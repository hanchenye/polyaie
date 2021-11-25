//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Pass/PassManager.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace memrefext;
using namespace xilinx::AIE;

using TokenInfo = std::tuple<StringAttr, unsigned, unsigned>;

namespace {
struct ConvertToAIE : public polyaie::ConvertToAIEBase<ConvertToAIE> {
  void runOnOperation() override;

  /// Used to hold the token name, token acquire value, and token release value
  /// for each intermediate result.
  DenseMap<Value, TokenInfo> tokInfoMap;

  /// Map from argument to the corresponding BufferOp.
  DenseMap<BlockArgument, BufferOp> bufMap;

  /// Used to hold the channel number of each TileOp.
  DenseMap<Operation *, unsigned> MM2SChanMap;
  DenseMap<Operation *, unsigned> S2MMChanMap;
};
} // namespace

static bool createMemCpy(OpBuilder &b, BufferOp srcBuf, BufferOp tgtBuf,
                         TokenInfo tokInfo) {
  // Extract token information.
  auto tokName = std::get<0>(tokInfo).getValue();
  auto tokValA = std::get<1>(tokInfo);
  auto tokValR = std::get<2>(tokInfo);

  // Generate token acquire and release.
  b.setInsertionPointToStart(&tgtBuf.getTileOp().getCoreOp().body().front());
  b.create<UseTokenOp>(b.getUnknownLoc(), tokName, tokValA,
                       LockAction::Acquire);
  auto useTokOp = b.create<UseTokenOp>(b.getUnknownLoc(), tokName, tokValR,
                                       LockAction::Release);

  // Create loop nests to copy data from source to target.
  b.setInsertionPoint(useTokOp);
  SmallVector<Value, 4> ivs;
  for (auto dimSiz : srcBuf.getType().getShape()) {
    auto loop = b.create<mlir::AffineForOp>(b.getUnknownLoc(), 0, dimSiz);
    b.setInsertionPointToStart(loop.getBody());
    ivs.push_back(loop.getInductionVar());
  }
  auto value = b.create<mlir::AffineLoadOp>(b.getUnknownLoc(), srcBuf, ivs);
  b.create<mlir::AffineStoreOp>(b.getUnknownLoc(), value, tgtBuf, ivs);

  return true;
}

static void fillMemOpBlocks(OpBuilder &b, Block *dmaBlock, Block *bdBlock,
                            Block *endBlock, BufferOp buf, TokenInfo tokInfo,
                            DMAChan channel) {
  // Create DMA start block.
  b.setInsertionPointToStart(dmaBlock);
  b.create<DMAStartOp>(b.getUnknownLoc(), channel, bdBlock, endBlock);

  // Extract token information.
  auto tokName = std::get<0>(tokInfo).getValue();
  auto tokValA = std::get<1>(tokInfo);
  auto tokValR = std::get<2>(tokInfo);

  // Create DMA descripter block.
  b.setInsertionPointToStart(bdBlock);
  b.create<UseTokenOp>(b.getUnknownLoc(), tokName, tokValA,
                       LockAction::Acquire);
  b.create<DMABDOp>(b.getUnknownLoc(), buf, /*offset=*/0,
                    buf.getType().getNumElements(), 0);
  b.create<UseTokenOp>(b.getUnknownLoc(), tokName, tokValR,
                       LockAction::Release);
  b.create<BranchOp>(b.getUnknownLoc(), bdBlock);

  // Create DMA end block.
  if (endBlock->empty()) {
    b.setInsertionPointToStart(endBlock);
    b.create<xilinx::AIE::EndOp>(b.getUnknownLoc());
  }
}

static void createOrUpdateMemOp(OpBuilder &b, BufferOp buf, TokenInfo tokInfo,
                                DMAChan channel) {
  auto tile = buf.getTileOp();

  if (auto mem = tile.getMemOp()) {
    auto &endBlock = mem.body().back();
    auto &predDmaBlock = *std::prev(mem.body().end(), 3);

    auto dmaBlock = b.createBlock(&endBlock);
    auto bdBlock = b.createBlock(&endBlock);

    auto predDma = cast<DMAStartOp>(&predDmaBlock.front());
    predDma.setSuccessor(dmaBlock, /*index=*/1);

    fillMemOpBlocks(b, dmaBlock, bdBlock, &endBlock, buf, tokInfo, channel);

  } else {
    // If MemOp has not been created, create a new one.
    b.setInsertionPointAfter(tile.getCoreOp());
    auto newMem = b.create<MemOp>(b.getUnknownLoc(), tile);

    auto &dmaBlock = newMem.body().emplaceBlock();
    auto &bdBlock = newMem.body().emplaceBlock();
    auto &endBlock = newMem.body().emplaceBlock();

    fillMemOpBlocks(b, &dmaBlock, &bdBlock, &endBlock, buf, tokInfo, channel);
  }
}

static Value getResultFromInput(OpOperand &input, FuncOp func = nullptr) {
  auto call = cast<CallOp>(input.getOwner());
  if (!func) {
    auto mod = call->getParentOfType<ModuleOp>();
    func = mod.lookupSymbol<FuncOp>(call.callee());
  }
  assert(func.sym_name() == call.callee());

  auto returnOp = cast<ReturnOp>(func.front().getTerminator());
  auto idx = llvm::find_if(returnOp.getOperands(), [&](Value operand) {
               return operand == func.getArgument(input.getOperandNumber());
             }).getIndex();
  return idx == call.getNumResults() ? nullptr : call.getResult(idx);
}

void ConvertToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  // Generate TokenOp and token release/acquire chain.
  unsigned tokIdx = 0;
  for (auto alloc : mod.getOps<memref::AllocOp>()) {
    for (auto user : alloc->getUsers()) {
      // Always ignore StoreBufferOps, because the interactions with global
      // buffer don't need to be implemented with tokens.
      if (isa<StoreBufferOp>(user))
        continue;

      // Create a new logical token for the current buffer.
      b.setInsertionPoint(user);
      auto tok = b.create<TokenOp>(b.getUnknownLoc(), 0);
      auto tokName = "token" + std::to_string(tokIdx++);
      auto tokNameAttr = b.getStringAttr(tokName);
      tok->setAttr("sym_name", tokNameAttr);

      // Propogate in the whole program to generate the token aquire/release
      // chain of the current buffer.
      SmallVector<Value, 32> worklist({cast<LoadBufferOp>(user).buffer()});
      unsigned tokVal = 1;
      while (!worklist.empty()) {
        auto buf = worklist.pop_back_val();
        auto tokInfo = tokInfoMap.lookup(buf);

        for (auto &use : buf.getUses()) {
          // Similarly, always ignore StoreBufferOps.
          if (isa<StoreBufferOp>(use.getOwner()))
            continue;

          auto call = cast<CallOp>(use.getOwner());
          auto func = mod.lookupSymbol<FuncOp>(call.callee());
          auto returnOp = cast<ReturnOp>(func.front().getTerminator());

          auto arg = func.getArgument(use.getOperandNumber());
          auto memTokVal = tokVal++;
          tokInfoMap[arg] = {tokNameAttr, std::get<1>(tokInfo), memTokVal};

          // Acquire and release the current token.
          b.setInsertionPointToStart(&func.front());
          b.create<UseTokenOp>(b.getUnknownLoc(), tokName, memTokVal,
                               LockAction::Acquire);

          b.setInsertionPoint(returnOp);
          auto coreTokVal = tokVal++;
          b.create<UseTokenOp>(b.getUnknownLoc(), tokName, coreTokVal,
                               LockAction::Release);

          // Find the result number of the buffer.
          if (auto resultBuf = getResultFromInput(use, func)) {
            // Record token name and acquire/release values.
            tokInfoMap[resultBuf] = {tokNameAttr, coreTokVal, tokVal++};

            // Push back the result buffer into the worklist.
            worklist.push_back(resultBuf);
          }
        }
      }
    }
  }

  // Generate TileOp, CoreOp, and BufferOps for each CallOp.
  unsigned bufIdx = 0;
  for (auto call : mod.getOps<CallOp>()) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = cast<ReturnOp>(func.front().getTerminator());
    b.setInsertionPointAfter(call);

    // Generate TileOp based on the placement results.
    auto tile = b.create<TileOp>(b.getUnknownLoc(), getCol(call), getRow(call));

    // Generate a BufferOp for each argument of the function.
    for (auto arg : func.getArguments()) {
      auto buf = b.create<BufferOp>(b.getUnknownLoc(), arg.getType(), tile);
      auto bufName = "buf" + std::to_string(bufIdx++);
      buf->setAttr("sym_name", b.getStringAttr(bufName));
      arg.replaceAllUsesExcept(buf, returnOp);
      bufMap[arg] = buf;
    }

    // Generate a CoreOp and inline the contents of the function.
    auto core = b.create<CoreOp>(b.getUnknownLoc(), tile);
    auto &coreBlock = core.body().emplaceBlock();

    auto &funcOps = func.front().getOperations();
    auto &coreOps = coreBlock.getOperations();
    coreOps.splice(coreOps.begin(), funcOps, funcOps.begin(),
                   std::prev(funcOps.end()));

    b.setInsertionPointToEnd(&coreBlock);
    b.create<xilinx::AIE::EndOp>(b.getUnknownLoc());
  }

  // Implement all dependencies between AIEs with FlowOp and MemOp.
  for (auto call : mod.getOps<CallOp>()) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = cast<ReturnOp>(func.front().getTerminator());

    for (auto result : call.getResults()) {
      // Get the current BufferOp and TileOp.
      auto srcBuf = bufMap[returnOp.getOperand(result.getResultNumber())
                               .cast<BlockArgument>()];
      auto srcTile = srcBuf.getTileOp();
      auto &srcChanIdx = MM2SChanMap[srcTile];

      // Traverse all users to create MemOp or direct memory copy.
      bool hasDmaUses = false;
      for (auto &use : result.getUses()) {
        // Similarly, we always ignore StoreBufferOp.
        if (isa<StoreBufferOp>(use.getOwner()))
          continue;

        // Retrieve TileOp and BufferOp of the successor.
        auto tgtCall = cast<CallOp>(use.getOwner());
        auto tgtFunc = mod.lookupSymbol<FuncOp>(tgtCall.callee());
        auto tgtArg = tgtFunc.getArgument(use.getOperandNumber());

        auto tgtBuf = bufMap[tgtArg];
        auto tgtTile = tgtBuf.getTileOp();
        auto tgtTokInfo = tokInfoMap[tgtArg];

        // Create direct memory copy if current and successor tiles are adjacent
        // with each other.
        if (haveShareableBuffer(srcTile.col(), srcTile.row(), tgtTile.col(),
                                tgtTile.row())) {
          createMemCpy(b, srcBuf, tgtBuf, tgtTokInfo);
          continue;
        }

        // Otherwise, we need to use switch boxes to establish the data delivery
        // between pred and target tiles.
        auto &tgtChanIdx = S2MMChanMap[tgtTile];
        // TODO: Handle more than 2 channels, is it possible?
        if (tgtChanIdx > 1) {
          call.emitOpError("has more than two S2MM channels");
          return signalPassFailure();
        }

        // Create FlowOp connecting the source srcTile and current srcTile.
        b.setInsertionPoint(tgtTile.getCoreOp());
        b.create<FlowOp>(b.getUnknownLoc(), srcTile, WireBundle::DMA,
                         srcChanIdx, tgtTile, WireBundle::DMA, tgtChanIdx);

        // Create or update MemOp for DMA descripters.
        createOrUpdateMemOp(b, tgtBuf, tgtTokInfo,
                            tgtChanIdx ? DMAChan::S2MM1 : DMAChan::S2MM0);
        ++tgtChanIdx;
        hasDmaUses = true;
      }

      if (hasDmaUses) {
        // TODO: Handle more than 2 channels, is it possible?
        if (srcChanIdx > 1) {
          call.emitOpError("has more than two MM2S channels");
          return signalPassFailure();
        }

        // Create or update MemOp for MM2S descripters.
        auto srcTokInfo = tokInfoMap[result];
        createOrUpdateMemOp(b, srcBuf, srcTokInfo,
                            srcChanIdx ? DMAChan::MM2S1 : DMAChan::MM2S0);
        ++srcChanIdx;
      }
    }
  }

  // Postprocess for host kernel generation. We lower LoadBufferOp and
  // StoreBufferOp and create lock releases to indicate the completion of the
  // whole program.
  for (auto &op : llvm::make_early_inc_range(mod.getBody()->getOperations())) {
    if (auto loadOp = dyn_cast<LoadBufferOp>(op)) {
      // Lower LoadBufferOp to general MemCpyOp.
      auto &use = *loadOp.buffer().use_begin();
      auto call = cast<CallOp>(use.getOwner());
      auto func = mod.lookupSymbol<FuncOp>(call.callee());
      auto buf = bufMap[func.getArgument(use.getOperandNumber())];
      auto rank = std::max(loadOp.getType().getRank(), (int64_t)1);

      b.setInsertionPoint(loadOp);
      b.create<memrefext::MemCpyOp>(
          b.getUnknownLoc(), b.getI64ArrayAttr(SmallVector<int64_t>(rank, 0)),
          loadOp.offsets(), loadOp.lengths(), buf, loadOp.memory());

    } else if (auto storeOp = dyn_cast<StoreBufferOp>(op)) {
      // Lower StoreBufferOp to general MemCpyOp.
      auto result = storeOp.buffer().cast<OpResult>();
      auto call = storeOp.buffer().getDefiningOp<CallOp>();
      auto func = mod.lookupSymbol<FuncOp>(call.callee());
      auto returnOp = cast<ReturnOp>(func.front().getTerminator());
      auto buf = bufMap[returnOp.getOperand(result.getResultNumber())
                            .cast<BlockArgument>()];
      auto rank = std::max(
          storeOp.memory().getType().cast<MemRefType>().getRank(), (int64_t)1);

      b.setInsertionPoint(storeOp);
      b.create<memrefext::MemCpyOp>(
          b.getUnknownLoc(), storeOp.offsets(),
          b.getI64ArrayAttr(SmallVector<int64_t>(rank, 0)), storeOp.lengths(),
          storeOp.memory(), buf);

      // Release the last lock (ID is 15) with value 1. Host kernel should wait
      // this lock to release before collect the results.
      // TODO: Make this more robust?
      auto tile = buf.getTileOp();
      b.setInsertionPointAfter(tile);
      auto lock = b.create<LockOp>(b.getUnknownLoc(), tile, 15);

      auto core = tile.getCoreOp();
      b.setInsertionPoint(core.body().front().getTerminator());
      b.create<UseLockOp>(b.getUnknownLoc(), lock, 1, LockAction::Release, 0);
    }

    // TODO: This is a quick solution to canonicalize token uses.
    if (auto coreOp = dyn_cast<CoreOp>(op)) {
      auto useTknOps = coreOp.body().front().getOps<UseTokenOp>();
      unsigned idx = 0;
      SmallVector<Operation *, 2> usesToErase;
      for (auto useA : useTknOps) {
        if (!useA.release())
          continue;
        for (auto useB : llvm::drop_begin(useTknOps, ++idx)) {
          if (!useB.acquire() || useA.value() != useB.value() ||
              useA.tokenName() != useB.tokenName())
            continue;
          usesToErase.push_back(useA);
          usesToErase.push_back(useB);
          break;
        }
      }
      for (auto use : usesToErase)
        use->erase();
    }
  }

  PassManager pm(mod.getContext(), "module");
  pm.addPass(createAIEAssignBufferAddressesPass());
  pm.addPass(createAIEPathfinderPass());
  pm.addPass(createAIECreateLocksPass());
  if (failed(pm.run(mod))) {
    emitError(mod.getLoc(), "failed to implement on AIE array");
    return signalPassFailure();
  }

  // Remove all redundant operations, including the temporary operations
  // generated by PolyAIE or MLIR-AIE and operations that are converted.
  for (auto &op : llvm::make_early_inc_range(mod.getBody()->getOperations())) {
    if (auto constant = dyn_cast<ConstantOp>(op)) {
      // Localize constant operation to the usage block.
      for (auto &use : llvm::make_early_inc_range(constant->getUses())) {
        b.setInsertionPoint(use.getOwner());
        auto localConstant = cast<ConstantOp>(b.clone(*constant));
        use.set(localConstant.getResult());
      }
      constant.erase();

    } else if (auto switchBox = dyn_cast<SwitchboxOp>(op)) {
      if (&switchBox.getBody()->front() ==
          switchBox.getBody()->getTerminator()) {
        switchBox->dropAllUses();
        switchBox->erase();
      }
    } else if (isa<CallOp, FuncOp, LoadBufferOp, StoreBufferOp, TokenOp, WireOp,
                   PLIOOp, ShimMuxOp>(op)) {
      op.dropAllUses();
      op.erase();
    }
  }

  // Remove unused TileOp.
  for (auto tile : llvm::make_early_inc_range(mod.getOps<TileOp>())) {
    if (tile.result().use_empty())
      tile.erase();
  }
}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}

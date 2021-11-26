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

namespace {
struct ConvertToAIE : public polyaie::ConvertToAIEBase<ConvertToAIE> {
  void runOnOperation() override;

  /// Map from CallOp to the corresponding TileOp.
  DenseMap<Operation *, TileOp> tileMap;

  /// Map from argument to the corresponding BufferOp.
  DenseMap<BlockArgument, BufferOp> bufMap;
};
} // namespace

static void createMemCpy(OpBuilder &b, BufferOp srcBuf, BufferOp tgtBuf,
                         StringRef tokName, unsigned tokValA, unsigned tokValR,
                         bool shareSrcTile) {
  auto loc = b.getUnknownLoc();
  auto getCoreBlock = [&](BufferOp buf) {
    return &buf.getTileOp().getCoreOp().body().front();
  };

  // If the shareable tile is source tile, then create memory copy in the end of
  // CoreOp of the source tile. Otherwise, create in the start of CoreOp of the
  // target tile.
  if (shareSrcTile)
    b.setInsertionPoint(getCoreBlock(srcBuf)->getTerminator());
  else
    b.setInsertionPointToStart(getCoreBlock(tgtBuf));

  // Generate token acquire and release.
  b.create<UseTokenOp>(loc, tokName, tokValA, LockAction::Acquire);
  auto useOp = b.create<UseTokenOp>(loc, tokName, tokValR, LockAction::Release);
  b.setInsertionPoint(useOp);

  // Create loop nests to copy data from source to target.
  SmallVector<Value, 4> ivs;
  for (auto dimSiz : srcBuf.getType().getShape()) {
    auto loop = b.create<mlir::AffineForOp>(loc, 0, dimSiz);
    b.setInsertionPointToStart(loop.getBody());
    ivs.push_back(loop.getInductionVar());
  }
  auto value = b.create<mlir::AffineLoadOp>(loc, srcBuf, ivs);
  b.create<mlir::AffineStoreOp>(loc, value, tgtBuf, ivs);
}

static void fillMemOpBlocks(OpBuilder &b, Block *dmaBlock, Block *bdBlock,
                            Block *endBlock, BufferOp buf, StringRef tokName,
                            unsigned tokValA, unsigned tokValR, DMAChan chan) {
  auto loc = b.getUnknownLoc();

  // Create DMA start block.
  b.setInsertionPointToStart(dmaBlock);
  b.create<DMAStartOp>(loc, chan, bdBlock, endBlock);

  // Create DMA descripter block.
  b.setInsertionPointToStart(bdBlock);
  b.create<UseTokenOp>(loc, tokName, tokValA, LockAction::Acquire);
  b.create<DMABDOp>(loc, buf, /*offset=*/0, buf.getType().getNumElements(), 0);
  b.create<UseTokenOp>(loc, tokName, tokValR, LockAction::Release);
  b.create<BranchOp>(loc, bdBlock);

  // Create DMA end block.
  if (endBlock->empty()) {
    b.setInsertionPointToStart(endBlock);
    b.create<xilinx::AIE::EndOp>(loc);
  }
}

static void updateMemOp(OpBuilder &b, BufferOp buf, StringRef tokName,
                        unsigned tokValA, unsigned tokValR, DMAChan chan) {
  auto tile = buf.getTileOp();

  if (auto mem = tile.getMemOp()) {
    auto &endBlock = mem.body().back();
    auto &predDmaBlock = *std::prev(mem.body().end(), 3);

    auto dmaBlock = b.createBlock(&endBlock);
    auto bdBlock = b.createBlock(&endBlock);

    auto predDma = cast<DMAStartOp>(&predDmaBlock.front());
    predDma.setSuccessor(dmaBlock, /*index=*/1);

    fillMemOpBlocks(b, dmaBlock, bdBlock, &endBlock, buf, tokName, tokValA,
                    tokValR, chan);

  } else {
    // If MemOp has not been created, create a new one.
    b.setInsertionPointAfter(tile.getCoreOp());
    auto newMem = b.create<MemOp>(b.getUnknownLoc(), tile);

    auto &dmaBlock = newMem.body().emplaceBlock();
    auto &bdBlock = newMem.body().emplaceBlock();
    auto &endBlock = newMem.body().emplaceBlock();

    fillMemOpBlocks(b, &dmaBlock, &bdBlock, &endBlock, buf, tokName, tokValA,
                    tokValR, chan);
  }
}

static OpResult getResultFromInput(OpOperand &input, FuncOp func = nullptr) {
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

  if (idx == call.getNumResults())
    return nullptr;
  return call.getResult(idx).cast<OpResult>();
}

void ConvertToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  // Generate TileOp, CoreOp, and BufferOps for each CallOp.
  unsigned bufIdx = 0;
  for (auto call : mod.getOps<CallOp>()) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = cast<ReturnOp>(func.front().getTerminator());
    b.setInsertionPointAfter(call);

    // Generate TileOp based on the placement results.
    auto tile = b.create<TileOp>(loc, getCol(call), getRow(call));
    tileMap[call] = tile;

    // Generate a BufferOp for each argument of the function.
    for (auto arg : func.getArguments()) {
      auto buf = b.create<BufferOp>(loc, arg.getType(), tile);
      auto bufName = "buf" + std::to_string(bufIdx++);
      buf->setAttr("sym_name", b.getStringAttr(bufName));

      arg.replaceAllUsesExcept(buf, returnOp);
      bufMap[arg] = buf;
    }

    // Generate a CoreOp and inline the contents of the function.
    auto core = b.create<CoreOp>(loc, tile);
    auto &coreBlock = core.body().emplaceBlock();

    auto &funcOps = func.front().getOperations();
    auto &coreOps = coreBlock.getOperations();
    coreOps.splice(coreOps.begin(), funcOps, funcOps.begin(),
                   std::prev(funcOps.end()));

    b.setInsertionPointToEnd(&coreBlock);
    b.create<xilinx::AIE::EndOp>(loc);
  }

  /// Used to hold the channel number of each TileOp.
  DenseMap<Operation *, unsigned> MM2SChanMap;
  DenseMap<Operation *, unsigned> S2MMChanMap;

  // Generate TokenOp and token release/acquire for each buffer propogation
  // chain (dependency chain). Implement dependencies with direct memory copy
  // (affine loops) for adjacent AIEs or MM2S-S2MM DMAs (FlowOp and MemOp) for
  // non-adjacent AIEs.
  unsigned tokIdx = 0;
  for (auto alloc : mod.getOps<memref::AllocOp>()) {
    for (auto user : alloc->getUsers()) {
      // Here we only need to deal with LoadBufferOps because LoadBufferOps
      // serve as the start point of each dependency chain. In the contrast,
      // StoreBufferOps are the end point of dependency chains.
      if (isa<StoreBufferOp>(user))
        continue;

      // If the user that consumes the buffer generated by LoadBufferOp doesn't
      // propoge the buffer to its result, we can early return.
      auto &firstUse = *cast<LoadBufferOp>(user).buffer().use_begin();
      auto firstResult = getResultFromInput(firstUse);
      if (!firstResult)
        continue;

      // Create a new TokenOp for the current buffer with an initial value of 0.
      b.setInsertionPoint(user);
      auto tok = b.create<TokenOp>(loc, 0);
      auto tokName = "token" + std::to_string(tokIdx++);
      tok->setAttr("sym_name", b.getStringAttr(tokName));

      // Generate first token acquire.
      auto firstTile = tileMap[firstResult.getDefiningOp<CallOp>()];
      b.setInsertionPointToStart(&firstTile.getCoreOp().body().front());
      b.create<UseTokenOp>(loc, tokName, 0, LockAction::Acquire);

      // Propogate the buffer in the whole program to generate the token
      // aquire/release chain of the current buffer. All unhandled intermediate
      // results are stacked in the worklist.
      SmallVector<OpResult, 32> worklist({firstResult});
      unsigned tokVal = 1;
      while (!worklist.empty()) {
        auto result = worklist.pop_back_val();

        // Get the BufferOp, TileOp, and MM2S channel index of the source tile.
        auto srcCall = result.getDefiningOp<CallOp>();
        auto srcFunc = mod.lookupSymbol<FuncOp>(srcCall.callee());
        auto srcReturn = cast<ReturnOp>(srcFunc.front().getTerminator());

        auto srcTile = tileMap[srcCall];
        auto srcBuf = bufMap[srcReturn.getOperand(result.getResultNumber())
                                 .cast<BlockArgument>()];
        auto &srcChanIdx = MM2SChanMap[srcTile];

        // Generate token release in the CoreOp,Hold the current token value to
        // make use of later.
        auto coreTokVal = tokVal++;
        b.setInsertionPoint(srcTile.getCoreOp().body().front().getTerminator());
        b.create<UseTokenOp>(loc, tokName, coreTokVal, LockAction::Release);

        // Handle all uses of the result.
        auto hasMM2S = false;
        for (auto &use : result.getUses()) {
          // Similarly, we ignore StoreBufferOps.
          if (isa<StoreBufferOp>(use.getOwner()))
            continue;

          // Get TileOp, BufferOp, and S2MM channel index of the target tile.
          auto tgtCall = cast<CallOp>(use.getOwner());
          auto tgtFunc = mod.lookupSymbol<FuncOp>(tgtCall.callee());

          auto tgtTile = tileMap[tgtCall];
          auto tgtBuf = bufMap[tgtFunc.getArgument(use.getOperandNumber())];
          auto &tgtChanIdx = S2MMChanMap[tgtTile];

          // If the buffer is propogated to the target tile's result, push it
          // into the worklist stack and create a token acquire in the target
          // tile. Hold the current token value to make use of later.
          auto memTokVal = tokVal++;
          if (auto newResult = getResultFromInput(use, tgtFunc)) {
            worklist.push_back(newResult);

            b.setInsertionPointToStart(&tgtTile.getCoreOp().body().front());
            b.create<UseTokenOp>(loc, tokName, memTokVal, LockAction::Acquire);
          }

          // Create a memory copy or MemOp/FlowOp to materialize the dependency.
          if (auto shareTile = getShareableTile(srcTile, tgtTile)) {
            // Create direct memory copy between shareable buffers if the source
            // and target tiles are adjacent with each other.
            createMemCpy(b, srcBuf, tgtBuf, tokName, coreTokVal, memTokVal,
                         shareTile == srcTile);
          } else {
            // Create FlowOp connecting the source and target tiles. Here, we
            // always connect the DMA channel of tiles.
            b.setInsertionPoint(tgtTile.getCoreOp());
            b.create<FlowOp>(loc, srcTile, WireBundle::DMA, srcChanIdx, tgtTile,
                             WireBundle::DMA, tgtChanIdx);

            // TODO: Handle more than 2 channels.
            if (tgtChanIdx > 1) {
              tgtCall.emitOpError("has more than two S2MM channels");
              return signalPassFailure();
            }
            updateMemOp(b, tgtBuf, tokName, coreTokVal, memTokVal,
                        tgtChanIdx++ ? DMAChan::S2MM1 : DMAChan::S2MM0);
            hasMM2S = true;
          }
        }

        // If the source and target tile are not adjacent with each other, MM2S
        // DMAs are created to stream the data. Therefore, we need to generate
        // the MM2S DMA descriptor in the MemOp of source tile.
        if (hasMM2S) {
          // TODO: Handle more than 2 channels.
          if (srcChanIdx > 1) {
            srcCall.emitOpError("has more than two MM2S channels");
            return signalPassFailure();
          }
          updateMemOp(b, srcBuf, tokName, coreTokVal, tokVal++,
                      srcChanIdx++ ? DMAChan::MM2S1 : DMAChan::MM2S0);
        }
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
          loc, b.getI64ArrayAttr(SmallVector<int64_t>(rank, 0)),
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
          loc, storeOp.offsets(),
          b.getI64ArrayAttr(SmallVector<int64_t>(rank, 0)), storeOp.lengths(),
          storeOp.memory(), buf);

      // Release the last lock (ID is 15) with value 1. Host kernel should wait
      // this lock to release before collect the results.
      // TODO: Make this more robust?
      // auto tile = buf.getTileOp();
      // b.setInsertionPointAfter(tile);
      // auto lock = b.create<LockOp>(loc, tile, 15);

      // auto core = tile.getCoreOp();
      // b.setInsertionPoint(core.body().front().getTerminator());
      // b.create<UseLockOp>(loc, lock, 1, LockAction::Release, 0);

    } else if (auto coreOp = dyn_cast<CoreOp>(op)) {
      // A quick token uese canonicalization.
      auto coreTokUses = coreOp.body().getOps<UseTokenOp>();
      unsigned useIdx = 0;
      SmallVector<UseTokenOp, 4> usesToErase;
      for (auto relUse : coreTokUses) {
        ++useIdx;
        if (!relUse.release())
          continue;
        for (auto acqUse : llvm::drop_begin(coreTokUses, useIdx)) {
          if (!acqUse.acquire() || relUse.value() != acqUse.value() ||
              relUse.tokenName() != acqUse.tokenName())
            continue;
          usesToErase.push_back(acqUse);
        }
      }
      for (auto use : usesToErase)
        use.erase();
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
    else if (auto core = tile.getCoreOp()) {
      b.setInsertionPointAfter(tile);
      auto lock = b.create<LockOp>(loc, tile, 15);

      b.setInsertionPoint(core.body().front().getTerminator());
      b.create<UseLockOp>(loc, lock, 1, LockAction::Release, 0);
    }
  }
}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}

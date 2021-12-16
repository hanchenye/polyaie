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
  ConvertToAIE() = default;
  ConvertToAIE(const ConvertToAIE &) {}
  ConvertToAIE(const PolyAIEOptions &opts) { vecSize = opts.vectorizeSize; }

  void runOnOperation() override;

  /// Map from argument to the corresponding BufferOp.
  DenseMap<Value, BufferOp> inputBufMap;
  DenseMap<Value, BufferOp> resultBufMap;
};
} // namespace

static OpResult getResultFromArg(BlockArgument arg, CallOp call = nullptr) {
  auto func = cast<FuncOp>(arg.getOwner()->getParentOp());
  if (!call) {
    auto mod = func->getParentOfType<ModuleOp>();
    call = cast<CallOp>(func.getSymbolUses(mod).getValue().begin()->getUser());
  }
  assert(func.sym_name() == call.callee());

  auto returnOp = cast<ReturnOp>(func.front().getTerminator());
  auto idx = llvm::find_if(returnOp.getOperands(), [&](Value operand) {
               return operand == arg;
             }).getIndex();

  if (idx == returnOp.getNumOperands())
    return nullptr;
  return call.getResult(idx).cast<OpResult>();
}

static Block *getCoreBlock(BufferOp buf) {
  return &buf.getTileOp().getCoreOp().body().front();
}

static void createLoopNest(OpBuilder &b, Value srcBuf, Value tgtBuf,
                           int64_t vecSize) {
  auto loc = b.getUnknownLoc();
  auto type = srcBuf.getType().cast<MemRefType>();
  auto rank = std::max(type.getRank(), (int64_t)1);

  SmallVector<Value, 4> ivs;
  unsigned loopIdx = 0;
  for (auto dimSize : type.getShape()) {
    // The last loop level should has a step of "vecSize".
    auto loop = b.create<mlir::AffineForOp>(loc, 0, dimSize,
                                            ++loopIdx == rank ? vecSize : 1);
    b.setInsertionPointToStart(loop.getBody());
    ivs.push_back(loop.getInductionVar());
  }

  // Create affine load/store operations or vector transfer read/write
  // operations according to the value of vector size.
  if (vecSize == 1) {
    auto value = b.create<mlir::AffineLoadOp>(loc, srcBuf, ivs);
    b.create<mlir::AffineStoreOp>(loc, value, tgtBuf, ivs);
  } else {
    auto vecType = VectorType::get({vecSize}, type.getElementType());
    auto value = b.create<vector::TransferReadOp>(loc, vecType, srcBuf, ivs);
    b.create<vector::TransferWriteOp>(loc, value, tgtBuf, ivs);
  }
}

static void createMemCpy(OpBuilder &b, BufferOp srcBuf, BufferOp tgtBuf,
                         StringRef tokName, unsigned tokValA, unsigned tokValR,
                         bool shareSrcTile, int64_t vecSize) {
  auto loc = b.getUnknownLoc();

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
  createLoopNest(b, srcBuf, tgtBuf, vecSize);
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

void ConvertToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  // Generate TileOp, CoreOp, and BufferOps for each CallOp.
  for (auto call : mod.getOps<CallOp>()) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = cast<ReturnOp>(func.front().getTerminator());

    // Generate TileOp based on the placement results.
    b.setInsertionPoint(call);
    auto tile = b.create<TileOp>(loc, getCol(call), getRow(call));

    // Generate a BufferOp for each returned value, and create a memory copy to
    // avoid the data pollution between predecessors and successors.
    for (auto operand : returnOp.getOperands()) {
      b.setInsertionPoint(call);
      auto bufType = operand.getType().cast<MemRefType>();
      auto buf = b.create<BufferOp>(loc, bufType, tile);
      resultBufMap[operand] = buf;

      b.setInsertionPoint(returnOp);
      createLoopNest(b, operand, buf, vecSize);
    }

    // Generate a BufferOp for each argument of the function.
    for (auto arg : func.getArguments()) {
      b.setInsertionPoint(call);
      auto buf = b.create<BufferOp>(loc, arg.getType(), tile);
      arg.replaceAllUsesExcept(buf, returnOp);
      inputBufMap[arg] = buf;
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
      // propogate the buffer to its result, we can early continue such that we
      // can reduce the number of tokens to instantiate.
      auto &firstUse = *cast<LoadBufferOp>(user).buffer().use_begin();
      auto firstCall = cast<CallOp>(firstUse.getOwner());
      auto firstArg = mod.lookupSymbol<FuncOp>(firstCall.callee())
                          .getArgument(firstUse.getOperandNumber());
      if (!getResultFromArg(firstArg, firstCall))
        continue;

      // Create a new TokenOp for the current buffer with an initial value of 0.
      b.setInsertionPoint(user);
      auto tok = b.create<TokenOp>(loc, 0);
      auto tokName = "token" + std::to_string(tokIdx++);
      tok->setAttr("sym_name", b.getStringAttr(tokName));

      // Generate the first token acquire.
      b.setInsertionPointToStart(getCoreBlock(inputBufMap[firstArg]));
      b.create<UseTokenOp>(loc, tokName, 0, LockAction::Acquire);

      // Propogate the buffer in the whole program to generate the token
      // aquire/release chain of the current buffer. All unhandled intermediate
      // buffers are stacked in the worklist.
      SmallVector<BlockArgument, 32> worklist({firstArg});
      unsigned tokVal = 1;
      while (!worklist.empty()) {
        // Get the BufferOp, TileOp, and MM2S channel index of the source tile.
        auto srcArg = worklist.pop_back_val();

        auto srcBuf = inputBufMap[srcArg];
        auto srcTile = srcBuf.getTileOp();
        auto &srcChanIdx = MM2SChanMap[srcTile];

        // Generate token release in the CoreOp, hold the current token value to
        // make use of later.
        auto coreTokVal = tokVal++;
        b.setInsertionPoint(getCoreBlock(srcBuf)->getTerminator());
        b.create<UseTokenOp>(loc, tokName, coreTokVal, LockAction::Release);

        // If the buffer is not propogated to result, we can continue.
        auto srcResult = getResultFromArg(srcArg);
        if (!srcResult)
          continue;
        srcBuf = resultBufMap[srcArg];

        // Handle all uses of the result.
        auto hasMM2S = false;
        for (auto &use : srcResult.getUses()) {
          // Similarly, we ignore StoreBufferOps.
          if (isa<StoreBufferOp>(use.getOwner()))
            continue;

          // Get TileOp, BufferOp, and S2MM channel index of the target tile.
          auto tgtCall = cast<CallOp>(use.getOwner());
          auto tgtArg = mod.lookupSymbol<FuncOp>(tgtCall.callee())
                            .getArgument(use.getOperandNumber());

          auto tgtBuf = inputBufMap[tgtArg];
          auto tgtTile = tgtBuf.getTileOp();
          auto &tgtChanIdx = S2MMChanMap[tgtTile];

          // Push the target argument into the worklist stack and create a token
          // acquire in the target tile. Hold the current token value to make
          // use of later.
          worklist.push_back(tgtArg);
          auto memTokVal = tokVal++;
          b.setInsertionPointToStart(getCoreBlock(tgtBuf));
          b.create<UseTokenOp>(loc, tokName, memTokVal, LockAction::Acquire);

          // Create a memory copy or MemOp/FlowOp to materialize the dependency.
          if (auto shareTile = getShareableTile(srcTile, tgtTile)) {
            // Create direct memory copy between shareable buffers if the source
            // and target tiles are adjacent with each other.
            createMemCpy(b, srcBuf, tgtBuf, tokName, coreTokVal, memTokVal,
                         shareTile == srcTile, vecSize);
          } else {
            // Create FlowOp connecting the source and target tiles. Here, we
            // always connect the DMA channel of tiles.
            b.setInsertionPoint(tgtTile.getCoreOp());
            b.create<FlowOp>(loc, srcTile, WireBundle::DMA, srcChanIdx, tgtTile,
                             WireBundle::DMA, tgtChanIdx);

            // TODO: Handle more than 2 channels.
            if (tgtChanIdx > 1) {
              tgtTile.emitOpError("has more than two S2MM channels");
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
            srcTile.emitOpError("has more than two MM2S channels");
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
      auto buf = inputBufMap[func.getArgument(use.getOperandNumber())];
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
      auto buf = resultBufMap[returnOp.getOperand(result.getResultNumber())];
      auto rank = std::max(
          storeOp.memory().getType().cast<MemRefType>().getRank(), (int64_t)1);

      b.setInsertionPoint(storeOp);
      b.create<memrefext::MemCpyOp>(
          loc, storeOp.offsets(),
          b.getI64ArrayAttr(SmallVector<int64_t>(rank, 0)), storeOp.lengths(),
          storeOp.memory(), buf);
    }
  }
}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}
std::unique_ptr<Pass>
polyaie::createConvertToAIEPass(const PolyAIEOptions &opts) {
  return std::make_unique<ConvertToAIE>(opts);
}

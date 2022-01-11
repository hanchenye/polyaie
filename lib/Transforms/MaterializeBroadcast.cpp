//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Pass/PassManager.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;
using namespace xilinx::AIE;

/// BroadcastOp takes one source buffer and variadic target buffers as operand,
/// the relationship between the source buffer and target buffer can be
/// categorized into three different kinds:
///   1) Share the source tile
///   2) share the target tile
///   3) Share both the source and target tile
///   4) Don't share any tile
/// For the target buffers of each BroadcastOp, there are at most one kind-1
/// buffer, one kind-2 buffer, two kind-3 buffer, and theoretically-unlimited
/// kind-4 buffers.
///
/// To materialize BroadcastOp, we need to do several things: 1) Reallocate
/// source buffer and merge target buffers if applicable; 2) Create MemOp,
/// DMAStartOp, DMABDPacketOp, and DMABDOp to describe DMAs; 3) Create FlowOp or
/// PacketFlowOp to describe connectivities; 4) Generate tokens/locks to realize
/// the back-pressure between computation and communication. Note that the
/// target buffer can be eliminated only if it shares the target tile with the
/// source buffer (or in other words, only if the target tile can access the
/// source buffer).
///
/// In the current implementation, we follow the table below to reallocate the
/// source buffer, where 1/2/3/4 indicates whether kind-1/2/3/4 exists in the
/// broadcast:
///   | 1 |2/3| 4 |  loc.  |
///   |---|---|---|--------|
///   | + |   |   | target |
///   |   | + |   | source |
///   |   |   | + | source |
///   | + | + |   | source |
///   | + |   | + | target |
///   |   | + | + | source |
///   | + | + | + | source |
///
/// This means only if there's one kind-1 and no kind-2/3 existing, we
/// reallocate the source buffer to the target tile.
///
namespace {
struct MaterializeBroadcast
    : public polyaie::MaterializeBroadcastBase<MaterializeBroadcast> {
  void runOnOperation() override;
};
} // namespace

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

void MaterializeBroadcast::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc(mod);

  unsigned tokIdx = 0;
  for (auto broadcast :
       llvm::make_early_inc_range(topFunc.getOps<BroadcastOp>())) {
    auto srcBuf = broadcast.source().getDefiningOp<BufferOp>();
    auto srcTile = srcBuf.getTileOp();

    SmallVector<BufferOp, 4> shareSrcTileBufs;
    SmallVector<BufferOp, 4> shareTgtTileBufs;
    SmallVector<BufferOp, 4> nonAdjacentBufs;
    for (auto tgt : broadcast.targets()) {
      auto tgtBuf = tgt.getDefiningOp<BufferOp>();
      auto tgtTile = tgtBuf.getTileOp();

      auto shareableTile = getShareableTile(srcBuf, tgtBuf);
      if (shareableTile == srcTile)
        shareSrcTileBufs.push_back(tgtBuf);
      else if (shareableTile == tgtTile)
        shareTgtTileBufs.push_back(tgtBuf);
      else
        nonAdjacentBufs.push_back(tgtBuf);
    }

    assert(shareSrcTileBufs.size() <= 1 && shareTgtTileBufs.size() <= 3 &&
           "illegal broadcast with incorrect target buffers");

    // Collect mergeable and non-mergeable target buffers.
    SmallVector<BufferOp, 4> mergeableBufs;
    SmallVector<BufferOp, 4> nonMergeableBufs;
    if (shareSrcTileBufs.size() == 1 && shareTgtTileBufs.size() == 0) {
      // Reallocate source buffer to the target tile.
      srcBuf.tileMutable().assign(shareSrcTileBufs.front().tile());

      // After reallocate, the target tile can access the source buffer thus the
      // target buffer is mergeable now.
      mergeableBufs.append(shareSrcTileBufs);
      nonMergeableBufs.append(nonAdjacentBufs);
    } else {
      mergeableBufs.append(shareTgtTileBufs);
      nonMergeableBufs.append(shareSrcTileBufs);
      nonMergeableBufs.append(nonAdjacentBufs);
    }

    // Create a new token for the broadcast.
    b.setInsertionPointToStart(&topFunc.front());
    auto tok = b.create<TokenOp>(loc, 0);
    auto tokName = "token" + std::to_string(tokIdx++);
    tok->setAttr("sym_name", b.getStringAttr(tokName));
    unsigned tokVal = 0;

    // Acquire and release the token in the source tile.
    auto srcCore = srcTile.getCoreOp();
    b.setInsertionPointToStart(&srcCore.body().front());
    b.create<UseTokenOp>(loc, tokName, tokVal, LockAction::Acquire);
    b.setInsertionPoint(srcCore.body().back().getTerminator());
    b.create<UseTokenOp>(loc, tokName, ++tokVal, LockAction::Release);
    auto srcRelTokVal = tokVal;

    // Handle mergeable target buffers.
    for (auto tgtBuf : mergeableBufs) {
      auto tgtCore = tgtBuf.getTileOp().getCoreOp();
      b.setInsertionPointToStart(&tgtCore.body().front());
      b.create<UseTokenOp>(loc, tokName, srcRelTokVal, LockAction::Acquire);
      b.setInsertionPoint(tgtCore.body().back().getTerminator());
      b.create<UseTokenOp>(loc, tokName, ++tokVal, LockAction::Release);

      // Replace target buffer with source buffer.
      tgtBuf.replaceAllUsesWith(srcBuf.getResult());
      tgtBuf.erase();
    }
  }

  llvm::outs() << *mod << "\n";
}

std::unique_ptr<Pass> polyaie::createMaterializeBroadcastPass() {
  return std::make_unique<MaterializeBroadcast>();
}

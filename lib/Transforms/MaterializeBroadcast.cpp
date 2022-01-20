//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

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
/// DMAStartOp, DMABDPacketOp, and DMABDOp to describe DMAs; 3) Create
/// PacketFlowOp, PacketSourceOp, and PacketDestOp to describe connectivities;
/// 4) Generate tokens/locks to realize the back-pressure between computation
/// and communication. Note that the target buffer can be eliminated only if it
/// shares the target tile with the source buffer (or in other words, only if
/// the target tile can access the source buffer).
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

namespace {
struct DMAInfo {
  StringAttr tokName;
  unsigned acqTokVal;
  unsigned relTokVal;
  Operation *buf;
  PacketFlowOp flow;

  DMAInfo(StringAttr tokName, unsigned acqTokVal, unsigned relTokVal,
          Operation *buf, PacketFlowOp flow)
      : tokName(tokName), acqTokVal(acqTokVal), relTokVal(relTokVal), buf(buf),
        flow(flow) {}
};
} // namespace

/// Get the tile operation given an external buffer or buffer.
static TileOp getTileOp(Operation *op) {
  if (auto buf = dyn_cast<BufferOp>(op))
    return buf.getTileOp();
  else if (auto externBuf = dyn_cast<ExternalBufferOp>(op)) {
    auto interface = getOnlyUserOfType<InterfaceOp>(externBuf);
    assert(interface && "external buffer is not associated to an interface");
    return interface.tile().getDefiningOp<TileOp>();
  }
  return TileOp();
}

void MaterializeBroadcast::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  // Map from TileOp to its associated S2MM/MM2S DMAs.
  llvm::SmallDenseMap<Operation *, SmallVector<DMAInfo, 8>, 32> S2MMInfoMap;
  llvm::SmallDenseMap<Operation *, SmallVector<DMAInfo, 8>, 32> MM2SInfoMap;

  unsigned tokIdx = 0;
  uint8_t packetIdx = 0;
  for (auto broadcast : llvm::make_early_inc_range(mod.getOps<BroadcastOp>())) {
    auto srcBuf = broadcast.source().getDefiningOp();
    auto srcTile = getTileOp(srcBuf);

    SmallVector<Operation *, 4> shareSrcTileBufs;
    SmallVector<Operation *, 4> shareTgtTileBufs;
    SmallVector<Operation *, 4> nonAdjacentBufs;
    for (auto tgt : broadcast.targets()) {
      auto tgtBuf = tgt.getDefiningOp();
      auto tgtTile = getTileOp(tgtBuf);

      // External buffer is always not adjacent with other buffers.
      if (isa<ExternalBufferOp>(srcBuf) || isa<ExternalBufferOp>(tgtBuf)) {
        nonAdjacentBufs.push_back(tgtBuf);
        continue;
      }

      // Check whether two buffers are adjacent with each other.
      auto shareableTile = getShareableTile(srcTile, tgtTile);
      if (shareableTile == srcTile)
        shareSrcTileBufs.push_back(tgtBuf);
      else if (shareableTile == tgtTile)
        shareTgtTileBufs.push_back(tgtBuf);
      else
        nonAdjacentBufs.push_back(tgtBuf);
    }

    assert(shareSrcTileBufs.size() <= 1 && shareTgtTileBufs.size() <= 3 &&
           "illegal broadcast with incorrect target buffers");
    // Now we can safely erase the broadcast operation.
    broadcast.erase();

    // Collect mergeable and non-mergeable target buffers.
    SmallVector<BufferOp, 4> mergeableBufs;
    SmallVector<Operation *, 4> nonMergeableBufs;
    if (shareSrcTileBufs.size() == 1 && shareTgtTileBufs.size() == 0) {
      // Reallocate source buffer to the target tile.
      auto tgtBuf = cast<BufferOp>(shareSrcTileBufs.front());
      cast<BufferOp>(srcBuf).tileMutable().assign(tgtBuf.tile());

      // After reallocate, the target tile can access the source buffer thus the
      // target buffer is mergeable now.
      mergeableBufs.push_back(tgtBuf);
      nonMergeableBufs.append(nonAdjacentBufs);
    } else {
      for (auto tgtBuf : shareTgtTileBufs)
        mergeableBufs.push_back(cast<BufferOp>(tgtBuf));
      nonMergeableBufs.append(shareSrcTileBufs);
      nonMergeableBufs.append(nonAdjacentBufs);
    }

    // Create a new token for the broadcast.
    b.setInsertionPointToStart(mod.getBody());
    auto tok = b.create<TokenOp>(loc, 0);
    auto tokName = b.getStringAttr("token" + std::to_string(tokIdx++));
    tok->setAttr("sym_name", tokName);
    unsigned tokVal = 0;

    // A helper for inserting token acquire and release to a CoreOp.
    auto insertTokenUses = [&](CoreOp core, unsigned acqTokVal) {
      b.setInsertionPointToStart(&core.body().front());
      b.create<UseTokenOp>(loc, tokName, acqTokVal, LockAction::Acquire);
      b.setInsertionPoint(core.body().back().getTerminator());
      b.create<UseTokenOp>(loc, tokName, ++tokVal, LockAction::Release);
    };

    // Insert token uses in the source core.
    insertTokenUses(srcTile.getCoreOp(), tokVal);
    auto srcRelTokVal = tokVal;

    // Handle mergeable buffers.
    for (auto tgtBuf : mergeableBufs) {
      // Insert token uses in each target core.
      insertTokenUses(tgtBuf.getTileOp().getCoreOp(), srcRelTokVal);
      tgtBuf.replaceAllUsesWith(cast<BufferOp>(srcBuf).getResult());
      tgtBuf.erase();
    }

    // Check if the source buffer need to DMA to stream.
    if (nonMergeableBufs.empty())
      continue;
    // As the source buffer may have been re-allocated, we need to update the
    // current associated tile of the source buffer.
    srcTile = getTileOp(srcBuf);

    // First, create a new packet_flow operation and construct the source DMA
    // info. The info will be used to generate MemOps later.
    b.setInsertionPointAfter(srcTile.getCoreOp());
    auto flow = b.create<PacketFlowOp>(loc, packetIdx++);
    b.setInsertionPointToEnd(&flow.ports().emplaceBlock());
    b.create<xilinx::AIE::EndOp>(loc);

    auto srcInfo = DMAInfo(tokName, srcRelTokVal, ++tokVal, srcBuf, flow);
    MM2SInfoMap[srcTile].push_back(srcInfo);

    // Handle non-mergeable target buffers.
    for (auto tgtBuf : nonMergeableBufs) {
      auto tgtTile = getTileOp(tgtBuf);

      // Construct the target DMA info.
      auto tgtInfo = DMAInfo(tokName, srcRelTokVal, ++tokVal, tgtBuf, flow);
      S2MMInfoMap[tgtTile].push_back(tgtInfo);

      // Note that the target tile depends on the S2MM DMA rather than the
      // source tile. Therefore, the acquire token value is equal to the release
      // token value of the S2MM DMA.
      insertTokenUses(tgtTile.getCoreOp(), tokVal);
    }
  }

  // Generate MemOps containing DMAStartOp, DMABDPacketOp, and DMABDOp. Also,
  // fill PacketSourceOp and PacketDestOp into the PacketFlowOp once the DMA
  // channel is deteremined.
  for (auto tile : llvm::make_early_inc_range(mod.getOps<TileOp>())) {
    auto S2MMs = S2MMInfoMap.lookup(tile);
    auto MM2Ss = MM2SInfoMap.lookup(tile);
    if (S2MMs.empty() && MM2Ss.empty())
      continue;

    // Allocate S2MM and MM2S DMAs to two channels, respectively.
    auto sizeS2MM0 = S2MMs.size() == 1 ? 1 : S2MMs.size() / 2;
    auto S2MM0s = llvm::make_range(S2MMs.begin(), S2MMs.begin() + sizeS2MM0);
    auto S2MM1s = llvm::make_range(S2MMs.begin() + sizeS2MM0, S2MMs.end());

    auto sizeMM2S0 = MM2Ss.size() == 1 ? 1 : MM2Ss.size() / 2;
    auto MM2S0s = llvm::make_range(MM2Ss.begin(), MM2Ss.begin() + sizeMM2S0);
    auto MM2S1s = llvm::make_range(MM2Ss.begin() + sizeMM2S0, MM2Ss.end());

    // Construct the MemOp or ShimDMAOp.
    b.setInsertionPointAfter(tile.getCoreOp());
    Block *endBlock;
    if (tile.isShimNOCorPLTile()) {
      auto shimDma = b.create<ShimDMAOp>(loc, b.getIndexType(), tile);
      endBlock = &shimDma.body().emplaceBlock();
    } else {
      auto mem = b.create<MemOp>(loc, tile);
      endBlock = &mem.body().emplaceBlock();
    }
    b.setInsertionPointToEnd(endBlock);
    b.create<xilinx::AIE::EndOp>(loc);

    DMAStartOp currentDMAStart;
    mlir::BranchOp currentBDBranch;
    Block *currentHeadBDBlock;

    // A helper for constructing desciption blocks of MemOp and inserting token
    // acquire and release to each description block.
    auto createMemBlocks = [&](llvm::iterator_range<DMAInfo *> dmaList,
                               xilinx::AIE::DMAChan chan) {
      if (dmaList.empty())
        return;

      // Construct one DMAStartOp.
      auto startBlock = b.createBlock(endBlock);
      if (currentDMAStart)
        currentDMAStart.setSuccessor(startBlock, /*chain_idx=*/1);
      b.setInsertionPointToEnd(startBlock);
      currentDMAStart = b.create<DMAStartOp>(loc, chan, endBlock, endBlock);

      unsigned dmaIdx = 0;
      for (auto dma : dmaList) {
        assert(getTileOp(dma.buf) == tile &&
               "DMA and buffer should have the same associated tile");
        // Connect all description blocks into a chained loop.
        auto bdBlock = b.createBlock(endBlock);
        if (dmaIdx++ == 0) {
          currentHeadBDBlock = bdBlock;
          currentDMAStart.setSuccessor(bdBlock, /*dest_idx=*/0);
        } else
          currentBDBranch.setSuccessor(bdBlock);

        // Create DMABDPacketOp and DMABDOp for each DMA.
        b.setInsertionPointToStart(bdBlock);
        auto tokName = dma.tokName.strref();
        b.create<UseTokenOp>(loc, tokName, dma.acqTokVal, LockAction::Acquire);
        b.create<DMABDPACKETOp>(loc, 0, dma.flow.ID());

        auto buf = dma.buf->getResult(0);
        auto bufType = buf.getType().cast<MemRefType>();
        b.create<DMABDOp>(loc, buf, /*offset=*/0, bufType.getNumElements(), 0);
        b.create<UseTokenOp>(loc, tokName, dma.relTokVal, LockAction::Release);
        currentBDBranch = b.create<BranchOp>(loc, currentHeadBDBlock);

        // Create PacketSourceOp or PacketDestOp in the PackeFlowOp.
        b.setInsertionPoint(dma.flow.ports().front().getTerminator());
        if (chan == DMAChan::MM2S0 || chan == DMAChan::MM2S1)
          b.create<PacketSourceOp>(loc, tile, WireBundle::DMA,
                                   chan == DMAChan::MM2S0 ? 0 : 1);
        else
          b.create<PacketDestOp>(loc, tile, WireBundle::DMA,
                                 chan == DMAChan::S2MM0 ? 0 : 1);
      }
    };

    // Create MemOp blocks for all four kinds of DMAs.
    createMemBlocks(S2MM0s, DMAChan::S2MM0);
    createMemBlocks(S2MM1s, DMAChan::S2MM1);
    createMemBlocks(MM2S0s, DMAChan::MM2S0);
    createMemBlocks(MM2S1s, DMAChan::MM2S1);

    if (auto interface = getOnlyUserOfType<InterfaceOp>(tile))
      interface.erase();
  }
}

std::unique_ptr<Pass> polyaie::createMaterializeBroadcastPass() {
  return std::make_unique<MaterializeBroadcast>();
}

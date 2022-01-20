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

namespace {
struct FlowPacketToCircuit
    : public polyaie::FlowPacketToCircuitBase<FlowPacketToCircuit> {
  void runOnOperation() override;
};
} // namespace

/// Get the block description (BD) packet op if the port only performs one DMA.
template <typename OpType> static DMABDPACKETOp getBdPacket(OpType port) {
  DMAChan channel;
  if (isa<PacketSourceOp>(port))
    channel = port.channel() == 0 ? DMAChan::MM2S0 : DMAChan::MM2S1;
  else if (isa<PacketDestOp>(port))
    channel = port.channel() == 0 ? DMAChan::S2MM0 : DMAChan::S2MM1;
  else
    llvm_unreachable("port must be packet source or dest opration");

  // We only handle the case when the wire bundle is DMA.
  if (port.bundle() != WireBundle::DMA)
    return DMABDPACKETOp();

  // Find the target DMA start operation.
  auto portTile = port.tile().template getDefiningOp<TileOp>();
  Region *dmaRegion;
  if (portTile.isShimNOCorPLTile())
    dmaRegion = &getOnlyUserOfType<ShimDMAOp>(port.tile()).body();
  else
    dmaRegion = &portTile.getMemOp().body();

  auto dmaStarts = dmaRegion->template getOps<DMAStartOp>();
  auto dmaStartPtr = llvm::find_if(
      dmaStarts, [&](DMAStartOp op) { return op.dmaChan() == channel; });
  assert(dmaStartPtr != dmaStarts.end() &&
         "a DMA port must have a corresponding DMA description");
  auto dmaStart = *dmaStartPtr;

  // Check the number of description blocks.
  auto headBdBlock = dmaStart.dest();
  auto headBdBranch = cast<mlir::BranchOp>(headBdBlock->getTerminator());
  if (headBdBranch.dest() != headBdBlock)
    return DMABDPACKETOp();

  auto bdPacket = headBdBlock->template getOps<DMABDPACKETOp>().begin();
  assert(bdPacket != headBdBlock->template getOps<DMABDPACKETOp>().end() &&
         "must specify the packet ID through a DMABDPacketOp");
  return *bdPacket;
}

void FlowPacketToCircuit::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  for (auto packetFlow :
       llvm::make_early_inc_range(mod.getOps<PacketFlowOp>())) {
    // Collect packet source and targets of the flow operation.
    SmallVector<PacketDestOp, 8> targets;
    PacketSourceOp source;
    for (auto &op : *packetFlow.getBody())
      if (auto target = dyn_cast<PacketDestOp>(op))
        targets.push_back(target);
      else if (auto currentSource = dyn_cast<PacketSourceOp>(op)) {
        assert(!source && "packet flow contains more than one packet source");
        source = currentSource;
      }
    assert(source && "packet flow must contain exactly one packet source");

    // Only if the source and each target port only performs one DMA.
    auto sourceBdPacket = getBdPacket(source);
    if (!sourceBdPacket)
      continue;

    SmallVector<DMABDPACKETOp, 8> targetBdPackets;
    bool isConvertable = true;
    for (auto target : targets) {
      if (auto targetBdPacket = getBdPacket(target))
        targetBdPackets.push_back(targetBdPacket);
      else {
        isConvertable = false;
        break;
      }
    }
    if (!isConvertable)
      continue;

    // Now, we can convert the PacketFlowOp to a FlowOp.
    b.setInsertionPoint(packetFlow);
    for (auto target : targets)
      b.create<FlowOp>(loc, source.tile(), source.bundle(), source.channel(),
                       target.tile(), target.bundle(), target.channel());

    // Eliminate the packet flow operation and all BD packet operations.
    packetFlow.erase();
    sourceBdPacket.erase();
    for (auto targetBdPacket : targetBdPackets)
      targetBdPacket.erase();
  }
}

std::unique_ptr<Pass> polyaie::createFlowPacketToCircuitPass() {
  return std::make_unique<FlowPacketToCircuit>();
}

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Transforms/DialectConversion.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;
using namespace xilinx::AIE;

namespace {
struct DataflowToAIE : public polyaie::DataflowToAIEBase<DataflowToAIE> {
  void runOnOperation() override;
};
} // namespace

void DataflowToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc(mod);

  // Map from a buffer to its target buffers.
  DenseMap<Value, SmallVector<Value, 4>> targetBufsMap;

  // Map from process result to its corresponding buffer.
  DenseMap<Value, BufferOp> bufMap;

  // Generate TileOp, BufferOps, and CoreOp.
  // TODO: Should use DFS traversal for graph region.
  for (auto process : llvm::make_early_inc_range(topFunc.getOps<ProcessOp>())) {
    // Generate TileOp based on the placement results.
    b.setInsertionPoint(process);
    auto tile = b.create<TileOp>(loc, getCol(process), getRow(process));

    // Create BufferOp for each local buffer.
    // TODO: Make this more robust. The current implementation assumes the
    // BufferStateChangedMemref pass has been applied.
    for (auto &op : llvm::make_early_inc_range(process.body().getOps())) {
      if (auto alloc = dyn_cast<memref::AllocOp>(op)) {
        // Replace uses of alloc with the BufferOp.
        auto buf = b.create<BufferOp>(loc, alloc.getType(), tile);
        alloc.replaceAllUsesWith(buf.getResult());
        alloc.erase();

        // If the buffer is casted to a tensor and returned, it may be consumed
        // by other processes. Therefore, we record the process result to buffer
        // mapping in "bufMap".
        if (auto castOp = getOnlyUserOfType<bufferization::ToTensorOp>(buf))
          if (auto result = process.getResultFromInternalVal(castOp.result())) {
            bufMap[result] = buf;
            castOp->dropAllUses();
            castOp.erase();

            // Create a host DMA to store the result to host.
            if (auto store = getOnlyUserOfType<TensorStoreOp>(result)) {
              b.create<HostDMAOp>(loc, store.offsets(), store.sizes(),
                                  store.strides(), HostDMAKind::AIEToHost,
                                  store.memory(), buf);
              store.erase();
            }
          }
      } else if (auto castOp = dyn_cast<bufferization::ToMemrefOp>(op)) {
        // Replace uses of the cast operation with the BufferOp.
        auto buf = b.create<BufferOp>(loc, castOp.getType(), tile);
        castOp.replaceAllUsesWith(buf.getResult());
        castOp.erase();

        if (auto operand = process.getOperandFromInternalVal(castOp.tensor())) {
          // Construct the "targetBufsMap" to record the buffer dependencies,
          // which is used to generate BroadcastOps later.
          auto sourceBuf = bufMap.lookup(operand);
          if (sourceBuf)
            targetBufsMap[sourceBuf].push_back(buf);

          // Create a host DMA to load the data from host.
          if (auto load = operand.getDefiningOp<TensorLoadOp>()) {
            b.create<HostDMAOp>(loc, load.offsets(), load.sizes(),
                                load.strides(), HostDMAKind::HostToAIE, buf,
                                load.memory());
            load->dropAllUses();
            load.erase();
          }
        }
      }
    }

    // Create BufferOp for each scalar argument.
    for (auto arg : process.body().getArguments()) {
      if (arg.getType().isa<TensorType>())
        continue;

      auto type = MemRefType::get({1}, arg.getType());
      auto buf = b.create<BufferOp>(loc, type, tile);
      b.create<HostDMAOp>(loc, b.getI64ArrayAttr(0), b.getI64ArrayAttr(1),
                          b.getI64ArrayAttr(1), HostDMAKind::HostToAIE, buf,
                          process.getOperandFromInternalVal(arg));
      auto insertPoint = b.saveInsertionPoint();

      b.setInsertionPointToStart(&process.body().front());
      auto value = b.create<mlir::AffineLoadOp>(loc, b.getConstantAffineMap(0),
                                                ValueRange(buf.getResult()));
      arg.replaceAllUsesWith(value);
      b.restoreInsertionPoint(insertPoint);
    }

    // Erase all process arguments as all of them have been converted.
    process.body().front().eraseArguments([](auto) { return true; });

    // Generate a CoreOp and inline the contents of the process.
    auto core = b.create<CoreOp>(loc, tile);
    auto &procBlocks = process.body().getBlocks();
    auto &coreBlocks = core.body().getBlocks();
    coreBlocks.splice(coreBlocks.begin(), procBlocks);

    // Replace the ternimator with an EndOp.
    auto returnOp = coreBlocks.back().getTerminator();
    b.setInsertionPoint(returnOp);
    b.create<xilinx::AIE::EndOp>(loc);
    returnOp->erase();
  }

  // Now we can safely erase all process operations.
  for (auto process : llvm::make_early_inc_range(topFunc.getOps<ProcessOp>())) {
    process->dropAllUses();
    process->erase();
  }

  // Create BroadcastOps.
  b.setInsertionPoint(topFunc.back().getTerminator());
  for (auto pair : targetBufsMap)
    b.create<BroadcastOp>(loc, pair.first, pair.second);
}

std::unique_ptr<Pass> polyaie::createDataflowToAIEPass() {
  return std::make_unique<DataflowToAIE>();
}

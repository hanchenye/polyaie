//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Transforms/DialectConversion.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"
#include "llvm/ADT/BreadthFirstIterator.h"

using namespace mlir;
using namespace polyaie;
using namespace bufferization;
using namespace dataflow;
using namespace xilinx::AIE;

namespace {
struct DataflowToAIE : public polyaie::DataflowToAIEBase<DataflowToAIE> {
  void runOnOperation() override;
};
} // namespace

/// Inline `func` into its parent module.
/// TODO: Use handshake function instead.
static void inlineFuncIntoModule(circt::handshake::FuncOp func) {
  // Create alloc for all arguments of the top function.
  auto mod = func->getParentOfType<ModuleOp>();
  auto b = OpBuilder(mod);
  b.setInsertionPointToEnd(mod.getBody());
  for (auto arg : func.getArguments()) {
    auto type = arg.getType().dyn_cast<MemRefType>();
    if (!type)
      type = MemRefType::get({1}, arg.getType());
    auto memref = b.create<memref::AllocOp>(func.getLoc(), type);
    arg.replaceAllUsesWith(memref);
  }

  // Inline the top function into the module.
  auto &modOps = mod.getBody()->getOperations();
  auto &funcOps = func.front().getOperations();
  modOps.splice(modOps.end(), funcOps, funcOps.begin(),
                std::prev(funcOps.end()));
  mod->setAttr("sym_name", func.getNameAttr());
  func.erase();
}

void DataflowToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc<circt::handshake::FuncOp>(mod);

  // Map from a buffer to its target buffers.
  DenseMap<Value, SmallVector<Value, 4>> targetBufsMap;
  // Map from process result to its corresponding buffer.
  DenseMap<Value, BufferOp> bufMap;

  // Generate TileOp, BufferOps, and CoreOp from ProcessOp. Generate DMAHostOp
  // from TensorLoad/StoreOp.
  for (auto process : llvm::make_early_inc_range(topFunc.getOps<ProcessOp>())) {
    // Generate TileOp based on the placement results.
    b.setInsertionPoint(process);
    auto tile = b.create<TileOp>(loc, getCol(process), getRow(process));

    // Create BufferOp for each local buffer.
    for (auto alloc :
         llvm::make_early_inc_range(process.getOps<memref::AllocOp>())) {
      auto buf = b.create<BufferOp>(loc, alloc.getType(), tile);
      alloc.replaceAllUsesWith(buf.getResult());
      alloc.erase();

      // Handle fanins of the local buffer.
      if (auto copy = getOnlyUserOfType<memref::CopyOp>(buf))
        if (auto toMemrefOp = copy.source().getDefiningOp<ToMemrefOp>()) {
          // Record the data transfer from predecessor to local buffer in order
          // to generate the BroadcastOp later.
          auto operand = process.getOperandFromInternalVal(toMemrefOp.tensor());
          assert(operand && toMemrefOp.tensor().hasOneUse() &&
                 toMemrefOp.memref().hasOneUse());
          auto sourceBuf = bufMap.lookup(operand);
          if (sourceBuf)
            targetBufsMap[sourceBuf].push_back(buf);
          copy.erase();
          toMemrefOp.erase();

          // Create a host DMA to load the data from host.
          if (auto load = operand.getDefiningOp<TensorLoadOp>())
            b.create<HostDMAOp>(loc, load.offsets(), load.sizes(),
                                load.strides(), HostDMAKind::HostToAIE, buf,
                                load.memory());
        }

      // Handle fanouts of the local buffer.
      if (auto toTensorOp = getOnlyUserOfType<ToTensorOp>(buf)) {
        // Record the result-to-buffer mapping if the buffer is returned.
        auto result = process.getResultFromInternalVal(toTensorOp.result());
        assert(result && toTensorOp.result().hasOneUse());
        bufMap[result] = buf;
        toTensorOp->dropAllUses();
        toTensorOp.erase();

        // Create a host DMA to store the result to host.
        if (auto store = getOnlyUserOfType<TensorStoreOp>(result))
          b.create<HostDMAOp>(loc, store.offsets(), store.sizes(),
                              store.strides(), HostDMAKind::AIEToHost,
                              store.memory(), buf);
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

    // Set the ternimator as an EndOp.
    auto returnOp = coreBlocks.back().getTerminator();
    b.setInsertionPoint(returnOp);
    b.create<xilinx::AIE::EndOp>(loc);
    returnOp->erase();
  }

  // Now we can safely erase all ProcessOps and TensorLoad/StoreOps.
  for (auto &op : llvm::make_early_inc_range(topFunc.getOps()))
    if (isa<ProcessOp, TensorLoadOp, TensorStoreOp>(op)) {
      op.dropAllUses();
      op.erase();
    }

  // Create BroadcastOps.
  for (auto pair : targetBufsMap) {
    b.setInsertionPointAfter(
        pair.first.getDefiningOp<BufferOp>().getTileOp().getCoreOp());
    b.create<BroadcastOp>(loc, pair.first, pair.second);
  }

  // Finally, inline the top function into the module.
  // TODO: Introduce AIE runtime-related operations.
  inlineFuncIntoModule(topFunc);
}

std::unique_ptr<Pass> polyaie::createDataflowToAIEPass() {
  return std::make_unique<DataflowToAIE>();
}

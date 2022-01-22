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
using namespace circt;

namespace {
struct InsertGMIOAdapter
    : public polyaie::InsertGMIOAdapterBase<InsertGMIOAdapter> {
  void runOnOperation() override;
};
} // namespace

// TODO: Note that this pass is highly experimental and just for the on-board
// test of GMIO and DDR communication.
void InsertGMIOAdapter::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc<handshake::FuncOp>(mod);

  SmallVector<Value, 32> ioVals;
  for (auto &op : topFunc.getOps()) {
    if (auto load = dyn_cast<dataflow::TensorLoadOp>(op))
      ioVals.push_back(load.tensor());
    if (auto store = dyn_cast<dataflow::TensorStoreOp>(op))
      ioVals.push_back(store.tensor());
  }

  for (auto tensor : ioVals) {
    // Create a new empty process op.
    b.setInsertionPointAfterValue(tensor);
    auto process = b.create<dataflow::ProcessOp>(loc, tensor.getType(), tensor);
    process->setAttr("polyaie.adapter", b.getUnitAttr());
    if (tensor.getDefiningOp<dataflow::TensorLoadOp>())
      tensor.replaceAllUsesExcept(process.getResult(0), process);
    else
      tensor.replaceUsesWithIf(process.getResult(0), [](OpOperand &operand) {
        return isa<dataflow::TensorStoreOp>(operand.getOwner());
      });

    auto type = tensor.getType().cast<RankedTensorType>();
    auto memrefType = MemRefType::get(type.getShape(), type.getElementType());
    auto entryBlock = &process.body().front();
    b.setInsertionPointToStart(entryBlock);

    // Create a local buffer to hold the input data.
    auto toMemrefOp = b.create<bufferization::ToMemrefOp>(
        loc, memrefType, entryBlock->getArgument(0));
    auto alloc = b.create<memref::AllocOp>(loc, memrefType);

    // Create explicit memory copy using an affine loop nest.
    auto insertPoint = b.saveInsertionPoint();
    SmallVector<Value, 4> ivs;
    for (auto dimSize : memrefType.getShape()) {
      auto loop = b.create<mlir::AffineForOp>(loc, 0, dimSize);
      b.setInsertionPointToStart(loop.getBody());
      ivs.push_back(loop.getInductionVar());
    }

    // Create affine load/store operations.
    auto value = b.create<mlir::AffineLoadOp>(loc, toMemrefOp.memref(), ivs);
    b.create<mlir::AffineStoreOp>(loc, value, alloc.memref(), ivs);
    b.restoreInsertionPoint(insertPoint);

    // Return the local buffer as result.
    auto toTensorOp = b.create<bufferization::ToTensorOp>(loc, alloc.memref());
    b.create<dataflow::ReturnOp>(loc, toTensorOp.result());
  }
}

std::unique_ptr<Pass> polyaie::createInsertGMIOAdapterPass() {
  return std::make_unique<InsertGMIOAdapter>();
}

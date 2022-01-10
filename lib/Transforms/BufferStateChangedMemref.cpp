//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct BufferStateChangedMemref
    : public polyaie::BufferStateChangedMemrefBase<BufferStateChangedMemref> {
  void runOnFunction() override;
};
} // namespace

void BufferStateChangedMemref::runOnFunction() {
  auto func = getFunction();
  auto b = OpBuilder(func);
  auto loc = b.getUnknownLoc();

  // Figure out all arguments that need to be buffered.
  for (auto arg : func.getArguments()) {
    // Get the argument type and bypass non-memref arguments.
    auto argType = arg.getType().dyn_cast<MemRefType>();
    if (!argType)
      continue;

    // Return it if the argument is used by any state-changing operations.
    if (llvm::any_of(arg.getUsers(), [&](Operation *op) {
          return isa<mlir::AffineWriteOpInterface, memref::StoreOp,
                     memref::TensorStoreOp, vector::TransferWriteOp>(op);
        })) {
      // Create a local buffer for each state-changed memref argument and
      // replace all its uses.
      // FIXME: The alloc generated here shouldn't have layout information?
      b.setInsertionPointToStart(&func.front());
      auto buf = b.create<memref::AllocOp>(loc, argType);
      arg.replaceAllUsesWith(buf);

      // Set insertion point to the ancestor of the first user.
      auto firstUser = *buf->user_begin();
      b.setInsertionPoint(func.body().findAncestorOpInRegion(*firstUser));

      // Create nested loop to copy data to local buffer.
      SmallVector<Value, 4> ivs;
      for (auto dimSize : argType.getShape()) {
        auto loop = b.create<mlir::AffineForOp>(loc, 0, dimSize);
        b.setInsertionPointToStart(loop.getBody());
        ivs.push_back(loop.getInductionVar());
      }

      // Create affine load/store operations.
      auto value = b.create<mlir::AffineLoadOp>(loc, arg, ivs);
      b.create<mlir::AffineStoreOp>(loc, value, buf, ivs);
    }
  }
}

std::unique_ptr<FunctionPass> polyaie::createBufferStateChangedMemrefPass() {
  return std::make_unique<BufferStateChangedMemref>();
}

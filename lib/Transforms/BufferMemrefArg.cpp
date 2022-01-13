//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct BufferMemrefArg : public polyaie::BufferMemrefArgBase<BufferMemrefArg> {
  void runOnFunction() override;
};
} // namespace

void BufferMemrefArg::runOnFunction() {
  auto func = getFunction();
  if (func->hasAttr("polyaie.top_func"))
    return;
  auto b = OpBuilder(func);
  auto loc = b.getUnknownLoc();

  // Figure out all arguments that need to be buffered.
  for (auto arg : func.getArguments()) {
    // Get the argument type and bypass non-memref arguments.
    auto argType = arg.getType().dyn_cast<MemRefType>();
    if (!argType)
      continue;

    // Create a local buffer for each memref argument.
    b.setInsertionPointToStart(&func.front());
    auto buf = b.create<memref::AllocOp>(loc, argType);
    arg.replaceAllUsesWith(buf);

    // Handle state-changed memref differently with const memref.
    if (llvm::any_of(arg.getUsers(), [&](Operation *op) {
          return isa<mlir::AffineStoreOp>(op);
        })) {
      // If the state of memref is changed, create explicit memory copy using an
      // affine loop nest.
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
    } else {
      // Otherwise, create a memref copy operation.
      b.create<memref::CopyOp>(loc, arg, buf);
    }
  }
}

std::unique_ptr<FunctionPass> polyaie::createBufferMemrefArgPass() {
  return std::make_unique<BufferMemrefArg>();
}

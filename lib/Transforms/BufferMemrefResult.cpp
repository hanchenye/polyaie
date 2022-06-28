//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct BufferMemrefResult
    : public polyaie::BufferMemrefResultBase<BufferMemrefResult> {
  void runOnOperation() override;
};
} // namespace

void BufferMemrefResult::runOnOperation() {
  auto func = getOperation();
  if (func->hasAttr("polyaie.top_func"))
    return;
  auto b = OpBuilder(func);
  auto loc = b.getUnknownLoc();

  for (auto operand : func.back().getTerminator()->getOperands()) {
    // Get the result type and bypass non-memref results.
    auto resultType = operand.getType().dyn_cast<MemRefType>();
    if (!resultType)
      continue;

    // Create a local buffer.
    b.setInsertionPointToStart(&func.front());
    auto buf = b.create<memref::AllocOp>(loc, resultType);
    operand.replaceAllUsesWith(buf);

    auto firstUser = *buf->user_begin();
    b.setInsertionPoint(func.getBody().findAncestorOpInRegion(*firstUser));

    // Create explicit memory copy using an affine loop nest.
    SmallVector<Value, 4> ivs;
    for (auto dimSize : resultType.getShape()) {
      auto loop = b.create<mlir::AffineForOp>(loc, 0, dimSize);
      b.setInsertionPointToStart(loop.getBody());
      ivs.push_back(loop.getInductionVar());
    }

    // Create affine load/store operations.
    auto value = b.create<mlir::AffineLoadOp>(loc, operand, ivs);
    b.create<mlir::AffineStoreOp>(loc, value, buf, ivs);
  }
}

std::unique_ptr<Pass> polyaie::createBufferMemrefResultPass() {
  return std::make_unique<BufferMemrefResult>();
}

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/IR/Dominance.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct PromoteMemrefResult
    : public polyaie::PromoteMemrefResultBase<PromoteMemrefResult> {
  void runOnOperation() override;
};
} // namespace

void PromoteMemrefResult::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());

    for (auto result : call.getResults()) {
      auto returnOp = func.front().getTerminator();
      auto arg = returnOp->getOperand(result.getResultNumber())
                     .dyn_cast<BlockArgument>();
      if (!arg)
        continue;

      auto argType = result.getType().dyn_cast<MemRefType>();
      if (!argType || argType.getRank() == 0 || argType.getNumElements() == 1)
        continue;

      // Create local buffer and replace all uses.
      b.setInsertionPointToStart(&func.front());
      auto buf = b.create<memref::AllocOp>(loc, argType);
      arg.replaceAllUsesWith(buf);

      // Set insertion point to the ancestor of the first user.
      // TODO: Is first user safe here?
      auto DT = DominanceInfo(func);
      auto firstUser = *buf->getUsers().begin();
      b.setInsertionPoint(func.front().findAncestorOpInBlock(*firstUser));

      // Create nested loop to copy data from argument to local buffer.
      SmallVector<Value, 4> ivs;
      for (auto dimSize : argType.getShape()) {
        auto loop = b.create<mlir::AffineForOp>(loc, 0, dimSize);
        b.setInsertionPointToStart(loop.getBody());
        ivs.push_back(loop.getInductionVar());
      }

      // Create affine load/store operations.
      auto value = b.create<mlir::AffineLoadOp>(loc, arg, ivs);
      b.create<mlir::AffineStoreOp>(loc, value, buf, ivs);

      // Create memref copy operation to copy data from local buffer to the
      // global memory.
      auto memory = call.getOperand(arg.getArgNumber());
      b.setInsertionPointAfter(call);
      b.create<memref::CopyOp>(loc, result, memory);
    }
  }
}

std::unique_ptr<Pass> polyaie::createPromoteMemrefResultPass() {
  return std::make_unique<PromoteMemrefResult>();
}

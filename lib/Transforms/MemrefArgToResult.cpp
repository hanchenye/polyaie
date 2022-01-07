//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct MemrefArgToResult
    : public polyaie::MemrefArgToResultBase<MemrefArgToResult> {
  void runOnOperation() override;
};
} // namespace

void MemrefArgToResult::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = func.front().getTerminator();
    auto returnVals = SmallVector<Value, 4>(returnOp->getOperands());

    // Figure out all arguments that need to be returned.
    // TODO: Currently we only return state-changed memref arguments, how to
    // determine whether other arguments need to be returned?
    for (auto arg : func.getArguments()) {
      // Get the argument type and bypass single-element memories.
      auto argType = arg.getType().dyn_cast<MemRefType>();
      if (!argType || argType.getRank() == 0 || argType.getNumElements() == 1)
        continue;

      // Return it if the argument is used by any state-changing operations.
      if (llvm::any_of(arg.getUsers(), [&](Operation *op) {
            return isa<mlir::AffineWriteOpInterface, memref::StoreOp,
                       memref::TensorStoreOp, vector::TransferWriteOp>(op);
          })) {
        // Create a local buffer for each state-changed memref argument and
        // replace all its uses.
        b.setInsertionPointToStart(&func.front());
        auto buf = b.create<memref::AllocOp>(loc, argType);
        arg.replaceAllUsesWith(buf);
        returnVals.push_back(buf);

        // Set insertion point to the ancestor of the first user.
        auto firstUser = *buf->getUsers().begin();
        b.setInsertionPoint(func.front().findAncestorOpInBlock(*firstUser));

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

        // Create a memref copy operation to copy data from local buffer.
        auto memory = call.getOperand(arg.getArgNumber());
        b.setInsertionPointAfter(call);
        b.create<memref::CopyOp>(loc, buf, memory);
      }
    }

    // Update return operation and function signature.
    b.setInsertionPoint(returnOp);
    auto newReturn = b.create<mlir::ReturnOp>(returnOp->getLoc(), returnVals);
    returnOp->erase();
    func.setType(b.getFunctionType(func.getArgumentTypes(),
                                   newReturn.getOperandTypes()));

    // Update function call.
    b.setInsertionPoint(call);
    auto newCall = b.create<CallOp>(call.getLoc(), func, call.getOperands());
    auto numResults = call.getNumResults();
    call.replaceAllUsesWith(newCall.getResults().take_front(numResults));
    call.erase();

    // Update the external uses of the local buffer.
    for (auto zip : llvm::drop_begin(
             llvm::zip(returnVals, newCall.getResults()), numResults)) {
      std::get<0>(zip).replaceUsesWithIf(std::get<1>(zip), [&](OpOperand &use) {
        return use.getOwner()->getParentRegion() == newCall->getParentRegion();
      });
    }
  }
}

std::unique_ptr<Pass> polyaie::createMemrefArgToResultPass() {
  return std::make_unique<MemrefArgToResult>();
}

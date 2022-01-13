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
struct MemrefArgToResult
    : public polyaie::MemrefArgToResultBase<MemrefArgToResult> {
  void runOnOperation() override;
};
} // namespace

void MemrefArgToResult::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc<FuncOp>(mod);

  for (auto call : llvm::make_early_inc_range(topFunc.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = func.back().getTerminator();
    SmallVector<Value, 4> returnVals(returnOp->getOperands());
    SmallVector<Value, 4> resultMems;

    // Figure out all arguments that need to be returned.
    // TODO: Currently we only return state-changed memref arguments, how to
    // determine whether other arguments need to be returned?
    for (auto arg : func.getArguments()) {
      // Get the argument type and bypass single-element memories.
      auto argType = arg.getType().dyn_cast<MemRefType>();
      if (!argType)
        continue;

      // Return it if the argument is used by any state-changing operations.
      if (llvm::any_of(arg.getUsers(), [&](Operation *op) {
            return isa<mlir::AffineWriteOpInterface, memref::StoreOp,
                       memref::TensorStoreOp, vector::TransferWriteOp>(op);
          })) {
        returnVals.push_back(arg);
        resultMems.push_back(call.getOperand(arg.getArgNumber()));
      }
    }

    // Update return operation and function signature.
    b.setInsertionPoint(returnOp);
    auto newReturn = b.create<mlir::ReturnOp>(returnOp->getLoc(), returnVals);
    returnOp->erase();
    func.setType(b.getFunctionType(func.getArgumentTypes(),
                                   newReturn.getOperandTypes()));

    // Update function call.
    b.setInsertionPointAfter(call);
    auto newCall = b.create<CallOp>(call.getLoc(), func, call.getOperands());
    auto numResults = call.getNumResults();
    call.replaceAllUsesWith(newCall.getResults().take_front(numResults));
    call.erase();

    // Create copy operation to copy the data back to global memory.
    for (auto zip :
         llvm::zip(newCall.getResults().drop_front(numResults), resultMems))
      b.create<memref::CopyOp>(loc, std::get<0>(zip), std::get<1>(zip));
  }
}

std::unique_ptr<Pass> polyaie::createMemrefArgToResultPass() {
  return std::make_unique<MemrefArgToResult>();
}

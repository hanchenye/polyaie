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
    SmallVector<Value, 8> returnVals(returnOp->getOperands());
    SmallVector<Value, 8> resultMems;
    SmallPtrSet<Value, 8> stateChangedMems;

    // Figure out all arguments that need to be returned.
    // TODO: Currently we return all memref arguments, how to determine whether
    // an argument need to be returned?
    for (auto arg : func.getArguments()) {
      // Get the argument type and bypass non-memref arguments.
      auto argType = arg.getType().dyn_cast<MemRefType>();
      if (!argType)
        continue;

      returnVals.push_back(arg);
      auto memory = call.getOperand(arg.getArgNumber());
      resultMems.push_back(memory);

      if (llvm::any_of(arg.getUsers(), [&](Operation *op) {
            return isa<mlir::AffineStoreOp>(op);
          }))
        stateChangedMems.insert(memory);
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

    // Create copy operation if the state of memory is changed.
    for (auto zip :
         llvm::zip(newCall.getResults().drop_front(numResults), resultMems))
      if (stateChangedMems.count(std::get<1>(zip)))
        b.create<memref::CopyOp>(loc, std::get<0>(zip), std::get<1>(zip));
  }
}

std::unique_ptr<Pass> polyaie::createMemrefArgToResultPass() {
  return std::make_unique<MemrefArgToResult>();
}

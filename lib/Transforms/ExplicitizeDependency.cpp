//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct ExplicitizeDependency
    : public polyaie::ExplicitizeDependencyBase<ExplicitizeDependency> {
  // Hold the subviews list (or itself) of each global memory.
  DenseMap<Value, SmallVector<Value, 16>> subviewsMap;

  void runOnOperation() override;
};
} // namespace

void ExplicitizeDependency::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto resultTypes = SmallVector<Type, 8>(func.getType().getResults().begin(),
                                            func.getType().getResults().end());

    auto returnOp = func.front().getTerminator();
    auto returnOperands = SmallVector<Value, 4>(returnOp->getOperands());

    // Figure out all arguments that need to be returned.
    for (auto arg : func.getArguments()) {
      // Get the argument type and bypass single-element memories.
      auto argType = arg.getType().dyn_cast<MemRefType>();
      if (!argType || argType.getRank() == 0 || argType.getNumElements() == 1)
        continue;

      // Return it if the argument is used by any state-changing operations.
      // TODO: How to control which argument to be returned?
      if (llvm::any_of(arg.getUsers(), [&](Operation *op) {
            return isa<mlir::AffineWriteOpInterface, memref::StoreOp,
                       memref::TensorStoreOp, vector::TransferWriteOp>(op);
          })) {
        resultTypes.push_back(arg.getType());
        returnOperands.push_back(arg);
      }
    }

    // Update return and function signature.
    func.setType(b.getFunctionType(func.getArgumentTypes(), resultTypes));
    b.setInsertionPoint(returnOp);
    b.create<mlir::ReturnOp>(returnOp->getLoc(), returnOperands);
    returnOp->erase();

    // Update function call.
    b.setInsertionPoint(call);
    auto newCall = b.create<CallOp>(call.getLoc(), func, call.getOperands());
    call.replaceAllUsesWith(
        newCall.getResults().take_front(call.getNumResults()));
    call.erase();

    // A map from a returned value to its function result.
    // FIXME: We assume that each value is not returned more than once.
    DenseMap<Value, Value> resultMap;
    for (auto zip : llvm::zip(returnOperands, newCall.getResults()))
      resultMap[std::get<0>(zip)] = std::get<1>(zip);

    // Create explicit dependencies.
    for (auto arg : func.getArguments()) {
      // Get the existing subviews list of the current memory.
      auto memory = newCall.getOperand(arg.getArgNumber());
      if (auto subview = memory.getDefiningOp<memref::SubViewOp>())
        memory = subview.source();
      auto &subviews = subviewsMap[memory];

      // Figure out if there exists an subview that has the same type.
      auto existSubview = llvm::find_if(
          subviews, [&](Value v) { return v.getType() == arg.getType(); });
      if (existSubview != subviews.end())
        newCall.setOperand(arg.getArgNumber(), *existSubview);

      // Update the subview list with the current subview if applicable.
      if (resultMap.count(arg)) {
        if (existSubview != subviews.end())
          subviews[existSubview - subviews.begin()] = resultMap.lookup(arg);
        else
          subviews.push_back(resultMap.lookup(arg));
      }
    }
  }
}

std::unique_ptr<Pass> polyaie::createExplicitizeDependencyPass() {
  return std::make_unique<ExplicitizeDependency>();
}

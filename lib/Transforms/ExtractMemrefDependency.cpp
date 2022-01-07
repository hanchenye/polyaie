//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct ExtractMemrefDependency
    : public polyaie::ExtractMemrefDependencyBase<ExtractMemrefDependency> {
  // Hold the subviews list (or itself) of each global memory.
  DenseMap<Value, SmallVector<Value, 16>> subviewsMap;

  void runOnOperation() override;
};
} // namespace

void ExtractMemrefDependency::runOnOperation() {
  auto mod = getOperation();

  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = func.front().getTerminator();

    unsigned operandIdx = 0;
    for (auto operand : call.getOperands()) {
      // Get the existing subviews list of the current memory.
      auto memory = operand;
      if (auto subview = memory.getDefiningOp<memref::SubViewOp>())
        memory = subview.source();
      auto &subviews = subviewsMap[memory];

      // Figure out if there exists an subview that has the same type. If so,
      // replace the current operand with the existing subview.
      auto existSubview = llvm::find_if(
          subviews, [&](Value v) { return v.getType() == operand.getType(); });
      if (existSubview != subviews.end())
        call.setOperand(operandIdx, *existSubview);

      // Check whether the result is an alias of the operand.
      auto isOperandAlias = [&](OpResult result) {
        return func.getArgument(operandIdx) ==
                   returnOp->getOperand(result.getResultNumber()) ||
               llvm::any_of(result.getUsers(), [&](Operation *user) {
                 auto copy = dyn_cast<memref::CopyOp>(user);
                 return copy ? copy.target() == operand : false;
               });
      };

      // Update the subview list with the current subview if applicable.
      for (auto result : call.getResults())
        if (isOperandAlias(result)) {
          if (existSubview != subviews.end())
            subviews[existSubview - subviews.begin()] = result;
          else
            subviews.push_back(result);
        }

      ++operandIdx;
    }
  }
}

std::unique_ptr<Pass> polyaie::createExtractMemrefDependencyPass() {
  return std::make_unique<ExtractMemrefDependency>();
}
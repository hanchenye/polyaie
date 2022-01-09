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
struct ExtractMemrefDependency
    : public polyaie::ExtractMemrefDependencyBase<ExtractMemrefDependency> {
  // Hold the subviews list (or itself) of each global memory.
  DenseMap<Value, SmallVector<Value, 16>> subviewsMap;

  void runOnOperation() override;
};
} // namespace

void ExtractMemrefDependency::runOnOperation() {
  auto mod = getOperation();
  auto topFunc = getTopFunc(mod);

  // Construct explicit dependencies between memrefs.
  for (auto call : llvm::make_early_inc_range(topFunc.getOps<CallOp>())) {
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

      // Update the subview list with the current subview if it is returned.
      for (auto result : call.getResults())
        if (func.getArgument(operandIdx) ==
            returnOp->getOperand(result.getResultNumber())) {
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

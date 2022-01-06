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
struct ExtractMemrefDependency
    : public polyaie::ExtractMemrefDependencyBase<ExtractMemrefDependency> {
  // Hold the subviews list (or itself) of each global memory.
  DenseMap<Value, SmallVector<Value, 16>> subviewsMap;

  void runOnOperation() override;
};
} // namespace

void ExtractMemrefDependency::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOperands =
        SmallVector<Value, 4>(func.front().getTerminator()->getOperands());

    // A map from a returned value to its function result.
    // FIXME: We assume that each value is not returned more than once.
    DenseMap<Value, Value> resultMap;
    for (auto zip : llvm::zip(returnOperands, call.getResults()))
      resultMap[std::get<0>(zip)] = std::get<1>(zip);

    // Create explicit dependencies.
    for (auto arg : func.getArguments()) {
      // Get the existing subviews list of the current memory.
      auto memory = call.getOperand(arg.getArgNumber());
      if (auto subview = memory.getDefiningOp<memref::SubViewOp>())
        memory = subview.source();
      auto &subviews = subviewsMap[memory];

      // Figure out if there exists an subview that has the same type.
      auto existSubview = llvm::find_if(
          subviews, [&](Value v) { return v.getType() == arg.getType(); });
      if (existSubview != subviews.end())
        call.setOperand(arg.getArgNumber(), *existSubview);

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

std::unique_ptr<Pass> polyaie::createExtractMemrefDependencyPass() {
  return std::make_unique<ExtractMemrefDependency>();
}

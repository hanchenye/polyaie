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
  void runOnOperation() override;
};
} // namespace

void ExtractMemrefDependency::runOnOperation() {
  auto mod = getOperation();
  auto topFunc = getTopFunc<FuncOp>(mod);

  // Hold the subviews list (or itself) of each global memory.
  DenseMap<Value, SmallVector<Value, 16>> subviewsMap;

  // Construct explicit dependencies between memrefs.
  for (auto call : llvm::make_early_inc_range(topFunc.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = func.back().getTerminator();

    for (auto &operand : call->getOpOperands()) {
      // Get the existing subviews list of the current memory.
      auto memory = operand.get();
      if (auto subview = memory.getDefiningOp<memref::SubViewOp>())
        memory = subview.source();
      auto &subviews = subviewsMap[memory];

      // Figure out if there exists an subview that has the same type. If so,
      // replace the current operand with the existing subview.
      auto existSubview = llvm::find_if(subviews, [&](Value v) {
        return v.getType() == operand.get().getType();
      });
      if (existSubview != subviews.end())
        call.setOperand(operand.getOperandNumber(), *existSubview);

      // Update the subview list with the current subview if it is returned.
      auto result = llvm::find_if(call.getResults(), [&](OpResult result) {
        return func.getArgument(operand.getOperandNumber()) ==
               returnOp->getOperand(result.getResultNumber());
      });
      if (result != call.getResults().end()) {
        if (existSubview != subviews.end())
          subviews[existSubview - subviews.begin()] = *result;
        else
          subviews.push_back(*result);
      }
    }
  }

  // As we have extracted memref dependencies, we can safely remove redundant
  // copy operations now.
  SmallVector<memref::CopyOp, 16> latestCopies;
  for (auto copy :
       llvm::make_early_inc_range(topFunc.getOps<memref::CopyOp>())) {
    auto latestCopy = llvm::find_if(latestCopies, [&](memref::CopyOp op) {
      return op.target() == copy.target() &&
             op.source().getType() == copy.source().getType();
    });

    if (latestCopy != latestCopies.end()) {
      latestCopy->erase();
      latestCopies[latestCopy - latestCopies.begin()] = copy;
    } else
      latestCopies.push_back(copy);
  }
}

std::unique_ptr<Pass> polyaie::createExtractMemrefDependencyPass() {
  return std::make_unique<ExtractMemrefDependency>();
}

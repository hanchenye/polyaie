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
struct PromoteMemrefResult
    : public polyaie::PromoteMemrefResultBase<PromoteMemrefResult> {
  void runOnFunction() override;
};
} // namespace

/// This pass reduces the sizes of memrefs passed to each function: (1) conduct
/// loop analysis to determine which tile of a memref is accessed in a function,
/// (2) create a corresponding SubViewOp to load the tile out from the original
/// memref and replace all uses.
void PromoteMemrefResult::runOnFunction() {
  auto func = getFunction();
  auto b = OpBuilder(func);
  auto loc = b.getUnknownLoc();
}

std::unique_ptr<OperationPass<FuncOp>>
polyaie::createPromoteMemrefResultPass() {
  return std::make_unique<PromoteMemrefResult>();
}

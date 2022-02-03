//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct CodeGenCleanup : public polyaie::CodeGenCleanupBase<CodeGenCleanup> {
  void runOnOperation() override;
};
} // namespace

void CodeGenCleanup::runOnOperation() {
  for (auto &op : llvm::make_early_inc_range(getOperation().getOps()))
    if (isa<memref::AllocOp, dataflow::HostDMAOp>(op)) {
      op.dropAllUses();
      op.erase();

    } else if (auto func = dyn_cast<mlir::FuncOp>(op)) {
      if (!func.isPrivate())
        continue;

      for (auto &block : llvm::make_early_inc_range(func.body())) {
        block.dropAllUses();
        block.erase();
      }
    }
}

std::unique_ptr<Pass> polyaie::createCodeGenCleanupPass() {
  return std::make_unique<CodeGenCleanup>();
}

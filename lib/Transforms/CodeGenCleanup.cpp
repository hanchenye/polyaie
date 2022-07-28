//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;
using namespace xilinx::AIE;

namespace {
struct CodeGenCleanup : public polyaie::CodeGenCleanupBase<CodeGenCleanup> {
  void runOnOperation() override;
};
} // namespace

void CodeGenCleanup::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  for (auto &op : llvm::make_early_inc_range(getOperation().getOps())) {
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

  for (auto core : llvm::make_early_inc_range(mod.getOps<CoreOp>())) {
    if (core.rowIndex() == 0) {
      core->dropAllUses();
      core.erase();
    }
  }
}

std::unique_ptr<Pass> polyaie::createCodeGenCleanupPass() {
  return std::make_unique<CodeGenCleanup>();
}

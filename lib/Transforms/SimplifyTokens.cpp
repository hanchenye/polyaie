//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace memrefext;
using namespace xilinx::AIE;

namespace {
struct SimplifyTokens : public polyaie::SimplifyTokensBase<SimplifyTokens> {
  void runOnOperation() override;
};
} // namespace

void SimplifyTokens::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  // Postprocess for host kernel generation. We lower LoadBufferOp and
  // StoreBufferOp and create lock releases to indicate the completion of the
  // whole program.
  for (auto &op : llvm::make_early_inc_range(mod.getBody()->getOperations())) {
    if (auto coreOp = dyn_cast<CoreOp>(op)) {
      // A quick token uese canonicalization.
      auto coreTokUses = coreOp.body().getOps<UseTokenOp>();
      unsigned useIdx = 0;
      SmallVector<UseTokenOp, 4> usesToErase;
      for (auto relUse : coreTokUses) {
        ++useIdx;
        if (!relUse.release())
          continue;
        for (auto acqUse : llvm::drop_begin(coreTokUses, useIdx)) {
          if (!acqUse.acquire() || relUse.value() != acqUse.value() ||
              relUse.tokenName() != acqUse.tokenName())
            continue;
          usesToErase.push_back(acqUse);
        }
      }
      for (auto use : usesToErase)
        use.erase();
    }
  }
}

std::unique_ptr<Pass> polyaie::createSimplifyTokensPass() {
  return std::make_unique<SimplifyTokens>();
}

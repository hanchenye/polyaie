//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "aie/AIETokenAnalysis.h"
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

  TokenAnalysis TA(mod);
  TA.runAnalysis();
  auto tokChains = TA.getTokenChains();

  // Map from token release operation to all token acquire operations that are
  // chained together.
  DenseMap<Operation *, SmallVector<Operation *, 4>> chainMap;
  for (auto pair : tokChains)
    chainMap[pair.first].push_back(pair.second);

  for (auto pair : chainMap) {
    // Only if all the release and acquire operations are in the same operation,
    // they can be safely erased.
    if (llvm::all_of(pair.second, [&](Operation *op) {
          return op->getParentOp() == pair.first->getParentOp();
        })) {
      pair.first->erase();
      llvm::for_each(pair.second, [&](Operation *op) { op->erase(); });
    }
  }
}

std::unique_ptr<Pass> polyaie::createSimplifyTokensPass() {
  return std::make_unique<SimplifyTokens>();
}

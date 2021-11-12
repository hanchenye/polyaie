//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/Passes.h"
#include "polyaie/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct CreateDataflow : public CreateDataflowBase<CreateDataflow> {
  void runOnOperation() override;
};
} // namespace

void CreateDataflow::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
}

std::unique_ptr<Pass> polyaie::createCreateDataflowPass() {
  return std::make_unique<CreateDataflow>();
}

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/IR/Dominance.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct CreateInterface : public polyaie::CreateInterfaceBase<CreateInterface> {
  void runOnOperation() override;
};
} // namespace

void CreateInterface::runOnOperation() {}

std::unique_ptr<Pass> polyaie::createCreateInterfacePass() {
  return std::make_unique<CreateInterface>();
}

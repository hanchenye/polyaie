//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct InsertGMIOAdapter
    : public polyaie::InsertGMIOAdapterBase<InsertGMIOAdapter> {
  void runOnOperation() override;
};
} // namespace

void InsertGMIOAdapter::runOnOperation() {}

std::unique_ptr<Pass> polyaie::createInsertGMIOAdapterPass() {
  return std::make_unique<InsertGMIOAdapter>();
}

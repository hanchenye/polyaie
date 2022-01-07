//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct TensorizeMemref : public polyaie::TensorizeMemrefBase<TensorizeMemref> {
  void runOnOperation() override;
};
} // namespace

void TensorizeMemref::runOnOperation() { auto mod = getOperation(); }

std::unique_ptr<Pass> polyaie::createTensorizeMemrefPass() {
  return std::make_unique<TensorizeMemref>();
}

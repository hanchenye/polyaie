//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct ConvertToAIE : public ConvertToAIEBase<ConvertToAIE> {
  void runOnOperation() override;
};
} // namespace

void ConvertToAIE::runOnOperation() {}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}

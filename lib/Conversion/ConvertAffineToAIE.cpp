//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Conversion/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct ConvertAffineToAIE : public ConvertAffineToAIEBase<ConvertAffineToAIE> {
  void runOnOperation() override;
};
} // namespace

void ConvertAffineToAIE::runOnOperation() {}

std::unique_ptr<Pass> polyaie::createConvertAffineToAIEPass() {
  return std::make_unique<ConvertAffineToAIE>();
}

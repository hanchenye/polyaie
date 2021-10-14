//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_CONVERSION_PASSES_H
#define POLYAIE_CONVERSION_PASSES_H

#include "aie/AIEDialect.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Pass/Pass.h"
#include <memory>

namespace mlir {
class Pass;
} // namespace mlir

namespace mlir {
namespace polyaie {

std::unique_ptr<Pass> createConvertAffineToAIEPass();

void registerConversionPasses();

#define GEN_PASS_CLASSES
#include "polyaie/Conversion/Passes.h.inc"

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_CONVERSION_PASSES_H

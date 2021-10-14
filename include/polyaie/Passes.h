//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_PASSES_H
#define POLYAIE_PASSES_H

#include "aie/AIEDialect.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Vector/VectorOps.h"
#include "mlir/Pass/Pass.h"
#include <memory>

namespace mlir {
class Pass;
} // namespace mlir

namespace mlir {
namespace polyaie {

std::unique_ptr<Pass> createAffinePreprocessPass();

void registerPolyAIEPasses();

#define GEN_PASS_CLASSES
#include "polyaie/Passes.h.inc"

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_PASSES_H

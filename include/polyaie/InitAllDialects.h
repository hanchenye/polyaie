//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_INITALLDIALECTS_H
#define POLYAIE_INITALLDIALECTS_H

#include "aie/AIEDialect.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/StandardOps/IR/Ops.h"
#include "mlir/IR/Dialect.h"

namespace mlir {
namespace polyaie {

// Add all the related dialects to the provided registry.
inline void registerAllDialects(mlir::DialectRegistry &registry) {
  // clang-format off
  registry.insert<
    mlir::StandardOpsDialect,
    mlir::memref::MemRefDialect,
    mlir::AffineDialect,
    mlir::LLVM::LLVMDialect,
    xilinx::AIE::AIEDialect
  >();
  // clang-format on
}

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_INITALLDIALECTS_H

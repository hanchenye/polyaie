//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_INITALLDIALECTS_H
#define POLYAIE_INITALLDIALECTS_H

#include "aie/AIEDialect.h"
#include "circt/Dialect/Handshake/HandshakeDialect.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Dialect/Math/IR/Math.h"
#include "mlir/Dialect/SCF/SCF.h"
#include "mlir/Dialect/Vector/VectorOps.h"
#include "mlir/IR/Dialect.h"
#include "polyaie/MemRefExt/MemRefExt.h"

namespace mlir {
namespace polyaie {

// Add all the related dialects to the provided registry.
inline void registerAllDialects(mlir::DialectRegistry &registry) {
  // clang-format off
  registry.insert<
    mlir::AffineDialect,
    mlir::scf::SCFDialect,
    mlir::StandardOpsDialect,
    mlir::arith::ArithmeticDialect,
    mlir::math::MathDialect,
    mlir::memref::MemRefDialect,
    polyaie::memrefext::MemRefExtDialect,
    mlir::vector::VectorDialect,
    mlir::LLVM::LLVMDialect,
    xilinx::AIE::AIEDialect,
    circt::handshake::HandshakeDialect
  >();
  // clang-format on
}

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_INITALLDIALECTS_H

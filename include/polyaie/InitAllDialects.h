//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_INITALLDIALECTS_H
#define POLYAIE_INITALLDIALECTS_H

#include "aie/AIEDialect.h"
#include "aie/Dialect/AIEVec/IR/AIEVecOps.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Dialect/Bufferization/IR/Bufferization.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Math/IR/Math.h"
#include "mlir/Dialect/SCF/SCF.h"
#include "mlir/Dialect/Vector/IR/VectorOps.h"
#include "mlir/IR/Dialect.h"
#include "polyaie/Dataflow/Dataflow.h"

namespace mlir {
namespace polyaie {

// Add all the related dialects to the provided registry.
inline void registerAllDialects(mlir::DialectRegistry &registry) {
  // clang-format off
  registry.insert<
    mlir::func::FuncDialect,
    mlir::cf::ControlFlowDialect,
    mlir::AffineDialect,
    mlir::scf::SCFDialect,
    mlir::memref::MemRefDialect,
    mlir::arith::ArithmeticDialect,
    mlir::math::MathDialect,
    mlir::vector::VectorDialect,
    mlir::bufferization::BufferizationDialect,
    mlir::LLVM::LLVMDialect,
    polyaie::dataflow::DataflowDialect,
    xilinx::AIE::AIEDialect,
    xilinx::aievec::AIEVecDialect
  >();
  // clang-format on
}

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_INITALLDIALECTS_H

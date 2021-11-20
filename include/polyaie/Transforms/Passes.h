//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_PASSES_H
#define POLYAIE_PASSES_H

#include "aie/AIEDialect.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/Vector/VectorOps.h"
#include "mlir/Pass/Pass.h"
#include "polyaie/MemRefExt/MemRefExt.h"
#include <memory>

namespace mlir {
class Pass;
} // namespace mlir

namespace mlir {
namespace polyaie {

struct PolyAIEPipelineOptions
    : public PassPipelineOptions<PolyAIEPipelineOptions> {
  Option<std::string> pipelineTopFuncName{
      *this, "top-func-name",
      ::llvm::cl::desc("Specify the top function of the program"),
      ::llvm::cl::init("main")};
};

std::unique_ptr<Pass> createPreprocessPass();
std::unique_ptr<Pass> createPreprocessPass(const PolyAIEPipelineOptions &opts);
std::unique_ptr<Pass> createCreateDataflowPass();
std::unique_ptr<Pass> createPlacementPass();
std::unique_ptr<Pass> createPrintDataflowPass();
std::unique_ptr<Pass> createConvertToAIEPass();

void registerPolyAIEPassPipeline();

void registerPolyAIEPasses();

#define GEN_PASS_CLASSES
#include "polyaie/Transforms/Passes.h.inc"

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_PASSES_H

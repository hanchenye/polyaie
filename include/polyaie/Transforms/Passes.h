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
  /// Configure the preprocess pass.
  Option<std::string> preprocessTopFuncName{
      *this, "top-func-name",
      llvm::cl::desc("Specify the top function of the program"),
      llvm::cl::init("main")};

  /// Configure the placement pass.
  Option<std::string> placementAlgorithm{
      *this, "algorithm",
      llvm::cl::desc("Specify the placement algorithm, possible values are: "
                     "naive(default), simulated-annealing"),
      llvm::cl::init("naive")};

  /// Configure the vectorization and convert-to-aie pass.
  Option<int64_t> vectorizeSize{
      *this, "vec-size",
      llvm::cl::desc("Specify the size of super vectorization"),
      llvm::cl::init(8)};
};

std::unique_ptr<Pass> createPreprocessPass();
std::unique_ptr<Pass> createReduceBufferSizePass();
std::unique_ptr<Pass> createCreateDataflowPass();
std::unique_ptr<OperationPass<FuncOp>> createDetectReductionPass();
std::unique_ptr<Pass> createPlacementPass();
std::unique_ptr<Pass> createPrintDataflowPass();
std::unique_ptr<Pass> createConvertToAIEPass();
std::unique_ptr<Pass> createPostprocessPass();

std::unique_ptr<Pass> createPreprocessPass(const PolyAIEPipelineOptions &opts);
std::unique_ptr<Pass> createPlacementPass(const PolyAIEPipelineOptions &opts);
std::unique_ptr<Pass>
createConvertToAIEPass(const PolyAIEPipelineOptions &opts);

void registerPolyAIEPassPipeline();
void registerPolyAIEPasses();

#define GEN_PASS_CLASSES
#include "polyaie/Transforms/Passes.h.inc"

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_PASSES_H

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
#define GEN_PASS_REGISTRATION
#include "polyaie/Transforms/Passes.h.inc"
} // namespace

void polyaie::registerPolyAIEPassPipeline() {
  PassPipelineRegistration<PolyAIEOptions>(
      "polyaie-pipeline", "Compile to AIE array",
      [](OpPassManager &pm, const PolyAIEOptions &opts) {
        pm.addPass(polyaie::createPreprocessPass(opts));
        pm.addPass(mlir::createAffineLoopNormalizePass());
        pm.addPass(mlir::createSimplifyAffineStructuresPass());
        pm.addPass(mlir::createCanonicalizerPass());
        pm.addPass(polyaie::createCreateMemrefSubviewPass());
        pm.addPass(polyaie::createDetectLoopReductionPass());
        pm.addPass(polyaie::createHoistMemrefSubviewPass());
        pm.addPass(polyaie::createMemrefArgToResultPass());
        pm.addPass(polyaie::createExtractMemrefDependencyPass());
        pm.addPass(polyaie::createPromoteMemrefResultPass());
        // pm.addPass(polyaie::createConvertToDataflowPass());
        // if (opts.enableLinkExternKernel)
        //   pm.addPass(polyaie::createLinkExternKernelPass(opts));
        if (opts.vectorizeSize != 1)
          pm.addPass(mlir::createSuperVectorizePass({opts.vectorizeSize}));
        pm.addPass(polyaie::createPlacementPass(opts));
        pm.addPass(polyaie::createPrintDataflowPass());
        // pm.addPass(polyaie::createConvertToAIEPass(opts));
        // pm.addPass(xilinx::AIE::createAIEPathfinderPass());
        // pm.addPass(xilinx::AIE::createAIECreateLocksPass());
        // pm.addPass(polyaie::createDoubleBufferPass());
        // pm.addPass(polyaie::createPostprocessPass());
      });
}

void polyaie::registerPolyAIEPasses() {
  registerPasses();
  registerPolyAIEPassPipeline();
}

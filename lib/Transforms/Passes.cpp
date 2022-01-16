//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
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
        pm.addPass(polyaie::createSplitTopFuncPass(opts));
        pm.addPass(mlir::createAffineLoopNormalizePass());
        pm.addPass(mlir::createSimplifyAffineStructuresPass());
        pm.addPass(mlir::createCanonicalizerPass());

        pm.addPass(polyaie::createCreateMemrefSubviewPass());
        pm.addPass(polyaie::createHoistMemrefSubviewPass());
        pm.addPass(polyaie::createMemrefArgToResultPass(opts));
        pm.addPass(polyaie::createExtractMemrefDependencyPass());
        pm.addPass(polyaie::createCreateInterfacePass());
        pm.addPass(polyaie::createBufferMemrefResultPass());

        pm.addPass(polyaie::createTensorizeMemrefPass());
        pm.addPass(polyaie::createDetectLoopReductionPass());
        pm.addPass(mlir::createLoopFusionPass());
        pm.addPass(mlir::createAffineScalarReplacementPass());
        if (opts.superVectorizeSize != 1)
          pm.addPass(mlir::createSuperVectorizePass({opts.superVectorizeSize}));

        pm.addPass(polyaie::createConvertToDataflowPass());
        pm.addPass(mlir::createCanonicalizerPass());
        // pm.addPass(polyaie::createCreateInterfacePass());
        pm.addPass(polyaie::createPlacementPass(opts));
        pm.addPass(polyaie::createPrintDataflowPass());

        pm.addPass(polyaie::createDataflowToAIEPass());
        pm.addPass(mlir::createCanonicalizerPass());
        if (opts.enableLinkExternKernel)
          pm.addPass(polyaie::createLinkExternKernelPass(opts));
        pm.addPass(polyaie::createMaterializeBroadcastPass());
        pm.addPass(polyaie::createFlowPacketToCircuitPass());

        pm.addPass(xilinx::AIE::createAIECreateLocksPass());
        pm.addPass(xilinx::AIE::createAIERoutePacketFlowsPass());
        pm.addPass(xilinx::AIE::createAIERouteFlowsPass());
        // pm.addPass(xilinx::AIE::createAIEPathfinderPass());
        // pm.addPass(polyaie::createDoubleBufferPass());
        pm.addPass(polyaie::createPostprocessPass());
      });
}

void polyaie::registerPolyAIEPasses() {
  registerPasses();
  registerPolyAIEPassPipeline();
}

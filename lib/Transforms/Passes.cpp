//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "aie/Dialect/AIEVec/Transforms/Passes.h"
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
        // Partition the input kernel into multiple tiles.
        pm.addPass(polyaie::createPreprocessPass(opts));
        pm.addPass(polyaie::createSplitTopFuncPass(opts));
        pm.addPass(mlir::createAffineLoopNormalizePass());
        pm.addNestedPass<func::FuncOp>(
            mlir::createSimplifyAffineStructuresPass());
        pm.addPass(mlir::createCanonicalizerPass());

        // Generate the dependency between each tile.
        pm.addPass(polyaie::createCreateMemrefSubviewPass());
        pm.addPass(polyaie::createHoistMemrefSubviewPass());
        pm.addPass(polyaie::createMemrefArgToResultPass(opts));
        pm.addPass(polyaie::createExtractMemrefDependencyPass());
        pm.addPass(polyaie::createBufferMemrefResultPass());

        // Tensorization the program and conduct intra-kernel optimizations.
        pm.addPass(polyaie::createTensorizeMemrefPass());
        pm.addPass(mlir::createLoopFusionPass());
        // pm.addPass(polyaie::createDetectLoopReductionPass());
        pm.addPass(mlir::createAffineScalarReplacementPass());
        if (opts.superVectorizeSize != 1) {
          pm.addPass(mlir::createSuperVectorizePass({opts.superVectorizeSize}));
          pm.addPass(xilinx::AIE::createAIEVectorOptPass());
          pm.addPass(xilinx::aievec::createAIEVectorizePass());
        }

        // Convert to dataflow IR and conduct placement.
        pm.addPass(polyaie::createConvertToDataflowPass());
        pm.addPass(mlir::createCanonicalizerPass());
        pm.addPass(polyaie::createInsertGMIOAdapterPass());
        pm.addPass(polyaie::createPlacementPass(opts));
        if (opts.enableCreateInterface)
          pm.addPass(polyaie::createCreateInterfacePass());
        pm.addPass(polyaie::createPrintDataflowPass());

        // Convert to AIE IR and implement data transfers.
        pm.addPass(polyaie::createDataflowToAIEPass());
        pm.addPass(mlir::createCanonicalizerPass());
        if (opts.enableLinkExternKernel)
          pm.addPass(polyaie::createLinkExternKernelPass(opts));
        pm.addPass(polyaie::createMaterializeBroadcastPass());
        pm.addPass(polyaie::createFlowPacketToCircuitPass());

        // Materialize tokens with locks, route, and enable double buffering.
        pm.addPass(xilinx::AIE::createAIECreateLocksPass());
        pm.addPass(xilinx::AIE::createAIERoutePacketFlowsPass());
        pm.addPass(xilinx::AIE::createAIERouteFlowsPass());
        // pm.addPass(xilinx::AIE::createAIEPathfinderPass());
        pm.addPass(polyaie::createDoubleBufferPass());
        pm.addPass(polyaie::createPostprocessPass());
      });
}

void polyaie::registerPolyAIEPasses() {
  registerPasses();
  registerPolyAIEPassPipeline();
}

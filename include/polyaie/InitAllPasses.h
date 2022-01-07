//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_INITALLPASSES_H
#define POLYAIE_INITALLPASSES_H

#include "mlir/InitAllPasses.h"
#include "polyaie/Transforms/Passes.h"

namespace mlir {
namespace polyaie {

// Add all the related passes.
inline void registerAllPasses() {
  // MLIR passes.
  mlir::registerAllPasses();

  // PolyAIE passes.
  polyaie::registerPolyAIEPasses();

  // AIE passes.
  xilinx::AIE::registerAIEAssignBufferAddressesPass();
  xilinx::AIE::registerAIECoreToStandardPass();
  xilinx::AIE::registerAIECreateCoresPass();
  xilinx::AIE::registerAIECreateLocksPass();
  xilinx::AIE::registerAIEFindFlowsPass();
  xilinx::AIE::registerAIEHerdRoutingPass();
  xilinx::AIE::registerAIELowerMemcpyPass();
  xilinx::AIE::registerAIENormalizeAddressSpacesPass();
  xilinx::AIE::registerAIERouteFlowsPass();
  xilinx::AIE::registerAIERoutePathfinderFlowsPass();
  xilinx::AIE::registerAIERoutePacketFlowsPass();
  xilinx::AIE::registerAIEVectorOptPass();
}

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_INITALLPASSES_H

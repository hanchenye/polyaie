//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_TRANSFORMS_PASSES_TD
#define POLYAIE_TRANSFORMS_PASSES_TD

include "mlir/Pass/PassBase.td"

def Preprocess : Pass<"polyaie-preprocess", "ModuleOp"> {
  let summary = "Preprocess the IR from phism";
  let constructor = "mlir::polyaie::createPreprocessPass()";

  let options = [
    Option<"topFuncName", "top-func-name", "std::string",
           /*default=*/"\"main\"", "Specify the top function of the program">
  ];
}

def SplitTopFunc : Pass<"polyaie-split-top-func", "ModuleOp"> {
  let summary = "Split the top-function";
  let description = [{
    Split the top-function into multiple sub-functions by unrolling the loops in
    the top-function. The total number of calls in the top-function after
    unrolling is constrained by the available number of AIEs.
  }];
  let constructor = "mlir::polyaie::createSplitTopFuncPass()";

  let options = [
    Option<"numAIE", "num-aie", "int64_t", /*default=*/"256",
           "Specify the available number of AIEs">
  ];
}

def CreateMemrefSubview : Pass<"polyaie-create-memref-subview", "FuncOp"> {
  let summary = "Create subviews based on loop analysis";
  let description = [{
    Through loop analysis, this pass can identify the memory partition that each
    sub-function is accessing. Then, by creating subview operations, the program
    in each sub-function can access the memory subview rather than the original
    memory.
  }];
  let constructor = "mlir::polyaie::createCreateMemrefSubviewPass()";
}

def HoistMemrefSubview : Pass<"polyaie-hoist-memref-subview", "ModuleOp"> {
  let summary = "Hoist subviews out of sub-functions";
  let description = [{
    Hoist subviews such that each sub-function takes memory subviews rather than
    the original memories as input.
  }];
  let constructor = "mlir::polyaie::createHoistMemrefSubviewPass()";
}

def MemrefArgToResult : Pass<"polyaie-memref-arg-to-result", "ModuleOp"> {
  let summary = "Return specified memref arguments as results";
  let description = [{
    Return specified memref arguments as results and create copy operations in
    the top-function to copy the data back to the original memories.
  }];
  let constructor = "mlir::polyaie::createMemrefArgToResultPass()";

  let options = [
    Option<"returnAllArg", "return-all-arg", "bool",
           /*default=*/"false", "Return all arguments as results">
  ];
}

def ExtractMemrefDependency :
      Pass<"polyaie-extract-memref-dependency", "ModuleOp"> {
  let summary = "Extract memref dependency";
  let description = [{
    Construct memref dependency between sub-function calls and remove redundant
    copy operations in the top-function.
  }];
  let constructor = "mlir::polyaie::createExtractMemrefDependencyPass()";
}

def BufferMemrefResult : Pass<"polyaie-buffer-memref-result", "FuncOp"> {
  let summary = "Buffer memref results";
  let description = [{
    Promote each memref result to a local buffer.
  }];
  let constructor = "mlir::polyaie::createBufferMemrefResultPass()";
}

def TensorizeMemref : Pass<"polyaie-tensorize-memref", "ModuleOp"> {
  let summary = "Tensorize memrefs";
  let constructor = "mlir::polyaie::createTensorizeMemrefPass()";
}

def DetectLoopReduction : Pass<"polyaie-detect-loop-reduction", "FuncOp"> {
  let summary = "Detect reductions in affine loops";
  let constructor = "mlir::polyaie::createDetectLoopReductionPass()";
}

def ConvertToDataflow : Pass<"polyaie-convert-to-dataflow", "ModuleOp"> {
  let summary = "Extract the depedencies and create dataflow";
  let description = [{
    Extract the dependencies between different function calls through memory
    type analysis. Then, create a dataflow based on the dependencies.
  }];
  let constructor = "mlir::polyaie::createConvertToDataflowPass()";
}

def InsertGMIOAdapter : Pass<"polyaie-insert-gmio-adapter", "ModuleOp"> {
  let summary = "Insert empty process node for each GMIO";
  let description = [{
    As GMIO cannot transmit packet streams, we need an adapter for each GMIO
    such that we can first stream the data from GMIO to the adapter using
    circuit-switched mode and then transmit packet from the adapter.
  }];
  let constructor = "mlir::polyaie::createInsertGMIOAdapterPass()";
}

def Placement : Pass<"polyaie-placement", "ModuleOp"> {
  let summary = "Place function calls to a physical location";
  let description = [{
    Find a physical location for each function call in the module using the
    given strategy. Buffer size and routing distance (adjacent/non-adjacent) are
    considered in wirestrength.
  }];
  let constructor = "mlir::polyaie::createPlacementPass()";

  let options = [
    Option<"algorithm", "algorithm", "std::string", /*default=*/"\"naive\"",
           "Specify the placement algorithm, possible values are: "
           "naive(default), simulated-annealing">
  ];
}

def CreateInterface : Pass<"polyaie-create-interface", "ModuleOp"> {
  let summary = "Create interfaces for the dataflow";
  let description = [{
    Packet tensor load/store operations that is associated to the same NoC or
    PL interface into PLIO/GMIO process operations.
  }];
  let constructor = "mlir::polyaie::createCreateInterfacePass()";
}

def PrintDataflow : Pass<"polyaie-print-dataflow", "ModuleOp"> {
  let summary = "Print dataflow into a DOT graph";
  let constructor = "mlir::polyaie::createPrintDataflowPass()";
}

def DataflowToAIE : Pass<"polyaie-dataflow-to-aie", "ModuleOp"> {
  let summary = "Convert to the logical-level IR of AIE";
  let description = [{
    Lower dataflow processes to AIE tiles and cores, create local buffers,
    create MemOp and FlowOp to implement the dependencies between AIE tiles,
    lower buffer load and store operations.
  }];
  let constructor = "mlir::polyaie::createDataflowToAIEPass()";
}

def LinkExternKernel : Pass<"polyaie-link-extern-kernel", "ModuleOp"> {
  let summary = "Substitute each function body with an external kernel";
  let description = [{
    This is a highly experimental pass. We need to figure out how to let the
    compiler know which external kernel to link for each tile.
  }];
  let constructor = "mlir::polyaie::createLinkExternKernelPass()";

  let options = [
    Option<"objectFile", "object-file", "std::string",
           /*default=*/"\"kernel.o\"", "Specify the path of the pre-compiled "
           "object file of external kernels">,
    Option<"genExternKernel", "gen-extern-kernel", "bool", /*default=*/"true",
            "Whether to generate external kernels through AIEVec dialect">
  ];
}

def MaterializeBroadcast : Pass<"polyaie-materialize-broadcast", "ModuleOp"> {
  let summary = "Materialize broadcast with tokens, flows, and dmas";
  let constructor = "mlir::polyaie::createMaterializeBroadcastPass()";
}

def FlowPacketToCircuit : Pass<"polyaie-flow-packet-to-circuit", "ModuleOp"> {
  let summary = "Attempt to convert packet flows to circuit flows";
  let description = [{
    The conversion is possible when both the source channel and destination
    channel only handle one DMA.
  }];
  let constructor = "mlir::polyaie::createFlowPacketToCircuitPass()";
}

def DoubleBuffer : Pass<"polyaie-double-buffer", "ModuleOp"> {
  let summary = "Enable the double buffer between computing and communication";
  let constructor = "mlir::polyaie::createDoubleBufferPass()";
}

def Postprocess : Pass<"polyaie-postprocess", "ModuleOp"> {
  let summary = "Postprocess the AIE-level IR";
  let description = [{
    Constant localization and remove redundant operations.
  }];
  let constructor = "mlir::polyaie::createPostprocessPass()";
}

#endif // POLYAIE_TRANSFORMS_PASSES_TD

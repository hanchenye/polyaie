//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_PASSES_TD
#define POLYAIE_PASSES_TD

include "mlir/Pass/PassBase.td"

def Preprocess : Pass<"polyaie-preprocess", "ModuleOp"> {
  let summary = "Preprocess the affine-level IR";
  let description = [{
    Erase contant arguments, unroll all loops, duplicate all sub-functions in
    the top function, bufferize all scalars to single-element memrefs, inline
    top function, and eliminate redundant sub-functions.
  }];
  let constructor = "mlir::polyaie::createPreprocessPass()";

  let options = [
    Option<"topFuncName", "top-func-name", "std::string",
           /*default=*/"\"main\"", "Specify the top function of the program">
  ];
}

def CreateSubView : FunctionPass<"polyaie-create-subview"> {
  let summary = "Extract local buffers based on loop analysis";
  let description = [{
    Through loop analysis, this pass can identify the memory partition that each
    function has accessed. In this way, the local buffer of each function can be
    extracted from the global memory.
  }];
  let constructor = "mlir::polyaie::createCreateSubViewPass()";
}

def DetectReduction : FunctionPass<"polyaie-detect-reduction"> {
  let summary = "Detect reductions in AffineForOps";
  let constructor = "mlir::polyaie::createDetectReductionPass()";
}

def ConvertToDataflow : Pass<"polyaie-convert-to-dataflow", "ModuleOp"> {
  let summary = "Extract the depedencies and create dataflow";
  let description = [{
    Extract the dependencies between different function calls through memory
    type analysis. Then, create a dataflow based on the dependencies.
  }];
  let constructor = "mlir::polyaie::createConvertToDataflowPass()";
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
           "object file of external kernels">
  ];
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

def PrintDataflow : Pass<"polyaie-print-dataflow", "ModuleOp"> {
  let summary = "Print dataflow into a DOT graph";
  let constructor = "mlir::polyaie::createPrintDataflowPass()";
}

def ConvertToAIE : Pass<"polyaie-convert-to-aie", "ModuleOp"> {
  let summary = "Convert to the logical-level IR of AIE";
  let description = [{
    Lower function calls to AIE tiles and cores, create local buffers, create
    MemOp and FlowOp to implement the dependencies between AIE tiles, lower
    buffer load and store operations.
  }];
  let constructor = "mlir::polyaie::createConvertToAIEPass()";

  let options = [
    Option<"vecSize", "vec-size", "int64_t", /*default=*/"1",
           "Specify the size of super vectorization">
  ];
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

#endif // POLYAIE_PASSES_TD

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

  let options = [
    Option<"topFuncName", "top-func-name", "std::string",
           /*default=*/"\"main\"", "Specify the top function of the program">
  ];

  let constructor = "mlir::polyaie::createPreprocessPass()";

  let dependentDialects = [
    "mlir::AffineDialect", "mlir::StandardOpsDialect",
    "mlir::memref::MemRefDialect", "mlir::LLVM::LLVMDialect"
  ];
}

def CreateDataflow : Pass<"polyaie-create-dataflow", "ModuleOp"> {
  let summary = "Extract the depedencies and create dataflow";
  let description = [{
    Extract the dependencies between different function calls through memory
    access analysis. Then, create a dataflow based on the dependencies.
  }];

  let constructor = "mlir::polyaie::createCreateDataflowPass()";

  let dependentDialects = [
    "mlir::AffineDialect", "mlir::StandardOpsDialect",
    "mlir::memref::MemRefDialect", "mlir::polyaie::memrefext::MemRefExtDialect"
  ];
}

def PrintDataflow : Pass<"polyaie-print-dataflow", "ModuleOp"> {
  let summary = "Print dataflow";
  let description = [{
    Print the call operations' dataflow graph of the module.
  }];

  let constructor = "mlir::polyaie::createPrintDataflowPass()";

  let dependentDialects = [
    "mlir::AffineDialect", "mlir::StandardOpsDialect",
    "mlir::memref::MemRefDialect", "mlir::polyaie::memrefext::MemRefExtDialect"
  ];
}

def ConvertToAIE : Pass<"polyaie-convert-to-aie", "ModuleOp"> {
  let summary = "Convert to the logical-level IR of AIE";
  let description = [{
    Placement, buffer allocation, routing, and physical locks materialization.
  }];

  let constructor = "mlir::polyaie::createConvertToAIEPass()";

  let dependentDialects = [
    "mlir::AffineDialect", "mlir::StandardOpsDialect",
    "mlir::memref::MemRefDialect", "mlir::vector::VectorDialect",
    "xilinx::AIE::AIEDialect"
  ];
}

#endif // POLYAIE_PASSES_TD

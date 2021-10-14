//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_CONVERSION_PASSES_TD
#define POLYAIE_CONVERSION_PASSES_TD

include "mlir/Pass/PassBase.td"

def ConvertAffineToAIE : Pass<"convert-affine-to-aie", "ModuleOp"> {
  let summary = "Convert Affine operations to AIE";
  let description = [{}];

  let options = [
    Option<"topFuncName", "top-func-name", "std::string",
           /*default=*/"\"main\"", "Specify the top function of the program">
  ];

  let constructor = "mlir::polyaie::createConvertAffineToAIEPass()";

  let dependentDialects = [
    "mlir::StandardOpsDialect", "mlir::memref::MemRefDialect",
    "mlir::AffineDialect", "mlir::LLVM::LLVMDialect", "xilinx::AIE::AIEDialect"
  ];
}

#endif // POLYAIE_CONVERSION_PASSES_TD

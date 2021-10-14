//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_PASSES_TD
#define POLYAIE_PASSES_TD

include "mlir/Pass/PassBase.td"

def AffinePreprocess : Pass<"affine-preprocess", "ModuleOp"> {
  let summary = "Preprocess the affine-level IR";
  let description = [{
    Erase contant arguments, unroll all loops and duplicate all sub-functions in
    the top function, and bufferize all scalar tos single-element memrefs.
  }];

  let options = [
    Option<"topFuncName", "top-func-name", "std::string",
           /*default=*/"\"main\"", "Specify the top function of the program">
  ];

  let constructor = "mlir::polyaie::createAffinePreprocessPass()";

  let dependentDialects = [
    "mlir::StandardOpsDialect", "mlir::memref::MemRefDialect",
    "mlir::AffineDialect"
  ];
}

#endif // POLYAIE_PASSES_TD

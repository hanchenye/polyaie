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

  let constructor = "mlir::polyaie::createConvertAffineToAIEPass()";

  let dependentDialects = [
    "mlir::AffineDialect", "xilinx::AIE::AIEDialect"
  ];
}

#endif // POLYAIE_CONVERSION_PASSES_TD

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_MEMREFEXT_MEMREFEXT_TD
#define POLYAIE_MEMREFEXT_MEMREFEXT_TD

include "mlir/IR/OpBase.td"

def MemRefExtDialect : Dialect {
  let name = "memrefext";
  let summary = "A extension of the MLIR MemRef dialect";
  let description = [{
    This dialect contains operations and attributes that are useful in the
    PolyAIE compilation flow.
  }];
  let cppNamespace = "::mlir::polyaie::memrefext";
}

class MemRefExtOp<string mnemonic, list<OpTrait> traits = []> :
    Op<MemRefExtDialect, mnemonic, traits>;

include "Ops.td"

#endif // POLYAIE_MEMREFEXT_MEMREFEXT_TD

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

def MemCpyOp : MemRefExtOp<"memcpy", [SameOperandsElementType]> {
  let summary = "memory copy operation";
  let description = [{
    This operation represents the memory copy between global memory and local
    memory, which should only be used in the procedure of compilation and should
    not appear in the finalized IR of PolyAIE.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, AnyMemRef:$source,
                       AnyMemRef:$destination);

  let assemblyFormat = [{
    $source `:` type($source) `to` $destination `:` type($destination) attr-dict
  }];
}

#endif // POLYAIE_MEMREFEXT_MEMREFEXT_TD

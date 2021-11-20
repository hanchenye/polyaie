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

def LoadBufferOp : MemRefExtOp<"load_buffer",
    [SameOperandsAndResultElementType]> {
  let summary = "load buffer operation";
  let description = [{
    This operation loads data from memory to a buffer.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, I64ArrayAttr:$lengths,
                       AnyMemRef:$memory);
  let results = (outs AnyMemRef:$buffer);

  let verifier = [{ return ::verify(*this); }];
}

def StoreBufferOp : MemRefExtOp<"store_buffer",
    [SameOperandsElementType]> {
  let summary = "store buffer operation";
  let description = [{
    This operation stores data from buffer to a memory.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, I64ArrayAttr:$lengths,
                       AnyMemRef:$memory, AnyMemRef:$buffer);

  let verifier = [{ return ::verify(*this); }];
}

def Load: I32EnumAttrCase<"Load", 0>;
def Store: I32EnumAttrCase<"Store", 1>;
def MemCpyKind: I32EnumAttr<"MemCpyKind", "", [Load, Store]> {
  let cppNamespace = "::mlir::polyaie::memrefext";
}

def MemCpyOp : MemRefExtOp<"memcpy", [SameOperandsElementType]> {
  let summary = "memory copy operation";
  let description = [{
    This operation represents the memory copy between external memory and local
    memory, which should only be used in the procedure of compilation and should
    not appear in the finalized IR of PolyAIE.
  }];

  let arguments = (ins MemCpyKind:$kind, I64ArrayAttr:$offsets, 
                       AnyMemRef:$source, AnyMemRef:$destination);

  let assemblyFormat = [{
    $kind $source `:` type($source) `to` $destination `:` type($destination)
    attr-dict
  }];

  let extraClassDeclaration = [{
    Value getLocalBuffer() {
      return kind() == memrefext::MemCpyKind::Load ? destination() : source();
    }
  }];
}

#endif // POLYAIE_MEMREFEXT_MEMREFEXT_TD

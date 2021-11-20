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

//===----------------------------------------------------------------------===//
// Buffer Copy/Load/Store Operation
//===----------------------------------------------------------------------===//

def CopyBufferOp : MemRefExtOp<"copy_buffer", [SameOperandsAndResultType]> {
  let summary = "copy buffer operation";
  let description = [{
    This operation copys data from one buffer to another buffer explicitly.
  }];

  let arguments = (ins AnyMemRef:$source);
  let results = (outs AnyMemRef:$target);
}

def LoadBufferOp : MemRefExtOp<"load_buffer",
    [SameOperandsAndResultElementType]> {
  let summary = "load buffer operation";
  let description = [{
    This operation loads data from memory to buffer.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, I64ArrayAttr:$lengths,
                       AnyMemRef:$memory);
  let results = (outs AnyMemRef:$buffer);

  let verifier = [{ return ::verify(*this); }];
}

def StoreBufferOp : MemRefExtOp<"store_buffer", [SameOperandsElementType]> {
  let summary = "store buffer operation";
  let description = [{
    This operation stores data from buffer to memory.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, I64ArrayAttr:$lengths,
                       AnyMemRef:$memory, AnyMemRef:$buffer);

  let verifier = [{ return ::verify(*this); }];
}

//===----------------------------------------------------------------------===//
// General Memory Copy Operation
//===----------------------------------------------------------------------===//

def MemCpyOp : MemRefExtOp<"memcpy", [SameOperandsElementType]> {
  let summary = "memory copy operation";
  let description = [{
    This operation represents a general memory copy from source to target. All
    buffer operation (copy/load/store) can be lowered to this operation.
  }];

  let arguments = (ins I64ArrayAttr:$targetOffsets, I64ArrayAttr:$sourceOffsets,
                       I64ArrayAttr:$lengths, AnyMemRef:$target,
                       AnyMemRef:$source);

  // let verifier = [{ return ::verify(*this); }];
}

#endif // POLYAIE_MEMREFEXT_MEMREFEXT_TD

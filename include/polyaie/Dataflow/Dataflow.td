//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_DATAFLOW_DATAFLOW_TD
#define POLYAIE_DATAFLOW_DATAFLOW_TD

include "mlir/IR/OpBase.td"

def DataflowDialect : Dialect {
  let name = "dataflow";
  let summary = "A extension of the MLIR MemRef dialect";
  let description = [{
    This dialect contains operations and attributes that are useful in the
    PolyAIE compilation flow.
  }];
  let cppNamespace = "::mlir::polyaie::dataflow";
}

class DataflowOp<string mnemonic, list<OpTrait> traits = []> :
    Op<DataflowDialect, mnemonic, traits>;

//===----------------------------------------------------------------------===//
// Buffer Load/Store Operation
//===----------------------------------------------------------------------===//

def LoadBufferOp : DataflowOp<"load_buffer",
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

def StoreBufferOp : DataflowOp<"store_buffer", [SameOperandsElementType]> {
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

def MemCpyOp : DataflowOp<"memcpy", [SameOperandsElementType]> {
  let summary = "memory copy operation";
  let description = [{
    This operation represents a general memory copy from source to target. All
    buffer operation (load/store) can be lowered to this operation.
  }];

  let arguments = (ins I64ArrayAttr:$targetOffsets, I64ArrayAttr:$sourceOffsets,
                       I64ArrayAttr:$lengths, AnyMemRef:$target,
                       AnyMemRef:$source);

  // let verifier = [{ return ::verify(*this); }];
}

#endif // POLYAIE_DATAFLOW_DATAFLOW_TD

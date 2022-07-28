//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_DATAFLOW_DATAFLOW_TD
#define POLYAIE_DATAFLOW_DATAFLOW_TD

include "mlir/IR/OpBase.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/IR/RegionKindInterface.td"
include "mlir/IR/FunctionInterfaces.td"
include "mlir/IR/OpAsmInterface.td"

include "mlir/Interfaces/ControlFlowInterfaces.td"
include "mlir/Interfaces/CallInterfaces.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

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
// Dataflow Operations
//===----------------------------------------------------------------------===//

def FuncOp : DataflowOp<"func", [IsolatedFromAbove, FunctionOpInterface, Symbol,
    RegionKindInterface, OpAsmOpInterface]> {
  let summary = "Dataflow dialect function.";
  let description = [{
    The func operation represents a handshaked function. This is almost exactly
    like a standard FuncOp, except that it has some extra verification
    conditions. In particular, each Value must only have a single use.
  }];

  let regions = (region AnyRegion : $body);

  let skipDefaultBuilders = 1;

  let builders =
       [OpBuilder<(ins "StringRef":$name, "FunctionType":$type,
                      CArg<"ArrayRef<NamedAttribute>", "{}">:$attrs)>];

  let extraClassDeclaration = [{
    // Add an entry block to an empty function, and set up the block arguments
    // to match the signature of the function.
    Block *addEntryBlock();

    FunctionType getType() {
      return (*this)->getAttrOfType<TypeAttr>(getTypeAttrName())
          .getValue()
          .cast<FunctionType>();
    }

    /// Implement RegionKindInterface.
    static RegionKind getRegionKind(unsigned index) { return RegionKind::Graph; }

    /// Returns the argument types of this function.
    ArrayRef<Type> getArgumentTypes() { return getType().getInputs(); }

    /// Returns the result types of this function.
    ArrayRef<Type> getResultTypes() { return getType().getResults(); }

    /// Returns the names of the arguments to this function.
    ArrayAttr getArgNames() {
      return (*this)->getAttrOfType<ArrayAttr>("argNames");
    }

    /// Returns the names of the results from this function.
    ArrayAttr getResNames() {
      return (*this)->getAttrOfType<ArrayAttr>("resNames");
    }

    /// Returns the argument name at the given index.
    StringAttr getArgName(unsigned idx) {
      return getArgNames()[idx].cast<StringAttr>();
    }

    /// Returns the result name at the given index.
    StringAttr getResName(unsigned idx) {
      return getResNames()[idx].cast<StringAttr>();
    }

    /// Resolve argument and result names. This can be used during building of
    /// a handshake.func operation to ensure that names provided by an incoming
    /// operation fulfills the name requirements of the handshake function.
    void resolveArgAndResNames();

    /// Hook for FunctionOpInterface, called after verifying that the 'type'
    /// attribute is present and checks if it holds a function type.  Ensures
    /// getType, getNumFuncArguments, and getNumFuncResults can be called
    /// safely.
    LogicalResult verifyType() {
      auto type = getTypeAttr().getValue();
      if (!type.isa<FunctionType>())
        return emitOpError("requires '" + getTypeAttrName() +
                           "' attribute of function type");
      return success();
    }

    //===------------------------------------------------------------------===//
    // OpAsmOpInterface Methods
    //===------------------------------------------------------------------===//

    static ::llvm::StringRef getDefaultDialect() {
      return "handshake";
    }
  }];

  let verifier = [{ return ::verify$cppClass(*this); }];
  let printer = [{ return ::print$cppClass(p, *this); }];
  let parser = [{ return ::parse$cppClass(parser, result); }];
}
def AIE:  I64EnumAttrCase<"AIE", 0>;
def GMIO:  I64EnumAttrCase<"GMIO", 1>;
def PLIO:  I64EnumAttrCase<"PLIO", 2>;
def ProcessKind: I64EnumAttr<"ProcessKind", "Kind of Process",
    [AIE, GMIO, PLIO]> {
  let cppNamespace = "mlir::polyaie";
}

def ProcessOp : DataflowOp<"process", [IsolatedFromAbove]> {
  let summary = "process operation";
  let description = [{
    This operation represents a process in a dataflow graph.
  }];

  let arguments = (ins ProcessKind:$kind, Variadic<AnyType>:$operands);
  let results = (outs Variadic<AnyType>:$results);
  let regions = (region AnyRegion:$body);

  let skipDefaultBuilders = 1;
  let builders = [
    OpBuilder<(ins "TypeRange":$resultTypes, "ValueRange":$operands,
                   CArg<"ProcessKind", "ProcessKind::AIE">:$kind)>
  ];

  let verifier = "return ::verify(*this);";
  let extraClassDeclaration = [{
    /// Given an internal value, return the corresponding process operand. If
    /// the internal value is not a block argument, return nullptr.
    Value getOperandFromInternalVal(Value internalVal);

    /// Given an internal value, return the corresponding process result. If the
    /// internal value is not returned as a result, return nullptr.
    Value getResultFromInternalVal(Value internalVal);

    /// Given a process operand, return the corresponding block argument.
    Value getArgumentFromOperand(OpOperand &operand);

    /// Given a process result, return the corresponding returned value.
    Value getReturnValFromResult(OpResult result);
  }];
}

def ReturnOp : DataflowOp<"return", [Terminator]> {
  let summary = "return operation of a process";
  let description = [{
    The operation terminates a process region and returns values generated by
    the process operation.
  }];

  let arguments = (ins Variadic<AnyType>:$operands);

  let verifier = "return ::verify(*this);";
}

def TensorLoadOp : DataflowOp<"tensor_load",
    [SameOperandsAndResultElementType]> {
  let summary = "tensor load operation";
  let description = [{
    This operation loads a tensor from a memory.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, I64ArrayAttr:$sizes,
                       I64ArrayAttr:$strides, AnyMemRef:$memory);
  let results = (outs AnyTensor:$tensor);

  let builders = [ OpBuilder<(ins "Type":$type, "Value":$memory)> ];
  let verifier = "return ::verify(*this);";
}

def TensorStoreOp : DataflowOp<"tensor_store", [SameOperandsElementType]> {
  let summary = "tensor store operation";
  let description = [{
    This operation stores a tensor to a memory.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, I64ArrayAttr:$sizes,
                       I64ArrayAttr:$strides, AnyMemRef:$memory,
                       AnyTensor:$tensor);

  let builders = [ OpBuilder<(ins "Value":$memory, "Value":$tensor)> ];
  let verifier = "return ::verify(*this);";
}

//===----------------------------------------------------------------------===//
// Runtime Operations - should be factored out to a new dialect
//===----------------------------------------------------------------------===//

def HostToDDR:  I64EnumAttrCase<"HostToDDR", 0>;
def HostToAIE:  I64EnumAttrCase<"HostToAIE", 1>;
def DDRToHost:  I64EnumAttrCase<"DDRToHost", 2>;
def AIEToHost:  I64EnumAttrCase<"AIEToHost", 3>;
def HostDMAKind: I64EnumAttr<"HostDMAKind", "Kind of Host DMA",
    [HostToDDR, HostToAIE, DDRToHost, AIEToHost]> {
  let cppNamespace = "mlir::polyaie";
}

def HostDMAOp : DataflowOp<"runtime.host_dma", []> {
  let summary = "Host DMA operation";
  let description = [{
    This operation represents a host DMA to/from external memory, such as DDRs.
  }];

  let arguments = (ins I64ArrayAttr:$offsets, I64ArrayAttr:$sizes,
                       I64ArrayAttr:$strides, HostDMAKind:$kind,
                       AnyMemRef:$target, AnyMemRef:$source);

  let verifier = "return ::verify(*this);";
}

//===----------------------------------------------------------------------===//
// AIE Operations - should be factored out to AIE dialect
//===----------------------------------------------------------------------===//

def InterfaceOp : DataflowOp<"aie.interface", []> {
  let summary = "Represent a logical tile interface";
  let description = [{
    This operation indicates all "externalBuffers" are accessed through the
    logical interface of "tile". Note that the "tile" must be a shim tile,
    either a ShimNoc or a ShimPL.
  }];

  let arguments = (ins Index:$tile, Variadic<AnyMemRef>:$externalBuffers);

  let verifier = "return ::verify(*this);";
}

def BroadcastOp : DataflowOp<"aie.broadcast", []> {
  let summary = "Memory broadcast operation";
  let description = [{
    Broadcast the source buffer to each target buffer.
  }];

  let arguments = (ins AnyMemRef:$source, Variadic<AnyMemRef>:$targets);

  let verifier = "return ::verify(*this);";
}

#endif // POLYAIE_DATAFLOW_DATAFLOW_TD

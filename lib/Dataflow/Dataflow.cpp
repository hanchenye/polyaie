//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Dataflow/Dataflow.h"
#include "aie/AIEDialect.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/FunctionImplementation.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

void DataflowDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "polyaie/Dataflow/Dataflow.cpp.inc"
      >();
}

#include "polyaie/Dataflow/DataflowEnums.cpp.inc"

//===----------------------------------------------------------------------===//
// FuncOp
//===----------------------------------------------------------------------===//

static ParseResult verifyFuncOp(dataflow::FuncOp op) {
  // If this function is external there is nothing to do.
  if (op.isExternal())
    return success();

  // Verify that the argument list of the function and the arg list of the
  // entry block line up.  The trait already verified that the number of
  // arguments is the same between the signature and the block.
  auto fnInputTypes = op.getType().getInputs();
  Block &entryBlock = op.front();

  for (unsigned i = 0, e = entryBlock.getNumArguments(); i != e; ++i)
    if (fnInputTypes[i] != entryBlock.getArgument(i).getType())
      return op.emitOpError("type of entry block argument #")
             << i << '(' << entryBlock.getArgument(i).getType()
             << ") must match the type of the corresponding argument in "
             << "function signature(" << fnInputTypes[i] << ')';

  // Verify that we have a name for each argument and result of this function.
  auto verifyPortNameAttr = [&](StringRef attrName,
                                unsigned numIOs) -> LogicalResult {
    auto portNamesAttr = op->getAttrOfType<ArrayAttr>(attrName);

    if (!portNamesAttr)
      return op.emitOpError() << "expected attribute '" << attrName << "'.";

    auto portNames = portNamesAttr.getValue();
    if (portNames.size() != numIOs)
      return op.emitOpError()
             << "attribute '" << attrName << "' has " << portNames.size()
             << " entries but is expected to have " << numIOs << ".";

    if (llvm::any_of(portNames,
                     [&](Attribute attr) { return !attr.isa<StringAttr>(); }))
      return op.emitOpError() << "expected all entries in attribute '"
                              << attrName << "' to be strings.";

    return success();
  };
  if (failed(verifyPortNameAttr("argNames", op.getNumArguments())))
    return failure();
  if (failed(verifyPortNameAttr("resNames", op.getNumResults())))
    return failure();

  return success();
}

/// Parses a FuncOp signature using
/// mlir::function_interface_impl::parseFunctionSignature while getting access
/// to the parsed SSA names to store as attributes.
static ParseResult parseFuncOpArgs(
    OpAsmParser &parser, SmallVectorImpl<OpAsmParser::OperandType> &entryArgs,
    SmallVectorImpl<Type> &argTypes, SmallVectorImpl<Attribute> &argNames,
    SmallVectorImpl<NamedAttrList> &argAttrs, SmallVectorImpl<Type> &resTypes,
    SmallVectorImpl<NamedAttrList> &resAttrs) {
  auto *context = parser.getContext();

  SmallVector<Location, 4> argLocs(
      entryArgs.size(),
      parser.getEncodedSourceLoc(parser.getCurrentLocation()));

  bool isVariadic;
  if (mlir::function_interface_impl::parseFunctionSignature(
          parser, /*allowVariadic=*/true, entryArgs, argTypes, argAttrs,
          argLocs, isVariadic, resTypes, resAttrs)
          .failed())
    return failure();

  llvm::transform(entryArgs, std::back_inserter(argNames), [&](auto arg) {
    return StringAttr::get(context, arg.name.drop_front());
  });

  return success();
}

/// Generates names for a dataflow.func input and output arguments, based on
/// the number of args as well as a prefix.
static SmallVector<Attribute> getFuncOpNames(Builder &builder, TypeRange types,
                                             StringRef prefix) {
  SmallVector<Attribute> resNames;
  llvm::transform(
      llvm::enumerate(types), std::back_inserter(resNames), [&](auto it) {
        bool lastOperand = it.index() == types.size() - 1;
        std::string suffix = lastOperand && it.value().template isa<NoneType>()
                                 ? "Ctrl"
                                 : std::to_string(it.index());
        return builder.getStringAttr(prefix + suffix);
      });
  return resNames;
}

void dataflow::FuncOp::build(OpBuilder &builder, OperationState &state,
                             StringRef name, FunctionType type,
                             ArrayRef<NamedAttribute> attrs) {
  state.addAttribute(SymbolTable::getSymbolAttrName(),
                     builder.getStringAttr(name));
  state.addAttribute(getTypeAttrName(), TypeAttr::get(type));
  state.attributes.append(attrs.begin(), attrs.end());

  if (const auto *argNamesAttrIt = llvm::find_if(
          attrs, [&](auto attr) { return attr.getName() == "argNames"; });
      argNamesAttrIt == attrs.end())
    state.addAttribute("argNames", builder.getArrayAttr({}));

  if (llvm::find_if(attrs, [&](auto attr) {
        return attr.getName() == "resNames";
      }) == attrs.end())
    state.addAttribute("resNames", builder.getArrayAttr({}));

  state.addRegion();
}

/// Helper function for appending a string to an array attribute, and
/// rewriting the attribute back to the operation.
static void addStringToStringArrayAttr(Builder &builder, Operation *op,
                                       StringRef attrName, StringAttr str) {
  llvm::SmallVector<Attribute> attrs;
  llvm::copy(op->getAttrOfType<ArrayAttr>(attrName).getValue(),
             std::back_inserter(attrs));
  attrs.push_back(str);
  op->setAttr(attrName, builder.getArrayAttr(attrs));
}

void dataflow::FuncOp::resolveArgAndResNames() {
  auto type = getType();
  Builder builder(getContext());

  /// Generate a set of fallback names. These are used in case names are
  /// missing from the currently set arg- and res name attributes.
  auto fallbackArgNames = getFuncOpNames(builder, type.getInputs(), "in");
  auto fallbackResNames = getFuncOpNames(builder, type.getResults(), "out");
  auto argNames = getArgNames().getValue();
  auto resNames = getResNames().getValue();

  /// Use fallback names where actual names are missing.
  auto resolveNames = [&](auto &fallbackNames, auto &actualNames,
                          StringRef attrName) {
    for (auto fallbackName : llvm::enumerate(fallbackNames)) {
      if (actualNames.size() <= fallbackName.index())
        addStringToStringArrayAttr(
            builder, this->getOperation(), attrName,
            fallbackName.value().template cast<StringAttr>());
    }
  };
  resolveNames(fallbackArgNames, argNames, "argNames");
  resolveNames(fallbackResNames, resNames, "resNames");
}

static ParseResult parseFuncOp(OpAsmParser &parser, OperationState &result) {
  auto &builder = parser.getBuilder();
  StringAttr nameAttr;
  SmallVector<OpAsmParser::OperandType, 4> args;
  SmallVector<Type, 4> argTypes, resTypes;
  SmallVector<NamedAttrList, 4> argAttributes, resAttributes;
  SmallVector<Attribute> argNames;

  // Parse signature
  if (parser.parseSymbolName(nameAttr, SymbolTable::getSymbolAttrName(),
                             result.attributes) ||
      parseFuncOpArgs(parser, args, argTypes, argNames, argAttributes, resTypes,
                      resAttributes))
    return failure();
  mlir::function_interface_impl::addArgAndResultAttrs(
      builder, result, argAttributes, resAttributes);

  // Set function type
  result.addAttribute(
      dataflow::FuncOp::getTypeAttrName(),
      TypeAttr::get(builder.getFunctionType(argTypes, resTypes)));

  // Parse attributes
  if (failed(parser.parseOptionalAttrDictWithKeyword(result.attributes)))
    return failure();

  // If argNames and resNames wasn't provided manually, infer argNames attribute
  // from the parsed SSA names and resNames from our naming convention.
  if (!result.attributes.get("argNames"))
    result.addAttribute("argNames", builder.getArrayAttr(argNames));
  if (!result.attributes.get("resNames")) {
    auto resNames = getFuncOpNames(builder, resTypes, "out");
    result.addAttribute("resNames", builder.getArrayAttr(resNames));
  }

  // Parse region
  auto *body = result.addRegion();
  return parser.parseRegion(*body, args, argTypes);
}

static void printFuncOp(OpAsmPrinter &p, dataflow::FuncOp op) {
  FunctionType fnType = op.getType();
  mlir::function_interface_impl::printFunctionOp(p, op, fnType.getInputs(),
                                                 /*isVariadic=*/true,
                                                 fnType.getResults());
}

//===----------------------------------------------------------------------===//
// ProcessOp
//===----------------------------------------------------------------------===//

void ProcessOp::build(OpBuilder &builder, OperationState &state,
                      TypeRange resultTypes, ValueRange operands,
                      ProcessKind kind) {
  state.addOperands(operands);
  state.addAttribute(kindAttrName(state.name),
                     ProcessKindAttr::get(builder.getContext(), kind));
  state.addTypes(resultTypes);

  auto body = state.addRegion();
  auto &entry = body->emplaceBlock();
  SmallVector<Location, 4> locations;
  for (auto value : operands)
    locations.push_back(value.getLoc());
  entry.addArguments(operands.getTypes(), locations);
}

static LogicalResult verify(ProcessOp op) {
  if (op.body().empty())
    return op.emitOpError("must have at least one block");

  if (op.getOperandTypes() != op.body().front().getArgumentTypes())
    return op.emitOpError(
        "operands types must align with arguments types of the entry block");

  for (auto result : op.getResultTypes())
    if (!result.isa<TensorType>())
      return op.emitOpError("process can only produce tensor type results");

  if (op.kind() != ProcessKind::AIE)
    for (auto &op : op.getOps())
      if (!isa<dataflow::TensorLoadOp, dataflow::TensorStoreOp,
               dataflow::ReturnOp>(op))
        return op.emitOpError(
            "GMIO or PLIO process must only contain tensor load/store op");

  return success();
}

/// Given an internal value, return the corresponding process operand. If
/// the internal value is not a block argument, return nullptr.
Value ProcessOp::getOperandFromInternalVal(Value internalVal) {
  if (auto arg = internalVal.dyn_cast<BlockArgument>())
    return getOperand(arg.getArgNumber());
  return Value();
}

/// Given an internal value, return the corresponding process result. If the
/// internal value is not returned as a result, return nullptr.
Value ProcessOp::getResultFromInternalVal(Value internalVal) {
  for (auto &operand : body().back().getTerminator()->getOpOperands())
    if (internalVal == operand.get())
      return getResult(operand.getOperandNumber());
  return Value();
}

/// Given a process operand, return the corresponding block argument.
Value ProcessOp::getArgumentFromOperand(OpOperand &operand) {
  return body().front().getArgument(operand.getOperandNumber());
}

/// Given a process result, return the corresponding returned value.
Value ProcessOp::getReturnValFromResult(OpResult result) {
  return body().back().getTerminator()->getOperand(result.getResultNumber());
}

//===----------------------------------------------------------------------===//
// ReturnOp
//===----------------------------------------------------------------------===//

static LogicalResult verify(dataflow::ReturnOp op) {
  if (auto process = op->getParentOfType<ProcessOp>())
    if (op.getOperandTypes() == process.getResultTypes())
      return success();

  if (auto func = op->getParentOfType<dataflow::FuncOp>())
    if (op.getOperandTypes() == func.getType().getResults())
      return success();

  if (auto func = op->getParentOfType<mlir::FuncOp>())
    if (op.getOperandTypes() == func.getType().getResults())
      return success();

  return op.emitOpError("operands types must align with result types of "
                        "the parent process or function op");
}

//===----------------------------------------------------------------------===//
// TensorLoad/StoreOp
//===----------------------------------------------------------------------===//

void TensorLoadOp::build(OpBuilder &builder, OperationState &state, Type type,
                         Value memory) {
  auto tensorType = type.cast<RankedTensorType>();
  auto offsets = SmallVector<int64_t>(tensorType.getRank(), 0);
  auto strides = SmallVector<int64_t>(tensorType.getRank(), 1);
  build(builder, state, type, builder.getI64ArrayAttr(offsets),
        builder.getI64ArrayAttr(tensorType.getShape()),
        builder.getI64ArrayAttr(strides), memory);
}

void TensorStoreOp::build(OpBuilder &builder, OperationState &state,
                          Value memory, Value tensor) {
  auto tensorType = tensor.getType().cast<RankedTensorType>();
  auto offsets = SmallVector<int64_t>(tensorType.getRank(), 0);
  auto strides = SmallVector<int64_t>(tensorType.getRank(), 1);
  build(builder, state, builder.getI64ArrayAttr(offsets),
        builder.getI64ArrayAttr(tensorType.getShape()),
        builder.getI64ArrayAttr(strides), memory, tensor);
}

template <class OpType>
static LogicalResult verifyTensorLoadStoreOp(OpType op) {
  auto tensorType = op.tensor().getType().template cast<RankedTensorType>();
  auto memoryType = op.memory().getType().template cast<MemRefType>();
  if (tensorType.getNumElements() > memoryType.getNumElements())
    return op.emitOpError("tensor size is larger than memory size");

  for (auto zip : llvm::zip(op.offsets(), op.sizes(), op.strides(),
                            tensorType.getShape(), memoryType.getShape())) {
    auto offset = std::get<0>(zip).template cast<IntegerAttr>().getInt();
    auto size = std::get<1>(zip).template cast<IntegerAttr>().getInt();
    auto stride = std::get<2>(zip).template cast<IntegerAttr>().getInt();

    if (size != std::get<3>(zip))
      return op.emitOpError("sizes attribute doen't match with tensor type");

    if (stride * (size - 1) + offset > std::get<4>(zip) - 1)
      return op.emitOpError("exceeds memory boundary");
  }

  return success();
}

static LogicalResult verify(TensorLoadOp op) {
  return verifyTensorLoadStoreOp(op);
}

static LogicalResult verify(TensorStoreOp op) {
  return verifyTensorLoadStoreOp(op);
}

//===----------------------------------------------------------------------===//
// Runtime Operations - should be factored out to a new dialect
//===----------------------------------------------------------------------===//

static LogicalResult verify(HostDMAOp op) { return success(); }

//===----------------------------------------------------------------------===//
// AIE Operations - should be factored out to AIE dialect
//===----------------------------------------------------------------------===//

static LogicalResult verify(InterfaceOp op) {
  if (!op.tile().getDefiningOp<xilinx::AIE::TileOp>())
    return op.emitOpError("operand tile must be defined by TileOp");

  for (auto buf : op.externalBuffers())
    if (!buf.getDefiningOp<xilinx::AIE::ExternalBufferOp>())
      return op.emitOpError("buffers must be defined by ExternalBufferOp");

  return success();
}

static LogicalResult verify(BroadcastOp op) {
  for (auto operand : op.getOperands())
    if (!operand.getDefiningOp<xilinx::AIE::BufferOp>() &&
        !operand.getDefiningOp<xilinx::AIE::ExternalBufferOp>())
      return op.emitOpError(
          "operand must be defined by BufferOp or ExternalBufferOp");

  return success();
}

//===----------------------------------------------------------------------===//
// Include TableGen files
//===----------------------------------------------------------------------===//

#define GET_OP_CLASSES
#include "polyaie/Dataflow/Dataflow.cpp.inc"
#undef GET_OP_CLASSES

#include "polyaie/Dataflow/DataflowDialect.cpp.inc"

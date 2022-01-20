//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Dataflow/Dataflow.h"
#include "aie/AIEDialect.h"
#include "circt/Dialect/Handshake/HandshakeOps.h"
#include "mlir/IR/Builders.h"

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
// ProcessOp
//===----------------------------------------------------------------------===//

void ProcessOp::build(OpBuilder &odsBuilder, OperationState &odsState,
                      TypeRange resultTypes, ValueRange operands,
                      ProcessKind kind) {
  odsState.addOperands(operands);
  odsState.addAttribute(kindAttrName(odsState.name),
                        ProcessKindAttr::get(odsBuilder.getContext(), kind));
  odsState.addTypes(resultTypes);

  auto body = odsState.addRegion();
  auto &entry = body->emplaceBlock();
  entry.addArguments(operands.getTypes());
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

  if (auto func = op->getParentOfType<circt::handshake::FuncOp>())
    if (op.getOperandTypes() == func.getType().getResults())
      return success();

  return op.emitOpError("operands types must align with result types of "
                        "the parent process or handshake function op");
}

//===----------------------------------------------------------------------===//
// TensorLoad/StoreOp
//===----------------------------------------------------------------------===//

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

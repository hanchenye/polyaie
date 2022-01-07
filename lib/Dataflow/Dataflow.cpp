//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Dataflow/Dataflow.h"
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
// Process-related Operation
//===----------------------------------------------------------------------===//

void ProcessOp::build(OpBuilder &odsBuilder, OperationState &odsState,
                      TypeRange resultTypes, ValueRange operands) {
  odsState.addOperands(operands);
  auto body = odsState.addRegion();
  odsState.addTypes(resultTypes);

  auto &entry = body->emplaceBlock();
  entry.addArguments(operands.getTypes());
}

static LogicalResult verify(ProcessOp op) {
  if (op.body().empty())
    return op.emitOpError("must have at least one block");

  if (op.getOperandTypes() != op.body().front().getArgumentTypes())
    return op.emitOpError(
        "operands types must align with arguments types of the entry block");

  return success();
}

static LogicalResult verify(ReturnOp op) {
  if (op.getOperandTypes() != op->getParentOfType<ProcessOp>().getResultTypes())
    return op.emitOpError("operands types must align with result types of the "
                          "parent process operation");

  return success();
}

//===----------------------------------------------------------------------===//
// Tensor Load/Store Operation
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
// Buffer Load/Store Operation
//===----------------------------------------------------------------------===//

template <class OpType>
static LogicalResult verifyLoadStoreBufferOp(OpType op) {
  auto bufferType = op.buffer().getType().template cast<MemRefType>();
  auto memoryType = op.memory().getType().template cast<MemRefType>();
  if (bufferType.getNumElements() > memoryType.getNumElements())
    return op.emitOpError("buffer size is larger than memory size");

  SmallVector<int64_t, 4> offsets;
  for (auto attr : op.offsets())
    offsets.push_back(attr.template cast<IntegerAttr>().getInt());

  SmallVector<int64_t, 4> lengths;
  for (auto attr : op.lengths())
    lengths.push_back(attr.template cast<IntegerAttr>().getInt());

  if (bufferType.getRank() == 0) {
    if (offsets.size() != 1 || lengths.size() != 1 || offsets.front() != 0 ||
        lengths.front() != 1)
      return op.emitOpError("illegal offsets or lengths attribute");
  } else {
    if (bufferType.getShape() != ArrayRef<int64_t>(lengths))
      return op.emitOpError("illegal lengths attribute");
    for (auto zip : llvm::zip(offsets, lengths, memoryType.getShape()))
      if (std::get<0>(zip) + std::get<1>(zip) > std::get<2>(zip))
        return op.emitOpError("exceeds memory boundary");
  }

  return success();
}

static LogicalResult verify(LoadBufferOp op) {
  return verifyLoadStoreBufferOp(op);
}

static LogicalResult verify(StoreBufferOp op) {
  return verifyLoadStoreBufferOp(op);
}

#define GET_OP_CLASSES
#include "polyaie/Dataflow/Dataflow.cpp.inc"
#undef GET_OP_CLASSES

#include "polyaie/Dataflow/DataflowDialect.cpp.inc"

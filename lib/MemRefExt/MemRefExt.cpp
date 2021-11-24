//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/MemRefExt/MemRefExt.h"
#include "mlir/IR/AffineMap.h"
#include "mlir/IR/Builders.h"

using namespace mlir;
using namespace polyaie;
using namespace memrefext;

void MemRefExtDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "polyaie/MemRefExt/MemRefExt.cpp.inc"
      >();
}

#include "polyaie/MemRefExt/MemRefExtEnums.cpp.inc"

//===----------------------------------------------------------------------===//
// Supporting methods, should be factored out
//===----------------------------------------------------------------------===//

/// Inference the buffer offsets from the input `type`.
SmallVector<int64_t, 4> polyaie::getBufferOffsets(MemRefType type) {
  auto affineMaps = type.getAffineMaps();
  if (affineMaps.empty())
    return SmallVector<int64_t, 4>(type.getRank(), 0);

  SmallVector<int64_t, 4> offsets;
  for (auto expr : affineMaps.back().getResults()) {
    // If the expression is a dimension value, the offset is 0.
    if (expr.getKind() == AffineExprKind::DimId) {
      offsets.push_back(0);
      continue;
    }

    // If the expression is a binary add, the offset is the constant operator.
    if (expr.getKind() == AffineExprKind::Add) {
      auto addExpr = expr.cast<AffineBinaryOpExpr>();
      if (addExpr.getLHS().getKind() == AffineExprKind::DimId)
        if (auto constExpr = addExpr.getRHS().dyn_cast<AffineConstantExpr>()) {
          offsets.push_back(constExpr.getValue());
          continue;
        }
    }

    // Otherwise, the memref type is illegal.
    offsets.push_back(-1);
  }
  return offsets;
}

int64_t polyaie::getCol(Operation *call) {
  return call->getAttrOfType<IntegerAttr>("aie.col").getInt();
}
int64_t polyaie::getRow(Operation *call) {
  return call->getAttrOfType<IntegerAttr>("aie.row").getInt();
}

//===----------------------------------------------------------------------===//
// BufferLoadOp and BufferStoreOp
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
#include "polyaie/MemRefExt/MemRefExt.cpp.inc"
#undef GET_OP_CLASSES

// #include "polyaie/MemRefExt/MemRefExtDialect.cpp.inc"

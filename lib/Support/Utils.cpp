//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Utils.h"
#include "aie/AIEDialect.h"
#include "mlir/IR/AffineMap.h"

using namespace mlir;
using namespace polyaie;

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

unsigned polyaie::getCol(Operation *call) {
  auto col = call->getAttrOfType<IntegerAttr>("aie.col").getInt();
  assert(col >= 0);
  return col;
}
unsigned polyaie::getRow(Operation *call) {
  auto row = call->getAttrOfType<IntegerAttr>("aie.row").getInt();
  assert(row >= 0);
  return row;
}

bool polyaie::haveShareableBuffer(unsigned srcCol, unsigned srcRow,
                                  unsigned tgtCol, unsigned tgtRow) {
  // If the source and target tiles are not adjacent with each other, they don't
  // have shareable buffer.
  if ((std::abs((int64_t)srcCol - (int64_t)tgtCol) +
       std::abs((int64_t)srcRow - (int64_t)tgtRow)) != 1)
    return false;

  // Retrieve the positional relationship of target and source tiles.
  auto isE = xilinx::AIE::isEast(srcCol, srcRow, tgtCol, tgtRow);
  auto isW = xilinx::AIE::isWest(srcCol, srcRow, tgtCol, tgtRow);
  auto isEvenRow = (srcRow % 2) == 0;

  // Although they are ajacent, but the target tile cannot access the source
  // tile's local buffer due to the AIE layout.
  if ((isW && !isEvenRow) || (isE && isEvenRow))
    return false;

  // Otherwise, the source and target tiles have shareable buffer.
  return true;
}

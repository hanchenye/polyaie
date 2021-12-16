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
  auto layoutMap = type.getLayout().getAffineMap();
  if (!layoutMap)
    return SmallVector<int64_t, 4>(type.getRank(), 0);

  SmallVector<int64_t, 4> offsets;
  for (auto expr : layoutMap.getResults()) {
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
  assert(col >= 0 && "illegal col attribute");
  return col;
}
unsigned polyaie::getRow(Operation *call) {
  auto row = call->getAttrOfType<IntegerAttr>("aie.row").getInt();
  assert(row >= 0 && "illegal row attribute");
  return row;
}

bool polyaie::adjacent(unsigned srcRow, unsigned srcCol, unsigned tgtRow,
                       unsigned tgtCol) {
  return (std::abs((int64_t)srcRow - (int64_t)tgtRow) +
          std::abs((int64_t)srcCol - (int64_t)tgtCol)) == 1;
}
bool polyaie::adjacent(CallOp srcCall, CallOp tgtCall) {
  return adjacent(getRow(srcCall), getCol(srcCall), getRow(tgtCall),
                  getCol(tgtCall));
}
bool polyaie::adjacent(xilinx::AIE::TileOp srcTile,
                       xilinx::AIE::TileOp tgtTile) {
  return adjacent(srcTile.row(), srcTile.col(), tgtTile.row(), tgtTile.col());
}

xilinx::AIE::TileOp polyaie::getShareableTile(xilinx::AIE::TileOp srcTile,
                                              xilinx::AIE::TileOp tgtTile) {
  auto srcCol = srcTile.col();
  auto srcRow = srcTile.row();
  auto tgtCol = tgtTile.col();
  auto tgtRow = tgtTile.row();

  bool isS = xilinx::AIE::isSouth(srcCol, srcRow, tgtCol, tgtRow);
  bool isW = xilinx::AIE::isWest(srcCol, srcRow, tgtCol, tgtRow);
  bool isN = xilinx::AIE::isNorth(srcCol, srcRow, tgtCol, tgtRow);
  bool isE = xilinx::AIE::isEast(srcCol, srcRow, tgtCol, tgtRow);
  bool isEvenRow = ((srcRow % 2) == 0);

  if (isS || isN || (isW && isEvenRow) || (isE && !isEvenRow))
    return tgtTile;
  if ((isW && !isEvenRow) || (isE && isEvenRow))
    return srcTile;

  return nullptr;
}

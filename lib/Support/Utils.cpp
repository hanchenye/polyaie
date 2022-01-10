//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Utils.h"
#include "aie/AIEDialect.h"
#include "mlir/IR/AffineMap.h"

using namespace mlir;
using namespace polyaie;

/// This is method for finding the number of child loops which immediatedly
/// contained by the input block.
static unsigned getNumChildLoop(Block &block) {
  unsigned childNum = 0;
  for (auto &op : block)
    childNum += isa<AffineForOp>(op);
  return childNum;
}

/// Collect all loop bands in the "block" and return them in "bands". If
/// "allowHavingChilds" is true, loop bands containing more than 1 other loop
/// bands are also collected. Otherwise, only loop bands that contains no child
/// loops are collected.
void polyaie::getLoopBands(Block &block, AffineLoopBands &bands, bool reverse,
                           bool allowHavingChilds) {
  bands.clear();
  block.walk([&](AffineForOp loop) {
    auto childNum = getNumChildLoop(*loop.getBody());

    if (childNum == 0 || (childNum > 1 && allowHavingChilds)) {
      // Collect loop band from the innermost loop.
      AffineLoopBand band;
      auto currentLoop = loop;
      while (true) {
        band.push_back(currentLoop);
        auto parentLoop = currentLoop->getParentOfType<AffineForOp>();
        if (!parentLoop || getNumChildLoop(*parentLoop.getBody()) != 1)
          break;
        currentLoop = parentLoop;
      }
      // The collected loop band is in a reversed order (from innermost to
      // outermost). If "reverse" is false, we need to reverse it back.
      if (!reverse)
        std::reverse(band.begin(), band.end());
      bands.push_back(band);
    }
  });
}

FuncOp polyaie::getTopFunc(ModuleOp mod) {
  for (auto func : mod.getOps<FuncOp>())
    if (func->hasAttr("polyaie.top_func"))
      return func;
  emitError(mod.getLoc(), "failed to find top function");
  return FuncOp();
}

unsigned polyaie::getCol(Operation *op) {
  auto col = op->getAttrOfType<IntegerAttr>("polyaie.col").getInt();
  assert(col >= 0 && "illegal col attribute");
  return col;
}
unsigned polyaie::getRow(Operation *op) {
  auto row = op->getAttrOfType<IntegerAttr>("polyaie.row").getInt();
  assert(row >= 0 && "illegal row attribute");
  return row;
}

bool polyaie::adjacent(unsigned srcRow, unsigned srcCol, unsigned tgtRow,
                       unsigned tgtCol) {
  return (std::abs((int64_t)srcRow - (int64_t)tgtRow) +
          std::abs((int64_t)srcCol - (int64_t)tgtCol)) == 1;
}
bool polyaie::adjacent(dataflow::ProcessOp srcProc,
                       dataflow::ProcessOp tgtProc) {
  return adjacent(getRow(srcProc), getCol(srcProc), getRow(tgtProc),
                  getCol(tgtProc));
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

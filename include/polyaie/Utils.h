//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_UTILS_H
#define POLYAIE_UTILS_H

#include "aie/AIEDialect.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Operation.h"

namespace mlir {
namespace polyaie {

using AffineLoopBand = SmallVector<AffineForOp, 6>;
using AffineLoopBands = std::vector<AffineLoopBand>;

/// Collect all loop bands in the "block" and return them in "bands". If
/// "allowHavingChilds" is true, loop bands containing more than 1 other loop
/// bands are also collected. Otherwise, only loop bands that contains no child
/// loops are collected.
void getLoopBands(Block &block, AffineLoopBands &bands, bool reverse = false,
                  bool allowHavingChilds = false);

FuncOp getTopFunc(ModuleOp mod);

unsigned getCol(Operation *call);
unsigned getRow(Operation *call);

bool adjacent(unsigned srcRow, unsigned srcCol, unsigned tgtRow,
              unsigned tgtCol);
bool adjacent(CallOp srcCall, CallOp tgtCall);
bool adjacent(xilinx::AIE::TileOp srcTile, xilinx::AIE::TileOp tgtTile);

xilinx::AIE::TileOp getShareableTile(xilinx::AIE::TileOp srcTile,
                                     xilinx::AIE::TileOp tgtTile);

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_UTILS_H

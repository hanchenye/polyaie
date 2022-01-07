//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_UTILS_H
#define POLYAIE_UTILS_H

#include "aie/AIEDialect.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Operation.h"

namespace mlir {
namespace polyaie {

/// Inference the buffer offsets from the input `type`.
SmallVector<int64_t, 4> getBufferOffsets(MemRefType type);

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

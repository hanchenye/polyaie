//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_UTILS_H
#define POLYAIE_UTILS_H

#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Operation.h"

namespace mlir {
namespace polyaie {

/// Inference the buffer offsets from the input `type`.
SmallVector<int64_t, 4> getBufferOffsets(MemRefType type);

int64_t getCol(Operation *call);
int64_t getRow(Operation *call);

bool haveShareableBuffer(int64_t srcCol, int64_t srcRow, int64_t tgtCol,
                         int64_t tgtRow);

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_UTILS_H

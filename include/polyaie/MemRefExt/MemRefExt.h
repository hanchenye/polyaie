//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_MEMREFEXT_MEMREFEXT_H
#define POLYAIE_MEMREFEXT_MEMREFEXT_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpImplementation.h"

#include "polyaie/MemRefExt/MemRefExtDialect.h.inc"
#include "polyaie/MemRefExt/MemRefExtEnums.h.inc"

namespace mlir {
namespace polyaie {

/// Inference the buffer offsets from the input `type`.
SmallVector<int64_t, 4> getBufferOffsets(MemRefType type);

int64_t getCol(Operation *call);
int64_t getRow(Operation *call);

} // namespace polyaie
} // namespace mlir

#define GET_OP_CLASSES
#include "polyaie/MemRefExt/MemRefExt.h.inc"

#endif // POLYAIE_MEMREFEXT_MEMREFEXT_H

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

#define GET_OP_CLASSES
#include "polyaie/MemRefExt/MemRefExt.h.inc"

#endif // POLYAIE_MEMREFEXT_MEMREFEXT_H

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_MEMREFEXT_MEMREFEXT_H
#define POLYAIE_MEMREFEXT_MEMREFEXT_H

#include "mlir/IR/BuiltinAttributes.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"

#include "polyaie/MemRefExt/MemRefExtDialect.h.inc"

#define GET_OP_CLASSES
#include "polyaie/MemRefExt/MemRefExt.h.inc"

#endif // POLYAIE_MEMREFEXT_MEMREFEXT_H

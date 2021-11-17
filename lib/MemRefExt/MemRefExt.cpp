//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/MemRefExt/MemRefExt.h"
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

#define GET_OP_CLASSES
#include "polyaie/MemRefExt/MemRefExt.cpp.inc"
#undef GET_OP_CLASSES

// #include "polyaie/MemRefExt/MemRefExtDialect.cpp.inc"

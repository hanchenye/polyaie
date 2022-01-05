//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_DATAFLOW_DATAFLOW_H
#define POLYAIE_DATAFLOW_DATAFLOW_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpImplementation.h"

#include "polyaie/Dataflow/DataflowDialect.h.inc"
#include "polyaie/Dataflow/DataflowEnums.h.inc"

#define GET_OP_CLASSES
#include "polyaie/Dataflow/Dataflow.h.inc"

#endif // POLYAIE_DATAFLOW_DATAFLOW_H

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_DATAFLOW_DATAFLOW_H
#define POLYAIE_DATAFLOW_DATAFLOW_H

#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpImplementation.h"
#include "llvm/ADT/GraphTraits.h"

#include "polyaie/Dataflow/DataflowDialect.h.inc"
#include "polyaie/Dataflow/DataflowEnums.h.inc"

#define GET_OP_CLASSES
#include "polyaie/Dataflow/Dataflow.h.inc"

namespace llvm {
using namespace mlir;
using namespace polyaie;

// Specialize GraphTraits to treat FuncOp as a graph of ProcessOps as nodes and
// uses as edges.
template <> struct GraphTraits<dataflow::FuncOp> {
  using GraphType = dataflow::FuncOp;
  using NodeRef = Operation *;

  static bool isProcess(Operation *op) { return isa<dataflow::ProcessOp>(op); }
  using ChildIteratorType =
      filter_iterator<Operation::user_iterator, decltype(&isProcess)>;
  static ChildIteratorType child_begin(NodeRef n) {
    return {n->user_begin(), n->user_end(), &isProcess};
  }
  static ChildIteratorType child_end(NodeRef n) {
    return {n->user_end(), n->user_end(), &isProcess};
  }

  using nodes_iterator =
      mlir::detail::op_iterator<dataflow::ProcessOp, Region::OpIterator>;
  static nodes_iterator nodes_begin(dataflow::FuncOp f) {
    return f.getOps<dataflow::ProcessOp>().begin();
  }
  static nodes_iterator nodes_end(dataflow::FuncOp f) {
    return f.getOps<dataflow::ProcessOp>().end();
  }
};
} // namespace llvm

#endif // POLYAIE_DATAFLOW_DATAFLOW_H

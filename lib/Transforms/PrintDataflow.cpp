//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Support/LLVM.h"
#include "polyaie/Transforms/Passes.h"
#include "llvm/Support/GraphWriter.h"

using namespace mlir;
using namespace polyaie;

namespace llvm {
// Specialize GraphTraits to treat ModuleOp as a graph of CallOps as nodes and
// uses as edges.
template <> struct GraphTraits<ModuleOp> {
  using GraphType = ModuleOp;
  using NodeRef = Operation *;

  static bool isCall(Operation *op) { return isa<CallOp>(op); }
  using ChildIteratorType =
      llvm::filter_iterator<Operation::user_iterator, decltype(&isCall)>;
  static ChildIteratorType child_begin(NodeRef n) {
    return {n->user_begin(), n->user_end(), &isCall};
  }
  static ChildIteratorType child_end(NodeRef n) {
    return {n->user_end(), n->user_end(), &isCall};
  }

  using nodes_iterator = mlir::detail::op_iterator<CallOp, Region::OpIterator>;
  static nodes_iterator nodes_begin(ModuleOp m) {
    return m.getOps<CallOp>().begin();
  }
  static nodes_iterator nodes_end(ModuleOp m) {
    return m.getOps<CallOp>().end();
  }
};

// Specialize DOTGraphTraits to produce more readable output.
template <> struct DOTGraphTraits<ModuleOp> : public DefaultDOTGraphTraits {
  using DefaultDOTGraphTraits::DefaultDOTGraphTraits;

  static std::string getNodeLabel(Operation *op, ModuleOp) {
    // Reuse the print output for the node labels.
    std::string ostr;
    raw_string_ostream os(ostr);
    os << dyn_cast<CallOp>(op).callee().rsplit("_").second;
    return os.str();
  }
};
} // namespace llvm

namespace {
class PrintDataflow : public polyaie::PrintDataflowBase<PrintDataflow> {
public:
  PrintDataflow(raw_ostream &os) : os(os) {}
  void runOnOperation() override {
    llvm::WriteGraph(os, getOperation(), false, "");
  }

private:
  raw_ostream &os;
};
} // namespace

std::unique_ptr<Pass> polyaie::createPrintDataflowPass() {
  return std::make_unique<PrintDataflow>(llvm::errs());
}

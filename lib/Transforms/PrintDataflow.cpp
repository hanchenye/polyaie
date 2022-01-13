//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"
#include "llvm/Support/GraphWriter.h"

using namespace mlir;
using namespace polyaie;

namespace llvm {
// Specialize GraphTraits to treat ModuleOp as a graph of dataflow::ProcessOps
// as nodes and uses as edges.
template <> struct GraphTraits<circt::handshake::FuncOp> {
  using GraphType = circt::handshake::FuncOp;
  using NodeRef = Operation *;

  static bool isProcess(Operation *op) { return isa<dataflow::ProcessOp>(op); }
  using ChildIteratorType =
      llvm::filter_iterator<Operation::user_iterator, decltype(&isProcess)>;
  static ChildIteratorType child_begin(NodeRef n) {
    return {n->user_begin(), n->user_end(), &isProcess};
  }
  static ChildIteratorType child_end(NodeRef n) {
    return {n->user_end(), n->user_end(), &isProcess};
  }

  using nodes_iterator =
      mlir::detail::op_iterator<dataflow::ProcessOp, Region::OpIterator>;
  static nodes_iterator nodes_begin(circt::handshake::FuncOp m) {
    return m.getOps<dataflow::ProcessOp>().begin();
  }
  static nodes_iterator nodes_end(circt::handshake::FuncOp m) {
    return m.getOps<dataflow::ProcessOp>().end();
  }
};

// Specialize DOTGraphTraits to produce more readable output.
template <>
struct DOTGraphTraits<circt::handshake::FuncOp> : public DefaultDOTGraphTraits {
  using DefaultDOTGraphTraits::DefaultDOTGraphTraits;

  static std::string getNodeLabel(Operation *op, circt::handshake::FuncOp) {
    // Reuse the print output for the node labels.
    std::string ostr;
    raw_string_ostream os(ostr);
    auto process = cast<dataflow::ProcessOp>(op);
    os << getCol(process) << ", " << getRow(process);
    return os.str();
  }

  static std::string getNodeAttributes(Operation *op,
                                       circt::handshake::FuncOp) {
    // Reuse the print output for the node labels.
    std::string ostr;
    raw_string_ostream os(ostr);
    auto process = cast<dataflow::ProcessOp>(op);
    os << "pos=\"" << getCol(process) << "," << getRow(process) << "!\"";
    return os.str();
  }
};
} // namespace llvm

namespace {
class PrintDataflow : public polyaie::PrintDataflowBase<PrintDataflow> {
public:
  PrintDataflow(raw_ostream &os) : os(os) {}
  void runOnOperation() override {
    auto topFunc = getTopFunc<circt::handshake::FuncOp>(getOperation());
    llvm::WriteGraph(os, topFunc, false, "");
  }

private:
  raw_ostream &os;
};
} // namespace

std::unique_ptr<Pass> polyaie::createPrintDataflowPass() {
  return std::make_unique<PrintDataflow>(llvm::errs());
}

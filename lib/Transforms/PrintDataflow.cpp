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

// Specialize GraphTraits to treat Block as a graph of Operations as nodes and
// uses as edges.
template <> struct GraphTraits<ModuleOp> {
  using GraphType = ModuleOp;
  using NodeRef = Operation *;

  using ChildIteratorType = Operation::user_iterator;
  static ChildIteratorType child_begin(NodeRef n) { return n->user_begin(); }
  static ChildIteratorType child_end(NodeRef n) { return n->user_end(); }

  // Operation's destructor is private so use Operation* instead and use
  // mapped iterator.
  static Operation *AddressOf(const CallOp &op) { return op; }
  using nodes_iterator =
      mapped_iterator<mlir::detail::op_iterator<CallOp, Region::OpIterator>,
                      decltype(&AddressOf)>;
  static nodes_iterator nodes_begin(ModuleOp m) {
    return nodes_iterator(m.getOps<CallOp>().begin(), &AddressOf);
  }
  static nodes_iterator nodes_end(ModuleOp m) {
    return nodes_iterator(m.getOps<CallOp>().end(), &AddressOf);
  }
};

// Specialize DOTGraphTraits to produce more readable output.
template <> struct DOTGraphTraits<ModuleOp> : public DefaultDOTGraphTraits {
  using DefaultDOTGraphTraits::DefaultDOTGraphTraits;
  static std::string getNodeLabel(Operation *op, ModuleOp);
};

std::string DOTGraphTraits<ModuleOp>::getNodeLabel(Operation *op, ModuleOp m) {
  // Reuse the print output for the node labels.
  std::string ostr;
  raw_string_ostream os(ostr);
  // os << op->getName() << " : ";

  // Print resultant types.
  // llvm::interleaveComma(op->getResultTypes(), os);

  // Print callee.
  auto callOp = dyn_cast<CallOp>(op);
  // os << "\ncallee: ";
  os << callOp.callee().rsplit("_").second;

  return os.str();
}

} // end namespace llvm

namespace {
// PrintDataflow is simple pass to write graph per function.
// Note: this is a module pass only to avoid interleaving on the same ostream
// due to multi-threading over functions.
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

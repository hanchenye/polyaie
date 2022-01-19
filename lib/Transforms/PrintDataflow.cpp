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

    if (process.kind() != ProcessKind::AIE)
      os << ",style=filled,fillcolor=\"/ylgnbu5/3\"";
    else if (!process.getOps<memref::CopyOp>().empty())
      os << ",style=filled,fillcolor=\"/ylgnbu5/2\"";
    else
      os << ",style=filled,fillcolor=\"/ylgnbu5/1\"";
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

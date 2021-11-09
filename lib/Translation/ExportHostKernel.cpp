//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Translation.h"
#include "polyaie/Exporters.h"
#include "polyaie/InitAllDialects.h"

using namespace mlir;
using namespace polyaie;

namespace {
class HostKernelExporter : public ExporterBase {
public:
  explicit HostKernelExporter(ExporterState &state) : ExporterBase(state) {}
  void exportHostKernel(ModuleOp module);
};
} // namespace

void HostKernelExporter::exportHostKernel(ModuleOp module) {
  os << "Test succeeds\n";
}

LogicalResult polyaie::exportHostKernel(ModuleOp module,
                                        llvm::raw_ostream &os) {
  ExporterState state(os);
  HostKernelExporter(state).exportHostKernel(module);
  return failure(state.encounteredError);
}

void polyaie::registerExportHostKernel() {
  static TranslateFromMLIRRegistration registration(
      "export-host-kernel", exportHostKernel, [&](DialectRegistry &registry) {
        polyaie::registerAllDialects(registry);
      });
}

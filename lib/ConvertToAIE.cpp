//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct ConvertToAIE : public ConvertToAIEBase<ConvertToAIE> {
  void runOnOperation() override;
};
} // namespace

static LogicalResult inlineTopFunc(ModuleOp mod) {
  for (auto func : mod.getOps<FuncOp>()) {
    if (func->getAttrOfType<UnitAttr>("scop.top_function")) {
      // Create alloc for all arguments of the top function.
      auto b = OpBuilder(mod);
      b.setInsertionPointToEnd(mod.getBody());
      for (auto arg : func.getArguments()) {
        auto type = arg.getType().dyn_cast<MemRefType>();
        if (!type)
          return emitError(func.getLoc(),
                           "top function isn't fully bufferized");
        auto memref = b.create<memref::AllocOp>(func.getLoc(), type);
        arg.replaceAllUsesWith(memref);
      }

      // Inline the top function into the module.
      auto &modOps = mod.getBody()->getOperations();
      auto &funcOps = func.front().getOperations();
      modOps.splice(modOps.end(), funcOps, funcOps.begin(),
                    std::prev(funcOps.end()));
      func.erase();

      return success();
    }
  }

  return emitError(mod.getLoc(), "failed to find top function");
}

void ConvertToAIE::runOnOperation() {
  auto mod = getOperation();

  // Inline top function into the module.
  if (failed(inlineTopFunc(mod))) {
    signalPassFailure();
    return;
  }
}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct Preprocess : public polyaie::PreprocessBase<Preprocess> {
  Preprocess() = default;
  Preprocess(const Preprocess &) {}
  Preprocess(const PolyAIEOptions &opts) {
    topFuncName = opts.preprocessTopFuncName;
  }

  void runOnOperation() override {
    auto mod = getOperation();
    auto b = OpBuilder(mod);

    mod->removeAttr("llvm.data_layout");
    mod->removeAttr("llvm.target_triple");
    mod.walk([&](Operation *op) {
      op->removeAttr("phism.top");
      op->removeAttr("phism.pe");
      op->removeAttr("phism.point_loop");
    });

    // Find the top function.
    auto topFunc = FuncOp();
    for (auto &op :
         llvm::make_early_inc_range(mod.getBody()->getOperations())) {
      if (isa<LLVM::GlobalOp, LLVM::LLVMFuncOp>(op))
        op.erase();
      else if (auto func = dyn_cast<FuncOp>(op))
        if (func.getName() == topFuncName)
          topFunc = func;
    }

    if (!topFunc) {
      emitError(mod.getLoc(), "failed to find top function " + topFuncName);
      return signalPassFailure();
    }

    // Currently we can only handle statically shaped functions.
    for (auto argType : topFunc.getArgumentTypes())
      if (auto memrefType = argType.dyn_cast<MemRefType>())
        if (!memrefType.hasStaticShape())
          emitError(topFunc.getLoc(), "has dynamic shaped argument");

    topFunc->removeAttr("llvm.linkage");
    topFunc->setAttr("polyaie.top_func", b.getUnitAttr());

    // Erase constant arguments of `func`. These constant are unused and
    // dangling there after the compilation of polymer.
    SmallVector<unsigned, 8> argsToErase;
    for (unsigned i = 0, e = topFunc.getNumArguments(); i < e; ++i) {
      if (topFunc.getArgAttr(i, "scop.constant_value"))
        argsToErase.push_back(i);
    }
    topFunc.eraseArguments(argsToErase);
  }
};
} // namespace

std::unique_ptr<Pass> polyaie::createPreprocessPass() {
  return std::make_unique<Preprocess>();
}
std::unique_ptr<Pass>
polyaie::createPreprocessPass(const PolyAIEOptions &opts) {
  return std::make_unique<Preprocess>(opts);
}

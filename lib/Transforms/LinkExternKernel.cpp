//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct LinkExternKernel
    : public polyaie::LinkExternKernelBase<LinkExternKernel> {
  LinkExternKernel() = default;
  LinkExternKernel(const LinkExternKernel &) {}
  LinkExternKernel(const PolyAIEOptions &opts) {
    objectFile = opts.linkExternKernelObjectFile;
  }

  // TODO: Note that this pass is highly experimental!
  void runOnOperation() override {
    auto mod = getOperation();
    auto b = OpBuilder(mod);
    auto loc = b.getUnknownLoc();

    auto firstFunc = *mod.getOps<FuncOp>().begin();
    auto kernelType = firstFunc.getType();

    for (auto func : mod.getOps<FuncOp>()) {
      if (func.getType() != kernelType) {
        func.emitOpError("All functions must have the same type");
        return signalPassFailure();
      }

      // Remove all operations contained by the function and replace them with a
      // function call.
      for (auto &op : llvm::make_early_inc_range(func.front()))
        if (!isa<ReturnOp>(op)) {
          op.dropAllUses();
          op.erase();
        }

      b.setInsertionPointToStart(&func.front());
      b.create<CallOp>(loc, "kernel", kernelType.getResults(),
                       func.getArguments());

      func->setAttr("polyaie.link_with", b.getStringAttr(objectFile));
    }

    // Create the kernel as a private function.
    b.setInsertionPointToStart(mod.getBody());
    auto kernel = b.create<FuncOp>(loc, "kernel", kernelType);
    kernel.setPrivate();
  }
};
} // namespace

std::unique_ptr<Pass> polyaie::createLinkExternKernelPass() {
  return std::make_unique<LinkExternKernel>();
}
std::unique_ptr<Pass>
polyaie::createLinkExternKernelPass(const PolyAIEOptions &opts) {
  return std::make_unique<LinkExternKernel>(opts);
}

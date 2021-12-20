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
    auto kernelType = b.getFunctionType(firstFunc.getType().getInputs(), {});
    b.setInsertionPointToStart(mod.getBody());

    // Create the kernel based on the type of the first function.
    if (objectFile != "") {
      auto kernel = b.create<FuncOp>(loc, "kernel", kernelType);
      kernel.setPrivate();
    } else {
      auto kernel = firstFunc.clone();
      b.insert(kernel);
      kernel.setName("kernel");
      kernel.front().getTerminator()->eraseOperands(0, kernel.getNumResults());
      kernel.setType(kernelType);
    }

    for (auto func : llvm::drop_begin(mod.getOps<FuncOp>(), 1)) {
      if (func.getType() != firstFunc.getType()) {
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
      b.create<CallOp>(loc, "kernel", TypeRange({}), func.getArguments());

      if (objectFile != "")
        func->setAttr("polyaie.link_with", b.getStringAttr(objectFile));
    }
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

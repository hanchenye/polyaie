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

    // Create the non-private reference kernel function.
    b.setInsertionPointToStart(mod.getBody());
    auto kernel = firstFunc.clone();
    b.insert(kernel);
    kernel.setName("kernel");
    kernel.front().getTerminator()->eraseOperands(0, kernel.getNumResults());
    kernel.setType(kernelType);

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
      if (objectFile != "") {
        b.create<CallOp>(loc, "extern_kernel", TypeRange({}),
                         func.getArguments());
        func->setAttr("polyaie.link_with", b.getStringAttr(objectFile));
      } else
        b.create<CallOp>(loc, "kernel", TypeRange({}), func.getArguments());
    }

    // Create the private external kernel function.
    b.setInsertionPointToStart(mod.getBody());
    if (objectFile != "") {
      auto kernel = b.create<FuncOp>(loc, "extern_kernel", kernelType);
      kernel.setPrivate();
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

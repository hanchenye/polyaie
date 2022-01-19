//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Analysis/Liveness.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace xilinx::AIE;

// Because we need to maintain a deterministic order of arguments to accommodate
// the external kernel design, we cannot use liveness analysis here.
static void getLiveIns(CoreOp core, SmallVectorImpl<Value> &liveIns,
                       SmallVectorImpl<Type> &liveInTypes) {
  liveIns.clear();
  liveInTypes.clear();

  core.walk([&](Operation *op) {
    Value memref;
    if (auto load = dyn_cast<mlir::AffineLoadOp>(op))
      memref = load.memref();
    else if (auto store = dyn_cast<mlir::AffineStoreOp>(op))
      memref = store.memref();

    if (memref && llvm::find(liveIns, memref) == liveIns.end())
      liveIns.push_back(memref);
  });

  for (auto liveIn : liveIns)
    liveInTypes.push_back(liveIn.getType());
}

namespace {
struct LinkExternKernel
    : public polyaie::LinkExternKernelBase<LinkExternKernel> {
  LinkExternKernel() = default;
  LinkExternKernel(const PolyAIEOptions &opts) {
    objectFile = opts.linkExternKernelObjectFile;
  }

  // TODO: Note that this pass is highly experimental and just designed for
  // measuring the on-board performance of Jinming's GEMM kernel.
  void runOnOperation() override {
    auto mod = getOperation();
    auto b = OpBuilder(mod);
    auto loc = b.getUnknownLoc();

    // We simply assume all CoreOp has the same content.
    auto firstCore = *mod.getOps<CoreOp>().begin();
    SmallVector<Value, 8> firstLiveIns;
    SmallVector<Type, 8> firstLiveInTypes;
    getLiveIns(firstCore, firstLiveIns, firstLiveInTypes);

    // Create the private external kernel function.
    auto kernelType = b.getFunctionType(firstLiveInTypes, {});
    b.setInsertionPointToStart(mod.getBody());
    auto kernel = b.create<FuncOp>(loc, "extern_kernel", kernelType);
    kernel.setPrivate();

    for (auto core : mod.getOps<CoreOp>()) {
      SmallVector<Value, 8> liveIns;
      SmallVector<Type, 8> liveInTypes;
      getLiveIns(core, liveIns, liveInTypes);

      if (liveInTypes != firstLiveInTypes) {
        core.emitOpError("All cores must have the same live-in types");
        return signalPassFailure();
      }

      // Remove all operations contained by the function and replace them with a
      // function call.
      for (auto &op : llvm::make_early_inc_range(core.body().front()))
        if (!isa<xilinx::AIE::EndOp>(op)) {
          op.dropAllUses();
          op.erase();
        }

      b.setInsertionPointToStart(&core.body().front());
      b.create<CallOp>(loc, kernel, liveIns);
      core->setAttr("link_with", b.getStringAttr(objectFile));
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

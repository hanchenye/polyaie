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
    if (core == op)
      return WalkResult::skip();

    for (auto operand : op->getOperands()) {
      if (llvm::find(liveIns, operand) != liveIns.end())
        continue;

      auto definingOp = operand.getDefiningOp();
      if (!definingOp)
        definingOp = operand.cast<BlockArgument>().getOwner()->getParentOp();
      if (!core->isProperAncestor(definingOp))
        liveIns.push_back(operand);
    }
    return WalkResult::advance();
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
    genExternKernel = opts.linkExternKernelGenExternKernel;
  }

  // TODO: Note that this pass is highly experimental and just designed for
  // measuring the on-board performance of Jinming's GEMM kernel.
  void runOnOperation() override {
    auto mod = getOperation();
    auto b = OpBuilder(mod);
    auto loc = b.getUnknownLoc();

    SmallVector<CoreOp, 32> nonEmptyCores;
    for (auto core : mod.getOps<CoreOp>())
      if (!llvm::hasSingleElement(core.body().front()))
        nonEmptyCores.push_back(core);

    // We simply assume all CoreOp has the same content.
    auto firstCore = nonEmptyCores.front();
    SmallVector<Value, 8> firstLiveIns;
    SmallVector<Type, 8> firstLiveInTypes;
    getLiveIns(firstCore, firstLiveIns, firstLiveInTypes);

    // Create the private external kernel function.
    auto kernelType = b.getFunctionType(firstLiveInTypes, {});
    b.setInsertionPointToStart(mod.getBody());
    auto kernel = b.create<FuncOp>(loc, "extern_kernel", kernelType);
    kernel.setPrivate();

    // Replace the body of each CoreOp with a function call to the kernel.
    for (auto core : nonEmptyCores) {
      SmallVector<Value, 8> liveIns;
      SmallVector<Type, 8> liveInTypes;
      getLiveIns(core, liveIns, liveInTypes);

      if (liveInTypes != firstLiveInTypes) {
        core.emitOpError("All cores must have the same live-in types");
        return signalPassFailure();
      }

      if ((core == firstCore) && genExternKernel) {
        // If we are going to generate external kernel through the AIEVec
        // dialect, move all operations of the first CoreOp into the new kernel
        // function.
        auto entryBlock = &kernel.body().emplaceBlock();
        auto &kernelOps = entryBlock->getOperations();
        auto &coreOps = core.body().front().getOperations();
        kernelOps.splice(kernelOps.begin(), coreOps, coreOps.begin(),
                         std::prev(coreOps.end()));

        b.setInsertionPointToEnd(entryBlock);
        b.create<mlir::ReturnOp>(loc);

        // Replace liveins with the entry block arguments.
        SmallVector<Location, 8> liveInLocs;
        for (auto value : liveIns)
          liveInLocs.push_back(value.getLoc());

        auto args = entryBlock->addArguments(liveInTypes, liveInLocs);
        for (auto zip : llvm::zip(liveIns, args))
          std::get<0>(zip).replaceUsesWithIf(
              std::get<1>(zip), [&](OpOperand &use) {
                return kernel->isProperAncestor(use.getOwner());
              });
      } else {
        // Otherwise, remove all operations contained by the function.
        for (auto &op : llvm::make_early_inc_range(core.body().front()))
          if (!isa<xilinx::AIE::EndOp>(op)) {
            op.dropAllUses();
            op.erase();
          }
      }

      // Create a function call to replace the original CoreOp body.
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

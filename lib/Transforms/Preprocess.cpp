//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Analysis/Liveness.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct Preprocess : public polyaie::PreprocessBase<Preprocess> {
  Preprocess() = default;
  Preprocess(const PolyAIEOptions &opts) {
    topFuncName = opts.preprocessTopFuncName;
    tileSize = opts.loopTileSize;
  }

  void runOnOperation() override {
    auto mod = getOperation();
    auto b = OpBuilder(mod);
    mod->removeAttr("llvm.data_layout");
    mod->removeAttr("llvm.target_triple");

    // Find the top function.
    auto topFunc = FuncOp();
    for (auto &op :
         llvm::make_early_inc_range(mod.getBody()->getOperations())) {
      if (isa<LLVM::GlobalOp, LLVM::LLVMFuncOp>(op))
        op.erase();
      else if (auto func = dyn_cast<FuncOp>(op)) {
        // Currently we can only handle single-block functions.
        if (!llvm::hasSingleElement(func.body())) {
          emitError(func.getLoc(), "has more than one blocks");
          return signalPassFailure();
        }
        // Currently we can only handle statically shaped functions.
        for (auto argType : func.getArgumentTypes())
          if (auto memrefType = argType.dyn_cast<MemRefType>())
            if (!memrefType.hasStaticShape()) {
              emitError(func.getLoc(), "has dynamic shaped argument");
              return signalPassFailure();
            }
        // Identify the top function.
        if (func.getName() == topFuncName)
          topFunc = func;
      }
    }

    if (!topFunc) {
      emitError(mod.getLoc(), "failed to find top function " + topFuncName);
      return signalPassFailure();
    }

    topFunc->removeAttr("llvm.linkage");
    topFunc->setAttr("polyaie.top_func", b.getUnitAttr());

    // TODO: This is very experimental and cannot handle complicated cases.
    std::vector<SmallVector<mlir::AffineForOp, 6>> bands;
    getTileableBands(topFunc, &bands);
    unsigned bandIdx = 0;
    for (auto band : bands) {
      SmallVector<unsigned, 6> tileSizes(band.size(), tileSize);
      SmallVector<mlir::AffineForOp, 6> tileBand;
      if (failed(tilePerfectlyNested(band, tileSizes, &tileBand)))
        return signalPassFailure();
      auto outerPointLoop = tileBand[band.size()];

      // Figure out the input variables of the point loop band.
      if (outerPointLoop.getNumResults()) {
        outerPointLoop.emitOpError("loop with results is not supported");
        return signalPassFailure();
      }
      auto liveness = Liveness(tileBand.front());
      SmallVector<Value, 8> inputs(outerPointLoop.getOperands());
      for (auto livein : liveness.getLiveIn(outerPointLoop.getBody()))
        if (!outerPointLoop->isAncestor(livein.getParentBlock()->getParentOp()))
          inputs.push_back(livein);

      // Outline the point loop band.
      b.setInsertionPoint(topFunc);
      auto funcName = "PE" + std::to_string(bandIdx++);
      auto funcType = b.getFunctionType(ValueRange(inputs), TypeRange({}));
      auto func = b.create<mlir::FuncOp>(b.getUnknownLoc(), funcName, funcType);
      auto entry = func.addEntryBlock();

      b.setInsertionPoint(outerPointLoop);
      b.create<mlir::CallOp>(outerPointLoop.getLoc(), func, inputs);
      b.setInsertionPointToEnd(entry);
      auto returnOp = b.create<mlir::ReturnOp>(b.getUnknownLoc());
      outerPointLoop->moveBefore(returnOp);

      for (auto t : llvm::zip(inputs, entry->getArguments()))
        std::get<0>(t).replaceUsesWithIf(std::get<1>(t), [&](OpOperand &use) {
          return func->isProperAncestor(use.getOwner());
        });
    }
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

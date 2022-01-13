//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/LoopUtils.h"
#include "mlir/Transforms/Passes.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"
#include "llvm/ADT/BitVector.h"

using namespace mlir;
using namespace polyaie;

/// Helper to get the total number of calls in the block.
static unsigned getNumCall(FuncOp func) {
  unsigned numCall = 0;
  func.walk([&](mlir::CallOp call) { ++numCall; });
  return numCall;
}

static bool hasFullyUnrolled(FuncOp func) {
  auto result =
      func.walk([](mlir::AffineForOp loop) { return WalkResult::interrupt(); });
  return !result.wasInterrupted();
}

static void unrollFuncByFactorGreedily(FuncOp func, unsigned factor,
                                       unsigned maxIteration = 3) {
  // Record the current remainded unroll factor.
  unsigned currentRemainder = factor;

  for (unsigned i = 1; i < maxIteration; ++i) {
    if (hasFullyUnrolled(func))
      return;

    // Collect all leaf loop bands in the function.
    AffineLoopBands bands;
    getLoopBands(func.front(), bands, /*reverse=*/true,
                 /*allowHavingChilds=*/false);

    auto minRemainder = currentRemainder;
    for (auto &band : bands) {
      auto remainder = currentRemainder;
      for (auto loop : band) {
        auto maybeTripCount = getConstantTripCount(loop);
        if (!maybeTripCount || maybeTripCount.getValue() < 1)
          continue;
        unsigned tripCount = maybeTripCount.getValue();

        auto unrollFactor = std::min(remainder, tripCount);
        auto cleanupUnrollFactor =
            tripCount % unrollFactor == 0 ? unrollFactor : unrollFactor - 1;
        if (succeeded(loopUnrollJamByFactor(loop, cleanupUnrollFactor)))
          remainder /= unrollFactor;
        else if (succeeded(loopUnrollByFactor(loop, cleanupUnrollFactor)))
          remainder /= unrollFactor;

        if (remainder == 1)
          break;
      }
      minRemainder = std::min(minRemainder, remainder);
    }

    // Simplify the loop structure after the unrolling.
    PassManager pm(func.getContext(), "builtin.func");
    pm.addPass(createSimplifyAffineStructuresPass());
    pm.addPass(createCanonicalizerPass());
    (void)pm.run(func);

    // Early exit if the unroll factor is already equal to one.
    currentRemainder = minRemainder;
    if (currentRemainder == 1)
      break;
  }
}

/// Duplicate a separate function for each call in `func`, such that each
/// function is only called once.
static void duplicateSubFuncs(FuncOp func) {
  auto b = OpBuilder(func);
  unsigned callIdx = 0;
  func.walk([&](CallOp call) {
    auto calleeOp = SymbolTable::lookupSymbolIn(
        func->getParentOfType<ModuleOp>(), call.callee());
    auto callee = dyn_cast<FuncOp>(calleeOp);

    // Create a new callee function for each call operation.
    b.setInsertionPointAfter(callee);
    auto newCallee = callee.clone();
    b.insert(newCallee);

    // Set up a new name.
    auto newName = call.callee().str() + "_AIE" + std::to_string(callIdx);
    newCallee.setName(newName);
    call->setAttr("callee", SymbolRefAttr::get(newCallee));

    // Localize the constant into the new callee.
    SmallVector<unsigned, 8> argsToErase;
    auto operandsToErase = llvm::BitVector();
    for (unsigned i = 0, e = call.getNumOperands(); i < e; ++i) {
      if (auto param = call.getOperand(i).getDefiningOp<arith::ConstantOp>()) {
        // Replace function argument with a constant number if applicable.
        b.setInsertionPointToStart(&newCallee.front());
        auto newParam = param.clone();
        b.insert(newParam);
        newCallee.getArgument(i).replaceAllUsesWith(newParam);

        argsToErase.push_back(i);
        operandsToErase.push_back(true);
      } else if (newCallee.getArgument(i).use_empty()) {
        // Remove unused function arguments.
        argsToErase.push_back(i);
        operandsToErase.push_back(true);
      } else
        operandsToErase.push_back(false);
    }
    newCallee.eraseArguments(argsToErase);
    call->eraseOperands(operandsToErase);

    // Canonicalize the function for constant propogation.
    PassManager pm(newCallee.getContext(), "builtin.func");
    pm.addPass(createCanonicalizerPass());
    (void)pm.run(newCallee);

    // Move to the next AIE call.
    ++callIdx;
  });
}

/// Eliminate all funcions that are redundant.
static void removeRedundantFuncs(ModuleOp mod) {
  for (auto func : llvm::make_early_inc_range(mod.getOps<FuncOp>())) {
    // Remove the function if it's no longer used.
    if (func.symbolKnownUseEmpty(mod) && !func->hasAttr("polyaie.top_func")) {
      func.erase();
      continue;
    }

    // Remove empty or zero-iteration loops.
    SmallVector<mlir::AffineForOp, 8> loops;
    func.walk([&](mlir::AffineForOp loop) { loops.push_back(loop); });
    for (auto loop : loops) {
      if (llvm::hasSingleElement(*loop.getBody()) ||
          (loop.getStep() > 0 && loop.hasConstantBounds() &&
           loop.getConstantLowerBound() >= loop.getConstantUpperBound()))
        loop.erase();
    }

    // Canonicalize the function to remove other redundant operations after
    // loops removal.
    PassManager pm(func.getContext(), "builtin.func");
    pm.addPass(createCanonicalizerPass());
    (void)pm.run(func);

    // Remove the function if it's empty. Also remove its symbol users.
    if (llvm::hasSingleElement(func.front()) && func.getNumResults() == 0) {
      auto symbolUses = func.getSymbolUses(mod);
      if (symbolUses.hasValue())
        for (auto use : symbolUses.getValue())
          use.getUser()->erase();
      func.erase();
    }
  }
}

namespace {
struct SplitTopFunc : public polyaie::SplitTopFuncBase<SplitTopFunc> {
  SplitTopFunc() = default;
  SplitTopFunc(const SplitTopFunc &) {}
  SplitTopFunc(const PolyAIEOptions &opts) { numAIE = opts.splitTopFuncNumAIE; }

  void runOnOperation() override {
    auto mod = getOperation();
    auto topFunc = getTopFunc<FuncOp>(mod);

    // Find the suitable function unroll factor.
    unsigned factor = numAIE / getNumCall(topFunc);
    if (factor <= 1)
      return;
    for (; factor < numAIE; ++factor) {
      auto cloneTopFunc = topFunc.clone();
      unrollFuncByFactorGreedily(cloneTopFunc, factor);

      // Exit and subtract one from the factor if the number of function calls
      // are larger than the available number of AIEs.
      if (getNumCall(cloneTopFunc) > numAIE) {
        --factor;
        break;
      }
      // Exit if the function is already fully unrolled.
      if (hasFullyUnrolled(cloneTopFunc))
        break;
      cloneTopFunc->remove();
    }

    // Split the top function.
    unrollFuncByFactorGreedily(topFunc, factor);
    duplicateSubFuncs(topFunc);
    removeRedundantFuncs(mod);

    // TODO: Support control flow.
    if (!hasFullyUnrolled(topFunc)) {
      emitError(topFunc.getLoc(), "top function is not fully unrolled");
      return signalPassFailure();
    }
  }
};
} // namespace

std::unique_ptr<Pass> polyaie::createSplitTopFuncPass() {
  return std::make_unique<SplitTopFunc>();
}
std::unique_ptr<Pass>
polyaie::createSplitTopFuncPass(const PolyAIEOptions &opts) {
  return std::make_unique<SplitTopFunc>(opts);
}

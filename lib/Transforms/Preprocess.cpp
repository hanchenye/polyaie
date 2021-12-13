//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Dialect/StandardOps/Transforms/FuncConversions.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/DialectConversion.h"
#include "mlir/Transforms/LoopUtils.h"
#include "mlir/Transforms/Passes.h"
#include "polyaie/Transforms/Passes.h"
#include "llvm/ADT/BitVector.h"

using namespace mlir;
using namespace polyaie;

static FuncOp simplifyModuleAndFindTopFunc(ModuleOp mod,
                                           StringRef topFuncName) {
  mod->removeAttr("llvm.data_layout");
  mod->removeAttr("llvm.target_triple");
  auto topFunc = FuncOp();
  for (auto &op : llvm::make_early_inc_range(mod.getBody()->getOperations())) {
    if (isa<LLVM::GlobalOp, LLVM::LLVMFuncOp>(op))
      op.erase();
    else if (auto func = dyn_cast<FuncOp>(op))
      if (func.getName() == topFuncName) {
        for (auto argType : func.getArgumentTypes())
          if (auto memrefType = argType.dyn_cast<MemRefType>())
            if (!memrefType.hasStaticShape())
              emitError(func.getLoc(), "has dynamic shaped argument");
        topFunc = func;
      }
  }
  return topFunc;
}

/// Erase constant arguments of `func`. These constant are unused and dangling
/// there after the compilation of polymer.
static void eraseConstantArgs(FuncOp func) {
  SmallVector<unsigned, 8> argsToErase;
  for (unsigned i = 0, e = func.getNumArguments(); i < e; ++i) {
    if (func.getArgAttr(i, "scop.constant_value"))
      argsToErase.push_back(i);
  }
  func.eraseArguments(argsToErase);
}

/// Fully unroll all loops in `func`, such that there's no loop in `func`.
static LogicalResult unrollAllLoops(FuncOp func) {
  // Try 8 iterations before exiting.
  unsigned i = 0;
  for (; i < 8; ++i) {
    bool hasFullyUnrolled = true;
    func.walk([&](mlir::AffineForOp loop) {
      if (failed(loopUnrollFull(loop)))
        hasFullyUnrolled = false;
    });

    PassManager pm(func.getContext(), "func");
    pm.addPass((createSimplifyAffineStructuresPass()));
    pm.addPass((createCanonicalizerPass()));
    (void)pm.run(func);

    if (hasFullyUnrolled)
      break;
  }
  return i == 8 ? failure() : success();
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
    call->removeAttr("scop.pe");
    callee->removeAttr("scop.pe");

    // Create a new callee function for each call operation.
    b.setInsertionPointAfter(callee);
    auto newCallee = callee.clone();
    b.insert(newCallee);

    // Set up a new name.
    auto newName = call.callee().str() + "_AIE" + std::to_string(callIdx);
    newCallee.setName(newName);
    call->setAttr("callee", b.getSymbolRefAttr(newName));

    // Localize the constant into the new callee.
    SmallVector<unsigned, 8> argsToErase;
    auto operandsToErase = llvm::BitVector();
    for (unsigned i = 0, e = call.getNumOperands(); i < e; ++i) {
      if (auto param = call.getOperand(i).getDefiningOp<ConstantOp>()) {
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

    // Move to the next AIE call.
    ++callIdx;
  });
}

namespace {
class ScalarBufferizeTypeConverter : public TypeConverter {
public:
  static Value materializeDefine(OpBuilder &b, Type type, ValueRange inputs,
                                 Location loc) {
    assert(inputs.size() == 1);
    auto inputType = inputs[0].getType().dyn_cast<MemRefType>();
    assert(inputType && inputType.getElementType() == type);
    return b.create<mlir::AffineLoadOp>(loc, inputs[0], ValueRange({}));
  }

  static Value materializeUse(OpBuilder &b, MemRefType type, ValueRange inputs,
                              Location loc) {
    assert(inputs.size() == 1);
    auto defLoad = inputs[0].getDefiningOp<mlir::AffineLoadOp>();
    // TODO: Make it more robust.
    assert(defLoad && defLoad.getMemRefType() == type);
    return defLoad.memref();
  }

  ScalarBufferizeTypeConverter() {
    // Convert all scalar to memref.
    addConversion([](Type type) -> Type {
      if (!type.isa<MemRefType>())
        return MemRefType::get({}, type);
      return type;
    });
    // Load the original scalar from memref.
    addArgumentMaterialization(materializeDefine);
    addSourceMaterialization(materializeDefine);
    addTargetMaterialization(materializeUse);
  }
};
} // namespace

/// Bufferize all scalars to single-element memrefs.
static LogicalResult bufferizeAllScalars(ModuleOp mod) {
  ScalarBufferizeTypeConverter typeConverter;
  RewritePatternSet patterns(mod.getContext());
  ConversionTarget target(*mod.getContext());

  populateFuncOpTypeConversionPattern(patterns, typeConverter);
  target.addDynamicallyLegalOp<FuncOp>([&](FuncOp op) {
    return typeConverter.isSignatureLegal(op.getType()) &&
           typeConverter.isLegal(&op.getBody());
  });
  populateCallOpTypeConversionPattern(patterns, typeConverter);
  target.addDynamicallyLegalOp<CallOp>(
      [&](CallOp op) { return typeConverter.isLegal(op); });
  populateReturnOpTypeConversionPattern(patterns, typeConverter);

  target.markUnknownOpDynamicallyLegal([&](Operation *op) {
    return isNotBranchOpInterfaceOrReturnLikeOp(op) ||
           isLegalForReturnOpTypeConversionPattern(op, typeConverter);
  });

  return applyFullConversion(mod, target, std::move(patterns));
}

/// Inline `func` into its parent module.
static void inlineFuncIntoModule(FuncOp func) {
  // Create alloc for all arguments of the top function.
  auto mod = func->getParentOfType<ModuleOp>();
  auto b = OpBuilder(mod);
  b.setInsertionPointToEnd(mod.getBody());
  for (auto arg : func.getArguments()) {
    auto type = arg.getType().dyn_cast<MemRefType>();
    assert(type && "top function must be fully bufferized");
    auto memref = b.create<memref::AllocOp>(func.getLoc(), type);
    arg.replaceAllUsesWith(memref);
  }

  // Inline the top function into the module.
  auto &modOps = mod.getBody()->getOperations();
  auto &funcOps = func.front().getOperations();
  modOps.splice(modOps.end(), funcOps, funcOps.begin(),
                std::prev(funcOps.end()));
  mod->setAttr("sym_name", func.sym_nameAttr());
  func.erase();

  // Canonicalize the whole module.
  PassManager pm(mod.getContext(), "module");
  pm.addPass(createCanonicalizerPass());
  (void)pm.run(mod);

  // FIXME: Temporary solution.
  for (auto store :
       llvm::make_early_inc_range(mod.getOps<mlir::AffineStoreOp>()))
    store.erase();
}

/// Eliminate all funcions that are redundant.
static void removeRedundantFuncs(ModuleOp mod) {
  for (auto func : llvm::make_early_inc_range(mod.getOps<FuncOp>())) {
    // Remove the function if it's no longer used.
    if (func.symbolKnownUseEmpty(mod)) {
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
      loop->removeAttr("scop.point_loop");
    }

    // Canonicalize the function to remove other redundant operations after
    // loops removal.
    PassManager pm(func.getContext(), "func");
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
struct Preprocess : public polyaie::PreprocessBase<Preprocess> {
  Preprocess() = default;
  Preprocess(const Preprocess &) {}
  Preprocess(const PolyAIEOptions &opts) {
    topFuncName = opts.preprocessTopFuncName;
  }

  void runOnOperation() override {
    auto mod = getOperation();
    auto topFunc = simplifyModuleAndFindTopFunc(mod, topFuncName);
    if (!topFunc) {
      emitError(mod.getLoc(), "failed to find top function " + topFuncName);
      return signalPassFailure();
    }
    eraseConstantArgs(topFunc);
    if (failed(unrollAllLoops(topFunc))) {
      emitError(topFunc.getLoc(), "failed to unroll all loops");
      return signalPassFailure();
    }
    duplicateSubFuncs(topFunc);
    if (failed(bufferizeAllScalars(mod))) {
      emitError(mod.getLoc(), "failed to bufferize scalars");
      return signalPassFailure();
    }
    inlineFuncIntoModule(topFunc);
    removeRedundantFuncs(mod);
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

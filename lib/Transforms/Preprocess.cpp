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
#include "polyaie/Passes.h"
#include "llvm/ADT/BitVector.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct Preprocess : public PreprocessBase<Preprocess> {
  void runOnOperation() override;
};
} // namespace

static void eraseConstantArguments(FuncOp func) {
  SmallVector<unsigned, 16> argsToErase;
  for (unsigned i = 0, e = func.getNumArguments(); i < e; ++i) {
    if (func.getArgAttr(i, "scop.constant_value"))
      argsToErase.push_back(i);
  }
  func.eraseArguments(argsToErase);
}

static LogicalResult unrollAllLoops(FuncOp func) {
  SmallVector<mlir::AffineForOp, 16> loops;
  func.walk([&](mlir::AffineForOp loop) { loops.push_back(loop); });
  for (auto loop : loops)
    if (failed(loopUnrollFull(loop)))
      return failure();
  return success();
}

static LogicalResult simplifyFunc(FuncOp func) {
  PassManager pm(func.getContext(), "func");
  pm.addPass(createCanonicalizerPass());
  pm.addPass((createSimplifyAffineStructuresPass()));
  return pm.run(func);
}

static void duplicateSubFuncs(ModuleOp mod, FuncOp func) {
  auto b = OpBuilder(func);
  unsigned aieIdx = 0;
  func.walk([&](CallOp call) {
    call->removeAttr("scop.pe");
    auto calleeOp = mod.lookupSymbol(call.callee());
    auto callee = dyn_cast<FuncOp>(calleeOp);

    // Create a new callee function for each call operation.
    b.setInsertionPointAfter(callee);
    auto newCallee = callee.clone();
    b.insert(newCallee);

    // Set up a new name.
    auto newName = call.callee().str() + "_AIE" + std::to_string(aieIdx);
    newCallee.setName(newName);
    call->setAttr("callee", b.getSymbolRefAttr(newName));

    // Localize the constant into the new callee.
    SmallVector<unsigned, 8> argsToErase;
    auto operandsToErase = llvm::BitVector();
    for (unsigned i = 0, e = call.getNumOperands(); i < e; ++i) {
      if (auto param = call.getOperand(i).getDefiningOp<ConstantOp>()) {
        b.setInsertionPointToStart(&newCallee.front());
        auto newParam = param.clone();
        b.insert(newParam);

        newCallee.getArgument(i).replaceAllUsesWith(newParam);

        argsToErase.push_back(i);
        operandsToErase.push_back(true);
        continue;
      }
      operandsToErase.push_back(false);
    }
    newCallee.eraseArguments(argsToErase);
    call->eraseOperands(operandsToErase);

    // Remove the callee function if not used.
    if (callee.symbolKnownUseEmpty(mod))
      callee.erase();

    // Move to the next AIE call.
    ++aieIdx;
  });
}

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
  assert(defLoad && defLoad.getMemRefType() == type);
  return defLoad.memref();
}

class ScalarBufferizeTypeConverter : public TypeConverter {
public:
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

static LogicalResult inlineFunc(ModuleOp mod, FuncOp func) {
  // Create alloc for all arguments of the top function.
  auto b = OpBuilder(mod);
  b.setInsertionPointToEnd(mod.getBody());
  for (auto arg : func.getArguments()) {
    auto type = arg.getType().dyn_cast<MemRefType>();
    if (!type)
      return emitError(func.getLoc(), "top function isn't fully bufferized");
    auto memref = b.create<memref::AllocOp>(func.getLoc(), type);
    arg.replaceAllUsesWith(memref);
  }

  // Inline the top function into the module.
  auto &modOps = mod.getBody()->getOperations();
  auto &funcOps = func.front().getOperations();
  modOps.splice(modOps.end(), funcOps, funcOps.begin(),
                std::prev(funcOps.end()));
  func.erase();

  PassManager pm(mod.getContext(), "module");
  pm.addPass(createCanonicalizerPass());
  return pm.run(mod);
}

void Preprocess::runOnOperation() {
  auto mod = getOperation();
  mod->removeAttr("llvm.target_triple");
  mod->removeAttr("llvm.data_layout");

  // Erase unused operations and find the top function.
  auto topFunc = FuncOp();
  for (auto &op : llvm::make_early_inc_range(mod.getBody()->getOperations())) {
    if (isa<LLVM::GlobalOp, LLVM::LLVMFuncOp>(op))
      op.erase();
    else if (auto func = dyn_cast<FuncOp>(op))
      if (func.getName() == topFuncName)
        topFunc = func;
  }
  if (!topFunc) {
    emitError(mod.getLoc(), "failed to find top function " + topFuncName);
    signalPassFailure();
  }

  // Erase constant arguments of the top function. These constant are unused
  // and dangling there after the compilation of phism.
  eraseConstantArguments(topFunc);

  // Unroll all loops in the top function.
  if (failed(unrollAllLoops(topFunc))) {
    emitError(topFunc.getLoc(), "failed to unroll all loops");
    signalPassFailure();
  }

  // Simplify the top function.
  if (failed(simplifyFunc(topFunc))) {
    emitError(topFunc.getLoc(), "failed to simplify the function");
    signalPassFailure();
  }

  // Create a seperate function for each call in the top function.
  duplicateSubFuncs(mod, topFunc);

  // Bufferize all scalar to single-element memrefs.
  if (failed(bufferizeAllScalars(mod))) {
    emitError(mod->getLoc(), "failed to bufferize scalars");
    signalPassFailure();
  }

  // Inline top function into the module.
  if (failed(inlineFunc(mod, topFunc))) {
    emitError(mod->getLoc(), "failed to inline the top function");
    signalPassFailure();
  }
}

std::unique_ptr<Pass> polyaie::createPreprocessPass() {
  return std::make_unique<Preprocess>();
}

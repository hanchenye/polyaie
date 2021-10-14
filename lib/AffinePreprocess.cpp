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
struct AffinePreprocess : public AffinePreprocessBase<AffinePreprocess> {
  void runOnOperation() override;
};
} // namespace

static FuncOp getTopFunc(ModuleOp mod, StringRef topFuncName) {
  for (auto func : mod.getOps<FuncOp>())
    if (func.getName() == topFuncName)
      return func;

  emitError(mod.getLoc(), "failed to find top function " + topFuncName);
  return nullptr;
}

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

static void duplicateSubFuncs(FuncOp func) {
  auto b = OpBuilder(func);
  SmallVector<CallOp, 16> calls;
  func.walk([&](CallOp call) { calls.push_back(call); });

  unsigned coreIdx = 0;
  for (auto call : calls) {
    auto calleeOp = SymbolTable::lookupSymbolIn(
        func->getParentOfType<ModuleOp>(), call.callee());
    auto callee = dyn_cast<FuncOp>(calleeOp);

    // Create a new callee function for each call operation.
    b.setInsertionPointAfter(callee);
    auto newCallee = callee.clone();
    b.insert(newCallee);

    // Set up a new name.
    auto newName = call.callee().str() + "_AIE" + std::to_string(coreIdx);
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

    // Move to the next AIE call.
    ++coreIdx;
  }
}

static Value materializeLoad(OpBuilder &b, Type type, ValueRange inputs,
                             Location loc) {
  assert(inputs.size() == 1);
  auto inputType = inputs[0].getType().dyn_cast<MemRefType>();
  assert(inputType && inputType.getElementType() == type);
  return b.create<mlir::AffineLoadOp>(loc, inputs[0], ValueRange({}));
}

static Value materializeAllocAndStore(OpBuilder &b, MemRefType type,
                                      ValueRange inputs, Location loc) {
  assert(inputs.size() == 1);
  assert(type.getElementType() == inputs[0].getType());
  auto memref = b.create<memref::AllocOp>(loc, type);
  b.create<mlir::AffineStoreOp>(loc, inputs[0], memref, ValueRange({}));
  return memref;
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
    addArgumentMaterialization(materializeLoad);
    addSourceMaterialization(materializeLoad);
    addTargetMaterialization(materializeAllocAndStore);
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

void AffinePreprocess::runOnOperation() {
  auto mod = getOperation();
  auto topFunc = getTopFunc(mod, topFuncName);
  if (!topFunc) {
    signalPassFailure();
    return;
  }

  // Erase constant arguments of the top function. These constant are unused
  // and dangling there after the compilation of phism.
  eraseConstantArguments(topFunc);

  // Unroll all loops in the top function.
  if (failed(unrollAllLoops(topFunc))) {
    signalPassFailure();
    return;
  }

  // Simplify the top function.
  if (failed(simplifyFunc(topFunc))) {
    signalPassFailure();
    return;
  }

  // Create a seperate function for each call in the top function.
  duplicateSubFuncs(topFunc);

  // Bufferize all scalar to single-element memrefs.
  if (failed(bufferizeAllScalars(mod))) {
    signalPassFailure();
    return;
  }
}

std::unique_ptr<Pass> polyaie::createAffinePreprocessPass() {
  return std::make_unique<AffinePreprocess>();
}

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Transforms/DialectConversion.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct ConvertToDataflow
    : public polyaie::ConvertToDataflowBase<ConvertToDataflow> {
  void runOnOperation() override;
};
} // namespace

namespace {
struct TensorLoadConversion
    : public OpConversionPattern<bufferization::ToTensorOp> {
  using OpConversionPattern<bufferization::ToTensorOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(bufferization::ToTensorOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    if (auto subview = op.memref().getDefiningOp<memref::SubViewOp>()) {
      rewriter.replaceOpWithNewOp<dataflow::TensorLoadOp>(
          op, op.getType(), subview.static_offsets(), subview.static_sizes(),
          subview.static_strides(), subview.source());
      return success();
    }
    return failure();
  }
};
} // namespace

namespace {
struct TensorStoreConversion : public OpConversionPattern<memref::CopyOp> {
  using OpConversionPattern<memref::CopyOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(memref::CopyOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    if (auto subview = op.target().getDefiningOp<memref::SubViewOp>()) {
      if (auto toMemrefOp =
              op.source().getDefiningOp<bufferization::ToMemrefOp>()) {
        rewriter.replaceOpWithNewOp<dataflow::TensorStoreOp>(
            op, subview.static_offsets(), subview.static_sizes(),
            subview.static_strides(), subview.source(), toMemrefOp.tensor());
        return success();
      }
    }
    return failure();
  }
};
} // namespace

namespace {
struct ProcessConversion : public OpConversionPattern<mlir::CallOp> {
  using OpConversionPattern<mlir::CallOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(mlir::CallOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto mod = op->getParentOfType<ModuleOp>();
    auto func = mod.lookupSymbol<FuncOp>(op.getCallee());

    // Replace call and function operation.
    auto process = rewriter.replaceOpWithNewOp<dataflow::ProcessOp>(
        op, op.getResultTypes(), op.getOperands());
    // process->setAttrs(func->getAttrs());

    auto &bodyBlock = process.body().front();
    rewriter.inlineRegionBefore(func.getBody(), &bodyBlock);
    rewriter.eraseBlock(&bodyBlock);
    rewriter.eraseOp(func);

    // Replace return operation.
    auto returnOp = process.body().back().getTerminator();
    rewriter.setInsertionPoint(returnOp);
    rewriter.create<dataflow::ReturnOp>(returnOp->getLoc(),
                                        returnOp->getOperands());
    rewriter.eraseOp(returnOp);
    return success();
  }
};
} // namespace

void ConvertToDataflow::runOnOperation() {
  auto mod = getOperation();
  auto topFunc = getTopFunc<FuncOp>(mod);
  auto b = OpBuilder(mod);

  RewritePatternSet patterns(mod.getContext());
  ConversionTarget target(*mod.getContext());

  target.addIllegalOp<mlir::CallOp>();
  target.addIllegalOp<bufferization::ToTensorOp>();
  target.addIllegalOp<memref::CopyOp>();

  patterns.add<TensorLoadConversion>(patterns.getContext());
  patterns.add<TensorStoreConversion>(patterns.getContext());
  patterns.add<ProcessConversion>(patterns.getContext());

  target.addLegalOp<dataflow::TensorLoadOp>();
  target.addLegalOp<dataflow::TensorStoreOp>();
  target.addLegalOp<dataflow::ProcessOp>();
  target.addLegalOp<dataflow::ReturnOp>();

  if (failed(applyPartialConversion(topFunc, target, std::move(patterns))))
    return signalPassFailure();

  // Mark leaf processes that drives tensor store ops.
  for (auto store : topFunc.getOps<dataflow::TensorStoreOp>()) {
    auto leafProcess = store.tensor().getDefiningOp<dataflow::ProcessOp>();
    leafProcess->setAttr("polyaie.leaf", b.getUnitAttr());
  }

  // Create a new handshake function.
  b.setInsertionPoint(topFunc);
  SmallVector<NamedAttribute, 4> attrs;
  for (const auto &attr : topFunc->getAttrs()) {
    if (attr.getName() == SymbolTable::getSymbolAttrName() ||
        attr.getName() == function_interface_impl::getTypeAttrName())
      continue;
    attrs.push_back(attr);
  }
  auto dfFunc = b.create<circt::handshake::FuncOp>(
      topFunc.getLoc(), topFunc.getName(), topFunc.getType(), attrs);
  dfFunc.resolveArgAndResNames();

  // Inline the contents of the top function.
  auto &topFuncBlocks = topFunc.body().getBlocks();
  auto &dfFuncBlocks = dfFunc.body().getBlocks();
  dfFuncBlocks.splice(dfFuncBlocks.begin(), topFuncBlocks);

  // Replace the ternimator with an EndOp.
  auto returnOp = dfFuncBlocks.back().getTerminator();
  b.setInsertionPoint(returnOp);
  b.create<dataflow::ReturnOp>(returnOp->getLoc(), returnOp->getOperands());
  returnOp->erase();

  // We can erase the top function now.
  topFunc->erase();
}

std::unique_ptr<Pass> polyaie::createConvertToDataflowPass() {
  return std::make_unique<ConvertToDataflow>();
}

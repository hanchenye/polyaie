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
    auto func = mod.lookupSymbol<FuncOp>(op.callee());

    // Replace call and function operation.
    auto process = rewriter.replaceOpWithNewOp<dataflow::ProcessOp>(
        op, op.getResultTypes(), op.getOperands());
    process->setAttrs(func->getAttrs());

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
  auto topFunc = getTopFunc(mod);

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
}

std::unique_ptr<Pass> polyaie::createConvertToDataflowPass() {
  return std::make_unique<ConvertToDataflow>();
}

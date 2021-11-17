//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/Passes.h"
#include "polyaie/MemRefExt/MemRefExt.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct CreateDataflow : public polyaie::CreateDataflowBase<CreateDataflow> {
  void runOnOperation() override;
};
} // namespace

void CreateDataflow::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  for (auto func : mod.getOps<FuncOp>()) {
    b.setInsertionPointToStart(&func.front());
    // Working here...
    for (auto arg : func.getArguments()) {
      if (arg.use_empty())
        continue;

      auto argType = arg.getType().dyn_cast<MemRefType>();
      if (!argType) {
        emitError(func.getLoc(), "function must be fully bufferized");
        return signalPassFailure();
      }

      // For single-element memory, directly create a local buffer for it and
      // create a new memory copy.
      if (argType.getRank() == 0) {
        auto buf = b.create<memref::AllocOp>(func.getLoc(), argType);
        arg.replaceAllUsesWith(buf);
        b.create<memrefext::MemCpyOp>(func.getLoc(),
                                      memrefext::MemCpyKind::Load,
                                      b.getI64ArrayAttr({0}), arg, buf);
        continue;
      }

      // We assume that after the compilation of phism, all users have the same
      // memory access pattern. Therefore, we only collect the operands and
      // affine map of the first user.
      auto firstUser = *arg.getUsers().begin();
      SmallVector<Value, 4> operands;
      AffineMap map;
      if (auto loadOp = dyn_cast<mlir::AffineLoadOp>(firstUser)) {
        operands = SmallVector<Value, 4>(loadOp.getMapOperands());
        map = loadOp.getAffineMap();
      } else if (auto storeOp = dyn_cast<mlir::AffineStoreOp>(firstUser)) {
        operands = SmallVector<Value, 4>(storeOp.getMapOperands());
        map = storeOp.getAffineMap();
      } else {
        firstUser->emitOpError("user must be an affine load/store operation");
        return signalPassFailure();
      }

      // Construct the dimension size map based on the loop trip counts.
      DenseMap<unsigned, unsigned> dimSizeMap;
      unsigned idx = 0;
      for (auto operand : operands) {
        auto loop = getForInductionVarOwner(operand);
        if (!loop) {
          firstUser->emitOpError("operand is not a loop induction variable");
          return signalPassFailure();
        }
        // TODO: We assume all loops are normalized and have constant bounds.
        if (!loop.hasConstantLowerBound() || !loop.hasConstantUpperBound() ||
            loop.getConstantLowerBound() != 0 ||
            loop.getConstantUpperBound() <= 0 || loop.getStep() != 1) {
          loop.emitOpError("loop is not normalized or has illegal bounds");
          return signalPassFailure();
        }
        dimSizeMap[idx++] = loop.getConstantUpperBound();
      }

      // Construct the local buffer shape and new memory access map.
      SmallVector<AffineExpr, 4> symbolRepls;
      for (unsigned i = 0, e = map.getNumInputs(); i < e; ++i)
        if (i >= map.getNumDims())
          symbolRepls.push_back(b.getAffineDimExpr(i));

      SmallVector<int64_t, 4> bufShape;
      SmallVector<int64_t, 4> bufOffsets;
      SmallVector<AffineExpr, 4> results;
      for (auto expr : map.getResults()) {
        // Replace symbols with dims because is seems Polygeist will make all
        // memory operation's inputs symbols.
        expr = expr.replaceSymbols(symbolRepls);

        // TODO: We assume all memory indices are in th form of `dim(n) + m`,
        // where `m` as the offset could be any constant number.
        if (auto dimExpr = expr.dyn_cast<AffineDimExpr>()) {
          bufShape.push_back(dimSizeMap[dimExpr.getPosition()]);
          bufOffsets.push_back(0);
          results.push_back(dimExpr);

        } else if (auto constExpr = expr.dyn_cast<AffineConstantExpr>()) {
          bufShape.push_back(1);
          bufOffsets.push_back(0);
          results.push_back(0);

        } else if (auto binaryExpr = expr.dyn_cast<AffineBinaryOpExpr>()) {
          if (binaryExpr.getKind() != AffineExprKind::Add ||
              binaryExpr.getLHS().getKind() != AffineExprKind::DimId ||
              binaryExpr.getRHS().getKind() != AffineExprKind::Constant) {
            firstUser->emitOpError("illegal memory access pattern");
            return signalPassFailure();
          }
          auto dimExprLHS = binaryExpr.getLHS().dyn_cast<AffineDimExpr>();
          auto constExprRHS =
              binaryExpr.getRHS().dyn_cast<AffineConstantExpr>();
          bufShape.push_back(dimSizeMap[dimExprLHS.getPosition()]);
          bufOffsets.push_back(constExprRHS.getValue());
          results.push_back(dimExprLHS);

        } else {
          firstUser->emitOpError("illegal memory access pattern");
          return signalPassFailure();
        }
      }
      auto newMap =
          AffineMap::get(map.getNumInputs(), 0, results, map.getContext());

      // Create a local buffer for the memory and a new memory copy.
      auto bufType = MemRefType::get(bufShape, argType.getElementType(),
                                     argType.getAffineMaps());
      auto buf = b.create<memref::AllocOp>(func.getLoc(), bufType);
      arg.replaceAllUsesWith(buf);
      b.create<memrefext::MemCpyOp>(func.getLoc(), memrefext::MemCpyKind::Load,
                                    b.getI64ArrayAttr(bufOffsets), arg, buf);

      // Update memory access maps.
      auto mapAttr = AffineMapAttr::get(newMap);
      bool hasStore = false;
      for (auto user : buf.getResult().getUsers()) {
        if (auto loadOp = dyn_cast<mlir::AffineLoadOp>(user)) {
          loadOp->setAttr(loadOp.getMapAttrName(), mapAttr);
        } else if (auto storeOp = dyn_cast<mlir::AffineStoreOp>(user)) {
          storeOp->setAttr(storeOp.getMapAttrName(), mapAttr);
          hasStore = true;
        }
      }

      // If there are store operations, create a copy the contents in buffer
      // back to memory in the end.
      if (hasStore) {
        auto intertPoint = b.saveInsertionPoint();
        b.setInsertionPoint(func.front().getTerminator());
        b.create<memrefext::MemCpyOp>(func.getLoc(),
                                      memrefext::MemCpyKind::Store,
                                      b.getI64ArrayAttr(bufOffsets), buf, arg);
        b.restoreInsertionPoint(intertPoint);
      }
    }
  }
}

std::unique_ptr<Pass> polyaie::createCreateDataflowPass() {
  return std::make_unique<CreateDataflow>();
}

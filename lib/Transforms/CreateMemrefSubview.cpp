//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct CreateMemrefSubview
    : public polyaie::CreateMemrefSubviewBase<CreateMemrefSubview> {
  void runOnFunction() override;
};
} // namespace

/// This pass reduces the sizes of memrefs passed to each function: (1) conduct
/// loop analysis to determine which tile of a memref is accessed in a function,
/// (2) create a corresponding SubViewOp to load the tile out from the original
/// memref and replace all uses.
void CreateMemrefSubview::runOnFunction() {
  auto func = getFunction();
  if (func->hasAttr("polyaie.top_func"))
    return;
  auto b = OpBuilder(func);
  auto loc = b.getUnknownLoc();

  for (auto arg : func.getArguments()) {
    // Get the argument type and bypass non-memref arguments.
    auto argType = arg.getType().dyn_cast<MemRefType>();
    if (!argType)
      continue;

    // We assume that after the compilation of phism, all users have the same
    // memory access pattern. Therefore, we only collect the operands and
    // affine map of the first user.
    // TODO: Make this more robust.
    auto firstUser = *arg.user_begin();
    SmallVector<Value, 4> operands;
    AffineMap map;
    if (auto loadOp = dyn_cast<mlir::AffineLoadOp>(firstUser)) {
      operands = SmallVector<Value, 4>(loadOp.getMapOperands());
      map = loadOp.getAffineMap();
    } else if (auto storeOp = dyn_cast<mlir::AffineStoreOp>(firstUser)) {
      operands = SmallVector<Value, 4>(storeOp.getMapOperands());
      map = storeOp.getAffineMap();
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
      // We assume all loops are normalized and have constant bounds.
      // TODO: Make this more flexible.
      if (!loop.hasConstantLowerBound() || !loop.hasConstantUpperBound() ||
          loop.getConstantLowerBound() != 0 ||
          loop.getConstantUpperBound() <= 0 || loop.getStep() != 1) {
        loop.emitOpError("loop is not normalized or has illegal bounds");
        return signalPassFailure();
      }
      dimSizeMap[idx++] = loop.getConstantUpperBound();
    }

    // Collect the buffer sizes, offsets, strides, and layout affine
    // expressions. Also, collect the memory access affine expressions for
    // affine load and store operations.
    SmallVector<AffineExpr, 4> symbolRepls;
    for (unsigned i = 0, e = map.getNumInputs(); i < e; ++i)
      if (i >= map.getNumDims())
        symbolRepls.push_back(b.getAffineDimExpr(i));

    SmallVector<int64_t, 4> bufSizes;
    SmallVector<int64_t, 4> bufOffsets;
    SmallVector<int64_t, 4> bufStrides;
    SmallVector<AffineExpr, 4> accessAffineExprs;
    for (auto expr : map.getResults()) {
      // Replace symbols with dims because is seems Polygeist will make all
      // memory operation's inputs symbols.
      expr = expr.replaceSymbols(symbolRepls);

      // We assume all memory indices are in th form of `dim(n) + m`, where
      // `m` as the offset could be any constant number.
      if (auto dimExpr = expr.dyn_cast<AffineDimExpr>()) {
        bufSizes.push_back(dimSizeMap[dimExpr.getPosition()]);
        bufOffsets.push_back(0);
        bufStrides.push_back(1);
        accessAffineExprs.push_back(dimExpr);

      } else if (auto constExpr = expr.dyn_cast<AffineConstantExpr>()) {
        bufSizes.push_back(1);
        bufOffsets.push_back(constExpr.getValue());
        bufStrides.push_back(1);
        accessAffineExprs.push_back(b.getAffineConstantExpr(0));

      } else if (auto binaryExpr = expr.dyn_cast<AffineBinaryOpExpr>()) {
        // TODO: Make this more flexible.
        if (binaryExpr.getKind() != AffineExprKind::Add ||
            binaryExpr.getLHS().getKind() != AffineExprKind::DimId ||
            binaryExpr.getRHS().getKind() != AffineExprKind::Constant) {
          firstUser->emitOpError("illegal memory access pattern");
          return signalPassFailure();
        }
        auto dimExprLHS = binaryExpr.getLHS().cast<AffineDimExpr>();
        auto constExprRHS = binaryExpr.getRHS().cast<AffineConstantExpr>();

        bufSizes.push_back(dimSizeMap[dimExprLHS.getPosition()]);
        bufOffsets.push_back(constExprRHS.getValue());
        bufStrides.push_back(1);
        accessAffineExprs.push_back(dimExprLHS);

      } else {
        firstUser->emitOpError("illegal memory access pattern");
        return signalPassFailure();
      }
    }

    // Construct the buffer type and create the SubViewOp.
    b.setInsertionPointToStart(&func.front());
    auto subview =
        b.create<memref::SubViewOp>(loc, arg, bufOffsets, bufSizes, bufStrides);
    arg.replaceAllUsesExcept(subview.getResult(), subview);

    // Update memory access maps of all affine load and store operations.
    auto accessAffineMap = AffineMap::get(map.getNumInputs(), 0,
                                          accessAffineExprs, map.getContext());
    for (auto user : subview.getResult().getUsers())
      if (isa<mlir::AffineLoadOp, mlir::AffineStoreOp>(user))
        user->setAttr("map", AffineMapAttr::get(accessAffineMap));
  }
}

std::unique_ptr<FunctionPass> polyaie::createCreateMemrefSubviewPass() {
  return std::make_unique<CreateMemrefSubview>();
}

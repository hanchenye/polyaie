//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Analysis/LoopAnalysis.h"
#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/Passes.h"
#include "polyaie/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct CreateDataflow : public CreateDataflowBase<CreateDataflow> {
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

      // For single-element memory, directly create a local buffer for it.
      if (argType.getRank() == 0) {
        auto buf = b.create<memref::AllocOp>(func.getLoc(), argType);
        arg.replaceAllUsesWith(buf);
        continue;
      }

      // We assume that after the compilation of phism, all users have the same
      // memory access pattern. Therefore, we only collect the induction
      // variables and affine map of the first user.
      auto firstUser = *arg.getUsers().begin();
      SmallVector<Value, 4> idvs;
      AffineMap map;
      if (auto loadOp = dyn_cast<mlir::AffineLoadOp>(firstUser)) {
        idvs = SmallVector<Value, 4>(loadOp.getMapOperands());
        map = loadOp.getAffineMap();
      } else if (auto storeOp = dyn_cast<mlir::AffineStoreOp>(firstUser)) {
        idvs = SmallVector<Value, 4>(storeOp.getMapOperands());
        map = storeOp.getAffineMap();
      } else {
        firstUser->emitOpError("user must be an affine load/store operation");
        return signalPassFailure();
      }

      // TODO: More flexible memory access pattern support.
      if (map.getNumInputs() != argType.getRank()) {
        emitError(func.getLoc(), "illegal memory access pattern");
        return signalPassFailure();
      }

      // Construct the buffer's shape vector based on the loop trip counts.
      SmallVector<int64_t, 4> bufShape;
      SmallVector<int64_t, 4> bufOffsets;
      for (auto idv : idvs) {
        auto loop = getForInductionVarOwner(idv);
        if (!loop) {
          firstUser->emitOpError("operand is not a loop induction variable");
          return signalPassFailure();
        }
        // TODO: More flexible loop pattern support.
        if (!loop.hasConstantLowerBound() || !loop.hasConstantUpperBound() ||
            loop.getStep() != 1) {
          loop.emitOpError("must have constant bounds and step of 1");
          return signalPassFailure();
        }
        bufShape.push_back(loop.getConstantUpperBound() -
                           loop.getConstantLowerBound());
        bufOffsets.push_back(loop.getConstantLowerBound());
      }

      // Replace symbols with dims because is seems Polygeist will make all
      // memory operation's inputs symbols. Also, add the offsets to the map.
      SmallVector<AffineExpr, 4> symbolRepls;
      for (unsigned i = 0, e = map.getNumInputs(); i < e; ++i)
        if (i >= map.getNumDims())
          symbolRepls.push_back(b.getAffineDimExpr(i));

      SmallVector<AffineExpr, 4> results;
      for (auto resultAndOffset : llvm::zip(map.getResults(), bufOffsets)) {
        auto result = std::get<0>(resultAndOffset).replaceSymbols(symbolRepls) -
                      std::get<1>(resultAndOffset);
        results.push_back(result);
      }
      map = AffineMap::get(map.getNumInputs(), 0, results, map.getContext());

      // Create a local buffer for the memory.
      assert(argType.getAffineMaps().empty() && "layout map is not allowed");
      auto bufType = MemRefType::get(bufShape, argType.getElementType());
      auto buf = b.create<memref::AllocOp>(func.getLoc(), bufType);
      arg.replaceAllUsesWith(buf);

      // Update memory access maps.
      auto mapAttr = AffineMapAttr::get(map);
      bool hasStore = false;
      for (auto user : buf.getResult().getUsers()) {
        if (auto loadOp = dyn_cast<mlir::AffineLoadOp>(user)) {
          loadOp->setAttr(loadOp.getMapAttrName(), mapAttr);
        } else if (auto storeOp = dyn_cast<mlir::AffineStoreOp>(user)) {
          storeOp->setAttr(storeOp.getMapAttrName(), mapAttr);
          hasStore = true;
        }
      }
    }
    // Working here...
  }
}

std::unique_ptr<Pass> polyaie::createCreateDataflowPass() {
  return std::make_unique<CreateDataflow>();
}

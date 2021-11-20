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

/// Inference the buffer offsets from the input `type`.
static SmallVector<int64_t, 4> getBufferOffsets(MemRefType type) {
  auto affineMaps = type.getAffineMaps();
  if (affineMaps.empty())
    return SmallVector<int64_t, 4>(type.getRank(), 0);

  SmallVector<int64_t, 4> offsets;
  for (auto expr : affineMaps.back().getResults()) {
    // If the expression is a dimension value, the offset is 0.
    if (expr.getKind() == AffineExprKind::DimId) {
      offsets.push_back(0);
      continue;
    }

    // If the expression is a binary add, the offset is the constant operator.
    if (expr.getKind() == AffineExprKind::Add) {
      auto addExpr = expr.cast<AffineBinaryOpExpr>();
      if (addExpr.getLHS().getKind() == AffineExprKind::DimId)
        if (auto constExpr = addExpr.getRHS().dyn_cast<AffineConstantExpr>()) {
          offsets.push_back(constExpr.getValue());
          continue;
        }
    }

    // Otherwise, the memref type is illegal.
    offsets.push_back(-1);
  }
  return offsets;
}

namespace {
/// This is a class used to maintain a list of buffers with different types.
class BufferList {
public:
  Value getBuffer(Type type) const {
    auto existBufPtr =
        llvm::find_if(impl, [&](Value v) { return v.getType() == type; });
    return existBufPtr != impl.end() ? *existBufPtr : nullptr;
  }

  void updateBuffer(Value newBuf) {
    auto oldBufPtr = llvm::find_if(
        impl, [&](Value v) { return v.getType() == newBuf.getType(); });
    if (oldBufPtr != impl.end())
      impl[oldBufPtr - impl.begin()] = newBuf;
    else
      impl.push_back(newBuf);
  }

private:
  SmallVector<Value, 32> impl;
};
} // namespace

void CreateDataflow::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  // This loop first reduces the sizes of memrefs passed to each function: (1)
  // conduct loop analysis to determine which tile of a memref is accessed in a
  // function, (2) create a corresponding LoadBufferOp to load the tile out from
  // the original memref, and (3) pass the loaded buffer to the function. Also,
  // if a function stores data to a buffer, we (1) return the buffer as the
  // result of the function and (2) create a corresponding StoreBufferOp to
  // store the tile in the buffer back to the original memref.
  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());

    SmallVector<Type, 8> inputTypes;
    SmallVector<Value, 2> resultBufs;
    SmallVector<Value, 2> resultMems;
    for (auto arg : func.getArguments()) {
      // Get the type of the current argument.
      auto argType = arg.getType().dyn_cast<MemRefType>();
      if (!argType) {
        emitError(func.getLoc(), "function must be fully bufferized");
        return signalPassFailure();
      }
      auto mem = call.getOperand(arg.getArgNumber());

      // Create a LoadBufferOp with the same type to buffer any single-element
      // memory. We assume single-element memory will never be updated.
      if (argType.getRank() == 0) {
        b.setInsertionPoint(call);
        auto buf = b.create<memrefext::LoadBufferOp>(
            b.getUnknownLoc(), argType, b.getI64ArrayAttr({0}),
            b.getI64ArrayAttr({1}), mem);
        call.setOperand(arg.getArgNumber(), buf);
        inputTypes.push_back(argType);
        continue;
      }

      // We assume that after the compilation of phism, all users have the same
      // memory access pattern. Therefore, we only collect the operands and
      // affine map of the first user.
      // TODO: Make this more robust.
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

      // Collect the buffer lengths, offsets, and layout affine expressions.
      // Also, collect the memory access affine expressions for affine load and
      // store operations.
      SmallVector<AffineExpr, 4> symbolRepls;
      for (unsigned i = 0, e = map.getNumInputs(); i < e; ++i)
        if (i >= map.getNumDims())
          symbolRepls.push_back(b.getAffineDimExpr(i));

      SmallVector<int64_t, 4> bufLengths;
      SmallVector<int64_t, 4> bufOffsets;
      SmallVector<AffineExpr, 4> bufAffineExprs;
      SmallVector<AffineExpr, 4> accessAffineExprs;
      unsigned position = 0;
      for (auto expr : map.getResults()) {
        // Replace symbols with dims because is seems Polygeist will make all
        // memory operation's inputs symbols.
        expr = expr.replaceSymbols(symbolRepls);

        // We assume all memory indices are in th form of `dim(n) + m`, where
        // `m` as the offset could be any constant number.
        if (auto dimExpr = expr.dyn_cast<AffineDimExpr>()) {
          bufLengths.push_back(dimSizeMap[dimExpr.getPosition()]);
          bufOffsets.push_back(0);
          bufAffineExprs.push_back(b.getAffineDimExpr(position++));
          accessAffineExprs.push_back(dimExpr);

        } else if (auto constExpr = expr.dyn_cast<AffineConstantExpr>()) {
          bufLengths.push_back(1);
          bufOffsets.push_back(constExpr.getValue());
          bufAffineExprs.push_back(b.getAffineDimExpr(position++) +
                                   constExpr.getValue());
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

          bufLengths.push_back(dimSizeMap[dimExprLHS.getPosition()]);
          bufOffsets.push_back(constExprRHS.getValue());
          bufAffineExprs.push_back(b.getAffineDimExpr(position++) +
                                   constExprRHS.getValue());
          accessAffineExprs.push_back(dimExprLHS);

        } else {
          firstUser->emitOpError("illegal memory access pattern");
          return signalPassFailure();
        }
      }

      // Construct the buffer type and create the LoadBufferOp.
      // TODO: Support memrefs with layout map? How?
      if (!argType.getAffineMaps().empty()) {
        call.emitOpError("memory isn't expected to have layout map");
        return signalPassFailure();
      }
      auto bufAffineMap = AffineMap::get(map.getNumResults(), 0, bufAffineExprs,
                                         map.getContext());
      auto bufType =
          MemRefType::get(bufLengths, argType.getElementType(), {bufAffineMap});
      auto bufOffsetsAttr = b.getI64ArrayAttr(bufOffsets);
      auto bufLengthsAttr = b.getI64ArrayAttr(bufLengths);

      b.setInsertionPoint(call);
      auto buf = b.create<memrefext::LoadBufferOp>(
          b.getUnknownLoc(), bufType, bufOffsetsAttr, bufLengthsAttr, mem);
      call.setOperand(arg.getArgNumber(), buf);
      inputTypes.push_back(bufType);
      // `arg` is now representing the internal buffer.
      arg.setType(bufType);

      // Update memory access maps of all affine load and store operations.
      auto accessAffineMap = AffineMap::get(
          map.getNumInputs(), 0, accessAffineExprs, map.getContext());
      auto accessMapAttr = AffineMapAttr::get(accessAffineMap);
      bool hasStore = false;
      for (auto user : arg.getUsers()) {
        if (auto loadOp = dyn_cast<mlir::AffineLoadOp>(user)) {
          loadOp->setAttr(loadOp.getMapAttrName(), accessMapAttr);
        } else if (auto storeOp = dyn_cast<mlir::AffineStoreOp>(user)) {
          storeOp->setAttr(storeOp.getMapAttrName(), accessMapAttr);
          hasStore = true;
        }
      }

      // We need to return the local buffer if it is updated.
      if (hasStore) {
        resultBufs.push_back(arg);
        resultMems.push_back(mem);
      }
    }

    // Update callee function type.
    SmallVector<Type, 2> resultTypes;
    for (auto result : resultBufs)
      resultTypes.push_back(result.getType());
    func.setType(b.getFunctionType(inputTypes, resultTypes));

    // Update return operation.
    auto returnOp = cast<ReturnOp>(func.front().getTerminator());
    b.setInsertionPoint(returnOp);
    b.create<ReturnOp>(returnOp.getLoc(), resultBufs);
    returnOp.erase();

    // Update call operation with new operands and results.
    b.setInsertionPoint(call);
    auto newCall = b.create<CallOp>(call.getLoc(), func, call.getOperands());
    call.erase();

    // If there are store operations, create a StoreBufferOp to store buffer
    // back to memory after the function call.
    b.setInsertionPointAfter(newCall);
    for (auto zip : llvm::zip(newCall.getResults(), resultMems)) {
      auto bufType = std::get<0>(zip).getType().cast<MemRefType>();
      b.create<memrefext::StoreBufferOp>(
          b.getUnknownLoc(), b.getI64ArrayAttr(getBufferOffsets(bufType)),
          b.getI64ArrayAttr(bufType.getShape()), std::get<1>(zip),
          std::get<0>(zip));
    }
  }

  // Construct a map from memory to its buffer list.
  DenseMap<Value, BufferList> bufListMap;
  for (auto alloc : mod.getOps<memref::AllocOp>())
    bufListMap[alloc.getResult()] = BufferList();

  // Create dataflow between function calls.
  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    for (auto buf : call.getOperands()) {
      auto loadOp = buf.getDefiningOp<memrefext::LoadBufferOp>();
      auto &bufList = bufListMap[loadOp.memory()];

      // Find the result buffer whether it exists.
      auto resultBuf = llvm::find_if(call.getResults(), [&](OpResult r) {
        auto storeOp = cast<memrefext::StoreBufferOp>(*r.getUsers().begin());
        return r.getType() == buf.getType() &&
               storeOp.memory() == loadOp.memory();
      });

      // Query the buffer list to check whether there is a buffer with the same
      // type existing. If so, replace the buffer generated by LoadBufferOp with
      // the exist buffer and erase the LoadBufferOp.
      if (auto existBuf = bufList.getBuffer(buf.getType())) {
        loadOp.replaceAllUsesWith(existBuf);
        loadOp.erase();
      }

      // Update the buffer list with the current buffer if applicable.
      if (resultBuf != call.getResults().end())
        bufList.updateBuffer(*resultBuf);
    }
  }

  // As long as the buffer is used by operations other than a StoreBufferOp, the
  // StoreBufferOp can be identified as redundant.
  for (auto storeOp :
       llvm::make_early_inc_range(mod.getOps<memrefext::StoreBufferOp>())) {
    if (!llvm::hasSingleElement(storeOp.buffer().getUsers()))
      storeOp.erase();
  }
}

std::unique_ptr<Pass> polyaie::createCreateDataflowPass() {
  return std::make_unique<CreateDataflow>();
}

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

namespace {
class MemorySegment {
public:
  MemorySegment(const Value memory, const Value segment,
                const ArrayRef<int64_t> offsetsRef)
      : memory(memory), segment(segment) {
    for (auto zip : llvm::zip(offsetsRef, getShape(),
                              memory.getType().cast<MemRefType>().getShape())) {
      auto offset = std::get<0>(zip);
      auto length = std::get<1>(zip);
      auto size = std::get<2>(zip);
      assert(offset >= 0 && length > 0 & offset + length <= size &&
             "illegal memory segment definition");
    }
    offsets.append(offsetsRef.begin(), offsetsRef.end());
  }

  MemorySegment(const MemorySegment &RHS) { operator=(RHS); }

  MemorySegment &operator=(const MemorySegment &RHS) {
    this->memory = RHS.memory;
    this->segment = RHS.segment;
    this->offsets = RHS.offsets;
    return *this;
  }

  bool operator==(const MemorySegment &RHS) const {
    return this->memory == RHS.memory && this->offsets == RHS.offsets &&
           this->getType() == RHS.getType();
  }
  bool operator!=(const MemorySegment &RHS) const { return !(*this == RHS); }

  Value getMemory() const { return memory; }
  Value getSegment() const { return segment; }
  ArrayRef<int64_t> getOffsets() const { return offsets; }

  MemRefType getType() const { return segment.getType().cast<MemRefType>(); }
  ArrayRef<int64_t> getShape() const { return getType().getShape(); }

private:
  Value memory;
  Value segment;
  SmallVector<int64_t, 4> offsets;
};

static bool haveNoIntersection(const MemorySegment &LHS,
                               const MemorySegment &RHS) {
  auto compare =
      [&](std::tuple<const int64_t &, const int64_t &, const int64_t &> zip) {
        return std::get<0>(zip) >= std::get<1>(zip) + std::get<2>(zip);
      };
  return llvm::any_of(
             llvm::zip(LHS.getOffsets(), RHS.getOffsets(), RHS.getShape()),
             compare) ||
         llvm::any_of(
             llvm::zip(RHS.getOffsets(), LHS.getOffsets(), LHS.getShape()),
             compare);
}

class MemorySegmentList {
public:
  MemorySegmentList(Value memory = nullptr) : memory(memory) {}

  bool isEmpty() const { return segments.empty(); }

  Optional<MemorySegment> getSegment(const MemorySegment &segment) const {
    assert(memory == segment.getMemory());
    auto result = llvm::find(segments, segment);
    return result != segments.end() ? *result : Optional<MemorySegment>();
  }

  bool updateSegment(const MemorySegment &segment) {
    if (getSegment(segment).hasValue())
      return llvm::find(segments, segment)->operator=(segment), true;
    else if (llvm::all_of(segments, [&](MemorySegment &RHS) {
               return haveNoIntersection(segment, RHS);
             }))
      return segments.push_back(segment), true;
    return false;
  }

  // private:
  Value memory;
  SmallVector<MemorySegment, 8> segments;
};
} // namespace

void CreateDataflow::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  // Create local buffers and memory copies for each function.
  for (auto func : mod.getOps<FuncOp>()) {
    b.setInsertionPointToStart(&func.front());
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
      if (argType.getRank() == 0 ||
          (argType.getRank() == 1 && argType.getDimSize(0) == 1)) {
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

  // Construct a map from memory to its segment list.
  DenseMap<Value, MemorySegmentList> segListMap;
  for (auto alloc : mod.getOps<memref::AllocOp>())
    segListMap[alloc.getResult()] = MemorySegmentList(alloc.getResult());

  // Create dataflow between calls.
  for (auto call : llvm::make_early_inc_range(mod.getOps<CallOp>())) {
    auto callee = mod.lookupSymbol<FuncOp>(call.callee());

    SmallVector<Type, 8> newInputTypes;
    SmallVector<Type, 2> newResultTypes;
    SmallVector<Value, 8> newReturnOperands;
    SmallVector<MemorySegment, 2> segsToUpdate;
    unsigned idx = 0;
    for (auto mem : call.getOperands()) {
      auto const &segList = segListMap[mem];

      auto memref = callee.getArgument(idx);
      auto loadOp = memrefext::MemCpyOp();
      auto storeOp = memrefext::MemCpyOp();
      for (auto user : memref.getUsers()) {
        auto memcpyOp = dyn_cast<memrefext::MemCpyOp>(user);
        if (!memcpyOp) {
          user->emitOpError("user must be memory copy operation");
          return signalPassFailure();
        }
        if (memcpyOp.kind() == memrefext::MemCpyKind::Load)
          loadOp = memcpyOp;
        else
          storeOp = memcpyOp;
      }

      auto buf = loadOp.getLocalBuffer();
      SmallVector<int64_t, 4> offsets(
          llvm::map_range(loadOp.offsets(), [&](Attribute attr) {
            return attr.dyn_cast<IntegerAttr>().getInt();
          }));
      auto optSeg = segList.getSegment(MemorySegment(mem, buf, offsets));

      // If the segment exists in the memory segment list, that means we need to
      // update the input to the segment memref.
      if (optSeg.hasValue()) {
        auto seg = optSeg.getValue();
        call.setOperand(idx, seg.getSegment());
        memref.setType(seg.getType());
        newInputTypes.push_back(seg.getType());

        SmallVector<int64_t, 4> newOffsets(offsets.size(), 0);
        loadOp->setAttr("offsets", b.getI64ArrayAttr(newOffsets));
      } else {
        newInputTypes.push_back(memref.getType());
      }

      // If there is store operation, return the local buffer as output and
      // update the memory segment list.
      if (storeOp) {
        newResultTypes.push_back(buf.getType());
        newReturnOperands.push_back(buf);
        segsToUpdate.push_back(MemorySegment(mem, buf, offsets));
        storeOp.erase();
      }
      ++idx;
    }

    // Update callee function type.
    callee.setType(b.getFunctionType(newInputTypes, newResultTypes));

    // Update return operation.
    auto returnOp = dyn_cast<ReturnOp>(callee.front().getTerminator());
    b.setInsertionPoint(returnOp);
    b.create<ReturnOp>(returnOp.getLoc(), newReturnOperands);
    returnOp.erase();

    // Update call operation.
    b.setInsertionPoint(call);
    auto newCall = b.create<CallOp>(call.getLoc(), callee, call.getOperands());
    call.erase();

    // Update memory segment list.
    for (auto resultAndSeg : llvm::zip(newCall.getResults(), segsToUpdate)) {
      auto seg = std::get<1>(resultAndSeg);
      auto &segList = segListMap[seg.getMemory()];
      if (!segList.updateSegment(MemorySegment(
              seg.getMemory(), std::get<0>(resultAndSeg), seg.getOffsets()))) {
        newCall.emitOpError("failed to update segment list");
        return signalPassFailure();
      }
    }
  }
}

std::unique_ptr<Pass> polyaie::createCreateDataflowPass() {
  return std::make_unique<CreateDataflow>();
}

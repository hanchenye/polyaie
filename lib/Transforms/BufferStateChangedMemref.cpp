//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct BufferStateChangedMemref
    : public polyaie::BufferStateChangedMemrefBase<BufferStateChangedMemref> {
  void runOnOperation() override;
};
} // namespace

void BufferStateChangedMemref::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc(mod);

  for (auto call : topFunc.getOps<CallOp>()) {
    auto func = mod.lookupSymbol<FuncOp>(call.callee());
    auto returnOp = func.front().getTerminator();

    // Figure out all arguments that need to be buffered.
    for (auto result : call.getResults()) {
      // Get the result type and bypass non-memory results.
      auto arg = returnOp->getOperand(result.getResultNumber())
                     .dyn_cast<BlockArgument>();
      auto resultType = result.getType().dyn_cast<MemRefType>();
      if (!arg || !resultType)
        continue;

      // Return it if the argument is used by any state-changing operations.
      if (llvm::any_of(arg.getUsers(), [&](Operation *op) {
            return isa<mlir::AffineWriteOpInterface, memref::StoreOp,
                       memref::TensorStoreOp, vector::TransferWriteOp>(op);
          })) {
        // Create a local buffer for each state-changed memref argument and
        // replace all its uses.
        // FIXME: The alloc generated here shouldn't have layout information?
        b.setInsertionPointToStart(&func.front());
        auto buf = b.create<memref::AllocOp>(loc, resultType);
        arg.replaceAllUsesWith(buf);

        // Set insertion point to the ancestor of the first user.
        auto firstUser = *buf->getUsers().begin();
        b.setInsertionPoint(func.front().findAncestorOpInBlock(*firstUser));

        // Create nested loop to copy data to local buffer.
        SmallVector<Value, 4> ivs;
        for (auto dimSize : resultType.getShape()) {
          auto loop = b.create<mlir::AffineForOp>(loc, 0, dimSize);
          b.setInsertionPointToStart(loop.getBody());
          ivs.push_back(loop.getInductionVar());
        }

        // Create affine load/store operations.
        auto value = b.create<mlir::AffineLoadOp>(loc, arg, ivs);
        b.create<mlir::AffineStoreOp>(loc, value, buf, ivs);

        // Create a memref copy operation to copy data from local buffer.
        auto memory = call.getOperand(arg.getArgNumber());
        b.setInsertionPointAfter(call);
        b.create<memref::CopyOp>(loc, result, memory);
      }
    }
  }

  // As we have extracted memref dependencies, we can safely remove redundant
  // copy operations now.
  SmallVector<memref::CopyOp, 16> latestCopies;
  for (auto copy :
       llvm::make_early_inc_range(topFunc.getOps<memref::CopyOp>())) {
    auto latestCopy = llvm::find_if(latestCopies, [&](memref::CopyOp op) {
      return op.target() == copy.target() &&
             op.source().getType() == copy.source().getType();
    });

    if (latestCopy != latestCopies.end()) {
      latestCopy->erase();
      latestCopies[latestCopy - latestCopies.begin()] = copy;
    } else
      latestCopies.push_back(copy);
  }
}

std::unique_ptr<Pass> polyaie::createBufferStateChangedMemrefPass() {
  return std::make_unique<BufferStateChangedMemref>();
}

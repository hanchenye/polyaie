//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/Affine/Passes.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/Passes.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct ConvertToAIE : public polyaie::ConvertToAIEBase<ConvertToAIE> {
  void runOnOperation() override;
};
} // namespace

void ConvertToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  // Map all function calls to an AIE tile.
  b.setInsertionPointToStart(mod.getBody());
  DenseMap<Operation *, xilinx::AIE::TileOp> tileMap;
  unsigned tileIdx = 0;
  auto lastTile = xilinx::AIE::TileOp();

  mod.walk([&](CallOp call) {
    // TODO: Placement algorithm. How to leverage the dependency?
    // Place all PEs in a Z-style.
    auto row = tileIdx / 4 + 2;
    auto col = (row % 2 ? tileIdx % 4 : 3 - tileIdx % 4);

    auto tile = b.create<xilinx::AIE::TileOp>(call.getLoc(), col, row);
    call->setAttr("aie.x", b.getIndexAttr(col));
    call->setAttr("aie.y", b.getIndexAttr(row));

    tileMap[call] = tile;
    lastTile = tile;
    ++tileIdx;
  });

  // TODO: How to allocate buffers in a more fine-grained way based on the
  // actual accessed address?
  // Allocate memory for each AIE tile.
  SmallVector<memref::AllocOp, 16> allocs;
  mod.walk([&](memref::AllocOp alloc) { allocs.push_back(alloc); });

  unsigned allocIdx = 0;
  for (auto alloc : allocs) {
    auto type = alloc.getType();
    auto length = type.getNumElements();

    // Create a new logical token for each allocated memref.
    b.setInsertionPointToStart(mod.getBody());
    auto token = b.create<xilinx::AIE::TokenOp>(alloc.getLoc(), 0);
    auto tokenName = "token" + std::to_string(allocIdx);
    token->setAttr("sym_name", b.getStringAttr(tokenName));

    // Traverse the users of the memref.
    unsigned tokenIdx = 0;
    unsigned userIdx = 0;
    auto memref = alloc.getResult();
    auto tile = xilinx::AIE::TileOp();

    for (auto &use : llvm::make_early_inc_range(alloc.getResult().getUses())) {
      // In our case, the user must be a call operation.
      auto call = dyn_cast<CallOp>(use.getOwner());
      if (!call) {
        use.getOwner()->emitOpError("memory user must be call operation");
        signalPassFailure();
        return;
      }
      auto callee = mod.lookupSymbol<FuncOp>(call.callee());

      auto currentTile = tileMap[call];
      if (userIdx > 0) {
        // Allocate a new memref for each use.
        b.setInsertionPoint(call);
        auto currentMemref = b.create<memref::AllocOp>(call.getLoc(), type);
        use.set(currentMemref);

        // We always directly DMA scalar values to the user AIE. Therefore,
        // scalars don't need to be passed between AIEs.
        if (length > 1) {
          auto rowDistance = std::abs((int64_t)tile.row() - currentTile.row());
          auto colDistance = std::abs((int64_t)tile.col() - currentTile.col());
          if (rowDistance + colDistance > 1) {
            b.create<xilinx::AIE::MemcpyOp>(
                call.getLoc(), tokenName, tokenIdx++, tokenIdx, tile, memref, 0,
                length, currentTile, currentMemref, 0, length);
          } else {
            // TODO: This is a small hack, which is definitely not correct...
            b.create<xilinx::AIE::MemcpyOp>(
                call.getLoc(), tokenName, tokenIdx, tokenIdx, tile, memref, 0,
                length, currentTile, currentMemref, 0, length);
          }
        }
        memref = currentMemref;
      }
      tile = currentTile;

      // Acquire and release tokens in the sub-function.
      if (length > 1) {
        b.setInsertionPointToStart(&callee.front());
        b.create<xilinx::AIE::UseTokenOp>(call.getLoc(), tokenName, tokenIdx++,
                                          xilinx::AIE::LockAction::Acquire);
        b.setInsertionPoint(callee.front().getTerminator());
        b.create<xilinx::AIE::UseTokenOp>(call.getLoc(), tokenName, tokenIdx,
                                          xilinx::AIE::LockAction::Release);
      }
      ++userIdx;
    }
    ++allocIdx;
  }

  // Lower logical AIE IR to physical IR.
  PassManager pm(mod.getContext(), "module");
  pm.addPass(xilinx::AIE::createAIECreateCoresPass());
  pm.addPass(xilinx::AIE::createAIEAssignBufferAddressesPass());
  pm.addPass(xilinx::AIE::createAIELowerMemcpyPass());
  pm.addPass(xilinx::AIE::createAIEPathfinderPass());
  pm.addPass(xilinx::AIE::createAIECreateLocksPass());
  pm.addPass(mlir::createCanonicalizerPass());
  if (failed(pm.run(mod))) {
    emitError(mod.getLoc(), "failed to implement on AIE array");
    signalPassFailure();
    return;
  }

  // Name all generated buffers.
  // TODO: How to mark buffers that need to be initialized?
  unsigned bufferIdx = 0;
  mod.walk([&](xilinx::AIE::BufferOp buffer) {
    auto bufferName = "buffer" + std::to_string(bufferIdx);
    buffer->setAttr("sym_name", b.getStringAttr(bufferName));
    ++bufferIdx;
  });

  // Localize constants.
  SmallVector<mlir::ConstantOp, 4> constants;
  mod.walk([&](mlir::ConstantOp constant) { constants.push_back(constant); });
  for (auto constant : constants) {
    for (auto &use : llvm::make_early_inc_range(constant->getUses())) {
      b.setInsertionPoint(use.getOwner());
      auto localConstant = dyn_cast<mlir::ConstantOp>(b.clone(*constant));
      use.set(localConstant.getResult());
    }
    constant.erase();
  }

  // Remove all wire, token, plio, and unused function ops.
  mod.walk([&](Operation *op) {
    if (isa<xilinx::AIE::TokenOp, xilinx::AIE::WireOp, xilinx::AIE::PLIOOp,
            xilinx::AIE::ShimMuxOp, FuncOp>(op)) {
      op->dropAllUses();
      op->dropAllReferences();
      op->erase();
    }
  });

  // Create a lock use in the last tile to indicate the completion of the
  // program.
  // TODO: Make this more rebust.
  auto lastCore = lastTile.getCoreOp();
  b.setInsertionPointAfter(lastTile);
  auto finalLock =
      b.create<xilinx::AIE::LockOp>(lastTile.getLoc(), lastTile, 15);
  b.setInsertionPoint(lastCore.getRegion().front().getTerminator());
  b.create<xilinx::AIE::UseLockOp>(lastTile.getLoc(), finalLock, 1,
                                   xilinx::AIE::LockAction::Release, 0);
}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}

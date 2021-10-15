//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Pass/PassManager.h"
#include "polyaie/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
struct ConvertToAIE : public ConvertToAIEBase<ConvertToAIE> {
  void runOnOperation() override;
};
} // namespace

static LogicalResult inlineTopFunc(ModuleOp mod) {
  for (auto func : mod.getOps<FuncOp>()) {
    if (func->getAttrOfType<UnitAttr>("scop.top_function")) {
      // Create alloc for all arguments of the top function.
      auto b = OpBuilder(mod);
      b.setInsertionPointToEnd(mod.getBody());
      for (auto arg : func.getArguments()) {
        auto type = arg.getType().dyn_cast<MemRefType>();
        if (!type)
          return emitError(func.getLoc(),
                           "top function isn't fully bufferized");
        auto memref = b.create<memref::AllocOp>(func.getLoc(), type);
        arg.replaceAllUsesWith(memref);
      }

      // Inline the top function into the module.
      auto &modOps = mod.getBody()->getOperations();
      auto &funcOps = func.front().getOperations();
      modOps.splice(modOps.end(), funcOps, funcOps.begin(),
                    std::prev(funcOps.end()));
      func.erase();

      return success();
    }
  }

  return emitError(mod.getLoc(), "failed to find top function");
}

void ConvertToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  // Inline top function into the module.
  if (failed(inlineTopFunc(mod))) {
    signalPassFailure();
    return;
  }

  // Map all function calls to an AIE tile.
  b.setInsertionPointToStart(mod.getBody());
  DenseMap<Operation *, xilinx::AIE::TileOp> tileMap;
  unsigned tileIdx = 0;

  mod.walk([&](CallOp call) {
    // TODO: Placement algorithm. How to leverage the dependency?
    // Place all PEs in a Z-style.
    auto row = tileIdx / 16 + 1;
    auto col = (row % 2 ? tileIdx % 16 : 15 - tileIdx % 16) + 1;

    auto tile = b.create<xilinx::AIE::TileOp>(call.getLoc(), col, row);
    call->setAttr("aie.x", b.getIndexAttr(col));
    call->setAttr("aie.y", b.getIndexAttr(row));

    tileMap[call] = tile;
    ++tileIdx;
  });

  // TODO: How to allocate buffers in a more fine-grained way based on the
  // actual accessed address?
  // Allocate memory for each AIE tile.
  SmallVector<memref::AllocOp, 16> allocs;
  mod.walk([&](memref::AllocOp alloc) { allocs.push_back(alloc); });

  unsigned allocIdx = 0;
  for (auto alloc : allocs) {
    // Create a new logical token for each allocated memref.
    b.setInsertionPointToStart(mod.getBody());
    auto token = b.create<xilinx::AIE::TokenOp>(alloc.getLoc(), 0);
    auto tokenName = "token" + std::to_string(allocIdx);
    token->setAttr("sym_name", b.getStringAttr(tokenName));
    auto type = alloc.getType();
    auto length = type.getNumElements();

    // Traverse the users of the memref.
    unsigned tokenIdx = 0;
    auto memref = alloc.getResult();
    auto tile = xilinx::AIE::TileOp();
    SmallVector<std::tuple<Operation *, unsigned, Value>, 16> replaceMap;

    for (auto &use : alloc.getResult().getUses()) {
      // In our case, the user must be a call operation.
      auto call = dyn_cast<CallOp>(use.getOwner());
      if (!call) {
        signalPassFailure();
        return;
      }

      // Allocate a new memref if the destination and source are not adjacent
      // AIE and copy the data from the current memref into the new memref.
      auto currentTile = tileMap[call];
      if (tokenIdx > 0) {
        auto rowDistance = std::abs((int64_t)tile.row() - currentTile.row());
        auto colDistance = std::abs((int64_t)tile.col() - currentTile.col());

        if (rowDistance + colDistance > 1) {
          b.setInsertionPoint(call);
          auto currentMemref = b.create<memref::AllocOp>(call.getLoc(), type);
          b.create<xilinx::AIE::MemcpyOp>(
              call.getLoc(), tokenName, tokenIdx++, tokenIdx, tile, memref, 0,
              length, currentTile, currentMemref, 0, length);
          memref = currentMemref;
        }
      }
      tile = currentTile;

      // Acquire and release tokens in each sub-function.
      auto callee = mod.lookupSymbol<FuncOp>(call.callee());
      b.setInsertionPointToStart(&callee.front());
      b.create<xilinx::AIE::UseTokenOp>(call.getLoc(), tokenName, tokenIdx++,
                                        xilinx::AIE::LockAction::Acquire);
      b.setInsertionPoint(callee.front().getTerminator());
      b.create<xilinx::AIE::UseTokenOp>(call.getLoc(), tokenName, tokenIdx,
                                        xilinx::AIE::LockAction::Release);

      replaceMap.push_back({use.getOwner(), use.getOperandNumber(), memref});
    }

    // Replace each use of the original memref with new memrefs if required.
    llvm::for_each(replaceMap, [&](auto t) {
      std::get<0>(t)->setOperand(std::get<1>(t), std::get<2>(t));
    });
    ++allocIdx;
  }

  // Lower logical AIE IR to physical IR.
  PassManager pm(mod.getContext(), "module");
  pm.addPass(xilinx::AIE::createAIECreateCoresPass());
  pm.addPass(xilinx::AIE::createAIEAssignBufferAddressesPass());
  if (failed(pm.run(mod))) {
    signalPassFailure();
    return;
  }

  // Remove all used functions.
  mod.walk([&](FuncOp func) { func.erase(); });
}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}

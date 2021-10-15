//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

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
    auto col = tileIdx / 16 + 1;
    auto row = tileIdx % 16 + 1;

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
    unsigned userIdx = 0;
    auto memref = alloc.getResult();
    auto tile = xilinx::AIE::TileOp();

    for (auto user : alloc.getResult().getUsers()) {
      // In our case, the user must be a call operation.
      auto call = dyn_cast<CallOp>(user);
      if (!call) {
        signalPassFailure();
        return;
      }

      // Acquire and release tokens in each sub-function.
      // Working here...
      auto callee = mod.lookupSymbol<FuncOp>(call.callee());
      b.setInsertionPointToStart(&callee.front());
      b.create<xilinx::AIE::UseTokenOp>(call.getLoc(), tokenName, userIdx * 2,
                                        xilinx::AIE::LockAction::Acquire);
      b.setInsertionPoint(callee.front().getTerminator());
      b.create<xilinx::AIE::UseTokenOp>(call.getLoc(), tokenName,
                                        userIdx * 2 + 1,
                                        xilinx::AIE::LockAction::Release);

      // Allocate a new memref for all users except the first one and copy the
      // data from the current memref into the new memref.
      if (userIdx > 0) {
        b.setInsertionPoint(user);
        auto currentMemref = b.create<memref::AllocOp>(user->getLoc(), type);
        auto currentTile = tileMap[call];
        auto memcpy = b.create<xilinx::AIE::MemcpyOp>(
            user->getLoc(), tokenName, userIdx * 2 - 1, userIdx * 2, tile,
            memref, 0, length, currentTile, currentMemref, 0, length);

        memref = currentMemref;
      }
      tile = tileMap[call];
      ++userIdx;
    }
    ++allocIdx;
  }
}

std::unique_ptr<Pass> polyaie::createConvertToAIEPass() {
  return std::make_unique<ConvertToAIE>();
}

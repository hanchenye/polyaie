//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/IR/Dominance.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

using ValuesMap = DenseMap<Value, SmallVector<Value, 32>>;

namespace {
struct InsertIOFunc : public polyaie::InsertIOFuncBase<InsertIOFunc> {
  const unsigned maxGroupNumBytes = 16000;

  std::vector<SmallVector<Value, 8>> groups;
  unsigned groupNumBytes = 0;
  unsigned groupIdx = 0;

  // A helper to construct value groups.
  void insertIntoGroups(Value value) {
    auto type = value.getType().cast<MemRefType>();
    auto numBytes = type.getElementTypeBitWidth() * type.getNumElements() / 8;
    if (groupNumBytes + numBytes > maxGroupNumBytes || groups.empty()) {
      groups.emplace_back();
      groupNumBytes = 0;
    }
    groups.back().push_back(value);
    groupNumBytes += numBytes;
  }

  // A helper to create new function and call.
  void createEmptyFunc(bool isCopy) {
    auto mod = getOperation();
    auto b = OpBuilder(mod);
    auto loc = b.getUnknownLoc();

    for (auto &group : groups) {
      auto types = SmallVector<Type, 32>(
          llvm::map_range(group, [](Value v) { return v.getType(); }));
      auto funcName = "copy_group" + std::to_string(groupIdx++);
      auto funcType = b.getFunctionType(types, types);

      b.setInsertionPointToStart(mod.getBody());
      auto func = b.create<FuncOp>(loc, funcName, funcType);
      auto entryBlock = &func.body().emplaceBlock();
      entryBlock->addArguments(types);
      b.setInsertionPointToEnd(entryBlock);
      b.create<mlir::ReturnOp>(loc, entryBlock->getArguments());

      b.setInsertionPointAfterValue(group.back());
      auto call = b.create<mlir::CallOp>(loc, func, group);

      auto shouldReplace = [&](OpOperand &use) {
        if (isCopy)
          return isa<memref::CopyOp>(use.getOwner());
        return isa<CallOp>(use.getOwner()) && use.getOwner() != call;
      };
      for (auto zip : llvm::zip(group, call.getResults()))
        std::get<0>(zip).replaceUsesWithIf(std::get<1>(zip), shouldReplace);

      auto DT = DominanceInfo(mod);
      for (auto user : call->getUsers())
        if (!DT.dominates(call, user))
          user->moveAfter(call);
    }
  }

  void runOnOperation() override {
    auto topFunc = getTopFunc<FuncOp>(getOperation());

    // Handle inputs.
    groups.clear();
    groupNumBytes = 0;
    for (auto subview : topFunc.getOps<memref::SubViewOp>())
      insertIntoGroups(subview.result());
    createEmptyFunc(/*isCopy=*/false);

    // Handle outputs.
    groups.clear();
    groupNumBytes = 0;
    for (auto copy : topFunc.getOps<memref::CopyOp>())
      insertIntoGroups(copy.source());
    createEmptyFunc(/*isCopy=*/true);
  }
};
} // namespace

std::unique_ptr<Pass> polyaie::createInsertIOFuncPass() {
  return std::make_unique<InsertIOFunc>();
}

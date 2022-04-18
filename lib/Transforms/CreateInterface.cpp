//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct CreateInterface : public polyaie::CreateInterfaceBase<CreateInterface> {
  void runOnOperation() override;
};
} // namespace

void CreateInterface::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc<dataflow::FuncOp>(mod);

  /// A map from column to all associated IOs.
  llvm::SmallDenseMap<unsigned, SmallVector<Operation *, 4>> ioMap;

  for (auto &op : topFunc.getOps()) {
    if (!isa<dataflow::TensorLoadOp, dataflow::TensorStoreOp>(op))
      continue;
    assert(getRow(&op) == 0 && "IO must be placed to row-0");
    ioMap[getCol(&op)].push_back(&op);
  }

  for (auto pair : ioMap) {
    auto col = pair.first;
    const auto &ioList = pair.second;

    SmallVector<Value, 8> inputs;
    SmallVector<Value, 8> outputs;
    SmallVector<Type, 8> outputTypes;
    for (auto op : ioList) {
      inputs.append(op->operand_begin(), op->operand_end());
      outputs.append(op->result_begin(), op->result_end());
      outputTypes.append(op->result_type_begin(), op->result_type_end());
      op->removeAttr("polyaie.row");
      op->removeAttr("polyaie.col");
    }

    // TODO: Support both GMIO and PLIO.
    b.setInsertionPointToStart(&topFunc.front());
    auto process = b.create<dataflow::ProcessOp>(loc, outputTypes, inputs,
                                                 ProcessKind::GMIO);
    process->setAttr("polyaie.row", b.getI64IntegerAttr(0));
    process->setAttr("polyaie.col", b.getI64IntegerAttr(col));
    auto entryBlock = &process.body().front();

    // Reconnect outputs.
    for (auto zip : llvm::zip(outputs, process.results()))
      std::get<0>(zip).replaceAllUsesWith(std::get<1>(zip));
    b.setInsertionPointToEnd(entryBlock);
    auto returnOp = b.create<dataflow::ReturnOp>(loc, outputs);

    // Move IOs into the new process op.
    for (auto op : ioList)
      op->moveBefore(returnOp);

    // Reconnect inputs.
    for (auto zip : llvm::zip(inputs, entryBlock->getArguments()))
      std::get<0>(zip).replaceUsesWithIf(
          std::get<1>(zip), [&](OpOperand &operand) {
            return process->isProperAncestor(operand.getOwner());
          });
  }
}

std::unique_ptr<Pass> polyaie::createCreateInterfacePass() {
  return std::make_unique<CreateInterface>();
}

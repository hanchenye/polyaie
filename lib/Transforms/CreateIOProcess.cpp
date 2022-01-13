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

using ValuesMap = DenseMap<Value, SmallVector<Value, 32>>;

static void createEmptyProcess(OpBuilder &b, Location loc,
                               const ValuesMap &map) {
  for (const auto &pair : map) {
    const auto &tensors = pair.second;
    auto resultTypes = SmallVector<Type, 32>(
        llvm::map_range(tensors, [](Value v) { return v.getType(); }));

    b.setInsertionPointAfterValue(tensors.back());
    auto process = b.create<ProcessOp>(loc, resultTypes, tensors);
    b.setInsertionPointToStart(&process.body().front());

    unsigned idx = 0;
    SmallVector<Value, 32> results;
    for (auto tensor : tensors) {
      auto tensorType = tensor.getType().cast<RankedTensorType>();
      auto memrefType =
          MemRefType::get(tensorType.getShape(), tensorType.getElementType());

      auto memref = b.create<bufferization::ToMemrefOp>(
          loc, memrefType, process.body().getArgument(idx));
      auto result = b.create<bufferization::ToTensorOp>(loc, memref);
      results.push_back(result);

      tensor.replaceAllUsesExcept(process.getResult(idx++), process);
    }
    b.create<dataflow::ReturnOp>(loc, results);
  }
}

namespace {
struct CreateIOProcess : public polyaie::CreateIOProcessBase<CreateIOProcess> {
  void runOnOperation() override {
    auto mod = getOperation();
    auto b = OpBuilder(mod);
    auto loc = b.getUnknownLoc();
    auto topFunc = getTopFunc<circt::handshake::FuncOp>(mod);

    ValuesMap inputsMap;
    for (auto load : topFunc.getOps<dataflow::TensorLoadOp>())
      inputsMap[load.memory()].push_back(load.tensor());
    createEmptyProcess(b, loc, inputsMap);

    ValuesMap outputsMap;
    for (auto store : topFunc.getOps<dataflow::TensorStoreOp>())
      outputsMap[store.memory()].push_back(store.tensor());
    createEmptyProcess(b, loc, outputsMap);
  }
};
} // namespace

std::unique_ptr<Pass> polyaie::createCreateIOProcessPass() {
  return std::make_unique<CreateIOProcess>();
}

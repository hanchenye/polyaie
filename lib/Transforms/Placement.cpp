//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
class Placer {
public:
  Placer(ModuleOp mod, unsigned rowNum = 8, unsigned colNum = 16,
         unsigned rowBegin = 2, unsigned colBegin = 0)
      : mod(mod), b(mod), rowNum(rowNum), colNum(colNum), rowBegin(rowBegin),
        colBegin(colBegin) {
    assert(rowBegin >= 2 && rowBegin + rowNum <= 10 &&
           "invalid range of row, first two rows should not be used");
    assert(colBegin + colNum <= 40 && "invalid range of col");
    layout.resize(rowNum * colNum);
  }

  /// Interfaces to run placement.
  void runNaive();
  void runSimulatedAnnealing();

private:
  /// Convert between coordinates and `layout` index.
  unsigned coordToIndex(unsigned row, unsigned col) {
    assert(row < rowNum && col < colNum && "illegal coordinates");
    return row * colNum + col;
  }
  std::pair<unsigned, unsigned> indexToCoord(unsigned index) {
    assert(index < layout.size() && "illegal layout index");
    return {index / colNum, index % colNum};
  }

  /// Manipulate nodes in the current layout.
  void eraseNode(unsigned row, unsigned col) {
    layout[coordToIndex(row, col)] = CallOp();
  }
  void eraseNode(CallOp call) {
    layout[llvm::find(layout, call) - layout.begin()] = CallOp();
  }

  void placeNode(CallOp call, unsigned row, unsigned col) {
    layout[coordToIndex(row, col)] = call;
  }

  /// Apply the current layout to the IR.
  void applyLayout() {
    unsigned index = 0;
    for (auto call : layout) {
      if (call) {
        auto loc = indexToCoord(index);
        call->setAttr("aie.row", b.getIndexAttr(loc.first + rowBegin));
        call->setAttr("aie.col", b.getIndexAttr(loc.second + colBegin));
      }
      ++index;
    }
  }

private:
  ModuleOp mod;
  OpBuilder b;

  unsigned rowNum;
  unsigned colNum;
  unsigned rowBegin;
  unsigned colBegin;

  SmallVector<CallOp, 128> layout;
};
} // namespace

void Placer::runNaive() {
  unsigned tileIdx = 0;
  for (auto call : mod.getOps<CallOp>()) {
    auto row = tileIdx / colNum;
    auto col = (row % 2 ? tileIdx % colNum : colNum - 1 - tileIdx % colNum);
    placeNode(call, row, col);
    ++tileIdx;
  }
  applyLayout();
}

void Placer::runSimulatedAnnealing() {
  unsigned tileIdx = 0;
  for (auto call : mod.getOps<CallOp>()) {
    auto row = tileIdx / colNum;
    auto col = (row % 2 ? tileIdx % colNum : colNum - 1 - tileIdx % colNum);
    placeNode(call, row, col);
    ++tileIdx;
  }
  applyLayout();
}

namespace {
struct Placement : public polyaie::PlacementBase<Placement> {
  Placement() = default;
  Placement(const Placement &) {}
  Placement(const PolyAIEPipelineOptions &opts) {
    algorithm = opts.placementAlgorithm;
  }

  void runOnOperation() override {
    Placer placer(getOperation());
    if (algorithm == "naive")
      return placer.runNaive();
    else if (algorithm == "simulated-annealing")
      return placer.runSimulatedAnnealing();

    emitError(getOperation().getLoc(), "unsupported placement algorithm");
    return signalPassFailure();
  }
};
} // namespace

std::unique_ptr<Pass> polyaie::createPlacementPass() {
  return std::make_unique<Placement>();
}
std::unique_ptr<Pass>
polyaie::createPlacementPass(const PolyAIEPipelineOptions &opts) {
  return std::make_unique<Placement>(opts);
}

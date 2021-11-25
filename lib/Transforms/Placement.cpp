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
      : mod(mod), rowNum(rowNum), colNum(colNum), rowBegin(rowBegin),
        colBegin(colBegin) {
    assert(rowBegin >= 2 && rowBegin + rowNum <= 10 &&
           "invalid range of row, first two rows should not be used");
    assert(colBegin + colNum <= 40 && "invalid range of col");

    layout.resize(rowNum * colNum);
    for (auto call : mod.getOps<CallOp>())
      nodes.push_back(call);
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

  /// Erase all placed nodes in the layout.
  void eraseAllNode() {
    for (unsigned index = 0, e = layout.size(); index < e; ++index)
      layout[index] = CallOp();
  }

  /// Initialize all nodes to a random location.
  void randomlyInitializeLayout() {
    eraseAllNode();

    unsigned index = 0;
    for (auto node : nodes)
      layout[index++] = node;

    std::srand(std::time(0));
    std::random_shuffle(layout.begin(), layout.end(),
                        [&](int i) { return std::rand() % i; });
  }

  /// Swap a random node into a new random location.
  void randomlySwapNode() {
    std::srand(std::time(0));
    auto call = nodes[std::rand() % nodes.size()];

    auto index = llvm::find(layout, call) - layout.begin();
    auto newIndex = std::rand() % layout.size();

    layout[index] = layout[newIndex];
    layout[newIndex] = call;
  }

  /// Calculate the cost of the layout.
  unsigned getLayoutCost() {
    for (auto node : nodes) {
      for (auto result : node.getResults()) {
      }
    }
    return 0;
  }

  /// Apply the current layout to the IR.
  void applyLayout() {
    auto b = Builder(mod);
    unsigned index = 0;
    for (auto call : layout) {
      if (call) {
        auto coord = indexToCoord(index);
        call->setAttr("aie.row", b.getIndexAttr(coord.first + rowBegin));
        call->setAttr("aie.col", b.getIndexAttr(coord.second + colBegin));
      }
      ++index;
    }
  }

private:
  ModuleOp mod;

  unsigned rowNum;
  unsigned colNum;
  unsigned rowBegin;
  unsigned colBegin;

  SmallVector<CallOp, 128> layout;
  SmallVector<CallOp, 128> nodes;
};
} // namespace

/// Place all nodes into a Z-style layout.
void Placer::runNaive() {
  eraseAllNode();

  unsigned tileIdx = 0;
  for (auto node : nodes) {
    auto row = tileIdx / colNum;
    auto col = (row % 2 ? tileIdx % colNum : colNum - 1 - tileIdx % colNum);
    layout[coordToIndex(row, col)] = node;
    ++tileIdx;
  }
  applyLayout();
}

/// Place all nodes with simulated annealing.
void Placer::runSimulatedAnnealing() {
  randomlyInitializeLayout();
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

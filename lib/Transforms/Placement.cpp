//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;

namespace {
class Placer {
public:
  Placer(ModuleOp mod) : mod(mod) {
    for (auto call : mod.getOps<CallOp>())
      nodes.push_back(call);

    rowBegin = 2;
    colBegin = 0;
    rowNum = std::min((unsigned)sqrt(nodes.size()), (unsigned)8);
    colNum = std::min((unsigned)(1.5 * nodes.size() / rowNum), (unsigned)40);

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
    std::random_shuffle(layout.begin(), layout.end(),
                        [&](int i) { return std::rand() % i; });
  }

  /// Swap a random node into a new random location.
  void randomlySwapNode() {
    auto node = nodes[std::rand() % nodes.size()];
    auto index = llvm::find(layout, node) - layout.begin();
    auto newIndex = std::rand() % layout.size();

    layout[index] = layout[newIndex];
    layout[newIndex] = node;
  }

  /// Calculate the cost of the layout.
  double getLayoutCost() {
    double cost = 0;
    for (auto node : nodes) {
      unsigned srcIndex = llvm::find(layout, node) - layout.begin();
      auto srcRow = indexToCoord(srcIndex).first;
      auto srcCol = indexToCoord(srcIndex).second;

      for (auto result : node.getResults()) {
        SmallVector<unsigned, 4> nodeRows({srcRow});
        SmallVector<unsigned, 4> nodeCols({srcCol});
        auto numElem = result.getType().cast<MemRefType>().getNumElements();

        for (auto user : result.getUsers()) {
          if (!isa<CallOp>(user))
            continue;
          unsigned tgtIndex = llvm::find(layout, user) - layout.begin();
          auto tgtRow = indexToCoord(tgtIndex).first;
          auto tgtCol = indexToCoord(tgtIndex).second;

          // We don't count the cost between tiles that are neighbors.
          if ((std::abs((int64_t)srcCol - (int64_t)tgtCol) +
               std::abs((int64_t)srcRow - (int64_t)tgtRow)) != 1) {
            nodeRows.push_back(tgtRow);
            nodeCols.push_back(tgtCol);
          }
        }

        // Calculate the cost using Half-Perimeter Wirelength (HPWL).
        if (!llvm::hasSingleElement(nodeRows)) {
          auto boxHeight = *std::max_element(nodeRows.begin(), nodeRows.end()) -
                           *std::min_element(nodeRows.begin(), nodeRows.end());
          auto boxWidth = *std::max_element(nodeCols.begin(), nodeCols.end()) -
                          *std::min_element(nodeCols.begin(), nodeCols.end());
          cost += numElem * (boxHeight + boxWidth);
        }
      }
    }
    return cost;
  }

  /// Apply the current layout to the IR.
  void applyLayout() {
    auto b = Builder(mod);
    unsigned index = 0;
    for (auto call : layout) {
      if (call) {
        auto coord = indexToCoord(index);
        call->setAttr("aie.row", b.getI64IntegerAttr(coord.first + rowBegin));
        call->setAttr("aie.col", b.getI64IntegerAttr(coord.second + colBegin));
      }
      ++index;
    }
  }

private:
  ModuleOp mod;
  SmallVector<CallOp, 128> nodes;

  unsigned rowBegin;
  unsigned colBegin;
  unsigned rowNum;
  unsigned colNum;

  SmallVector<CallOp, 128> layout;
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
  // llvm::dbgs() << getLayoutCost() << "\n";

  applyLayout();
}

/// Place all nodes with simulated annealing.
void Placer::runSimulatedAnnealing() {
  std::srand(std::time(0));
  randomlyInitializeLayout();
  auto minCost = getLayoutCost();
  auto minLayout = layout;

  // Set a simulated temperature and start the cooling down.
  double temperature = getLayoutCost();
  for (auto i = 0, e = 1000000; i < e; ++i) {
    // Generate a new layout by random nodes swapping.
    for (auto k = 0, ek = 2; k < ek; ++k)
      randomlySwapNode();
    auto cost = getLayoutCost();

    if (cost > minCost) {
      // If the new solution is worse than the current solution, determine
      // whether to take it.
      auto randNum = (double)std::rand() / (double)RAND_MAX;
      auto threshold = std::exp((minCost - cost) / temperature);
      if (randNum > threshold)
        layout = minLayout;
    } else {
      // Otherwise, update the current solution.
      minCost = cost;
      minLayout = layout;
    }

    if (i % 1000 == 0) {
      // Cool down the temperature.
      temperature = 0.99 * temperature;
      // llvm::dbgs() << temperature << "\t" << minCost << "\n";
    }
  }
  layout = minLayout;

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

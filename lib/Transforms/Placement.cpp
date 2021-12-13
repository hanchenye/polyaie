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
  Placer(ModuleOp mod);

  /// Place all nodes into a Z-style layout.
  void runNaive();
  /// Place all nodes with simulated annealing.
  void runSimulatedAnnealing(double, double, unsigned, unsigned, unsigned);

private:
  /// Convert `layout` index to coordinates.
  std::pair<unsigned, unsigned> indexToCoord(unsigned index) const {
    assert(index < layout.size() && "illegal layout index");
    return {index / colNum, index % colNum};
  }

  /// Erase all placed nodes in the layout.
  void clearLayout() {
    layoutMap.clear();
    for (auto &node : layout)
      node = CallOp();
  }

  /// Initialize all nodes to a random location.
  void initLayoutRandomly();
  /// Swap a random node into a new random location.
  void swapRandomlyOnce();

  /// Calculate the cost of the layout.
  double getLayoutCost() const;

  /// Apply the current layout to the IR.
  void applyLayout() const;

private:
  const ModuleOp mod;

  /// All CallOps in the placement problem.
  const SmallVector<CallOp, 128> nodes;

  /// The block for placement.
  const unsigned rowBegin, colBegin, rowNum, colNum;

  /// Record the CallOp on each coordinates(index).
  SmallVector<CallOp, 128> layout;
  /// Record the coordinates(index) of each CallOp.
  DenseMap<Operation *, unsigned> layoutMap;
};
} // namespace

Placer::Placer(ModuleOp mod)
    : mod(mod), nodes(mod.getOps<CallOp>().begin(), mod.getOps<CallOp>().end()),
      rowBegin(2), colBegin(0),
      rowNum(std::min((unsigned)sqrt(nodes.size()), (unsigned)8)),
      colNum(std::min((unsigned)(1.5 * nodes.size() / rowNum), (unsigned)40)) {

  assert(rowNum * colNum >= nodes.size() && "AIEs are not enough");
  layout.resize(rowNum * colNum);

  std::srand(std::time(0));
}

/// Initialize all nodes to a random location.
void Placer::initLayoutRandomly() {
  clearLayout();

  unsigned index = 0;
  for (auto node : nodes)
    layout[index++] = node;

  std::random_shuffle(layout.begin(), layout.end(),
                      [&](int i) { return std::rand() % i; });
  index = 0;
  for (auto node : layout) {
    if (node)
      layoutMap[node] = index;
    ++index;
  }
}

/// Swap a random node into a new random location.
void Placer::swapRandomlyOnce() {
  auto node = nodes[std::rand() % nodes.size()];
  auto index = layoutMap[node];

  auto swapIndex = std::rand() % layout.size();
  auto swapNode = layout[swapIndex];

  layoutMap[node] = swapIndex;
  layout[swapIndex] = node;

  layout[index] = swapNode;
  if (swapNode)
    layoutMap[swapNode] = index;
}

/// Calculate the cost of the layout.
double Placer::getLayoutCost() const {
  double cost = 0;
  for (auto node : nodes) {
    auto srcCoord = indexToCoord(layoutMap.lookup(node));
    auto srcRow = srcCoord.first;
    auto srcCol = srcCoord.second;

    for (auto result : node.getResults()) {
      SmallVector<unsigned, 4> rows({srcRow});
      SmallVector<unsigned, 4> cols({srcCol});

      for (auto user : result.getUsers()) {
        if (!isa<CallOp>(user))
          continue;

        auto tgtCoord = indexToCoord(layoutMap.lookup(user));
        auto tgtRow = tgtCoord.first;
        auto tgtCol = tgtCoord.second;

        // We don't count the cost between tiles that are neighbors.
        if (!adjacent(srcRow, srcCol, tgtRow, tgtCol)) {
          rows.push_back(tgtRow);
          cols.push_back(tgtCol);
        }
      }

      // Calculate the cost using Half-Perimeter Wirelength (HPWL).
      if (!llvm::hasSingleElement(rows)) {
        auto boxHeight = *std::max_element(rows.begin(), rows.end()) -
                         *std::min_element(rows.begin(), rows.end());
        auto boxWidth = *std::max_element(cols.begin(), cols.end()) -
                        *std::min_element(cols.begin(), cols.end());
        cost += result.getType().cast<MemRefType>().getNumElements() *
                (boxHeight + boxWidth);
      }
    }
  }
  return cost;
}

/// Apply the current layout to the IR.
void Placer::applyLayout() const {
  auto b = Builder(mod);
  unsigned index = 0;
  for (auto node : layout) {
    if (node) {
      auto mapIndex = layoutMap.lookup(node);
      assert(mapIndex == index && "disorted layout");
      auto coord = indexToCoord(index);
      node->setAttr("aie.row", b.getI64IntegerAttr(coord.first + rowBegin));
      node->setAttr("aie.col", b.getI64IntegerAttr(coord.second + colBegin));
    }
    ++index;
  }
}

/// Place all nodes into a Z-style layout.
void Placer::runNaive() {
  clearLayout();

  unsigned tileIdx = 0;
  for (auto node : nodes) {
    auto row = tileIdx / colNum;
    auto col = (row % 2 ? tileIdx % colNum : colNum - 1 - tileIdx % colNum);
    auto index = row * colNum + col;

    layout[index] = node;
    layoutMap[node] = index;
    ++tileIdx;
  }
  applyLayout();
}

/// Place all nodes with simulated annealing.
void Placer::runSimulatedAnnealing(double startTemp = 10,
                                   double finalTemp = 0.01,
                                   unsigned adjustNum = 200,
                                   unsigned mutatePerTemp = 1000,
                                   unsigned swapPerMutate = 2) {
  initLayoutRandomly();
  auto minCost = getLayoutCost();
  auto minLayout = layout;
  auto minLayoutMap = layoutMap;

  // Calculate the start and frozen temperatur and adjustment factor.
  startTemp *= minCost;
  finalTemp *= minCost;
  auto factor = std::pow(finalTemp / startTemp, 1.0 / adjustNum);

  // Set the simulated temperature and start the adjustment.
  auto temp = startTemp;
  unsigned counter = 0;
  while (temp > finalTemp) {
    // Generate a new layout by random nodes swapping.
    for (unsigned i = 0; i < swapPerMutate; ++i)
      swapRandomlyOnce();
    auto cost = getLayoutCost();

    if (cost > minCost) {
      // If the new solution is worse than the current solution, determine
      // whether to take it.
      auto randNum = (double)std::rand() / (double)RAND_MAX;
      auto threshold = std::exp((minCost - cost) / temp);
      if (randNum > threshold) {
        layout = minLayout;
        layoutMap = minLayoutMap;
      }
    } else {
      // Otherwise, update the current solution.
      minCost = cost;
      minLayout = layout;
      minLayoutMap = layoutMap;
    }

    // Cool down the temperature.
    if (counter++ == mutatePerTemp) {
      // llvm::dbgs() << temp << "\t" << minCost << "\n";
      temp *= factor;
      counter = 0;
    }
  }
  layout = minLayout;
  layoutMap = minLayoutMap;
  applyLayout();
}

namespace {
struct Placement : public polyaie::PlacementBase<Placement> {
  Placement() = default;
  Placement(const Placement &) {}
  Placement(const PolyAIEOptions &opts) { algorithm = opts.placementAlgorithm; }

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
std::unique_ptr<Pass> polyaie::createPlacementPass(const PolyAIEOptions &opts) {
  return std::make_unique<Placement>(opts);
}

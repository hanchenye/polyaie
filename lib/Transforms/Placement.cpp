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

using PhysicalLocation = std::pair<unsigned, unsigned>;

//===----------------------------------------------------------------------===//
// A general-purpose layout class
//===----------------------------------------------------------------------===//

namespace {
class Layout {
public:
  Layout() = delete;
  Layout(const Layout &other) : nodes(other.nodes), layout(other.layout) {}
  Layout(const SmallVector<Operation *, 32> &nodes, unsigned size)
      : nodes(nodes), layout(size) {
    assert(size >= nodes.size() && "layout size is not enough");
    DenseSet<Operation *> nodeSet;
    for (auto node : nodes)
      assert(nodeSet.insert(node).second && "duplicate node");
  }
  virtual ~Layout() = default;

  /// Get the physical location of a node if it exists in the layout.
  Optional<PhysicalLocation> getPhysicalLoc(Operation *node) const {
    if (auto loc = find(node))
      return logicalToPhysicalLoc(loc.getValue());
    return llvm::None;
  }

  /// Get the node placed on the given physical location. If the location is
  /// empty, return nullptr.
  Operation *getNode(PhysicalLocation physLoc) const {
    return layout[physicalToLogicalLoc(physLoc)];
  }

  /// Check whether all nodes have been placed.
  LogicalResult checkFullyPlaced() const {
    // Check whether any node is placed more than once.
    DenseSet<Operation *> placedNodeSet;
    for (auto node : llvm::make_filter_range(
             layout, [](Operation *node) -> bool { return node; }))
      if (!placedNodeSet.insert(node).second)
        return failure();

    // Check whether any node is not placed.
    for (auto node : nodes)
      if (!placedNodeSet.count(node))
        return failure();

    return success();
  }

  /// Erase all placed nodes in the layout.
  void clear() {
    for (auto &node : layout)
      node = nullptr;
  }

  /// Initialize all nodes to a random logical location.
  void randomInitialize() {
    clear();
    unsigned loc = 0;
    for (auto node : nodes)
      layout[loc++] = node;
    llvm::shuffle(layout.begin(), layout.end(), []() { return std::rand(); });
  }

  /// Swap a random node into a new random location.
  void randomSwap(unsigned iteration = 1) {
    for (unsigned i = 0; i < iteration; ++i) {
      auto node = nodes[std::rand() % nodes.size()];
      auto loc = find(node);
      assert(loc && "node has not been placed");

      auto swapLoc = std::rand() % layout.size();
      auto swapNode = layout[swapLoc];

      layout[loc.getValue()] = swapNode;
      layout[swapLoc] = node;
    }
  }

protected:
  /// Find the logical location given a node.
  /// TODO: We should finally have a DenseMap<Operation *, unsigned> to find the
  /// logical location to get O(logn) performance. This requires all non-const
  /// methods to be enhanced.
  Optional<unsigned> find(Operation *node) const {
    auto nodePtr = llvm::find(layout, node);
    if (nodePtr == layout.end())
      return llvm::None;
    return nodePtr - layout.begin();
  }

  /// Return whether a logical location is legal.
  bool verifyLogicalLoc(unsigned loc) const { return loc < layout.size(); }

  /// Return whether a physical location is legal.
  virtual bool verifyPhysicalLoc(PhysicalLocation physLoc) const = 0;

  /// Get the physical location given the logical location.
  virtual PhysicalLocation logicalToPhysicalLoc(unsigned loc) const = 0;

  /// Get the logical location given the physical location.
  virtual unsigned physicalToLogicalLoc(PhysicalLocation physLoc) const = 0;

private:
  /// All the nodes in the layout. They may or may not have been placed.
  const SmallVector<Operation *, 32> &nodes;

  /// Record the node placed on each logical location.
  SmallVector<Operation *, 32> layout;
};
} // namespace

//===----------------------------------------------------------------------===//
// AIE layout class
//===----------------------------------------------------------------------===//

namespace {
/// PhysicalLocation is interpreted as [row, col].
class AIELayout : public Layout {
public:
  AIELayout(const SmallVector<Operation *, 32> &nodes, unsigned rowBegin = 1,
            unsigned colBegin = 0, unsigned rowNum = 8, unsigned colNum = 50)
      : Layout(nodes, rowNum * colNum), rowBegin(rowBegin), colBegin(colBegin),
        rowNum(rowNum), colNum(colNum) {
    assert(rowBegin > 0 && rowBegin + rowNum <= 8 && colBegin + colNum <= 50 &&
           "illegal AIE range");
  }

private:
  /// Return whether a physical location is legal.
  bool verifyPhysicalLoc(PhysicalLocation physLoc) const override {
    return physLoc.first - rowBegin < rowNum &&
           physLoc.second - colBegin < colNum;
  }

  /// Get the physical location given the logical location.
  PhysicalLocation logicalToPhysicalLoc(unsigned loc) const override {
    assert(verifyLogicalLoc(loc) && "illegal logical location");
    return {loc / colNum + rowBegin, loc % colNum + colBegin};
  }

  /// Get the logical location given the physical location.
  unsigned physicalToLogicalLoc(PhysicalLocation physLoc) const override {
    assert(verifyPhysicalLoc(physLoc) && "illegal physical location");
    return (physLoc.first - rowBegin) * colNum + physLoc.second - colBegin;
  }

  /// The range of AIEs for placement.
  const unsigned rowBegin, colBegin, rowNum, colNum;
};
} // namespace

//===----------------------------------------------------------------------===//
// Shim layout class
//===----------------------------------------------------------------------===//

namespace {
/// PhysicalLocation is interpreted as [col, port].
/// TODO: Support to apply constraints like AIELayout.
class ShimLayout : public Layout {
public:
  ShimLayout(const SmallVector<Operation *, 32> &nodes,
             ArrayRef<unsigned> shimCols, unsigned portNum)
      : Layout(nodes, shimCols.size() * portNum),
        shimCols(shimCols.begin(), shimCols.end()), portNum(portNum) {}

private:
  /// Return whether a physical location is legal.
  bool verifyPhysicalLoc(PhysicalLocation physLoc) const override {
    return llvm::find(shimCols, physLoc.first) != shimCols.end() &&
           physLoc.second < portNum;
  }

  /// Get the physical location given the logical location.
  PhysicalLocation logicalToPhysicalLoc(unsigned loc) const override {
    assert(verifyLogicalLoc(loc) && "illegal logical location");
    return {shimCols[loc / portNum], loc % portNum};
  }

  /// Get the logical location given the physical location.
  unsigned physicalToLogicalLoc(PhysicalLocation physLoc) const override {
    assert(verifyPhysicalLoc(physLoc) && "illegal physical location");
    return (llvm::find(shimCols, physLoc.first) - shimCols.begin()) * portNum +
           physLoc.second;
  }

  /// This array holds the columns that have IO available.
  const SmallVector<unsigned, 16> shimCols;

  /// The number of ports on each shim tile.
  const unsigned portNum;
};
} // namespace

//===----------------------------------------------------------------------===//
// ShimNOC and ShimPL layout class
//===----------------------------------------------------------------------===//

/// There're in total 16 ShimNOCs that can directly access the external DDR.
/// They are distributed to the 50 shim tiles and each ShimNOC has two input and
/// two output ports that can be connected to AIE. This array holds the columns
/// that have ShimNOC available.
static const unsigned ShimNOC[16] = {2,  3,  6,  7,  10, 11, 18, 19,
                                     26, 27, 34, 35, 42, 43, 46, 47};

namespace {
/// Could be used for both input and output ports.
class ShimNOCLayout : public ShimLayout {
public:
  ShimNOCLayout(const SmallVector<Operation *, 32> &nodes)
      : ShimLayout(nodes, ShimNOC, 2) {}
};
} // namespace

//===----------------------------------------------------------------------===//
// A placer class extensible for multiple algorithms
//===----------------------------------------------------------------------===//

namespace {
class Placer {
public:
  Placer(circt::handshake::FuncOp func);

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
      node = dataflow::ProcessOp();
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
  const FuncOp func;

  /// All dataflow::ProcessOps in the placement problem.
  const SmallVector<dataflow::ProcessOp, 128> nodes;

  /// The block for placement.
  const unsigned rowBegin, colBegin, rowNum, colNum;

  /// Record the dataflow::ProcessOp on each coordinates(index).
  SmallVector<dataflow::ProcessOp, 128> layout;
  /// Record the coordinates(index) of each dataflow::ProcessOp.
  DenseMap<Operation *, unsigned> layoutMap;

  // const unsigned PLInputs[39 * 8] = {};
  // const unsigned PLOutputs[39 * 6] = {};
};
} // namespace

Placer::Placer(circt::handshake::FuncOp func)
    : func(func), nodes(func.getOps<dataflow::ProcessOp>().begin(),
                        func.getOps<dataflow::ProcessOp>().end()),
      rowBegin(2), colBegin(0),
      rowNum(std::min((unsigned)sqrt(nodes.size()), (unsigned)7)),
      colNum(std::min((unsigned)(1.5 * nodes.size() / rowNum), (unsigned)50)) {

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
        if (!isa<dataflow::ProcessOp>(user))
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
        cost += result.getType().cast<RankedTensorType>().getNumElements();
        cost += 4 * (boxHeight + boxWidth);
      }
    }
  }
  return cost;
}

/// Apply the current layout to the IR.
void Placer::applyLayout() const {
  auto b = Builder(func);
  unsigned index = 0;
  for (auto node : layout) {
    if (node) {
      auto mapIndex = layoutMap.lookup(node);
      assert(mapIndex == index && "disorted layout");
      auto coord = indexToCoord(index);
      node->setAttr("polyaie.row", b.getI64IntegerAttr(coord.first + rowBegin));
      node->setAttr("polyaie.col",
                    b.getI64IntegerAttr(coord.second + colBegin));
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
    auto topFunc = getTopFunc<circt::handshake::FuncOp>(getOperation());
    Placer placer(topFunc);
    if (algorithm == "naive")
      return placer.runNaive();
    else if (algorithm == "simulated-annealing")
      return placer.runSimulatedAnnealing();

    emitError(topFunc.getLoc(), "unsupported placement algorithm");
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

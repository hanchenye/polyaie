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
using namespace circt;

using PhysicalLocation = std::pair<unsigned, unsigned>;

//===----------------------------------------------------------------------===//
// A general-purpose layout class
//===----------------------------------------------------------------------===//

namespace {
class Layout {
public:
  virtual ~Layout() = default;

  Layout() = delete;
  Layout(unsigned size) : layout(size) {}

  Layout &operator=(const Layout &other) {
    layout = other.layout;
    return *this;
  }

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

  static bool isNode(Operation *node) { return node; }
  using NodeRange = llvm::iterator_range<
      llvm::filter_iterator<Operation *const *, decltype(&isNode)>>;

  /// Get all nodes placed in the layout.
  NodeRange getNodes() const {
    return llvm::make_filter_range(layout, &isNode);
  }

  /// Check whether all nodes have been placed.
  LogicalResult checkFullyPlaced(const DenseSet<Operation *> &nodes) const {
    DenseSet<Operation *> placedNodes;
    for (auto node : getNodes())
      if (!placedNodes.insert(node).second)
        return failure();

    return placedNodes == nodes ? success() : failure();
  }

  /// Initialize all nodes to a random logical location.
  void randomInitialize(const DenseSet<Operation *> nodes) {
    assert(layout.size() >= nodes.size() && "layout size is not enough");
    for (auto &node : layout)
      node = nullptr;

    unsigned loc = 0;
    for (auto node : nodes)
      layout[loc++] = node;

    llvm::shuffle(layout.begin(), layout.end(), []() { return std::rand(); });
  }

  /// Swap a random node into a new random location.
  void randomSwap(SmallVectorImpl<std::pair<unsigned, unsigned>> &records,
                  unsigned iteration = 1) {
    for (unsigned i = 0; i < iteration; ++i) {
      // TODO: This needs to be rewritten.
      unsigned loc = std::rand() % layout.size();
      while (!layout[loc])
        loc = std::rand() % layout.size();
      auto node = layout[loc];

      auto swapLoc = std::rand() % layout.size();
      auto swapNode = layout[swapLoc];

      layout[loc] = swapNode;
      layout[swapLoc] = node;

      records.push_back({loc, swapLoc});
    }
  }

  /// Reverse a swap based on the records.
  void reverseSwap(SmallVectorImpl<std::pair<unsigned, unsigned>> &records) {
    for (auto i = records.rbegin(), e = records.rend(); i < e; ++i) {
      auto node = layout[i->first];
      auto swapNode = layout[i->second];

      layout[i->first] = swapNode;
      layout[i->second] = node;
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
  /// Record the node placed on each logical location.
  SmallVector<Operation *, 32> layout;
};
} // namespace

//===----------------------------------------------------------------------===//
// AIE layout class
//===----------------------------------------------------------------------===//

namespace {
/// PhysicalLocation is interpreted as [row, col].
class LayoutAIE : public Layout {
public:
  LayoutAIE(unsigned rowBegin = 1, unsigned colBegin = 0, unsigned rowNum = 8,
            unsigned colNum = 50)
      : Layout(rowNum * colNum), rowBegin(rowBegin), colBegin(colBegin),
        rowNum(rowNum), colNum(colNum) {
    assert(rowBegin > 0 && rowBegin + rowNum <= 9 && colBegin + colNum <= 50 &&
           "illegal AIE range");
  }

  LayoutAIE &operator=(const LayoutAIE &other) {
    Layout::operator=(other);
    rowBegin = other.rowBegin, colBegin = other.colBegin;
    rowNum = other.rowNum, colNum = other.colNum;
    return *this;
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
  unsigned rowBegin, colBegin, rowNum, colNum;
};
} // namespace

//===----------------------------------------------------------------------===//
// Shim layout class
//===----------------------------------------------------------------------===//

namespace {
/// PhysicalLocation is interpreted as [col, port].
class LayoutShim : public Layout {
public:
  LayoutShim() = delete;
  LayoutShim(ArrayRef<unsigned> shimCols, unsigned portNum)
      : Layout(portNum * shimCols.size()),
        shimCols(shimCols.begin(), shimCols.end()), portNum(portNum) {}

  LayoutShim &operator=(const LayoutShim &other) {
    Layout::operator=(other);
    shimCols = other.shimCols, portNum = other.portNum;
    return *this;
  }

private:
  /// Return whether a physical location is legal.
  bool verifyPhysicalLoc(PhysicalLocation physLoc) const override {
    return llvm::find(shimCols, physLoc.first) != shimCols.end();
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
  SmallVector<unsigned, 16> shimCols;

  /// The number of ports on each shim tile.
  unsigned portNum;
};
} // namespace

//===----------------------------------------------------------------------===//
// ShimNOC and ShimPL layout class
//===----------------------------------------------------------------------===//

/// There're in total 16 ShimNOCs that can directly access the external DDR.
/// They are distributed to the 50 shim tiles and each ShimNOC has two input and
/// two output ports that can be connected to AIE. This array holds the columns
/// that have ShimNOC available.
static const unsigned shimNOC[16] = {2,  3,  6,  7,  10, 11, 18, 19,
                                     26, 27, 34, 35, 42, 43, 46, 47};

namespace {
/// Can be used for both input and output ports.
class LayoutShimNOC : public LayoutShim {
public:
  LayoutShimNOC() : LayoutShim(shimNOC, /*portNum=*/2) {}
  using LayoutShim::operator=;
};
} // namespace

//===----------------------------------------------------------------------===//
// A placer class extensible for multiple algorithms
//===----------------------------------------------------------------------===//

namespace {
/// TODO: Support multi-threads for multi-layouts placement.
class Placer {
public:
  Placer(handshake::FuncOp func)
      : func(func), procs(func.getOps<dataflow::ProcessOp>().begin(),
                          func.getOps<dataflow::ProcessOp>().end()) {
    unsigned rowBegin = 2, colBegin = 0;
    unsigned rowNum = std::min((int)sqrt(procs.size()), (int)7);
    unsigned colNum = std::min((int)(1.5 * procs.size() / rowNum), (int)50);

    layoutAie = LayoutAIE(rowBegin, colBegin, rowNum, colNum);
    layoutAie.randomInitialize(procs);

    std::srand(std::time(0));
  }

  /// Place all nodes into a random layout.
  void runNaive() {
    layoutAie.randomInitialize(procs);
    applyLayout();
  }

  /// Place all nodes with simulated annealing.
  void runSA(double, double, unsigned, unsigned, unsigned);

private:
  /// Calculate the cost of the layout.
  double getLayoutCost() const;

  /// Apply the current layout to the IR.
  void applyLayout() const {
    auto b = Builder(func);
    for (auto node : layoutAie.getNodes()) {
      auto loc = layoutAie.getPhysicalLoc(node).getValue();
      node->setAttr("polyaie.row", b.getI64IntegerAttr(loc.first));
      node->setAttr("polyaie.col", b.getI64IntegerAttr(loc.second));
    }
  }

private:
  handshake::FuncOp func;

  /// All types of nodes in the placement problem.
  DenseSet<Operation *> procs;
  // const SmallVector<Operation *, 32> loads;
  // const SmallVector<Operation *, 32> stores;

  /// All types of layouts in the placement problem.
  LayoutAIE layoutAie;
  // LayoutShimNOC layoutNocIn;
  // LayoutShimNOC layoutNocOut;
};
} // namespace

/// Calculate the cost of the layout.
double Placer::getLayoutCost() const {
  double cost = 0;
  for (auto node : procs) {
    auto srcLoc = layoutAie.getPhysicalLoc(node).getValue();
    auto srcRow = srcLoc.first;
    auto srcCol = srcLoc.second;

    for (auto result : node->getResults()) {
      SmallVector<unsigned, 4> rows({srcRow});
      SmallVector<unsigned, 4> cols({srcCol});

      for (auto user : result.getUsers()) {
        if (!isa<dataflow::ProcessOp>(user))
          continue;

        auto tgtLoc = layoutAie.getPhysicalLoc(user).getValue();
        auto tgtRow = tgtLoc.first;
        auto tgtCol = tgtLoc.second;

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

/// Place all nodes with simulated annealing.
void Placer::runSA(double startTemp = 10, double finalTemp = 0.01,
                   unsigned adjustNum = 200, unsigned mutatePerTemp = 1000,
                   unsigned swapPerMutate = 2) {
  layoutAie.randomInitialize(procs);
  auto minCost = getLayoutCost();
  LayoutAIE minLayout;

  // Calculate the start and frozen temperatur and adjustment factor.
  startTemp *= minCost;
  finalTemp *= minCost;
  auto factor = std::pow(finalTemp / startTemp, 1.0 / adjustNum);

  // Set the simulated temperature and start the adjustment.
  auto temp = startTemp;
  unsigned counter = 0;
  while (temp > finalTemp) {
    // Generate a new layout by random nodes swapping.
    SmallVector<std::pair<unsigned, unsigned>, 4> swapRecords;
    layoutAie.randomSwap(swapRecords, swapPerMutate);
    auto cost = getLayoutCost();

    if (cost > minCost) {
      // If the new solution is worse than the current solution, determine
      // whether to take it.
      auto randNum = (double)std::rand() / (double)RAND_MAX;
      auto threshold = std::exp((minCost - cost) / temp);
      if (randNum > threshold)
        layoutAie.reverseSwap(swapRecords);
    } else {
      // Otherwise, update the current solution.
      minCost = cost;
      minLayout = layoutAie;
    }

    // Cool down the temperature.
    if (counter++ == mutatePerTemp) {
      // llvm::dbgs() << temp << "\t" << minCost << "\n";
      temp *= factor;
      counter = 0;
      layoutAie = minLayout;
    }
  }
  layoutAie = minLayout;
  applyLayout();
}

namespace {
struct Placement : public polyaie::PlacementBase<Placement> {
  Placement() = default;
  Placement(const Placement &) {}
  Placement(const PolyAIEOptions &opts) { algorithm = opts.placementAlgorithm; }

  void runOnOperation() override {
    auto topFunc = getTopFunc<handshake::FuncOp>(getOperation());
    Placer placer(topFunc);
    if (algorithm == "naive")
      return placer.runNaive();
    else if (algorithm == "simulated-annealing")
      return placer.runSA();

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

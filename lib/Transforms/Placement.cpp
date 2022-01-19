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

namespace {
using PhysicalLocation = std::pair<unsigned, unsigned>;

enum LayoutKind { AIE, NOCIN, NOCOUT, PLIN, PLOUT };
using SwapPair = std::pair<unsigned, unsigned>;
using SwapRecord = std::pair<LayoutKind, SwapPair>;
} // namespace

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
  LogicalResult
  checkFullyPlaced(const SmallVector<Operation *, 32> &nodes) const {
    DenseSet<Operation *> placedNodes;
    for (auto node : getNodes())
      if (!placedNodes.insert(node).second)
        return failure();

    for (auto node : nodes)
      if (!placedNodes.count(node))
        return failure();
    return success();
  }

  /// Initialize all nodes to a random logical location.
  void randomInitialize(const SmallVector<Operation *, 32> &nodes) {
    assert(layout.size() >= nodes.size() && "layout size is not enough");
    for (auto &node : layout)
      node = nullptr;

    unsigned loc = 0;
    for (auto node : nodes)
      layout[loc++] = node;

    llvm::shuffle(layout.begin(), layout.end(), []() { return std::rand(); });
  }

  /// Swap the node into a new random location.
  SwapPair randomSwap(Operation *node) {
    auto loc = find(node);
    assert(loc && "node must have been placed");

    auto swapLoc = std::rand() % layout.size();
    auto swapNode = layout[swapLoc];

    layout[loc.getValue()] = swapNode;
    layout[swapLoc] = node;

    return {loc.getValue(), swapLoc};
  }

  /// Reverse a swap based on the records.
  void reverseSwap(SwapPair pair) {
    auto node = layout[pair.first];
    auto swapNode = layout[pair.second];

    layout[pair.first] = swapNode;
    layout[pair.second] = node;
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

  LayoutAIE(const LayoutAIE &other)
      : Layout(other), rowBegin(other.rowBegin), colBegin(other.colBegin),
        rowNum(other.rowNum), colNum(other.colNum) {}

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

  LayoutShim(const LayoutShim &other)
      : Layout(other), shimCols(other.shimCols), portNum(other.portNum) {}

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
// Placer class
//===----------------------------------------------------------------------===//

/// There're in total 16 ShimNocs that can directly access the external DDR.
/// They are distributed to the 50 shim tiles and each ShimNoc has two input and
/// two output ports that can be connected to AIE. This array holds the columns
/// that have ShimNoc available.
static const unsigned shimNoc[16] = {2,  3,  6,  7,  10, 11, 18, 19,
                                     26, 27, 34, 35, 42, 43, 46, 47};

namespace {
class Placer {
public:
  Placer(handshake::FuncOp func);

  /// Place all nodes with simulated annealing.
  void runSA(double, double, unsigned, unsigned, unsigned);

  /// Get the physical location given any type of node.
  Optional<PhysicalLocation> getPhysicalLoc(Operation *node) const;

  /// Check whether all nodes have been placed.
  LogicalResult checkFullyPlaced() const;

  /// Initialize all nodes to a random logical location.
  void randomInitialize();

  /// Swap a random node into a new random location.
  void randomSwap(SmallVectorImpl<SwapRecord> &records, unsigned iteration = 1);

  /// Reverse a swap based on the records.
  void reverseSwap(SmallVectorImpl<SwapRecord> &records);

  /// Calculate the cost of the layout.
  double getCost() const;

  /// Apply the current layout to the IR.
  void materializeLayout() const;

private:
  handshake::FuncOp func;

  /// All types of nodes in the placement problem.
  SmallVector<Operation *, 32> procs;
  SmallVector<Operation *, 32> loads;
  SmallVector<Operation *, 32> stores;

  struct CompoundLayout {
    LayoutAIE aie;
    LayoutShim nocIn = {shimNoc, 2};
    LayoutShim nocOut = {shimNoc, 2};
    // LayoutShim plIn = {shimPl, 8};
    // LayoutShim plOut = {shimPl, 6};
  };

  /// The current layout of the placement problem.
  CompoundLayout layout;
};
} // namespace

Placer::Placer(handshake::FuncOp func)
    : func(func), procs(func.getOps<dataflow::ProcessOp>()),
      loads(func.getOps<dataflow::TensorLoadOp>()),
      stores(func.getOps<dataflow::TensorStoreOp>()) {

  // FIXME: rowBegin should be 1 by default.
  unsigned rowBegin = 2, colBegin = 0;
  unsigned rowNum = std::min((int)sqrt(procs.size()), (int)7);
  unsigned colNum = std::min((int)(1.5 * procs.size() / rowNum), (int)50);
  layout.aie = {rowBegin, colBegin, rowNum, colNum};

  std::srand(std::time(0));
  randomInitialize();
}

/// Get the physical location given any type of node.
Optional<PhysicalLocation> Placer::getPhysicalLoc(Operation *node) const {
  if (isa<dataflow::ProcessOp>(node))
    return layout.aie.getPhysicalLoc(node);

  else if (isa<dataflow::TensorLoadOp>(node)) {
    if (auto loc = layout.nocIn.getPhysicalLoc(node))
      return PhysicalLocation({(unsigned)0, loc.getValue().first});

  } else if (isa<dataflow::TensorStoreOp>(node)) {
    if (auto loc = layout.nocOut.getPhysicalLoc(node))
      return PhysicalLocation({(unsigned)0, loc.getValue().first});
  }
  return llvm::None;
}

/// Check whether all nodes have been placed.
LogicalResult Placer::checkFullyPlaced() const {
  if (failed(layout.aie.checkFullyPlaced(procs)) ||
      failed(layout.nocIn.checkFullyPlaced(loads)) ||
      failed(layout.nocOut.checkFullyPlaced(stores)))
    return failure();
  return success();
}

/// Initialize all nodes to a random logical location.
void Placer::randomInitialize() {
  layout.aie.randomInitialize(procs);
  layout.nocIn.randomInitialize(loads);
  layout.nocOut.randomInitialize(stores);
}

/// Swap a random node into a new random location.
void Placer::randomSwap(SmallVectorImpl<SwapRecord> &records,
                        unsigned iteration) {
  for (unsigned i = 0; i < iteration; ++i) {
    int index = std::rand() % (procs.size() + loads.size() + stores.size());

    auto procIndex = index;
    auto loadIndex = index - (int)procs.size();
    auto storeIndex = index - (int)procs.size() - (int)loads.size();

    LayoutKind kind;
    std::pair<unsigned, unsigned> pair;

    if (storeIndex >= 0) {
      kind = LayoutKind::NOCOUT;
      pair = layout.nocOut.randomSwap(stores[storeIndex]);
    } else if (loadIndex >= 0) {
      kind = LayoutKind::NOCIN;
      pair = layout.nocIn.randomSwap(loads[loadIndex]);
    } else {
      kind = LayoutKind::AIE;
      pair = layout.aie.randomSwap(procs[procIndex]);
    }

    records.push_back({kind, pair});
  }
}

/// Reverse a swap based on the records.
void Placer::reverseSwap(SmallVectorImpl<SwapRecord> &records) {
  for (auto i = records.rbegin(), e = records.rend(); i < e; ++i) {
    auto kind = i->first;
    auto pair = i->second;

    switch (kind) {
    case LayoutKind::NOCOUT:
      layout.nocOut.reverseSwap(pair);
      break;
    case LayoutKind::NOCIN:
      layout.nocIn.reverseSwap(pair);
      break;
    case LayoutKind::AIE:
      layout.aie.reverseSwap(pair);
      break;
    default:
      llvm_unreachable("invalid layout kind");
      break;
    }
  }
}

/// Calculate the cost of the layout.
double Placer::getCost() const {
  double cost = 0;
  for (const auto node : llvm::concat<Operation *const>(procs, loads, stores)) {
    auto srcLoc = getPhysicalLoc(node);
    assert(srcLoc && "node must have been placed");
    auto srcRow = srcLoc.getValue().first;
    auto srcCol = srcLoc.getValue().second;

    for (auto result : node->getResults()) {
      SmallVector<unsigned, 4> rows({srcRow});
      SmallVector<unsigned, 4> cols({srcCol});

      for (auto user : result.getUsers()) {
        auto tgtLoc = getPhysicalLoc(user);
        assert(tgtLoc && "node must have been placed");
        auto tgtRow = tgtLoc.getValue().first;
        auto tgtCol = tgtLoc.getValue().second;

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
void Placer::materializeLayout() const {
  auto b = Builder(func);
  for (const auto node : llvm::concat<Operation *const>(procs, loads, stores)) {
    auto loc = getPhysicalLoc(node);
    assert(loc && "node must have been placed");
    node->setAttr("polyaie.row", b.getI64IntegerAttr(loc.getValue().first));
    node->setAttr("polyaie.col", b.getI64IntegerAttr(loc.getValue().second));
  }
}

/// Place all nodes with simulated annealing.
void Placer::runSA(double startTemp = 10, double finalTemp = 0.01,
                   unsigned adjustNum = 200, unsigned mutatePerTemp = 1000,
                   unsigned swapPerMutate = 2) {
  randomInitialize();
  auto minCost = getCost();
  auto minLayout = layout;

  // Calculate the start and frozen temperatur and adjustment factor.
  startTemp *= minCost;
  finalTemp *= minCost;
  auto factor = std::pow(finalTemp / startTemp, 1.0 / adjustNum);

  // Set the simulated temperature and start the adjustment.
  auto temp = startTemp;
  unsigned counter = 0;
  while (temp > finalTemp) {
    // Generate a new layout by random nodes swapping.
    SmallVector<SwapRecord, 4> swapRecords;
    randomSwap(swapRecords, swapPerMutate);
    auto cost = getCost();

    if (cost > minCost) {
      // If the new solution is worse than the current solution, determine
      // whether to take it.
      auto randNum = (double)std::rand() / (double)RAND_MAX;
      auto threshold = std::exp((minCost - cost) / temp);
      if (randNum > threshold)
        reverseSwap(swapRecords);
    } else {
      // Otherwise, update the current solution.
      minCost = cost;
      minLayout = layout;
    }

    // Cool down the temperature.
    if (counter++ == mutatePerTemp) {
      // llvm::dbgs() << temp << "\t" << minCost << "\n";
      temp *= factor;
      counter = 0;
      layout = minLayout;
    }
  }
  layout = minLayout;
}

namespace {
struct Placement : public polyaie::PlacementBase<Placement> {
  Placement() = default;
  Placement(const PolyAIEOptions &opts) { algorithm = opts.placementAlgorithm; }

  void runOnOperation() override {
    auto topFunc = getTopFunc<handshake::FuncOp>(getOperation());
    Placer placer(topFunc);

    if (algorithm == "naive")
      placer.randomInitialize();
    else if (algorithm == "simulated-annealing")
      placer.runSA();
    else {
      emitError(topFunc.getLoc(), "unsupported placement algorithm");
      return signalPassFailure();
    }

    if (failed(placer.checkFullyPlaced())) {
      emitError(topFunc.getLoc(), "failed to fully place all nodes");
      return signalPassFailure();
    }
    placer.materializeLayout();
  }
};
} // namespace

std::unique_ptr<Pass> polyaie::createPlacementPass() {
  return std::make_unique<Placement>();
}
std::unique_ptr<Pass> polyaie::createPlacementPass(const PolyAIEOptions &opts) {
  return std::make_unique<Placement>(opts);
}

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

static void placeNaive(ModuleOp mod) {
  auto b = OpBuilder(mod);
  unsigned tileIdx = 0;
  mod.walk([&](CallOp call) {
    auto row = tileIdx / 16 + 2;
    auto col = (row % 2 ? tileIdx % 16 : 15 - tileIdx % 16) + 2;

    call->setAttr("aie.col", b.getIndexAttr(col));
    call->setAttr("aie.row", b.getIndexAttr(row));

    ++tileIdx;
  });
}

static void placeSA(ModuleOp mod) {
  auto b = OpBuilder(mod);
  unsigned tileIdx = 0;
  mod.walk([&](CallOp call) {
    auto row = tileIdx / 16 + 2;
    auto col = (row % 2 ? tileIdx % 16 : 15 - tileIdx % 16) + 2;

    call->setAttr("aie.col", b.getIndexAttr(col));
    call->setAttr("aie.row", b.getIndexAttr(row));

    ++tileIdx;
  });
}

namespace {
struct Placement : public polyaie::PlacementBase<Placement> {
  Placement() = default;
  Placement(const Placement &) {}
  Placement(const PolyAIEPipelineOptions &opts) {
    algorithm = opts.placementAlgorithm;
  }

  void runOnOperation() override {
    auto mod = getOperation();
    if (algorithm == "naive")
      return placeNaive(mod);
    else if (algorithm == "simulated-annealing")
      return placeSA(mod);

    emitError(mod.getLoc(), "unsupported placement algorithm");
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

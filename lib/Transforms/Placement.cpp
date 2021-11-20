//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
class Placement : public polyaie::PlacementBase<Placement> {
public:
  void runOnOperation() override;
};
} // namespace

void Placement::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);

  // Place all PEs in a Z-style.
  // TODO: Placement algorithm.
  unsigned tileIdx = 0;
  mod.walk([&](CallOp call) {
    auto row = tileIdx / 16 + 2;
    auto col = (row % 2 ? tileIdx % 16 : 15 - tileIdx % 16);

    call->setAttr("aie.col", b.getIndexAttr(col));
    call->setAttr("aie.row", b.getIndexAttr(row));

    ++tileIdx;
  });
}

std::unique_ptr<Pass> polyaie::createPlacementPass() {
  return std::make_unique<Placement>();
}

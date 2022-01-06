//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Dataflow/Dataflow.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;

namespace {
struct HoistSubView : public polyaie::HoistSubViewBase<HoistSubView> {
  void runOnOperation() override;
};
} // namespace

void HoistSubView::runOnOperation() { auto mod = getOperation(); }

std::unique_ptr<Pass> polyaie::createHoistSubViewPass() {
  return std::make_unique<HoistSubView>();
}

//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Dialect/SCF/SCF.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace memrefext;
using namespace xilinx::AIE;

namespace {
struct DoubleBuffer : public polyaie::DoubleBufferBase<DoubleBuffer> {
  void runOnOperation() override;
};
} // namespace

void DoubleBuffer::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  // Traverse all tile operations in the IR.
  for (auto core : llvm::make_early_inc_range(mod.getOps<CoreOp>())) {
    // Iterate the body of each AIE for N times, where N is loaded from an
    // index-typed local buffer.
    auto tile = core.getTileOp();
    b.setInsertionPointAfter(tile);
    auto iterNumBuf =
        b.create<BufferOp>(loc, MemRefType::get({}, b.getI32Type()), tile);
    iterNumBuf->setAttr("polyaie.iter_num_buf", b.getUnitAttr());

    // Create a loop iterating for N times.
    b.setInsertionPointToStart(&core.body().front());
    auto one = b.create<ConstantOp>(loc, b.getIndexAttr(1));
    auto zero = b.create<ConstantOp>(loc, b.getIndexAttr(0));
    auto iterNum = b.create<IndexCastOp>(
        loc, b.create<memref::LoadOp>(loc, iterNumBuf), b.getIndexType());
    auto loop = b.create<scf::ForOp>(loc, zero, iterNum, one);

    // Inline all operations except the terminator in the original block into
    // the loop.
    auto &loopOps = loop.getBody()->getOperations();
    auto &blockOps = core.body().front().getOperations();
    loopOps.splice(loopOps.begin(), blockOps, std::next(blockOps.begin(), 5),
                   std::prev(blockOps.end()));
  }
}

std::unique_ptr<Pass> polyaie::createDoubleBufferPass() {
  return std::make_unique<DoubleBuffer>();
}

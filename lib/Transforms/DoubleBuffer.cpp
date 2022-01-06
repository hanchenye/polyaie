//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Analysis/Utils.h"
#include "mlir/Dialect/SCF/SCF.h"
#include "polyaie/Transforms/Passes.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;
using namespace xilinx::AIE;

namespace {
struct DoubleBuffer : public polyaie::DoubleBufferBase<DoubleBuffer> {
  void runOnOperation() override;

  // void recursivelyInsertPongBlocks(Block &block) {
  //   pongBlocks.insert(&block);
  //   for (auto &op : block)
  //     for (auto &region : op.getRegions())
  //       for (auto &child : region)
  //         recursivelyInsertPongBlocks(child);
  // }

  // // Hold all locks and buffers that need to be duplicated.
  // DenseMap<Value, Value> lockAndBufMap;
  // // Hold all pong blocks.
  // DenseSet<Block *> pongBlocks;
};
} // namespace

void DoubleBuffer::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();

  // Traverse all tile operations in the IR.
  for (auto core : llvm::make_early_inc_range(mod.getOps<CoreOp>())) {
    auto tile = core.getTileOp();
    b.setInsertionPointAfter(tile);

    // // Collect all locks and buffers associated with the tile.
    // SmallVector<LockOp, 8> locks;
    // SmallVector<BufferOp, 8> bufs;
    // for (auto user : tile.result().getUsers()) {
    //   if (auto lock = dyn_cast<LockOp>(user))
    //     locks.push_back(lock);
    //   else if (auto buf = dyn_cast<BufferOp>(user))
    //     bufs.push_back(buf);
    // }

    // // Duplicate each lock and store them in the map.
    // auto lockIdx = locks.size();
    // for (auto lock : locks) {
    //   auto newLock = b.create<LockOp>(loc, tile, lockIdx++);
    //   lockAndBufMap[lock] = newLock;
    // }

    // // Duplicate each buffer and store them in the map.
    // for (auto buf : bufs) {
    //   if (!buf->getAttr("polyaie.double_buf"))
    //     continue;
    //   auto newBuf = buf.clone();
    //   b.insert(newBuf);
    //   lockAndBufMap[buf] = newBuf;

    //   // Annotate buffers with "ping" or "pong" mark.
    //   buf->setAttr("polyaie.ping_buf", b.getUnitAttr());
    //   newBuf->setAttr("polyaie.pong_buf", b.getUnitAttr());

    //   // Duplicate MemCpyOps as well for each buffer.
    //   for (auto &use : llvm::make_early_inc_range(buf->getUses())) {
    //     auto user = use.getOwner();
    //     if (isa<dataflow::MemCpyOp>(user)) {
    //       auto insertPoint = b.saveInsertionPoint();
    //       b.setInsertionPoint(user);
    //       auto newMemCpy = user->clone();
    //       newMemCpy->setOperand(use.getOperandNumber(), newBuf);
    //       b.insert(newMemCpy);
    //       b.restoreInsertionPoint(insertPoint);
    //     }
    //   }
    // }

    // Iterate the body of each AIE for N times, where N is loaded from an
    // index-typed local buffer.
    b.setInsertionPointAfter(tile);
    auto iterNumBuf =
        b.create<BufferOp>(loc, MemRefType::get({1}, b.getI32Type()), tile);
    iterNumBuf->setAttr("polyaie.iter_num_buf", b.getUnitAttr());

    // Create a loop iterating for N times.
    b.setInsertionPointToStart(&core.body().front());
    auto one = b.create<arith::ConstantIndexOp>(loc, 1);
    auto zero = b.create<arith::ConstantIndexOp>(loc, 0);
    auto iterNum = b.create<arith::IndexCastOp>(
        loc, b.create<memref::LoadOp>(loc, iterNumBuf, zero.getResult()),
        b.getIndexType());
    auto loop = b.create<scf::ForOp>(loc, zero, iterNum, one);

    // Inline all operations except the terminator in the original block into
    // the loop.
    auto &loopOps = loop.getBody()->getOperations();
    auto &blockOps = core.body().front().getOperations();
    loopOps.splice(loopOps.begin(), blockOps, std::next(blockOps.begin(), 5),
                   std::prev(blockOps.end()));
  }

  // // Duplicate the body of CoreOp.
  // for (auto core : mod.getOps<CoreOp>()) {
  //   auto loop = *core.body().getOps<scf::ForOp>().begin();
  //   b.setInsertionPointToStart(loop.getBody());

  //   // Create an IfOp to branch ping/pong computing phase.
  //   auto iv = loop.getInductionVar();
  //   auto two = b.create<arith::ConstantIndexOp>(loc, 2);
  //   auto modTwo = b.create<UnsignedRemIOp>(loc, iv, two);
  //   auto zero = b.create<arith::ConstantIndexOp>(loc, 0);
  //   auto cond = b.create<CmpIOp>(loc, CmpIPredicate::eq, modTwo, zero);
  //   auto ifOp = b.create<scf::IfOp>(loc, cond, /*withElseRegion=*/true);

  //   auto &loopOps = loop.getBody()->getOperations();
  //   auto &pingOps = ifOp.thenBlock()->getOperations();
  //   pingOps.splice(pingOps.begin(), loopOps, std::next(loopOps.begin(), 5),
  //                  std::prev(loopOps.end()));

  //   auto tmpIfOp = ifOp.clone();
  //   auto &tmpPongOps = tmpIfOp.thenBlock()->getOperations();
  //   auto &pongOps = ifOp.elseBlock()->getOperations();
  //   pongOps.splice(pongOps.begin(), tmpPongOps, tmpPongOps.begin(),
  //                  std::prev(tmpPongOps.end()));
  //   tmpIfOp.erase();

  //   // Insert all child blocks of the else block.
  //   recursivelyInsertPongBlocks(*ifOp.elseBlock());
  // }

  // // Duplicate the BD block of MemOp.
  // for (auto mem : mod.getOps<MemOp>()) {
  //   for (auto dma : mem.getOps<DMAStartOp>()) {
  //     auto pingBlock = dma.dest();
  //     auto pingBranch = cast<BranchOp>(pingBlock->getTerminator());
  //     // TODO: Support more than one blocks under the same channel.
  //     if (pingBranch.dest() != pingBlock)
  //       mem.emitOpError("dmaBd block must branch to itself");

  //     // FIXME: This is risky? Pong block is not necessary to be the block
  //     // before the chain block of DMAStartOp.
  //     auto pongBlock = b.createBlock(dma.chain());
  //     for (auto &op : pingBlock->getOperations())
  //       b.insert(op.clone());
  //     pingBranch.setDest(pongBlock);

  //     pongBlocks.insert(pongBlock);
  //   }
  // }

  // // Replace all locks and buffers in the pong blocks.
  // for (auto pair : lockAndBufMap) {
  //   auto pingLockOrBuf = pair.first;
  //   auto pongLockOrBuf = pair.second;

  //   pingLockOrBuf.replaceUsesWithIf(pongLockOrBuf, [&](OpOperand &use) {
  //     return pongBlocks.count(use.getOwner()->getBlock());
  //   });
  // }
}

std::unique_ptr<Pass> polyaie::createDoubleBufferPass() {
  return std::make_unique<DoubleBuffer>();
}

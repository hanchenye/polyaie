//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "mlir/Transforms/DialectConversion.h"
#include "polyaie/Transforms/Passes.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace bufferization;
using namespace dataflow;
using namespace xilinx::AIE;

namespace {
struct DataflowToAIE : public polyaie::DataflowToAIEBase<DataflowToAIE> {
  void runOnOperation() override;

  const uint64_t baseAddress = 0x020100004000;
};
} // namespace

/// Inline `func` into its parent module.
/// TODO: Use handshake function instead.
static void inlineFuncIntoModule(circt::handshake::FuncOp func) {
  // Create alloc for all arguments of the top function.
  auto mod = func->getParentOfType<ModuleOp>();
  auto b = OpBuilder(mod);
  b.setInsertionPointToEnd(mod.getBody());
  for (auto arg : func.getArguments()) {
    auto type = arg.getType().dyn_cast<MemRefType>();
    if (!type)
      type = MemRefType::get({1}, arg.getType());
    auto memref = b.create<memref::AllocOp>(func.getLoc(), type);
    arg.replaceAllUsesWith(memref);
  }

  // Inline the top function into the module.
  auto &modOps = mod.getBody()->getOperations();
  auto &funcOps = func.front().getOperations();
  modOps.splice(modOps.end(), funcOps, funcOps.begin(),
                std::prev(funcOps.end()));
  mod->setAttr("sym_name", func.getNameAttr());
  func.erase();
}

void DataflowToAIE::runOnOperation() {
  auto mod = getOperation();
  auto b = OpBuilder(mod);
  auto loc = b.getUnknownLoc();
  auto topFunc = getTopFunc<circt::handshake::FuncOp>(mod);

  // using BufferOpUnion = PointerUnion<BufferOp, ExternalBufferOp>;

  // Map from process to its corresponding tile.
  llvm::SmallDenseMap<Operation *, TileOp, 32> tileMap;
  // Map from process result to its corresponding buffer or external buffer.
  llvm::SmallDenseMap<Value, Operation *, 64> bufMap;

  // Map from a tile to the external buffers interfaced through it.
  llvm::SmallDenseMap<Value, SmallVector<Value, 4>, 16> interfaceMap;

  // Hold the address allocated for external buffers.
  uint64_t address = baseAddress;

  // In the first iteration of traversing processes, we create a TileOp for each
  // process and convert all results returned by the process to a BufferOp and
  // record the mapping in "tileMap" and "BufMap", respectively.
  for (auto process : llvm::make_early_inc_range(topFunc.getOps<ProcessOp>())) {
    // Generate TileOp based on the placement results.
    b.setInsertionPoint(process);
    auto tile = b.create<TileOp>(loc, getCol(process), getRow(process));
    tileMap[process] = tile;

    auto returnOp = process.body().back().getTerminator();
    for (auto result : process.getResults()) {
      auto operand = returnOp->getOperand(result.getResultNumber());
      assert(operand.hasOneUse() && "return operand must only be used once");
      // For now, all results should be tensor-typed.
      auto tensorType = result.getType().cast<TensorType>();

      if (auto toTensorOp = operand.getDefiningOp<ToTensorOp>()) {
        // Handle the case when the memref is an local buffer.
        auto alloc = toTensorOp.memref().getDefiningOp<memref::AllocOp>();
        assert(alloc && "memref must be defined by an alloc operation");

        auto buf = b.create<BufferOp>(loc, alloc.getType(), tile);
        bufMap[result] = buf;

        alloc.replaceAllUsesWith(buf.getResult());
        alloc.erase();
        toTensorOp->dropAllUses();
        toTensorOp.erase();

      } else if (auto load = operand.getDefiningOp<dataflow::TensorLoadOp>()) {
        // Handle the case when the memref is a external buffer.
        assert(process.kind() != ProcessKind::AIE);
        auto arg = load.memory().dyn_cast<BlockArgument>();
        assert(arg && "tensor must be loaded from a block argument");

        auto bufType =
            MemRefType::get(tensorType.getShape(), tensorType.getElementType());
        auto buf = b.create<ExternalBufferOp>(loc, bufType, address);
        address += bufType.getSizeInBits() / 8;
        bufMap[result] = buf;
        interfaceMap[tile].push_back(buf);

        // Create a host DMA op to load data from host to external buffer.
        auto mem = process.getOperandFromInternalVal(arg);
        b.create<HostDMAOp>(loc, load.offsets(), load.sizes(), load.strides(),
                            HostDMAKind::HostToDDR, buf, mem);
        load->dropAllUses();
        load.erase();
      } else
        llvm_unreachable(
            "return operand must be defined by ToTensorOp or TensorLoadOp");
    }
  }

  // Map from a buffer to its target buffers.
  llvm::SmallDenseMap<Value, SmallVector<Value, 4>, 64> broadcastMap;

  // In the second iteration of traversing processes, we convert all arguments
  // of the process to local buffers and create CoreOps for each AIE tile.
  for (auto process : llvm::make_early_inc_range(topFunc.getOps<ProcessOp>())) {
    b.setInsertionPoint(process);
    assert(tileMap.count(process) && "cannot find tile op");
    auto tile = tileMap.lookup(process);

    // Create BufferOp for each process argument.
    for (auto arg : process.body().getArguments()) {
      auto operand = process.getOperandFromInternalVal(arg);

      // Handle scalar argument. Basically we need to create a local buffer for
      // each scalar.
      if (!arg.getType().isa<ShapedType>()) {
        auto type = MemRefType::get({1}, arg.getType());
        auto buf = b.create<BufferOp>(loc, type, tile);
        b.create<HostDMAOp>(loc, b.getI64ArrayAttr(0), b.getI64ArrayAttr(1),
                            b.getI64ArrayAttr(1), HostDMAKind::HostToAIE, buf,
                            operand);
        auto insertPoint = b.saveInsertionPoint();

        b.setInsertionPointToStart(&process.body().front());
        auto value = b.create<mlir::AffineLoadOp>(
            loc, b.getConstantAffineMap(0), ValueRange(buf.getResult()));
        arg.replaceAllUsesWith(value);
        b.restoreInsertionPoint(insertPoint);
      }

      // Handle tensor argument.
      auto tensorType = arg.getType().dyn_cast<TensorType>();
      if (!tensorType)
        continue;
      assert(arg.hasOneUse() && "tensor argument must only be used once");
      auto srcBuf = bufMap.lookup(operand);
      assert(srcBuf && "cannot find source buffer");

      if (auto toMemrefOp = getOnlyUserOfType<ToMemrefOp>(arg)) {
        // If the tensor argument is converted to a memref, then create a
        // local buffer for it and record in the broadcast map.
        auto buf = b.create<BufferOp>(loc, toMemrefOp.getType(), tile);
        broadcastMap[srcBuf->getResult(0)].push_back(buf);

        toMemrefOp.replaceAllUsesWith(buf.getResult());
        toMemrefOp.erase();

      } else if (auto store = getOnlyUserOfType<dataflow::TensorStoreOp>(arg)) {
        // If the tensor argument is stored to a memory, then create an
        // external buffer for it and record in the broadcast map.
        assert(process.kind() != ProcessKind::AIE);
        auto arg = store.memory().dyn_cast<BlockArgument>();
        assert(arg && "tensor must be stored to a block argument");

        auto bufType =
            MemRefType::get(tensorType.getShape(), tensorType.getElementType());
        auto buf = b.create<ExternalBufferOp>(loc, bufType, address);
        address += bufType.getSizeInBits() / 8;
        broadcastMap[srcBuf->getResult(0)].push_back(buf);
        interfaceMap[tile].push_back(buf);

        // Create a host DMA to store from external memory to host.
        auto mem = process.getOperandFromInternalVal(arg);
        b.create<HostDMAOp>(loc, store.offsets(), store.sizes(),
                            store.strides(), HostDMAKind::DDRToHost, mem, buf);
        store.erase();
      } else
        llvm_unreachable(
            "tensor argument must be used by ToMemrefOp or TensorStoreOp");
    }
    // Erase all process arguments as all of them have been converted.
    process.body().front().eraseArguments([](auto) { return true; });

    if (process.kind() == ProcessKind::AIE) {
      // Generate a CoreOp and inline the contents of the process.
      auto core = b.create<CoreOp>(loc, tile);
      auto &procBlocks = process.body().getBlocks();
      auto &coreBlocks = core.body().getBlocks();
      coreBlocks.splice(coreBlocks.begin(), procBlocks);

      // Set the ternimator as an EndOp.
      auto returnOp = coreBlocks.back().getTerminator();
      b.setInsertionPoint(returnOp);
      b.create<xilinx::AIE::EndOp>(loc);
      returnOp->erase();
    }
  }

  // For the third iteration, now we can safely erase all the ProcessOps...
  for (auto process : llvm::make_early_inc_range(topFunc.getOps<ProcessOp>())) {
    process->dropAllUses();
    process->erase();
  }

  // Create BroadcastOps from the "broadcastMap", also create InterfaceOps from
  // the "interfaceMap".
  b.setInsertionPoint(topFunc.back().getTerminator());
  for (auto pair : broadcastMap)
    b.create<BroadcastOp>(loc, pair.first, pair.second);

  for (auto pair : interfaceMap) {
    b.setInsertionPointAfterValue(pair.first);
    b.create<InterfaceOp>(loc, pair.first, pair.second);
  }

  // Finally, inline the top function into the module.
  // TODO: Introduce AIE runtime-related operations.
  inlineFuncIntoModule(topFunc);
}

std::unique_ptr<Pass> polyaie::createDataflowToAIEPass() {
  return std::make_unique<DataflowToAIE>();
}

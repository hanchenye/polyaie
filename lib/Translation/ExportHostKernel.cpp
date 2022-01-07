//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "aie/AIEDialect.h"
#include "mlir/Translation.h"
#include "polyaie/Exporters.h"
#include "polyaie/InitAllDialects.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace dataflow;
using namespace xilinx::AIE;

static llvm::cl::opt<bool>
    dryRunHostKernel("dry-run-host-kernel",
                     llvm::cl::desc("run the host kernel without real data"),
                     llvm::cl::init(false));

namespace {
class HostKernelExporter : public ExporterBase {
public:
  explicit HostKernelExporter(ExporterState &state) : ExporterBase(state) {}
  void exportHostKernel(ModuleOp mod);
  void emitMemCpy(dataflow::MemCpyOp memCpy, unsigned argIdx, bool isWrite);
};
} // namespace

void HostKernelExporter::emitMemCpy(dataflow::MemCpyOp memCpy, unsigned argIdx,
                                    bool isWrite) {
  auto buf = isWrite ? memCpy.target() : memCpy.source();
  auto bufOffsets = isWrite ? memCpy.sourceOffsets() : memCpy.targetOffsets();
  auto bufType = buf.getType().dyn_cast<MemRefType>();
  auto bufName = buf.getDefiningOp<BufferOp>().name().getValue();
  auto bufRank = bufType.getRank();

  // Generate the loop head.
  // TODO: Make this more robust. Now we assume we won't read and write buffer
  // simultaneously in the host kernel.
  if (bufRank)
    indent() << "bufIdx = 0;\n";
  unsigned ivIdx = 0;
  for (auto dimSize : bufType.getShape()) {
    auto ivName = "idx" + std::to_string(ivIdx++);
    indent() << "for (int64_t " << ivName << " = 0; " << ivName << " < "
             << dimSize << "; ++" << ivName << ")\n";
    addIndent();
  }

  auto emitArgValue = [&]() {
    os << "arg" << argIdx;
    for (ivIdx = 0; ivIdx < bufRank; ++ivIdx) {
      reduceIndent();
      os << "[idx" << ivIdx;
      auto offset = bufOffsets[ivIdx].cast<IntegerAttr>().getInt();
      if (offset)
        os << " + " << offset << "]";
      else
        os << "]";
    }
  };

  // Generate the loop body.
  if (isWrite) {
    indent() << "mlir_aie_write_buffer_" << bufName << "(_xaie, "
             << (bufRank ? "bufIdx++" : "0") << ", ";
    emitArgValue();
    os << ");\n\n";
  } else {
    indent();
    emitArgValue();
    os << " = mlir_aie_read_buffer_" << bufName << "(_xaie, "
       << (bufRank ? "bufIdx++" : "0") << ");\n\n";
  }
}

static StringRef emitType(Type type) {
  if (auto intType = type.dyn_cast<IntegerType>()) {
    if (intType.getWidth() != 32 || !intType.isSignless())
      return "UNKNOWN_TYPE";
    return "int32_t";
  } else if (auto floatType = type.dyn_cast<Float32Type>())
    return "float";
  return "UNKNOWN_TYPE";
}

void HostKernelExporter::exportHostKernel(ModuleOp mod) {
  os << R"XXX(
//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for MLIR-AIE host kernel.
//
//===----------------------------------------------------------------------===//

#include "test_library.h"
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <thread>
#include <unistd.h>
#include <xaiengine.h>

#define HIGH_ADDR(addr)	((addr & 0xffffffff00000000) >> 32)
#define LOW_ADDR(addr)	(addr & 0x00000000ffffffff)
#define MLIR_STACK_OFFSET 4096

#include "aie_inc.cpp"

)XXX";

  // Generate the host kernel signature.
  if (!mod.getName().hasValue())
    emitError(mod.getLoc(), "top module is not named");
  os << "void " << mod.getName().getValue() << "(\n";
  addIndent();

  // Each allocated global memory is an argument of the kernel.
  SmallVector<memref::AllocOp, 8> allocs(mod.getOps<memref::AllocOp>());
  unsigned argIdx = 0;
  DenseMap<Value, unsigned> argIdxMap;
  for (auto alloc : allocs) {
    auto type = alloc.getType();
    argIdxMap[alloc.getResult()] = argIdx;

    indent() << emitType(type.getElementType()) << " arg" << argIdx++;
    for (auto dimSize : type.getShape())
      os << "[" << dimSize << "]";
    os << ",\n";
  }
  indent() << "unsigned iter_num = 1) {\n";

  // Generate the kernel body.
  os << R"XXX(
  printf("Configure AIE array...\n");

  aie_libxaie_ctx_t *_xaie = mlir_aie_init_libxaie();
  mlir_aie_init_device(_xaie);

  mlir_aie_configure_cores(_xaie);
  mlir_aie_configure_switchboxes(_xaie);
  mlir_aie_initialize_locks(_xaie);
  mlir_aie_configure_dmas(_xaie);


  printf("Initialize buffers...\n");

)XXX";

  // Collect tile operations.
  SmallVector<TileOp, 32> tiles;
  SmallPtrSet<Operation *, 16> leafTiles;
  for (auto tile : mod.getOps<TileOp>()) {
    if (tile.getCoreOp())
      tiles.push_back(tile);
    if (tile->getAttr("polyaie.leaf_tile"))
      leafTiles.insert(tile);
  }

  // Collect memory copy operations.
  SmallVector<dataflow::MemCpyOp, 8> loads;
  SmallVector<dataflow::MemCpyOp, 8> stores;

  for (auto memCpy : mod.getOps<dataflow::MemCpyOp>())
    if (memCpy.target().getDefiningOp<BufferOp>())
      loads.push_back(memCpy);
    else if (auto buf = memCpy.source().getDefiningOp<BufferOp>())
      stores.push_back(memCpy);

  if (!dryRunHostKernel) {
    // Clear the local memory of all tiles.
    for (auto tile : tiles)
      indent() << "mlir_aie_clear_tile_memory(_xaie, " << tile.col() << ", "
               << tile.row() << ");\n";
    os << "\n";

    // Initialize local memories.
    indent() << "unsigned bufIdx;\n\n";
    for (auto load : loads)
      emitMemCpy(load, argIdxMap[load.source()], /*isWrite=*/true);
  }

  // Configure the iteration number buffer of each AIE.
  for (auto buf : mod.getOps<BufferOp>())
    if (buf->getAttr("polyaie.iter_num_buf"))
      indent() << "mlir_aie_write_buffer_" << buf.name().getValue()
               << "(_xaie, 0, iter_num);\n";
  os << "\n";

  // Create a "results" array to indicate the completion of the kernel and then
  // start the execution.
  indent() << "bool results[" << leafTiles.size() << "];\n";

  os << R"XXX(
  for (auto &result : results)
    result = false;

  auto kernel_complete = [&]() {
    bool flag = true;
    for (auto result : results)
      flag &= result;
    return flag;
  };


  printf("Start cores...\n");
  mlir_aie_start_cores(_xaie);

)XXX";

  // Iterate until all elements in "results" are set.
  indent() << "while(!kernel_complete()) {\n";
  addIndent();

  unsigned tileIdx = 0;
  for (auto op : leafTiles) {
    auto tile = cast<TileOp>(op);
    indent() << "if (mlir_aie_acquire_lock(_xaie, " << tile.col() << ", "
             << tile.row() << ", 15, 1, 0))\n";
    // indent() << "if (XAieTile_CoreReadStatusDone(&(_xaie->TileInst["
    //          << tile.col() << "][" << tile.row() << "])))\n";
    addIndent();
    indent() << "results[" << tileIdx++ << "] = true;\n";
    reduceIndent();
  }

  for (auto load : loads) {
    if (!load->getAttr("polyaie.load_each_iter"))
      continue;

    auto tile = load.target().getDefiningOp<BufferOp>().getTileOp();
    indent() << "if (mlir_aie_acquire_lock(_xaie, " << tile.col() << ", "
             << tile.row() << ", 15, 1, 0)) {\n";
    addIndent();

    if (!dryRunHostKernel)
      emitMemCpy(load, argIdxMap[load.source()], /*isWrite=*/true);

    indent() << "mlir_aie_release_lock(_xaie, " << tile.col() << ", "
             << tile.row() << ", 15, 0, 0);\n";
    reduceIndent();
    indent() << "}\n";
  }

  reduceIndent();
  indent() << "}\n\n";

  if (!dryRunHostKernel) {
    // Write back results from local to global memory.
    for (auto memCpy : stores)
      emitMemCpy(memCpy, argIdxMap[memCpy.target()], /*isWrite=*/false);
  }

  os << R"XXX(
  printf("Complete compute.\n");
)XXX";

  os << "}\n";
}

LogicalResult polyaie::exportHostKernel(ModuleOp module, raw_ostream &os) {
  ExporterState state(os);
  HostKernelExporter(state).exportHostKernel(module);
  return failure(state.encounteredError);
}

void polyaie::registerExportHostKernel() {
  static TranslateFromMLIRRegistration registration(
      "export-host-kernel", exportHostKernel, [&](DialectRegistry &registry) {
        polyaie::registerAllDialects(registry);
      });
}

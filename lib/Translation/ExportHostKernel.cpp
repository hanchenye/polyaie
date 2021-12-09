//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "aie/AIEDialect.h"
#include "mlir/Translation.h"
#include "polyaie/Exporters.h"
#include "polyaie/InitAllDialects.h"
#include "polyaie/Utils.h"

using namespace mlir;
using namespace polyaie;
using namespace memrefext;
using namespace xilinx::AIE;

static llvm::cl::opt<bool>
    debugHostKernel("debug-host-kernel",
                    llvm::cl::desc("run the host kernel in debug mode"),
                    llvm::cl::init(false));

static llvm::cl::opt<bool>
    dryRunHostKernel("dry-run-host-kernel",
                     llvm::cl::desc("run the host kernel without real data"),
                     llvm::cl::init(false));

namespace {
class HostKernelExporter : public ExporterBase {
public:
  explicit HostKernelExporter(ExporterState &state) : ExporterBase(state) {}
  void exportHostKernel(ModuleOp mod);
  void emitMemCpy(memrefext::MemCpyOp memCpy, unsigned argIdx, Value arg,
                  Value buf, bool isWrite);
};
} // namespace

void HostKernelExporter::emitMemCpy(memrefext::MemCpyOp memCpy, unsigned argIdx,
                                    Value arg, Value buf, bool isWrite) {
  auto bufType = buf.getType().dyn_cast<MemRefType>();
  auto bufName = buf.getDefiningOp<BufferOp>().name().getValue();
  auto bufRank = bufType.getRank();
  auto bufOffsets = isWrite ? memCpy.sourceOffsets() : memCpy.targetOffsets();

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
  for (auto tile : mod.getOps<TileOp>())
    if (tile.getCoreOp())
      tiles.push_back(tile);
  os << "\n";

  // Collect memory copy operations.
  DenseMap<Operation *, SmallVector<memrefext::MemCpyOp, 8>> loadsMap;
  DenseMap<Operation *, SmallVector<memrefext::MemCpyOp, 8>> storesMap;
  SmallPtrSet<Value, 2> resultMems;

  for (auto memCpy : mod.getOps<memrefext::MemCpyOp>())
    if (memCpy.source().getDefiningOp<memref::AllocOp>()) {
      auto tile = memCpy.target().getDefiningOp<BufferOp>().getTileOp();
      loadsMap[tile].push_back(memCpy);

    } else if (memCpy.target().getDefiningOp<memref::AllocOp>()) {
      auto tile = memCpy.source().getDefiningOp<BufferOp>().getTileOp();
      storesMap[tile].push_back(memCpy);
      resultMems.insert(memCpy.target());
    }

  if (!dryRunHostKernel) {
    // Clear the local memory of all tiles.
    for (auto tile : tiles)
      indent() << "mlir_aie_clear_tile_memory(_xaie, " << tile.col() << ", "
               << tile.row() << ");\n";
    os << "\n";

    // Initialize local memories.
    indent() << "unsigned bufIdx;\n\n";
    for (auto tile : tiles)
      for (auto memCpy : loadsMap[tile])
        emitMemCpy(memCpy, argIdxMap[memCpy.source()], memCpy.source(),
                   memCpy.target(), /*isWrite=*/true);
  }

  // Create counters and start the execution.
  indent() << "unsigned counters[" << tiles.size() << "];\n";

  os << R"XXX(
  auto kernel_complete = [&]() {
    for (auto counter : counters)
      if (counter < iter_num)
        return false;
    return true;
  };

  for (auto &counter : counters)
    counter = 0;


  printf("Start cores...\n");
  mlir_aie_start_cores(_xaie);

)XXX";

  // Iterate for iter_num times.
  indent() << "while(!kernel_complete()) {\n";
  addIndent();

  unsigned tileIdx = 0;
  for (auto tile : tiles) {
    indent() << "if (mlir_aie_acquire_lock(_xaie, " << tile.col() << ", "
             << tile.row() << ", 15, 1, 0)) {\n";
    addIndent();

    indent() << "if (++counters[" << tileIdx++ << "] < iter_num) {\n";
    addIndent();

    if (!dryRunHostKernel)
      for (auto memCpy : loadsMap[tile])
        if (resultMems.count(memCpy.source()))
          emitMemCpy(memCpy, argIdxMap[memCpy.source()], memCpy.source(),
                     memCpy.target(), /*isWrite=*/true);

    indent() << "mlir_aie_release_lock(_xaie, " << tile.col() << ", "
             << tile.row() << ", 15, 0, 0);\n";
    reduceIndent();
    indent() << "}\n";

    if (debugHostKernel)
      indent() << "printf(\"[" << tile.col() << "][" << tile.row()
               << "]=1, \");\n";
    reduceIndent();

    if (debugHostKernel)
      indent() << "} else printf(\"[" << tile.col() << "][" << tile.row()
               << "]=0, \");\n";
    else
      indent() << "}\n";
  }

  if (debugHostKernel)
    indent() << "printf(\"\\n--------------------\\n\");\n";
  reduceIndent();
  indent() << "}\n\n";

  if (!dryRunHostKernel) {
    // Write back results from local to global memory.
    for (auto tile : tiles)
      for (auto memCpy : storesMap[tile])
        emitMemCpy(memCpy, argIdxMap[memCpy.target()], memCpy.target(),
                   memCpy.source(), /*isWrite=*/false);
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

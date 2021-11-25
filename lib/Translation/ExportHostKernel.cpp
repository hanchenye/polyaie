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
  auto bufOffsets = getBufferOffsets(bufType);

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
      auto offset = bufOffsets[ivIdx];
      if (offset)
        os << " + " << offset << "]";
      else
        os << "]";
    }
  };

  // Generate the loop body.
  if (isWrite) {
    indent() << "mlir_write_buffer_" << bufName << "("
             << (bufRank ? "bufIdx++" : "0") << ", ";
    emitArgValue();
    os << ");\n\n";
  } else {
    indent();
    emitArgValue();
    os << " = mlir_read_buffer_" << bufName << "("
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

#define XAIE_NUM_ROWS 8
#define XAIE_NUM_COLS 50
#define XAIE_ADDR_ARRAY_OFF 0x800

#define LOCK_TIMEOUT 100

#define HIGH_ADDR(addr) ((addr & 0xffffffff00000000) >> 32)
#define LOW_ADDR(addr) (addr & 0x00000000ffffffff)

#define MLIR_STACK_OFFSET 4096

namespace {
XAieGbl_Config *AieConfigPtr;
XAieGbl AieInst;
XAieGbl_HwCfg AieConfig;
XAieGbl_Tile TileInst[XAIE_NUM_COLS][XAIE_NUM_ROWS + 1];
XAieDma_Tile TileDMAInst[XAIE_NUM_COLS][XAIE_NUM_ROWS + 1];

#include "aie_inc.cpp"
} // namespace

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
    if (alloc != allocs.back())
      os << ",\n";
    else
      os << ") {\n";
  }

  // Generate the kernel body.
  os << R"XXX(
  printf("Configure AIE array...\n");

  size_t aie_base = XAIE_ADDR_ARRAY_OFF << 14;
  XAIEGBL_HWCFG_SET_CONFIG((&AieConfig), XAIE_NUM_ROWS, XAIE_NUM_COLS,
                           XAIE_ADDR_ARRAY_OFF);
  XAieGbl_HwInit(&AieConfig);
  AieConfigPtr = XAieGbl_LookupConfig(XPAR_AIE_DEVICE_ID);
  XAieGbl_CfgInitialize(&AieInst, &TileInst[0][0], AieConfigPtr);

  mlir_configure_cores();
  mlir_configure_switchboxes();
  mlir_configure_dmas();
  mlir_initialize_locks();


  printf("Initialize buffers...\n");

)XXX";

  // Clear the local memory of all tiles.
  SmallVector<TileOp, 32> tiles;
  for (auto tile : mod.getOps<TileOp>()) {
    if (tile.getCoreOp()) {
      indent() << "ACDC_clear_tile_memory(TileInst[" << tile.col() << "]["
               << tile.row() << "]);\n";
      tiles.push_back(tile);
    }
  }
  os << "\n";

  // Collect memory copy operations.
  SmallVector<memrefext::MemCpyOp, 32> loads;
  SmallVector<memrefext::MemCpyOp, 32> stores;
  for (auto memCpy : mod.getOps<memrefext::MemCpyOp>())
    if (memCpy.source().getDefiningOp<memref::AllocOp>())
      loads.push_back(memCpy);
    else if (memCpy.target().getDefiningOp<memref::AllocOp>())
      stores.push_back(memCpy);

  // Initialize local memories.
  indent() << "unsigned bufIdx;\n\n";
  for (auto memCpy : loads)
    emitMemCpy(memCpy, argIdxMap[memCpy.source()], memCpy.source(),
               memCpy.target(), /*isWrite=*/true);

  // Start the execution.
  os << R"XXX(
  printf("Start cores...\n");
  mlir_start_cores();

)XXX";

  // Check the completion of the program.
  // TODO: Make this more robust.
  for (auto memCpy : stores) {
    auto buf = memCpy.source().getDefiningOp<BufferOp>();
    auto tile = buf.getTileOp();
    indent() << "while (!XAieTile_LockAcquire(&(TileInst[" << tile.col() << "]["
             << tile.row() << "]), 15, 1, LOCK_TIMEOUT)) {}\n";
  }
  os << "\n";

  // Write back results from local to global memory.
  for (auto memCpy : stores)
    emitMemCpy(memCpy, argIdxMap[memCpy.target()], memCpy.target(),
               memCpy.source(), /*isWrite=*/false);

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

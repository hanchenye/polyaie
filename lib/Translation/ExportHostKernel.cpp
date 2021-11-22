//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "aie/AIEDialect.h"
#include "mlir/Translation.h"
#include "polyaie/Exporters.h"
#include "polyaie/InitAllDialects.h"

using namespace mlir;
using namespace polyaie;
using namespace memrefext;
using namespace xilinx::AIE;

namespace {
class HostKernelExporter : public ExporterBase {
public:
  explicit HostKernelExporter(ExporterState &state) : ExporterBase(state) {}
  void exportHostKernel(ModuleOp mod);
};
} // namespace

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
  SmallVector<TileOp, 32> tiles(mod.getOps<TileOp>());
  for (auto tile : tiles)
    indent() << "ACDC_clear_tile_memory(TileInst[" << tile.col() << "]["
             << tile.row() << "];\n";
  indent() << "\n";

  // Initialize local memories.
  for (auto memCpy : mod.getOps<memrefext::MemCpyOp>())
    if (memCpy.source().getDefiningOp<memref::AllocOp>()) {
      auto arg = memCpy.source();
      auto buf = memCpy.target();
      auto bufType = buf.getType().dyn_cast<MemRefType>();
      auto bufName = buf.getDefiningOp<BufferOp>().name().getValue();
      auto bufRank = bufType.getRank();

      // Generate the loop head.
      if (bufRank)
        indent() << "unsigned " << bufName << "_idx = 0;\n";
      unsigned ivIdx = 0;
      for (auto dimSize : bufType.getShape()) {
        auto ivName = "idx" + std::to_string(ivIdx++);
        indent() << "for (int64_t " << ivName << " = 0; " << ivName << " < "
                 << dimSize << "; ++" << ivName << ") {\n";
        addIndent();
      }

      // Generate the loop body.
      indent() << "mlir_write_buffer_" << bufName << "(";
      if (bufRank)
        os << bufName << "_idx++";
      else
        os << "0";
      os << ", arg" << argIdxMap[arg];
      for (ivIdx = 0; ivIdx < bufRank; ++ivIdx) {
        reduceIndent();
        os << "[idx" << ivIdx << "]";
      }
      os << ");\n";

      indent() << "\n";
    }

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

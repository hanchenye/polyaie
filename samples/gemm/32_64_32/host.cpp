
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

#define HIGH_ADDR(addr) ((addr & 0xffffffff00000000) >> 32)
#define LOW_ADDR(addr) (addr & 0x00000000ffffffff)
#define MLIR_STACK_OFFSET 4096

#include "aie_inc.cpp"

void gemm(float arg0[32][32], float arg1[32][64], float arg2[64][32],
          unsigned iter_num = 1) {

  printf("Configure AIE array...\n");

  aie_libxaie_ctx_t *_xaie = mlir_aie_init_libxaie();
  mlir_aie_init_device(_xaie);

  mlir_aie_configure_cores(_xaie);
  mlir_aie_configure_switchboxes(_xaie);
  mlir_aie_initialize_locks(_xaie);
  mlir_aie_configure_dmas(_xaie);

  printf("Initialize buffers...\n");

  int fd = open("/dev/mem", O_RDWR | O_SYNC);
  assert(fd != -1 && "memory is not available");

  mlir_aie_clear_tile_memory(_xaie, 0, 0);
  mlir_aie_clear_tile_memory(_xaie, 26, 2);
  mlir_aie_clear_tile_memory(_xaie, 26, 3);

  unsigned bufIdx;

  float *buf0_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x4000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf0_ptr[bufIdx++] = arg1[idx0][idx1 + 32];

  float *buf1_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x5000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf1_ptr[bufIdx++] = arg2[idx0 + 32][idx1];

  float *buf2_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x6000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf2_ptr[bufIdx++] = arg1[idx0][idx1];

  float *buf3_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x7000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf3_ptr[bufIdx++] = arg2[idx0][idx1];

  bool results[1];

  for (auto &result : results)
    result = false;

  auto kernel_complete = [&]() {
    bool flag = true;
    for (auto result : results) {
      flag &= result;
      // printf("%d ", result);
    }
    // printf("\n");
    return flag;
  };

  printf("Start cores...\n");
  mlir_aie_start_cores(_xaie);

  mlir_aie_release_lock(_xaie, 26, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 26, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 26, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 26, 0, 3, 1, 0);

  while (!kernel_complete()) {
    if (mlir_aie_acquire_lock(_xaie, 26, 3, 15, 1, 0))
      results[0] = true;
  }

  float *buf4_ptr =
      (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x8000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0] = buf4_ptr[bufIdx++];

  mlir_aie_deinit_libxaie(_xaie);

  printf("Complete compute.\n");
}


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

void gemm(float arg0[96][96], float arg1[96][96], float arg2[96][96],
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
  mlir_aie_clear_tile_memory(_xaie, 10, 2);
  mlir_aie_clear_tile_memory(_xaie, 10, 3);
  mlir_aie_clear_tile_memory(_xaie, 10, 4);
  mlir_aie_clear_tile_memory(_xaie, 11, 2);
  mlir_aie_clear_tile_memory(_xaie, 11, 3);
  mlir_aie_clear_tile_memory(_xaie, 11, 4);
  mlir_aie_clear_tile_memory(_xaie, 12, 2);
  mlir_aie_clear_tile_memory(_xaie, 12, 3);
  mlir_aie_clear_tile_memory(_xaie, 12, 4);
  mlir_aie_clear_tile_memory(_xaie, 13, 2);
  mlir_aie_clear_tile_memory(_xaie, 13, 3);
  mlir_aie_clear_tile_memory(_xaie, 13, 4);
  mlir_aie_clear_tile_memory(_xaie, 14, 2);
  mlir_aie_clear_tile_memory(_xaie, 14, 3);
  mlir_aie_clear_tile_memory(_xaie, 14, 4);
  mlir_aie_clear_tile_memory(_xaie, 15, 2);
  mlir_aie_clear_tile_memory(_xaie, 15, 3);
  mlir_aie_clear_tile_memory(_xaie, 15, 4);
  mlir_aie_clear_tile_memory(_xaie, 16, 2);
  mlir_aie_clear_tile_memory(_xaie, 16, 3);
  mlir_aie_clear_tile_memory(_xaie, 16, 4);
  mlir_aie_clear_tile_memory(_xaie, 17, 2);
  mlir_aie_clear_tile_memory(_xaie, 17, 3);
  mlir_aie_clear_tile_memory(_xaie, 17, 4);
  mlir_aie_clear_tile_memory(_xaie, 18, 2);
  mlir_aie_clear_tile_memory(_xaie, 18, 3);
  mlir_aie_clear_tile_memory(_xaie, 18, 4);

  unsigned bufIdx;

  float *buf0_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x4000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf0_ptr[bufIdx++] = arg1[idx0][idx1 + 64];

  float *buf1_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x5000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf1_ptr[bufIdx++] = arg2[idx0 + 64][idx1];

  float *buf2_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x6000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf2_ptr[bufIdx++] = arg1[idx0][idx1 + 32];

  float *buf3_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x7000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf3_ptr[bufIdx++] = arg2[idx0 + 32][idx1];

  float *buf4_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x8000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf4_ptr[bufIdx++] = arg1[idx0][idx1];

  float *buf5_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x9000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf5_ptr[bufIdx++] = arg2[idx0][idx1];

  float *buf14_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xA000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf14_ptr[bufIdx++] = arg1[idx0 + 64][idx1 + 64];

  float *buf15_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xB000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf15_ptr[bufIdx++] = arg1[idx0 + 64][idx1 + 32];

  float *buf16_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xC000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf16_ptr[bufIdx++] = arg1[idx0 + 64][idx1];

  float *buf17_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xD000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf17_ptr[bufIdx++] = arg1[idx0 + 32][idx1 + 64];

  float *buf18_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xE000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf18_ptr[bufIdx++] = arg1[idx0 + 32][idx1 + 32];

  float *buf19_ptr =
      (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xF000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf19_ptr[bufIdx++] = arg1[idx0 + 32][idx1];

  float *buf20_ptr = (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x10000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf20_ptr[bufIdx++] = arg2[idx0 + 64][idx1 + 64];

  float *buf21_ptr = (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x11000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf21_ptr[bufIdx++] = arg2[idx0 + 32][idx1 + 64];

  float *buf22_ptr = (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x12000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf22_ptr[bufIdx++] = arg2[idx0][idx1 + 64];

  float *buf23_ptr = (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x13000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf23_ptr[bufIdx++] = arg2[idx0 + 64][idx1 + 32];

  float *buf24_ptr = (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x14000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf24_ptr[bufIdx++] = arg2[idx0 + 32][idx1 + 32];

  float *buf25_ptr = (float *)mmap(NULL, 4096, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x15000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 32; ++idx0)
    for (int64_t idx1 = 0; idx1 < 32; ++idx1)
      buf25_ptr[bufIdx++] = arg2[idx0][idx1 + 32];

  bool results[9];

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

  mlir_aie_release_lock(_xaie, 10, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 3, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 4, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 4, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 3, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 4, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 3, 1, 0);

  while (!kernel_complete()) {
    if (mlir_aie_acquire_lock(_xaie, 10, 4, 15, 1, 0))
      results[0] = true;
    if (mlir_aie_acquire_lock(_xaie, 11, 4, 15, 1, 0))
      results[1] = true;
    if (mlir_aie_acquire_lock(_xaie, 12, 4, 15, 1, 0))
      results[2] = true;
    if (mlir_aie_acquire_lock(_xaie, 13, 4, 15, 1, 0))
      results[3] = true;
    if (mlir_aie_acquire_lock(_xaie, 14, 4, 15, 1, 0))
      results[4] = true;
    if (mlir_aie_acquire_lock(_xaie, 15, 4, 15, 1, 0))
      results[5] = true;
    if (mlir_aie_acquire_lock(_xaie, 16, 4, 15, 1, 0))
      results[6] = true;
    if (mlir_aie_acquire_lock(_xaie, 17, 4, 15, 1, 0))
      results[7] = true;
    if (mlir_aie_acquire_lock(_xaie, 18, 4, 15, 1, 0))
      results[8] = true;
  }

  float *buf6_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                  MAP_SHARED, fd, 0x16000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0] = buf6_ptr[bufIdx++];

  float *buf7_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                  MAP_SHARED, fd, 0x18000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0] = buf7_ptr[bufIdx++];

  float *buf8_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                  MAP_SHARED, fd, 0x1A000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0] = buf8_ptr[bufIdx++];

  float *buf9_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                  MAP_SHARED, fd, 0x1C000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0 + 32] = buf9_ptr[bufIdx++];

  float *buf10_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x1E000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0 + 32] = buf10_ptr[bufIdx++];

  float *buf11_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x20000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0 + 32] = buf11_ptr[bufIdx++];

  float *buf12_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x22000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0 + 64] = buf12_ptr[bufIdx++];

  float *buf13_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x24000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0 + 64] = buf13_ptr[bufIdx++];

  float *buf26_ptr = (float *)mmap(NULL, 4100, PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0x26000);
  bufIdx = 0;
  for (int64_t idx0 = 0; idx0 < 1025; ++idx0)
    arg0[idx0 + 64] = buf26_ptr[bufIdx++];

  mlir_aie_deinit_libxaie(_xaie);

  printf("Complete compute.\n");
}
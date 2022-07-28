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
#define MAP_SIZE 16UL
#define MAP_MASK (MAP_SIZE - 1)

void devmemRW32(uint32_t address, uint32_t value, bool write) {
  int fd;
  uint32_t *map_base;
  uint32_t read_result;
  uint32_t offset = address - 0xF70A0000;

  if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1)
    printf("ERROR!!!! open(devmem)\n");
  printf("\n/dev/mem opened.\n");
  fflush(stdout);

  map_base = (uint32_t *)mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
                              fd, 0xF70A0000);
  if (map_base == (void *)-1)
    printf("ERROR!!!! map_base\n");
  printf("Memory mapped at address %p.\n", map_base);
  fflush(stdout);

  read_result = map_base[uint32_t(offset / 4)];
  printf("Value at address 0x%X: 0x%X\n", address, read_result);
  fflush(stdout);

  if (write) {
    map_base[uint32_t(offset / 4)] = value;
    // msync(map_base, MAP_SIZE, MS_SYNC);
    read_result = map_base[uint32_t(offset / 4)];
    printf("Written 0x%X; readback 0x%X\n", value, read_result);
    fflush(stdout);
  }

  // msync(map_base, MAP_SIZE, MS_SYNC);
  if (munmap(map_base, MAP_SIZE) == -1)
    printf("ERROR!!!! unmap_base\n");
  printf("/dev/mem closed.\n");
  fflush(stdout);
  close(fd);
}

int main(int argc, char *argv[]) {
  devmemRW32(0xF70A000C, 0xF9E8D7C6, true);
  devmemRW32(0xF70A0000, 0x04000000, true);
  devmemRW32(0xF70A0004, 0x040381B1, true);
  devmemRW32(0xF70A0000, 0x04000000, true);
  devmemRW32(0xF70A0004, 0x000381B1, true);
  devmemRW32(0xF70A000C, 0x12341234, true);
  printf("test start.\n");

  aie_libxaie_ctx_t *_xaie = mlir_aie_init_libxaie();
  mlir_aie_init_device(_xaie);

  u32 sleep_u = 100000;
  usleep(sleep_u);
  printf("before configure cores.\n");

  mlir_aie_configure_cores(_xaie);

  usleep(sleep_u);
  printf("before configure sw.\n");

  mlir_aie_configure_switchboxes(_xaie);

  usleep(sleep_u);
  printf("before DMA config\n");

  mlir_aie_configure_dmas(_xaie);
  mlir_aie_initialize_locks(_xaie);
  int errors = 0;

  printf("Initialize buffers...\n");

  int fd = open("/dev/mem", O_RDWR | O_SYNC);
  assert(fd != -1 && "memory is not available");

  mlir_aie_clear_tile_memory(_xaie, 10, 2);
  mlir_aie_clear_tile_memory(_xaie, 10, 3);
  mlir_aie_clear_tile_memory(_xaie, 10, 4);
  mlir_aie_clear_tile_memory(_xaie, 11, 2);
  mlir_aie_clear_tile_memory(_xaie, 11, 3);
  mlir_aie_clear_tile_memory(_xaie, 11, 4);
  mlir_aie_clear_tile_memory(_xaie, 12, 2);
  mlir_aie_clear_tile_memory(_xaie, 12, 3);
  mlir_aie_clear_tile_memory(_xaie, 12, 4);

#define DMA_COUNT 1024
  int *mem_ptr0 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x4000);
  int *mem_ptr1 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x5000);
  int *mem_ptr2 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x6000);
  int *mem_ptr3 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x7000);
  int *mem_ptr4 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x8000);
  int *mem_ptr5 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x9000);
  int *mem_ptr6 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xA000);
  int *mem_ptr7 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xB000);
  int *mem_ptr8 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xC000);
  int *mem_ptr9 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xD000);
  int *mem_ptr10 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xE000);
  int *mem_ptr11 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xF000);
  int *mem_ptr12 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x10000);
  int *mem_ptr13 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x12000);
  int *mem_ptr14 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x14000);
  for (int i = 0; i < DMA_COUNT + 1; i++) {
    if (i == 0) {
      *(mem_ptr12 + i) = 3;
      *(mem_ptr13 + i) = 3;
      *(mem_ptr14 + i) = 3;
    } else {
      *(mem_ptr0 + i - 1) = 1;
      *(mem_ptr1 + i - 1) = 1;
      *(mem_ptr2 + i - 1) = 1;
      *(mem_ptr3 + i - 1) = 1;
      *(mem_ptr4 + i - 1) = 1;
      *(mem_ptr5 + i - 1) = 1;
      *(mem_ptr6 + i - 1) = 1;
      *(mem_ptr7 + i - 1) = 1;
      *(mem_ptr8 + i - 1) = 1;
      *(mem_ptr9 + i - 1) = 1;
      *(mem_ptr10 + i - 1) = 1;
      *(mem_ptr11 + i - 1) = 1;
      *(mem_ptr12 + i) = 3;
      *(mem_ptr13 + i) = 3;
      *(mem_ptr14 + i) = 3;
    }
  }

  usleep(sleep_u);

  printf("Start cores...\n");
  mlir_aie_start_cores(_xaie);

  mlir_aie_release_lock(_xaie, 10, 0, 3, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 4, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 3, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 4, 1, 0);

  usleep(sleep_u);

  // mlir_aie_print_tile_status(_xaie, 26, 2);
  // mlir_aie_print_tile_status(_xaie, 26, 3);

  int tries1 = 1;
  while ((tries1 < 1000) && (!mlir_aie_acquire_lock(_xaie, 10, 4, 15, 1, 0))) {
    tries1++;
  }
  printf("It took %d tries1.\n", tries1);

  for (int idx0 = 0; idx0 < 1025; ++idx0) {
    if (idx0 == 0) {
      printf("External memory1[0]=%x\n", mem_ptr14[0]);
    } else if (mem_ptr14[idx0] != 96) {
      printf("External memory1[%d]=%d\n", idx0, mem_ptr14[idx0]);
      errors++;
    }
  }

  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf15(_xaie, 0),
                 32, errors);
  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf16(_xaie, 0),
                 1, errors);
  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf17(_xaie, 0),
                 1, errors);
  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf19(_xaie, 0),
                 64, errors);
  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf40(_xaie, 0),
                 1, errors);

  int res = 0;
  if (!errors) {
    printf("PASS!\n");
    res = 0;
  } else {
    printf("Fail!\n");
    res = -1;
  }
  mlir_aie_deinit_libxaie(_xaie);

  printf("test done.\n");

  return res;
}
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
  // mlir_aie_initialize_locks(_xaie);
  mlir_aie_configure_dmas(_xaie);

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

  // mlir_aie_init_mems(_xaie, 1);

#define DMA_COUNT 1024
  // int *mem_ptr0 = (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED,
  // fd, 0x020100000000); int *mem_ptr1 = (int *)mmap(NULL, 4100, PROT_READ |
  // PROT_WRITE, MAP_SHARED, fd, 0x020100001000); int *mem_ptr2 = (int
  // *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x020100003000);
  // int *mem_ptr3 = (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED,
  // fd, 0x020100005000);

  // for (int i = 0; i < DMA_COUNT+1; i++) {
  //     if (i==0){
  //         *(mem_ptr1 + i) = 3;
  //         *(mem_ptr2 + i) = 3;
  //         *(mem_ptr3 + i) = 3;
  //     }
  //     else{
  //         *(mem_ptr0 + i-1) = 1;
  //         *(mem_ptr1 + i) = 3;
  //         *(mem_ptr2 + i) = 3;
  //         *(mem_ptr3 + i) = 3;
  //     }
  // }

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
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x10000);
  int *mem_ptr13 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x11000);
  int *mem_ptr14 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x12000);
  int *mem_ptr15 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x13000);
  int *mem_ptr16 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x14000);
  int *mem_ptr17 =
      (int *)mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x15000);
  int *mem_ptr18 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x16000);
  int *mem_ptr19 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x18000);
  int *mem_ptr20 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x1A000);
  int *mem_ptr21 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x1C000);
  int *mem_ptr22 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x1E000);
  int *mem_ptr23 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x20000);
  int *mem_ptr24 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x22000);
  int *mem_ptr25 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x24000);
  int *mem_ptr26 =
      (int *)mmap(NULL, 4100, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x26000);

  for (int i = 0; i < DMA_COUNT + 1; i++) {
    if (i == 0) {
      *(mem_ptr18 + i) = 3;
      *(mem_ptr19 + i) = 3;
      *(mem_ptr20 + i) = 3;
      *(mem_ptr21 + i) = 3;
      *(mem_ptr22 + i) = 3;
      *(mem_ptr23 + i) = 3;
      *(mem_ptr24 + i) = 3;
      *(mem_ptr25 + i) = 3;
      *(mem_ptr26 + i) = 3;
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
      *(mem_ptr12 + i - 1) = 1;
      *(mem_ptr13 + i - 1) = 1;
      *(mem_ptr14 + i - 1) = 1;
      *(mem_ptr15 + i - 1) = 1;
      *(mem_ptr16 + i - 1) = 1;
      *(mem_ptr17 + i - 1) = 1;
      *(mem_ptr18 + i) = 3;
      *(mem_ptr19 + i) = 3;
      *(mem_ptr20 + i) = 3;
      *(mem_ptr21 + i) = 3;
      *(mem_ptr22 + i) = 3;
      *(mem_ptr23 + i) = 3;
      *(mem_ptr24 + i) = 3;
      *(mem_ptr25 + i) = 3;
      *(mem_ptr26 + i) = 3;
    }
  }

  usleep(sleep_u);

  for (int col = 10; col < 19; col++) {
    for (int row = 2; row < 5; row++) {
      for (int lock_num = 0; lock_num < row; lock_num++) {
        mlir_aie_release_lock(_xaie, col, row, lock_num, 0, 0);
      }
    }
  }

  usleep(sleep_u);
  mlir_aie_print_tile_status(_xaie, 10, 2);
  mlir_aie_print_tile_status(_xaie, 10, 3);
  mlir_aie_print_tile_status(_xaie, 10, 4);
  mlir_aie_print_tile_status(_xaie, 11, 2);
  mlir_aie_print_tile_status(_xaie, 11, 3);
  mlir_aie_print_tile_status(_xaie, 11, 4);

  usleep(sleep_u);
  printf("Start cores...\n");
  mlir_aie_start_cores(_xaie);

  mlir_aie_release_lock(_xaie, 10, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 3, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 4, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 10, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 3, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 4, 1, 0);
  mlir_aie_release_lock(_xaie, 18, 0, 0, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 4, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 2, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 3, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 5, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 1, 1, 0);
  mlir_aie_release_lock(_xaie, 11, 0, 0, 1, 0);

  usleep(sleep_u);

  mlir_aie_print_tile_status(_xaie, 10, 2);
  mlir_aie_print_tile_status(_xaie, 10, 3);
  mlir_aie_print_tile_status(_xaie, 10, 4);
  mlir_aie_print_tile_status(_xaie, 11, 2);
  mlir_aie_print_tile_status(_xaie, 11, 3);
  mlir_aie_print_tile_status(_xaie, 11, 4);

  // int tries1 = 1;
  // while ((tries1 < 1000) && (!mlir_aie_acquire_lock(_xaie, 10, 4, 15, 1,
  // 10000))) {
  //   tries1++;
  // }
  // printf("It took %d tries1.\n", tries1);

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

  // for (int idx0 = 0; idx0 < 1024; ++idx0){
  //  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf35(_xaie,
  //  idx0), 1,
  //                 errors);
  //  if(errors==1)
  //   printf("buf35[%d]\n",idx0);
  // }

  for (int idx0 = 0; idx0 < 1025; ++idx0) {
    if (idx0 == 0) {
      printf("External memory1[0]=%x\n", mem_ptr18[0]);
    } else if (mem_ptr18[idx0] != 96) {
      printf("External memory1[%d]=%d\n", idx0, mem_ptr18[idx0]);
      errors++;
    }
  }

  if (!errors) {

    for (int idx0 = 0; idx0 < 1025; ++idx0) {
      if (idx0 == 0) {
        printf("External memory2[0]=%x\n", mem_ptr19[0]);
      } else if (mem_ptr19[idx0] != 96) {
        printf("External memory2[%d]=%d\n", idx0, mem_ptr19[idx0]);
        errors++;
      }
    }
  }

  if (!errors) {
    for (int idx0 = 0; idx0 < 1025; ++idx0) {
      if (idx0 == 0) {
        printf("External memory3[0]=%x\n", mem_ptr20[0]);
      } else if (mem_ptr20[idx0] != 96) {
        printf("External memory3[%d]=%d\n", idx0, mem_ptr20[idx0]);
        errors++;
      }
    }
  }

  if (!errors) {
    for (int idx0 = 0; idx0 < 1025; ++idx0) {
      if (idx0 == 0) {
        printf("External memory4[0]=%x\n", mem_ptr21[0]);
      } else if (mem_ptr21[idx0] != 96) {
        printf("External memory4[%d]=%d\n", idx0, mem_ptr21[idx0]);
        errors++;
      }
    }
  }

  if (!errors) {
    for (int idx0 = 0; idx0 < 1025; ++idx0) {
      if (idx0 == 0) {
        printf("External memory1[0]=%x\n", mem_ptr22[0]);
      } else if (mem_ptr22[idx0] != 96) {
        printf("External memory1[%d]=%d\n", idx0, mem_ptr22[idx0]);
        errors++;
      }
    }
  }

  // for (int idx0 = 0; idx0 < 1024; ++idx0){
  //   mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf38(_xaie,
  //   idx0), 1,
  //                  errors);
  //   printf("buf38[%d]\n",idx0);
  // }

  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf35(_xaie, 1),
                 1, errors);
  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf38(_xaie, 1),
                 1, errors);
  mlir_aie_check("Before release lock:", mlir_aie_read_buffer_buf48(_xaie, 1),
                 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf28(_xaie, 1022), 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf38(_xaie, 1022), 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf48(_xaie, 1022), 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf35(_xaie, 1023), 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf29(_xaie, 1023), 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf28(_xaie, 1023), 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf38(_xaie, 1023), 1, errors);
  mlir_aie_check("Before release lock:",
                 mlir_aie_read_buffer_buf48(_xaie, 1023), 1, errors);

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
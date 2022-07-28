/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */
/* gemm.c: this file is part of PolyBench/C */

#include "gemm.host.cpp"

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

/* Include polybench common header. */
#include "polybench.h"

/* Include benchmark-specific header. */
#include "gemm.h"

/* Array initialization. */

void init_array(int ni, int nj, int nk, DATA_TYPE *alpha, DATA_TYPE *beta,
                DATA_TYPE POLYBENCH_2D(C, NI, NJ, ni, nj),
                DATA_TYPE POLYBENCH_2D(A, NI, NK, ni, nk),
                DATA_TYPE POLYBENCH_2D(B, NK, NJ, nk, nj)) {
  int i, j;

  *alpha = 2; /* 1.5; */
  *beta = 1;  /* 1.2; */
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C[i][j] = 0.0;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (DATA_TYPE)(i * (j + 1) % 10); /* nk) / nk; */
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (DATA_TYPE)(i * (j + 2) % 10); /* nj) / nj; */
}

/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */

void print_array(int ni, int nj, DATA_TYPE POLYBENCH_2D(C, NI, NJ, ni, nj)) {
  int i, j;

  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("C");
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      if ((i * ni + j) % 20 == 0)
        fprintf(POLYBENCH_DUMP_TARGET, "\n");
      fprintf(POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, C[i][j]);
    }
  POLYBENCH_DUMP_END("C");
  POLYBENCH_DUMP_FINISH;
}

/* Main computational kernel. The whole function will be timed,
   including the call and return. */

void kernel_gemm(int ni, int nj, int nk,
                 DATA_TYPE POLYBENCH_2D(C, NI, NJ, ni, nj),
                 DATA_TYPE POLYBENCH_2D(A, NI, NK, ni, nk),
                 DATA_TYPE POLYBENCH_2D(B, NK, NJ, nk, nj)) {
  int i, j, k;

#pragma scop
  for (i = 0; i < _PB_NI; i++) {
    for (k = 0; k < _PB_NK; k++) {
      for (j = 0; j < _PB_NJ; j++)
        C[i][j] += A[i][k] * B[k][j];
    }
  }
#pragma endscop
}

int main(int argc, char **argv) {
  /* Retrieve problem size. */
  int ni = NI;
  int nj = NJ;
  int nk = NK;

  /* Variable declaration/allocation. */
  DATA_TYPE alpha;
  DATA_TYPE beta;
  POLYBENCH_2D_ARRAY_DECL(C, DATA_TYPE, NI, NJ, ni, nj);
  POLYBENCH_2D_ARRAY_DECL(A, DATA_TYPE, NI, NK, ni, nk);
  POLYBENCH_2D_ARRAY_DECL(B, DATA_TYPE, NK, NJ, nk, nj);

  /* Initialize array(s). */
  init_array(ni, nj, nk, &alpha, &beta, POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A),
             POLYBENCH_ARRAY(B));

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  bool run_aie = atoi(argv[1]) == 1;
  unsigned iter_num = atoi(argv[2]);
  if (run_aie) {
    printf("Running on AIE for %d times...\n", iter_num);
    gemm(POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B), iter_num);
  } else {
    printf("Running on ARM CPU for %d times...\n", iter_num);
    for (unsigned i = 0; i < iter_num; ++i)
      kernel_gemm(ni, nj, nk, POLYBENCH_ARRAY(C), POLYBENCH_ARRAY(A),
                  POLYBENCH_ARRAY(B));
  }

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(ni, nj, POLYBENCH_ARRAY(C)));

  /* Be clean. */
  POLYBENCH_FREE_ARRAY(C);
  POLYBENCH_FREE_ARRAY(A);
  POLYBENCH_FREE_ARRAY(B);

  return 0;
}

#include <stdio.h>

extern "C" {
void extern_kernel(float *C, float *B, float *A) {
  for (int i = 0; i < 32; i++)
    for (int k = 0; k < 32; k++)
      for (int j = 0; j < 32; j++)
        C[i * 32 + j] += A[i * 32 + k] * B[k * 32 + j];
}
}

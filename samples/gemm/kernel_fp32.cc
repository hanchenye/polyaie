#define __AIENGINE__ 1
#define NOCPP

#define h1 32
#define w1 32
#define w2 32
const int boundary_i = h1 / 8;
const int boundary_j = w2 / 2;
const int boundary_k = w1 / 8 - 1;
const int judge_i = boundary_i - 1;
const int judge_j = boundary_j - 1;

#include <cardano.h>
#include <stdio.h>

extern "C" {
void extern_kernel(float *acc, float *C, float *A, float *B) {

  input_window_float matAImpl = {(window_datatype *)A, (window_datatype *)A,
                                 (window_datatype *)A, 4096, 1024};
  input_window_float matBImpl = {(window_datatype *)B, (window_datatype *)B,
                                 (window_datatype *)B, 4096, 1024};
  input_window_float accImpl = {(window_datatype *)acc, (window_datatype *)acc,
                                (window_datatype *)acc, 4096, 1024};
  output_window_float matCImpl = {(window_datatype *)C, (window_datatype *)C,
                                  (window_datatype *)C, 4096, 1024};

  input_window_float *matA = &matAImpl;
  input_window_float *matB = &matBImpl;
  input_window_float *acc_in = &accImpl;
  output_window_float *matC = &matCImpl;

  v8float acc0 = null_v8float(); // For first output column
  v8float acc1 = null_v8float(); // For second output column
  v16float buf_matB = undef_v16float();
  v16float buf_matA = undef_v16float();

  buf_matB = upd_v(buf_matB, 0, window_read_v4(matB));
  window_incr(matB, w1);
  buf_matB = upd_v(buf_matB, 1, window_read_v4(matB));
  window_decr(matB, w1 - 4);

  buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
  window_incr(matA, h1);

  for (unsigned int i = 0; i < boundary_i; i++)
    chess_prepare_for_pipelining chess_loop_range(boundary_i, ) {

      for (unsigned int j = 0; j < boundary_j; j++)
        chess_prepare_for_pipelining chess_loop_range(boundary_j, ) {
          int jump = h1;
          if (j == judge_j) {
            if (i == judge_i) {
              jump = 8;
            } else {
              jump = h1 + 8;
            }
          } else {
            jump = h1;
          }
          acc0 = window_read_v8(acc_in);
          window_incr(acc_in, h1);
          acc1 = window_read_v8(acc_in);
          window_incr(acc_in, jump);
          for (unsigned int k = 0; k < boundary_k; k++)
            chess_prepare_for_pipelining chess_loop_range(boundary_k, ) {
              acc0 = fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 0,
                           0x0);
              buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
              window_incr(matA, h1);
              buf_matB = upd_v(buf_matB, 2, window_read_v4(matB));
              window_incr(matB, w1);
              acc1 = fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 4,
                           0x0);
              buf_matB = upd_v(buf_matB, 3, window_read_v4(matB));
              window_decr(matB, w1 - 4);

              acc0 = fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 1,
                           0x0);
              buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
              window_incr(matA, h1);
              acc1 = fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 5,
                           0x0);

              acc0 = fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 2,
                           0x0);
              buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
              window_incr(matA, h1);
              acc1 = fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 6,
                           0x0);

              acc0 = fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 3,
                           0x0);
              buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
              window_incr(matA, h1);
              acc1 = fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 7,
                           0x0);

              ////////////////////////////////////////////////////////////////////////
              acc0 = fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 0,
                           0x0);
              buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
              window_incr(matA, h1);
              acc1 = fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 4,
                           0x0);

              acc0 = fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 1,
                           0x0);
              buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
              window_incr(matA, h1);
              acc1 = fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 5,
                           0x0);

              acc0 = fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 2,
                           0x0);
              buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
              window_incr(matA, h1);
              acc1 = fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 6,
                           0x0);

              acc0 = fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 3,
                           0x0);
              // window_write(matC,srs(acc0,0));
              // window_incr(matC,h1);
              buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
              window_incr(matA, h1);
              buf_matB = upd_v(buf_matB, 0, window_read_v4(matB));
              window_incr(matB, w1);
              acc1 = fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 7,
                           0x0);
              // window_write(matC,srs(acc1,0));
              // window_incr(matC,h1+8);
              buf_matB = upd_v(buf_matB, 1, window_read_v4(matB));
              window_decr(matB, w1 - 4);
            }
          acc0 =
              fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 0, 0x0);
          buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
          window_incr(matA, h1);
          buf_matB = upd_v(buf_matB, 2, window_read_v4(matB));
          window_incr(matB, w1);
          acc1 =
              fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 4, 0x0);
          buf_matB = upd_v(buf_matB, 3, window_read_v4(matB));
          window_incr(matB, 4);

          acc0 =
              fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 1, 0x0);
          buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
          window_incr(matA, h1);
          acc1 =
              fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 5, 0x0);

          acc0 =
              fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 2, 0x0);
          buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
          window_incr(matA, h1);
          acc1 =
              fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 0), 6, 0x0);

          acc0 =
              fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 3, 0x0);
          buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
          window_incr(matA, h1);
          acc1 =
              fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 0), 7, 0x0);

          ////////////////////////////////////////////////////////////////////////
          acc0 =
              fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 0, 0x0);
          buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
          window_incr(matA, h1);
          acc1 =
              fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 4, 0x0);

          acc0 =
              fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 1, 0x0);
          buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
          window_incr(matA, h1);
          acc1 =
              fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 5, 0x0);

          acc0 =
              fpmac(acc0, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 2, 0x0);
          buf_matA = upd_w(buf_matA, 1, window_read_v8(matA));
          window_incr(matA, jump);
          acc1 =
              fpmac(acc1, buf_matA, 0, 0x76543210, ext_w(buf_matB, 1), 6, 0x0);

          acc0 =
              fpmac(acc0, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 3, 0x0);
          window_write(matC, acc0);
          window_incr(matC, h1);
          buf_matA = upd_w(buf_matA, 0, window_read_v8(matA));
          window_incr(matA, h1);
          buf_matB = upd_v(buf_matB, 0, window_read_v4(matB));
          window_incr(matB, w1);
          acc1 =
              fpmac(acc1, buf_matA, 8, 0x76543210, ext_w(buf_matB, 1), 7, 0x0);
          window_write(matC, acc1);
          window_incr(matC, jump);
          buf_matB = upd_v(buf_matB, 1, window_read_v4(matB));
          window_decr(matB, w1 - 4);
        }
    }
}
}

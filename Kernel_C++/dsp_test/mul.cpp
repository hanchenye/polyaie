/**********
Copyright (c) 2019, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/

/*******************************************************************************
Description:
    HLS pragmas can be used to optimize the design : improve throughput, reduce
latency and
    device resource utilization of the resulting RTL code
    This is vector addition example to demonstrate how HLS optimizations are
used in kernel.
*******************************************************************************/
#include <ap_int.h>
#include "kernel_config.h"
#define BUFFER_SIZE 512
#define DATA_SIZE 4096

// TRIPCOUNT identifier
const unsigned int c_len = DATA_SIZE / BUFFER_SIZE;
const unsigned int c_size = BUFFER_SIZE;



extern "C" {
void mul(ap_uint<WIDTH> *in1, // Read-Only Vector 1
          ap_uint<WIDTH> *in2, // Read-Only Vector 2
          ap_uint<WIDTH> *out_r,     // Output Result
          int size                 // Size in integer
          ) {
// Here Vitis kernel contains one s_axilite interface which will be used by host
// application to configure the kernel.
// Here bundle control is defined which is s_axilite interface and associated
// with all the arguments (in1, in2, out_r and size),
// control interface must also be associated with "return".
// All the global memory access arguments must be associated to one m_axi(AXI
// Master Interface). Here all three arguments(in1, in2, out_r) are
// associated to bundle gmem which means that a AXI master interface named
// "gmem" will be created in Kernel and all these variables will be
// accessing global memory through this interface.
// Multiple interfaces can also be created based on the requirements. For
// example when multiple memory accessing arguments need access to
// global memory simultaneously, user can create multiple master interfaces and
// can connect to different arguments.
#pragma HLS INTERFACE m_axi port = in1 offset = slave bundle = gmem
#pragma HLS INTERFACE m_axi port = in2 offset = slave bundle = gmem
#pragma HLS INTERFACE m_axi port = out_r offset = slave bundle = gmem
#pragma HLS INTERFACE s_axilite port = in1 bundle = control
#pragma HLS INTERFACE s_axilite port = in2 bundle = control
#pragma HLS INTERFACE s_axilite port = out_r bundle = control
#pragma HLS INTERFACE s_axilite port = size bundle = control
#pragma HLS INTERFACE s_axilite port = return bundle = control

  ap_uint<WIDTH> v1_buffer[BUFFER_SIZE];   // Local memory to store vector1
  ap_uint<WIDTH> v2_buffer[BUFFER_SIZE];   // Local memory to store vector2
  ap_uint<WIDTH> vout_buffer[BUFFER_SIZE]; // Local Memory to store result
  #pragma HLS RESOURCE variable=vout_buffer core=Mul
  // Per iteration of this loop perform BUFFER_SIZE vector addition
  for (int i = 0; i < size; i += BUFFER_SIZE) {
#pragma HLS LOOP_TRIPCOUNT min = c_len max = c_len
    int chunk_size = BUFFER_SIZE;
    // boundary checks
    if ((i + BUFFER_SIZE) > size)
      chunk_size = size - i;

  // Transferring data in bursts hides the memory access latency as well as
  // improves bandwidth utilization and efficiency of the memory controller.
  // It is recommended to infer burst transfers from successive requests of data
  // from consecutive address locations.
  // A local memory vl_local is used for buffering the data from a single burst.
  // The entire input vector is read in multiple bursts.
  // The choice of LOCAL_MEM_SIZE depends on the specific applications and
  // available on-chip memory on target FPGA.
  // burst read of v1 and v2 vector from global memory

  read1:
    for (int j = 0; j < chunk_size; j++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
#pragma HLS PIPELINE II = 1
      v1_buffer[j] = in1[i + j];
    }

  read2:
    for (int j = 0; j < chunk_size; j++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
#pragma HLS PIPELINE II = 1
      v2_buffer[j] = in2[i + j];
    }

  // PIPELINE pragma reduces the initiation interval for loop by allowing the
  // concurrent executions of operations
  vadd:
    for (int j = 0; j < chunk_size; j++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
#pragma HLS PIPELINE II = 1
//#pragma HLS unroll factor=64
      // perform vector addition
      vout_buffer[j] = vout_buffer[j]+v1_buffer[j] * v2_buffer[j];
    }

  // burst write the result
  write:
    for (int j = 0; j < chunk_size; j++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
#pragma HLS PIPELINE II = 1
      out_r[i + j] = vout_buffer[j];
    }
  }
}
}

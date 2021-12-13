/**
* Copyright (C) 2019-2021 Xilinx, Inc
*
* Licensed under the Apache License, Version 2.0 (the "License"). You may
* not use this file except in compliance with the License. A copy of the
* License is located at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
* License for the specific language governing permissions and limitations
* under the License.
*/

#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

extern "C" {

void pl_mm2s(ap_int<16>* mem, hls::stream<qdma_axis<16, 0, 0, 0> >& s, int size) {
data_mover:
    for (int i = 0; i < size; i++) {
        qdma_axis<16, 0, 0, 0> x;
        x.data = mem[i];
        x.keep_all();
        s.write(x);
    }
}
}

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
#include "aie_graph.h"
using namespace adf;

PLIO* in0 = new PLIO("DataIn0", adf::plio_32_bits, "data/input0.txt",500);
PLIO* in1 = new PLIO("DataIn1", adf::plio_32_bits, "data/input1.txt",500);
PLIO* in2 = new PLIO("DataIn2", adf::plio_32_bits, "data/input2.txt",500);
PLIO* in3 = new PLIO("DataIn3", adf::plio_32_bits, "data/input3.txt",500);
PLIO* out = new PLIO("DataOut", adf::plio_32_bits, "data/output.txt",500);

simulation::platform<4, 1> platform(in0, in1, in2, in3, out);

simpleGraph addergraph;

connect<> net0(platform.src[0], addergraph.in0);
connect<> net1(platform.src[1], addergraph.in1);
connect<> net2(platform.src[2], addergraph.in2);
connect<> net3(platform.src[3], addergraph.in3);

connect<> net4(addergraph.out, platform.sink[0]);

#ifdef __AIESIM__
int main(int argc, char** argv) {
    addergraph.init();
    addergraph.run(1);
    addergraph.end();
    return 0;
}
#endif

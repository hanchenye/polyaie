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

#ifndef __GRAPH_H__
#define __GRAPH_H__

#include <adf.h>
#include "aie_kernel.h"
#include "para.h"
using namespace adf;

class simpleGraph : public graph {
   private:
    kernel mm;
    kernel mm1;

   public:
    port<input> in0, in1, in2, in3;
    port<output> out;

    simpleGraph() {
        mm = kernel::create(mm_test);
        mm1 = kernel::create(mm_test1);

        connect<window<h1*w1*4>>(in0, mm.in[0]);
        connect<window<w1*w2*4>>(in1, mm.in[1]);
        connect<window<h1*w1*4>>(in2, mm1.in[0]);
        connect<window<w1*w2*4>>(in3, mm1.in[1]);
        connect<window<h1*w2*4>>(mm.out[0], mm1.in[2]);
        connect<window<h1*w2*4>>(mm1.out[0], out);



        source(mm) = "mm_test.cc";
        source(mm1) = "mm_test1.cc";
        runtime<ratio>(mm) = 1;
        runtime<ratio>(mm1) = 1;
    };
};

#endif /**********__GRAPH_H__**********/

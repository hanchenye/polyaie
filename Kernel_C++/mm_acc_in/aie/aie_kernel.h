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

#ifndef __KERNELS_H__
#define __KERNELS_H__

#include <adf/stream/types.h>

void mm_test(input_window_int32* matA, input_window_int32* matB, output_window_int32* matC);
void mm_test1(input_window_int32* matA, input_window_int32* matB, input_window_int32* acc_in, output_window_int32* matC);

#endif /**********__KERNELS_H__**********/

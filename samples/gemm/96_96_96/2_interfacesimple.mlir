module {
  dataflow.func @gemm(%arg0: memref<96x96xf32>, %arg1: memref<96x96xf32>, %arg2: memref<96x96xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0:6 = "dataflow.process"(%arg1, %arg2, %arg1, %arg2, %arg1, %arg2, %arg0, %6, %arg0, %9, %arg0, %12, %arg0, %15, %arg0, %18, %arg0, %21, %arg0, %24, %arg0, %27) ({
    ^bb0(%arg3: memref<96x96xf32>, %arg4: memref<96x96xf32>, %arg5: memref<96x96xf32>, %arg6: memref<96x96xf32>, %arg7: memref<96x96xf32>, %arg8: memref<96x96xf32>, %arg9: memref<96x96xf32>, %arg10: tensor<32x32xf32>, %arg11: memref<96x96xf32>, %arg12: tensor<32x32xf32>, %arg13: memref<96x96xf32>, %arg14: tensor<32x32xf32>, %arg15: memref<96x96xf32>, %arg16: tensor<32x32xf32>, %arg17: memref<96x96xf32>, %arg18: tensor<32x32xf32>, %arg19: memref<96x96xf32>, %arg20: tensor<32x32xf32>, %arg21: memref<96x96xf32>, %arg22: tensor<32x32xf32>, %arg23: memref<96x96xf32>, %arg24: tensor<32x32xf32>):
      %31 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %32 = "dataflow.tensor_load"(%arg4) {offsets = [64, 0], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %33 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %34 = "dataflow.tensor_load"(%arg4) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %35 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %36 = "dataflow.tensor_load"(%arg4) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg9, %arg10) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg12) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg14) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg16) {offsets = [32, 0], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg18) {offsets = [32, 32], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg20) {offsets = [32, 64], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg22) {offsets = [64, 0], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg24) {offsets = [64, 32], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%31, %32, %33, %34, %35, %36) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64} : (memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, tensor<32x32xf32>, memref<96x96xf32>, tensor<32x32xf32>, memref<96x96xf32>, tensor<32x32xf32>, memref<96x96xf32>, tensor<32x32xf32>, memref<96x96xf32>, tensor<32x32xf32>, memref<96x96xf32>, tensor<32x32xf32>, memref<96x96xf32>, tensor<32x32xf32>, memref<96x96xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %1:6 = "dataflow.process"(%arg1, %arg1, %arg1, %arg1, %arg1, %arg1) ({
    ^bb0(%arg3: memref<96x96xf32>, %arg4: memref<96x96xf32>, %arg5: memref<96x96xf32>, %arg6: memref<96x96xf32>, %arg7: memref<96x96xf32>, %arg8: memref<96x96xf32>):
      %31 = "dataflow.tensor_load"(%arg3) {offsets = [64, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %32 = "dataflow.tensor_load"(%arg3) {offsets = [64, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %33 = "dataflow.tensor_load"(%arg3) {offsets = [64, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %34 = "dataflow.tensor_load"(%arg3) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %35 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %36 = "dataflow.tensor_load"(%arg3) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%31, %32, %33, %34, %35, %36) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64} : (memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %2:6 = "dataflow.process"(%arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg0, %30) ({
    ^bb0(%arg3: memref<96x96xf32>, %arg4: memref<96x96xf32>, %arg5: memref<96x96xf32>, %arg6: memref<96x96xf32>, %arg7: memref<96x96xf32>, %arg8: memref<96x96xf32>, %arg9: memref<96x96xf32>, %arg10: tensor<32x32xf32>):
      %31 = "dataflow.tensor_load"(%arg3) {offsets = [64, 64], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %32 = "dataflow.tensor_load"(%arg3) {offsets = [32, 64], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %33 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %34 = "dataflow.tensor_load"(%arg3) {offsets = [64, 32], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %35 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %36 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg9, %arg10) {offsets = [64, 64], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%31, %32, %33, %34, %35, %36) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64} : (memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %3:9 = "dataflow.process"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0) ({
    ^bb0(%arg3: memref<96x96xf32>, %arg4: memref<96x96xf32>, %arg5: memref<96x96xf32>, %arg6: memref<96x96xf32>, %arg7: memref<96x96xf32>, %arg8: memref<96x96xf32>, %arg9: memref<96x96xf32>, %arg10: memref<96x96xf32>, %arg11: memref<96x96xf32>):
      %31 = "dataflow.tensor_load"(%arg3) {offsets = [64, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %32 = "dataflow.tensor_load"(%arg3) {offsets = [64, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %33 = "dataflow.tensor_load"(%arg3) {offsets = [64, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %34 = "dataflow.tensor_load"(%arg3) {offsets = [32, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %35 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %36 = "dataflow.tensor_load"(%arg3) {offsets = [32, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %37 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %38 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %39 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%31, %32, %33, %34, %35, %36, %37, %38, %39) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64} : (memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %4 = "dataflow.process"(%0#4, %0#5, %3#8) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.process"(%0#2, %0#3, %4) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.process"(%0#0, %0#1, %5) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.process"(%0#4, %2#5, %3#7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.process"(%0#2, %2#4, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.process"(%0#0, %2#3, %8) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.process"(%0#4, %2#2, %3#6) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.process"(%0#2, %2#1, %10) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %12 = "dataflow.process"(%0#0, %2#0, %11) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %13 = "dataflow.process"(%1#5, %0#5, %3#5) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %14 = "dataflow.process"(%1#4, %0#3, %13) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %15 = "dataflow.process"(%1#3, %0#1, %14) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %16 = "dataflow.process"(%1#5, %2#5, %3#4) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %17 = "dataflow.process"(%1#4, %2#4, %16) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %18 = "dataflow.process"(%1#3, %2#3, %17) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %19 = "dataflow.process"(%1#5, %2#2, %3#3) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %20 = "dataflow.process"(%1#4, %2#1, %19) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %21 = "dataflow.process"(%1#3, %2#0, %20) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %22 = "dataflow.process"(%1#2, %0#5, %3#2) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %23 = "dataflow.process"(%1#1, %0#3, %22) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %24 = "dataflow.process"(%1#0, %0#1, %23) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %25 = "dataflow.process"(%1#2, %2#5, %3#1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %26 = "dataflow.process"(%1#1, %2#4, %25) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %27 = "dataflow.process"(%1#0, %2#3, %26) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %28 = "dataflow.process"(%1#2, %2#2, %3#0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %29 = "dataflow.process"(%1#1, %2#1, %28) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %30 = "dataflow.process"(%1#0, %2#0, %29) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %31 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %32 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %33 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %34 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %36 = aievec.upd %31[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %36, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %37 = aievec.upd %34[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %38 = aievec.ups %37 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %39 = aievec.upd %33[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %40 = aievec.upd %32[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %41 = aievec.concat %40, %40 : vector<8xf32>, vector<16xf32>
            %42 = aievec.mac %41, %39, %38 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %43 = aievec.srs %42 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %43, %34[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %35 = bufferization.to_tensor %34 : memref<32x32xf32>
      "dataflow.return"(%35) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.return"() : () -> ()
  }
}


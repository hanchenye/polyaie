module {
  dataflow.func @gemm(%arg0: memref<32x96xf32>, %arg1: memref<32x96xf32>, %arg2: memref<96x96xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0:6 = "dataflow.process"(%arg1, %arg2, %arg1, %arg2, %arg1, %arg2) ({
    ^bb0(%arg3: memref<32x96xf32>, %arg4: memref<96x96xf32>, %arg5: memref<32x96xf32>, %arg6: memref<96x96xf32>, %arg7: memref<32x96xf32>, %arg8: memref<96x96xf32>):
      %12 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
      %13 = "dataflow.tensor_load"(%arg4) {offsets = [64, 0], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %14 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
      %15 = "dataflow.tensor_load"(%arg4) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %16 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 3 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
      %17 = "dataflow.tensor_load"(%arg4) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%12, %13, %14, %15, %16, %17) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64} : (memref<32x96xf32>, memref<96x96xf32>, memref<32x96xf32>, memref<96x96xf32>, memref<32x96xf32>, memref<96x96xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %1:6 = "dataflow.process"(%arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg0, %5, %arg0, %8, %arg0, %11) ({
    ^bb0(%arg3: memref<96x96xf32>, %arg4: memref<96x96xf32>, %arg5: memref<96x96xf32>, %arg6: memref<96x96xf32>, %arg7: memref<96x96xf32>, %arg8: memref<96x96xf32>, %arg9: memref<32x96xf32>, %arg10: tensor<32x32xf32>, %arg11: memref<32x96xf32>, %arg12: tensor<32x32xf32>, %arg13: memref<32x96xf32>, %arg14: tensor<32x32xf32>):
      %12 = "dataflow.tensor_load"(%arg3) {offsets = [64, 64], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %13 = "dataflow.tensor_load"(%arg3) {offsets = [32, 64], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %14 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %15 = "dataflow.tensor_load"(%arg3) {offsets = [64, 32], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %16 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      %17 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg9, %arg10) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg12) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg9, %arg14) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%12, %13, %14, %15, %16, %17) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64} : (memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<96x96xf32>, memref<32x96xf32>, tensor<32x32xf32>, memref<32x96xf32>, tensor<32x32xf32>, memref<32x96xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %2:3 = "dataflow.process"(%arg0, %arg0, %arg0) ({
    ^bb0(%arg3: memref<32x96xf32>, %arg4: memref<32x96xf32>, %arg5: memref<32x96xf32>):
      %12 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
      %13 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
      %14 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%12, %13, %14) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64} : (memref<32x96xf32>, memref<32x96xf32>, memref<32x96xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %3 = "dataflow.process"(%0#4, %0#5, %2#2) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.process"(%0#2, %0#3, %3) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.process"(%0#0, %0#1, %4) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.process"(%0#4, %1#5, %2#1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.process"(%0#2, %1#4, %6) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.process"(%0#0, %1#3, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.process"(%0#4, %1#2, %2#0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.process"(%0#2, %1#1, %9) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.process"(%0#0, %1#0, %10) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %12 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %13 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %14 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %15 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %17 = aievec.upd %12[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %17, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %18 = aievec.upd %15[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %20 = aievec.upd %14[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %21 = aievec.upd %13[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
            %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %24, %15[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %16 = bufferization.to_tensor %15 : memref<32x32xf32>
      "dataflow.return"(%16) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.return"() : () -> ()
  }
}


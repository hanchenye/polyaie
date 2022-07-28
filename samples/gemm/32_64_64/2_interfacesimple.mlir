module {
  dataflow.func @gemm(%arg0: memref<32x64xf32>, %arg1: memref<32x64xf32>, %arg2: memref<64x64xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0:2 = "dataflow.process"(%arg2, %arg2) ({
    ^bb0(%arg3: memref<64x64xf32>, %arg4: memref<64x64xf32>):
      %7 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
      %8 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%7, %8) : (tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 27 : i64, polyaie.row = 0 : i64} : (memref<64x64xf32>, memref<64x64xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>)
    %1:4 = "dataflow.process"(%arg1, %arg2, %arg1, %arg2, %arg0, %4, %arg0, %6) ({
    ^bb0(%arg3: memref<32x64xf32>, %arg4: memref<64x64xf32>, %arg5: memref<32x64xf32>, %arg6: memref<64x64xf32>, %arg7: memref<32x64xf32>, %arg8: tensor<32x32xf32>, %arg9: memref<32x64xf32>, %arg10: tensor<32x32xf32>):
      %7 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
      %8 = "dataflow.tensor_load"(%arg4) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
      %9 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
      %10 = "dataflow.tensor_load"(%arg4) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg7, %arg8) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg7, %arg10) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%7, %8, %9, %10) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 26 : i64, polyaie.row = 0 : i64} : (memref<32x64xf32>, memref<64x64xf32>, memref<32x64xf32>, memref<64x64xf32>, memref<32x64xf32>, tensor<32x32xf32>, memref<32x64xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %2:2 = "dataflow.process"(%arg0, %arg0) ({
    ^bb0(%arg3: memref<32x64xf32>, %arg4: memref<32x64xf32>):
      %7 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
      %8 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%7, %8) : (tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64} : (memref<32x64xf32>, memref<32x64xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>)
    %3 = "dataflow.process"(%1#2, %1#3, %2#1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %7 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %8 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %9 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %10 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %12 = aievec.upd %7[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %12, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %13 = aievec.upd %10[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %14 = aievec.ups %13 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %15 = aievec.upd %9[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %16 = aievec.upd %8[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %17 = aievec.concat %16, %16 : vector<8xf32>, vector<16xf32>
            %18 = aievec.mac %17, %15, %14 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %19 = aievec.srs %18 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %19, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %11 = bufferization.to_tensor %10 : memref<32x32xf32>
      "dataflow.return"(%11) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 26 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.process"(%1#0, %1#1, %3) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %7 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %8 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %9 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %10 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %12 = aievec.upd %7[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %12, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %13 = aievec.upd %10[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %14 = aievec.ups %13 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %15 = aievec.upd %9[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %16 = aievec.upd %8[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %17 = aievec.concat %16, %16 : vector<8xf32>, vector<16xf32>
            %18 = aievec.mac %17, %15, %14 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %19 = aievec.srs %18 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %19, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %11 = bufferization.to_tensor %10 : memref<32x32xf32>
      "dataflow.return"(%11) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 26 : i64, polyaie.leaf, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.process"(%1#2, %0#1, %2#0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %7 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %8 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %9 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %10 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %12 = aievec.upd %7[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %12, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %13 = aievec.upd %10[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %14 = aievec.ups %13 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %15 = aievec.upd %9[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %16 = aievec.upd %8[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %17 = aievec.concat %16, %16 : vector<8xf32>, vector<16xf32>
            %18 = aievec.mac %17, %15, %14 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %19 = aievec.srs %18 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %19, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %11 = bufferization.to_tensor %10 : memref<32x32xf32>
      "dataflow.return"(%11) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 27 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.process"(%1#0, %0#0, %5) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %7 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %8 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %9 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %10 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %12 = aievec.upd %7[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %12, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %13 = aievec.upd %10[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %14 = aievec.ups %13 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %15 = aievec.upd %9[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %16 = aievec.upd %8[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %17 = aievec.concat %16, %16 : vector<8xf32>, vector<16xf32>
            %18 = aievec.mac %17, %15, %14 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %19 = aievec.srs %18 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %19, %10[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %11 = bufferization.to_tensor %10 : memref<32x32xf32>
      "dataflow.return"(%11) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 27 : i64, polyaie.leaf, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.return"() : () -> ()
  }
}


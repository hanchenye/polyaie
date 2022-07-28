module {
  dataflow.func @gemm(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.process"(%arg2) ({
    ^bb0(%arg3: memref<32x32xf32>):
      %3 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%3) : (tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 27 : i64, polyaie.row = 0 : i64} : (memref<32x32xf32>) -> tensor<32x32xf32>
    %1:2 = "dataflow.process"(%arg1, %arg0, %arg0, %2) ({
    ^bb0(%arg3: memref<32x32xf32>, %arg4: memref<32x32xf32>, %arg5: memref<32x32xf32>, %arg6: tensor<32x32xf32>):
      %3 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      %4 = "dataflow.tensor_load"(%arg4) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg4, %arg6) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%3, %4) : (tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 26 : i64, polyaie.row = 0 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>)
    %2 = "dataflow.process"(%1#0, %0, %1#1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %3 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %4 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %5 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %6 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %8 = aievec.upd %3[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %8, %6[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %9 = aievec.upd %6[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %10 = aievec.ups %9 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %11 = aievec.upd %5[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %12 = aievec.upd %4[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %13 = aievec.concat %12, %12 : vector<8xf32>, vector<16xf32>
            %14 = aievec.mac %13, %11, %10 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %15 = aievec.srs %14 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %15, %6[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %7 = bufferization.to_tensor %6 : memref<32x32xf32>
      "dataflow.return"(%7) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.leaf, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.return"() : () -> ()
  }
}


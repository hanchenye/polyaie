module {
  dataflow.func @gemm(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.tensor_load"(%arg1) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
    %1 = "dataflow.tensor_load"(%arg2) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
    %2 = "dataflow.tensor_load"(%arg0) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
    %3 = "dataflow.process"(%0, %1, %2) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %4 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %5 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %6 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %7 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %9 = aievec.upd %4[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %9, %7[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %10 = aievec.upd %7[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %11 = aievec.ups %10 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %12 = aievec.upd %6[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %13 = aievec.upd %5[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %14 = aievec.concat %13, %13 : vector<8xf32>, vector<16xf32>
            %15 = aievec.mac %14, %12, %11 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %16 = aievec.srs %15 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %16, %7[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %8 = bufferization.to_tensor %7 : memref<32x32xf32>
      "dataflow.return"(%8) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.leaf} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %3) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, tensor<32x32xf32>) -> ()
    "dataflow.return"() : () -> ()
  }
}


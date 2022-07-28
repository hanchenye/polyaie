module {
  dataflow.func @gemm(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = AIE.tile(27, 0)
    %1 = "dataflow.process"(%arg2) ({
    ^bb0(%arg3: memref<32x32xf32>):
      %6 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%6) : (tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 27 : i64, polyaie.row = 0 : i64} : (memref<32x32xf32>) -> tensor<32x32xf32>
    %2 = AIE.tile(26, 0)
    %3:2 = "dataflow.process"(%arg1, %arg0, %arg0, %5) ({
    ^bb0(%arg3: memref<32x32xf32>, %arg4: memref<32x32xf32>, %arg5: memref<32x32xf32>, %arg6: tensor<32x32xf32>):
      %6 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      %7 = "dataflow.tensor_load"(%arg4) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg4, %arg6) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%6, %7) : (tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 26 : i64, polyaie.row = 0 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>)
    %4 = AIE.tile(25, 2)
    %5 = "dataflow.process"(%3#0, %1, %3#1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %6 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %7 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %8 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %9 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %11 = aievec.upd %6[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %11, %9[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %12 = aievec.upd %9[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %13 = aievec.ups %12 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %14 = aievec.upd %8[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %15 = aievec.upd %7[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %16 = aievec.concat %15, %15 : vector<8xf32>, vector<16xf32>
            %17 = aievec.mac %16, %14, %13 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %18 = aievec.srs %17 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %18, %9[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %10 = bufferization.to_tensor %9 : memref<32x32xf32>
      "dataflow.return"(%10) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.leaf, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.return"() : () -> ()
  }
}


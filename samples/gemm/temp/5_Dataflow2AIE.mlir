module {
  dataflow.func @gemm(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = AIE.tile(27, 0)
    %1 = AIE.external_buffer 16384 : memref<32x32xf32>
    "dataflow.runtime.host_dma"(%1, %arg2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
    %2 = "dataflow.process"(%arg2) ({
    ^bb0(%arg3: memref<32x32xf32>):
      %10 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%10) : (tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 27 : i64, polyaie.row = 0 : i64} : (memref<32x32xf32>) -> tensor<32x32xf32>
    %3 = AIE.tile(26, 0)
    %4 = AIE.external_buffer 20480 : memref<32x32xf32>
    "dataflow.runtime.host_dma"(%4, %arg1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
    %5 = AIE.external_buffer 24576 : memref<32x32xf32>
    "dataflow.runtime.host_dma"(%5, %arg0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
    %6:2 = "dataflow.process"(%arg1, %arg0, %arg0, %9) ({
    ^bb0(%arg3: memref<32x32xf32>, %arg4: memref<32x32xf32>, %arg5: memref<32x32xf32>, %arg6: tensor<32x32xf32>):
      %10 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      %11 = "dataflow.tensor_load"(%arg4) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg4, %arg6) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%10, %11) : (tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 26 : i64, polyaie.row = 0 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>)
    %7 = AIE.tile(25, 2) {polyaie.leaf}
    %8 = AIE.buffer(%7) : memref<32x32xf32>
    %9 = "dataflow.process"(%6#0, %2, %6#1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %10 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %11 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %12 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %13 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %15 = aievec.upd %10[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %15, %13[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %16 = aievec.upd %13[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %17 = aievec.ups %16 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %18 = aievec.upd %12[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %19 = aievec.upd %11[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %20 = aievec.concat %19, %19 : vector<8xf32>, vector<16xf32>
            %21 = aievec.mac %20, %18, %17 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %22 = aievec.srs %21 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %22, %13[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %14 = bufferization.to_tensor %13 : memref<32x32xf32>
      "dataflow.return"(%14) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.leaf, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.return"() : () -> ()
  }
}


module {
  dataflow.func @gemm(%arg0: memref<32x64xf32>, %arg1: memref<32x64xf32>, %arg2: memref<64x64xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.tensor_load"(%arg2) {offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %1 = "dataflow.tensor_load"(%arg2) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %2 = "dataflow.tensor_load"(%arg0) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
    %3 = "dataflow.tensor_load"(%arg1) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.tensor_load"(%arg2) {offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.tensor_load"(%arg1) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.tensor_load"(%arg2) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.tensor_load"(%arg0) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.process"(%5, %6, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
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
    }) {kind = 0 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.process"(%3, %4, %8) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
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
    }) {kind = 0 : i64, polyaie.leaf} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %9) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, tensor<32x32xf32>) -> ()
    %10 = "dataflow.process"(%5, %1, %2) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
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
    }) {kind = 0 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.process"(%3, %0, %10) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
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
    }) {kind = 0 : i64, polyaie.leaf} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %11) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, tensor<32x32xf32>) -> ()
    "dataflow.return"() : () -> ()
  }
}


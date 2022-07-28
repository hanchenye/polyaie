module {
  dataflow.func @gemm(%arg0: memref<64x64xf32>, %arg1: memref<64x64xf32>, %arg2: memref<64x64xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.tensor_load"(%arg0) {offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %1 = "dataflow.tensor_load"(%arg1) {offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %2 = "dataflow.tensor_load"(%arg1) {offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %3 = "dataflow.tensor_load"(%arg0) {offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.tensor_load"(%arg2) {offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.tensor_load"(%arg2) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.tensor_load"(%arg0) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.tensor_load"(%arg1) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.tensor_load"(%arg2) {offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.tensor_load"(%arg1) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.tensor_load"(%arg2) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.tensor_load"(%arg0) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>) -> tensor<32x32xf32>
    %12 = "dataflow.process"(%9, %10, %11) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %13 = "dataflow.process"(%7, %8, %12) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.leaf} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %13) {offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, tensor<32x32xf32>) -> ()
    %14 = "dataflow.process"(%9, %5, %6) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %15 = "dataflow.process"(%7, %4, %14) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.leaf} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %15) {offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, tensor<32x32xf32>) -> ()
    %16 = "dataflow.process"(%2, %10, %3) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %17 = "dataflow.process"(%1, %8, %16) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.leaf} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %17) {offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, tensor<32x32xf32>) -> ()
    %18 = "dataflow.process"(%2, %5, %0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %19 = "dataflow.process"(%1, %4, %18) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %20 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %21 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %22 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %23 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %25 = aievec.upd %20[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %25, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %26 = aievec.upd %23[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %27 = aievec.ups %26 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %28 = aievec.upd %22[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %29 = aievec.upd %21[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %30 = aievec.concat %29, %29 : vector<8xf32>, vector<16xf32>
            %31 = aievec.mac %30, %28, %27 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %32 = aievec.srs %31 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %32, %23[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %24 = bufferization.to_tensor %23 : memref<32x32xf32>
      "dataflow.return"(%24) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.leaf} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %19) {offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, tensor<32x32xf32>) -> ()
    "dataflow.return"() : () -> ()
  }
}


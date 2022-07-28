module {
  dataflow.func @gemm(%arg0: memref<64x128xf32>, %arg1: memref<64x128xf32>, %arg2: memref<128x128xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.tensor_load"(%arg0) {offsets = [32, 96], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %1 = "dataflow.tensor_load"(%arg0) {offsets = [32, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %2 = "dataflow.tensor_load"(%arg0) {offsets = [32, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %3 = "dataflow.tensor_load"(%arg1) {offsets = [32, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.tensor_load"(%arg1) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.tensor_load"(%arg1) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.tensor_load"(%arg1) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.tensor_load"(%arg0) {offsets = [32, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.tensor_load"(%arg2) {offsets = [96, 96], polyaie.PackID = 7 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.tensor_load"(%arg2) {offsets = [64, 96], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.tensor_load"(%arg2) {offsets = [32, 96], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.tensor_load"(%arg2) {offsets = [0, 96], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %12 = "dataflow.tensor_load"(%arg0) {offsets = [0, 96], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %13 = "dataflow.tensor_load"(%arg2) {offsets = [96, 64], polyaie.PackID = 7 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %14 = "dataflow.tensor_load"(%arg2) {offsets = [64, 64], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %15 = "dataflow.tensor_load"(%arg2) {offsets = [32, 64], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %16 = "dataflow.tensor_load"(%arg2) {offsets = [0, 64], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %17 = "dataflow.tensor_load"(%arg0) {offsets = [0, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %18 = "dataflow.tensor_load"(%arg2) {offsets = [96, 32], polyaie.PackID = 7 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %19 = "dataflow.tensor_load"(%arg2) {offsets = [64, 32], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %20 = "dataflow.tensor_load"(%arg2) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %21 = "dataflow.tensor_load"(%arg2) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %22 = "dataflow.tensor_load"(%arg0) {offsets = [0, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %23 = "dataflow.tensor_load"(%arg1) {offsets = [0, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %24 = "dataflow.tensor_load"(%arg2) {offsets = [96, 0], polyaie.PackID = 7 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %25 = "dataflow.tensor_load"(%arg1) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %26 = "dataflow.tensor_load"(%arg2) {offsets = [64, 0], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %27 = "dataflow.tensor_load"(%arg1) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %28 = "dataflow.tensor_load"(%arg2) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %29 = "dataflow.tensor_load"(%arg1) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %30 = "dataflow.tensor_load"(%arg2) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %31 = "dataflow.tensor_load"(%arg0) {offsets = [0, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>) -> tensor<32x32xf32>
    %32 = "dataflow.process"(%29, %30, %31) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %33 = "dataflow.process"(%27, %28, %32) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %34 = "dataflow.process"(%25, %26, %33) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %35 = "dataflow.process"(%23, %24, %34) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %35) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    %36 = "dataflow.process"(%29, %21, %22) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %37 = "dataflow.process"(%27, %20, %36) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %38 = "dataflow.process"(%25, %19, %37) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %39 = "dataflow.process"(%23, %18, %38) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %39) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    %40 = "dataflow.process"(%29, %16, %17) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %41 = "dataflow.process"(%27, %15, %40) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %42 = "dataflow.process"(%25, %14, %41) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %43 = "dataflow.process"(%23, %13, %42) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %43) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    %44 = "dataflow.process"(%29, %11, %12) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %45 = "dataflow.process"(%27, %10, %44) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %46 = "dataflow.process"(%25, %9, %45) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %47 = "dataflow.process"(%23, %8, %46) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %47) {offsets = [0, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    %48 = "dataflow.process"(%6, %30, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %49 = "dataflow.process"(%5, %28, %48) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %50 = "dataflow.process"(%4, %26, %49) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %51 = "dataflow.process"(%3, %24, %50) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %51) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    %52 = "dataflow.process"(%6, %21, %2) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %53 = "dataflow.process"(%5, %20, %52) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %54 = "dataflow.process"(%4, %19, %53) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %55 = "dataflow.process"(%3, %18, %54) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %55) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    %56 = "dataflow.process"(%6, %16, %1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %57 = "dataflow.process"(%5, %15, %56) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %58 = "dataflow.process"(%4, %14, %57) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %59 = "dataflow.process"(%3, %13, %58) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %59) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    %60 = "dataflow.process"(%6, %11, %0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %61 = "dataflow.process"(%5, %10, %60) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %62 = "dataflow.process"(%4, %9, %61) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %63 = "dataflow.process"(%3, %8, %62) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %64 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %65 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %66 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %67 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %69 = aievec.upd %64[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %69, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %70 = aievec.upd %67[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %71 = aievec.ups %70 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %72 = aievec.upd %66[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %73 = aievec.upd %65[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %74 = aievec.concat %73, %73 : vector<8xf32>, vector<16xf32>
            %75 = aievec.mac %74, %72, %71 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %76 = aievec.srs %75 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %76, %67[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %68 = bufferization.to_tensor %67 : memref<32x32xf32>
      "dataflow.return"(%68) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %63) {offsets = [32, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, tensor<32x32xf32>) -> ()
    "dataflow.return"() : () -> ()
  }
}


module {
  dataflow.func @gemm(%arg0: memref<128x128xf32>, %arg1: memref<128x128xf32>, %arg2: memref<128x128xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.tensor_load"(%arg0) {offsets = [96, 96], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %1 = "dataflow.tensor_load"(%arg0) {offsets = [96, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %2 = "dataflow.tensor_load"(%arg0) {offsets = [96, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %3 = "dataflow.tensor_load"(%arg1) {offsets = [96, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.col = 27 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.tensor_load"(%arg1) {offsets = [96, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 27 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.tensor_load"(%arg1) {offsets = [96, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 27 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.tensor_load"(%arg1) {offsets = [96, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 27 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.tensor_load"(%arg0) {offsets = [96, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.tensor_load"(%arg0) {offsets = [64, 96], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.tensor_load"(%arg0) {offsets = [64, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.tensor_load"(%arg0) {offsets = [64, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.tensor_load"(%arg1) {offsets = [64, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %12 = "dataflow.tensor_load"(%arg1) {offsets = [64, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %13 = "dataflow.tensor_load"(%arg1) {offsets = [64, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %14 = "dataflow.tensor_load"(%arg1) {offsets = [64, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %15 = "dataflow.tensor_load"(%arg0) {offsets = [64, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %16 = "dataflow.tensor_load"(%arg0) {offsets = [32, 96], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %17 = "dataflow.tensor_load"(%arg0) {offsets = [32, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %18 = "dataflow.tensor_load"(%arg0) {offsets = [32, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %19 = "dataflow.tensor_load"(%arg1) {offsets = [32, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %20 = "dataflow.tensor_load"(%arg1) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %21 = "dataflow.tensor_load"(%arg1) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %22 = "dataflow.tensor_load"(%arg1) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %23 = "dataflow.tensor_load"(%arg0) {offsets = [32, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %24 = "dataflow.tensor_load"(%arg2) {offsets = [96, 96], polyaie.PackID = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %25 = "dataflow.tensor_load"(%arg2) {offsets = [64, 96], polyaie.PackID = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %26 = "dataflow.tensor_load"(%arg2) {offsets = [32, 96], polyaie.PackID = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %27 = "dataflow.tensor_load"(%arg2) {offsets = [0, 96], polyaie.PackID = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %28 = "dataflow.tensor_load"(%arg0) {offsets = [0, 96], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %29 = "dataflow.tensor_load"(%arg2) {offsets = [96, 64], polyaie.PackID = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %30 = "dataflow.tensor_load"(%arg2) {offsets = [64, 64], polyaie.PackID = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %31 = "dataflow.tensor_load"(%arg2) {offsets = [32, 64], polyaie.PackID = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %32 = "dataflow.tensor_load"(%arg2) {offsets = [0, 64], polyaie.PackID = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %33 = "dataflow.tensor_load"(%arg0) {offsets = [0, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %34 = "dataflow.tensor_load"(%arg2) {offsets = [96, 32], polyaie.PackID = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %35 = "dataflow.tensor_load"(%arg2) {offsets = [64, 32], polyaie.PackID = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %36 = "dataflow.tensor_load"(%arg2) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %37 = "dataflow.tensor_load"(%arg2) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %38 = "dataflow.tensor_load"(%arg0) {offsets = [0, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %39 = "dataflow.tensor_load"(%arg1) {offsets = [0, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %40 = "dataflow.tensor_load"(%arg2) {offsets = [96, 0], polyaie.PackID = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %41 = "dataflow.tensor_load"(%arg1) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %42 = "dataflow.tensor_load"(%arg2) {offsets = [64, 0], polyaie.PackID = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %43 = "dataflow.tensor_load"(%arg1) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %44 = "dataflow.tensor_load"(%arg2) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %45 = "dataflow.tensor_load"(%arg1) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 4 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %46 = "dataflow.tensor_load"(%arg2) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64, polyaie.row = 0 : i64, polyaie.row1 = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %47 = "dataflow.tensor_load"(%arg0) {offsets = [0, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
    %48 = "dataflow.process"(%45, %46, %47) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %49 = "dataflow.process"(%43, %44, %48) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %50 = "dataflow.process"(%41, %42, %49) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %51 = "dataflow.process"(%39, %40, %50) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %51) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %52 = "dataflow.process"(%45, %37, %38) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %53 = "dataflow.process"(%43, %36, %52) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %54 = "dataflow.process"(%41, %35, %53) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %55 = "dataflow.process"(%39, %34, %54) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %55) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %56 = "dataflow.process"(%45, %32, %33) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %57 = "dataflow.process"(%43, %31, %56) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %58 = "dataflow.process"(%41, %30, %57) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %59 = "dataflow.process"(%39, %29, %58) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %59) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %60 = "dataflow.process"(%45, %27, %28) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %61 = "dataflow.process"(%43, %26, %60) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %62 = "dataflow.process"(%41, %25, %61) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %63 = "dataflow.process"(%39, %24, %62) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %63) {offsets = [0, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %64 = "dataflow.process"(%22, %46, %23) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %65 = "dataflow.process"(%21, %44, %64) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %66 = "dataflow.process"(%20, %42, %65) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %67 = "dataflow.process"(%19, %40, %66) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %67) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %68 = "dataflow.process"(%22, %37, %18) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %69 = "dataflow.process"(%21, %36, %68) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %70 = "dataflow.process"(%20, %35, %69) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %71 = "dataflow.process"(%19, %34, %70) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %71) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %72 = "dataflow.process"(%22, %32, %17) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %73 = "dataflow.process"(%21, %31, %72) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %74 = "dataflow.process"(%20, %30, %73) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %75 = "dataflow.process"(%19, %29, %74) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %75) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %76 = "dataflow.process"(%22, %27, %16) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %77 = "dataflow.process"(%21, %26, %76) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %78 = "dataflow.process"(%20, %25, %77) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %79 = "dataflow.process"(%19, %24, %78) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %79) {offsets = [32, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %80 = "dataflow.process"(%14, %46, %15) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %81 = "dataflow.process"(%13, %44, %80) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %82 = "dataflow.process"(%12, %42, %81) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %83 = "dataflow.process"(%11, %40, %82) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %83) {offsets = [64, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %84 = "dataflow.process"(%14, %37, %10) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %85 = "dataflow.process"(%13, %36, %84) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %86 = "dataflow.process"(%12, %35, %85) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %87 = "dataflow.process"(%11, %34, %86) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %87) {offsets = [64, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %88 = "dataflow.process"(%14, %32, %9) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %89 = "dataflow.process"(%13, %31, %88) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %90 = "dataflow.process"(%12, %30, %89) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %91 = "dataflow.process"(%11, %29, %90) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %91) {offsets = [64, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %92 = "dataflow.process"(%14, %27, %8) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %93 = "dataflow.process"(%13, %26, %92) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %94 = "dataflow.process"(%12, %25, %93) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %95 = "dataflow.process"(%11, %24, %94) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %95) {offsets = [64, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %96 = "dataflow.process"(%6, %46, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %97 = "dataflow.process"(%5, %44, %96) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %98 = "dataflow.process"(%4, %42, %97) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %99 = "dataflow.process"(%3, %40, %98) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %99) {offsets = [96, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %100 = "dataflow.process"(%6, %37, %2) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %101 = "dataflow.process"(%5, %36, %100) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %102 = "dataflow.process"(%4, %35, %101) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %103 = "dataflow.process"(%3, %34, %102) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %103) {offsets = [96, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %104 = "dataflow.process"(%6, %32, %1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %105 = "dataflow.process"(%5, %31, %104) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %106 = "dataflow.process"(%4, %30, %105) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %107 = "dataflow.process"(%3, %29, %106) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %107) {offsets = [96, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    %108 = "dataflow.process"(%6, %27, %0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %109 = "dataflow.process"(%5, %26, %108) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %110 = "dataflow.process"(%4, %25, %109) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %111 = "dataflow.process"(%3, %24, %110) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %112 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %113 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %114 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %115 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %117 = aievec.upd %112[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %117, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %118 = aievec.upd %115[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %119 = aievec.ups %118 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %120 = aievec.upd %114[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %121 = aievec.upd %113[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %122 = aievec.concat %121, %121 : vector<8xf32>, vector<16xf32>
            %123 = aievec.mac %122, %120, %119 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %124 = aievec.srs %123 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %124, %115[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %116 = bufferization.to_tensor %115 : memref<32x32xf32>
      "dataflow.return"(%116) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %111) {offsets = [96, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
    "dataflow.return"() : () -> ()
  }
}


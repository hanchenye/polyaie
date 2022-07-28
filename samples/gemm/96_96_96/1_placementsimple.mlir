module {
  dataflow.func @gemm(%arg0: memref<96x96xf32>, %arg1: memref<96x96xf32>, %arg2: memref<96x96xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.tensor_load"(%arg0) {offsets = [64, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %1 = "dataflow.tensor_load"(%arg0) {offsets = [64, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %2 = "dataflow.tensor_load"(%arg1) {offsets = [64, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %3 = "dataflow.tensor_load"(%arg1) {offsets = [64, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.tensor_load"(%arg1) {offsets = [64, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 18 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.tensor_load"(%arg0) {offsets = [64, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.tensor_load"(%arg0) {offsets = [32, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.tensor_load"(%arg0) {offsets = [32, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.tensor_load"(%arg1) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.tensor_load"(%arg1) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.tensor_load"(%arg1) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 18 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.tensor_load"(%arg0) {offsets = [32, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %12 = "dataflow.tensor_load"(%arg2) {offsets = [64, 64], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %13 = "dataflow.tensor_load"(%arg2) {offsets = [32, 64], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %14 = "dataflow.tensor_load"(%arg2) {offsets = [0, 64], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %15 = "dataflow.tensor_load"(%arg0) {offsets = [0, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %16 = "dataflow.tensor_load"(%arg2) {offsets = [64, 32], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %17 = "dataflow.tensor_load"(%arg2) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %18 = "dataflow.tensor_load"(%arg2) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %19 = "dataflow.tensor_load"(%arg0) {offsets = [0, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %20 = "dataflow.tensor_load"(%arg1) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %21 = "dataflow.tensor_load"(%arg2) {offsets = [64, 0], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %22 = "dataflow.tensor_load"(%arg1) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %23 = "dataflow.tensor_load"(%arg2) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %24 = "dataflow.tensor_load"(%arg1) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %25 = "dataflow.tensor_load"(%arg2) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %26 = "dataflow.tensor_load"(%arg0) {offsets = [0, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %27 = "dataflow.process"(%24, %25, %26) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %28 = "dataflow.process"(%22, %23, %27) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %29 = "dataflow.process"(%20, %21, %28) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %29) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %30 = "dataflow.process"(%24, %18, %19) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %31 = "dataflow.process"(%22, %17, %30) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %32 = "dataflow.process"(%20, %16, %31) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %32) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %33 = "dataflow.process"(%24, %14, %15) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %34 = "dataflow.process"(%22, %13, %33) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %35 = "dataflow.process"(%20, %12, %34) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %35) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %36 = "dataflow.process"(%10, %25, %11) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %37 = "dataflow.process"(%9, %23, %36) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %38 = "dataflow.process"(%8, %21, %37) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %38) {offsets = [32, 0], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %39 = "dataflow.process"(%10, %18, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %40 = "dataflow.process"(%9, %17, %39) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %41 = "dataflow.process"(%8, %16, %40) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %41) {offsets = [32, 32], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %42 = "dataflow.process"(%10, %14, %6) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %43 = "dataflow.process"(%9, %13, %42) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %44 = "dataflow.process"(%8, %12, %43) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %44) {offsets = [32, 64], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %45 = "dataflow.process"(%4, %25, %5) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %46 = "dataflow.process"(%3, %23, %45) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %47 = "dataflow.process"(%2, %21, %46) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %47) {offsets = [64, 0], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %48 = "dataflow.process"(%4, %18, %1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %49 = "dataflow.process"(%3, %17, %48) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %50 = "dataflow.process"(%2, %16, %49) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %50) {offsets = [64, 32], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    %51 = "dataflow.process"(%4, %14, %0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %52 = "dataflow.process"(%3, %13, %51) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %53 = "dataflow.process"(%2, %12, %52) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %54 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %55 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %56 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %57 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %59 = aievec.upd %54[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %59, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %60 = aievec.upd %57[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.ups %60 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %62 = aievec.upd %56[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %63 = aievec.upd %55[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %64 = aievec.concat %63, %63 : vector<8xf32>, vector<16xf32>
            %65 = aievec.mac %64, %62, %61 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %66 = aievec.srs %65 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %66, %57[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %58 = bufferization.to_tensor %57 : memref<32x32xf32>
      "dataflow.return"(%58) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %53) {offsets = [64, 64], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, tensor<32x32xf32>) -> ()
    "dataflow.return"() : () -> ()
  }
}


module {
  dataflow.func @gemm(%arg0: memref<32x96xf32>, %arg1: memref<32x96xf32>, %arg2: memref<96x96xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = "dataflow.tensor_load"(%arg2) {offsets = [64, 64], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %1 = "dataflow.tensor_load"(%arg2) {offsets = [32, 64], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %2 = "dataflow.tensor_load"(%arg2) {offsets = [0, 64], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.col = 11 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %3 = "dataflow.tensor_load"(%arg0) {offsets = [0, 64], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
    %4 = "dataflow.tensor_load"(%arg2) {offsets = [64, 32], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %5 = "dataflow.tensor_load"(%arg2) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.tensor_load"(%arg2) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.tensor_load"(%arg0) {offsets = [0, 32], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.tensor_load"(%arg1) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.tensor_load"(%arg2) {offsets = [64, 0], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.tensor_load"(%arg1) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.tensor_load"(%arg2) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %12 = "dataflow.tensor_load"(%arg1) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 10 : i64, polyaie.reuse = 3 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
    %13 = "dataflow.tensor_load"(%arg2) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.col = 10 : i64, polyaie.reuse = 1 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>) -> tensor<32x32xf32>
    %14 = "dataflow.tensor_load"(%arg0) {offsets = [0, 0], polyaie.channel = 2 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>) -> tensor<32x32xf32>
    %15 = "dataflow.process"(%12, %13, %14) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %16 = "dataflow.process"(%10, %11, %15) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %17 = "dataflow.process"(%8, %9, %16) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %17) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, tensor<32x32xf32>) -> ()
    %18 = "dataflow.process"(%12, %6, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %19 = "dataflow.process"(%10, %5, %18) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %20 = "dataflow.process"(%8, %4, %19) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %20) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, tensor<32x32xf32>) -> ()
    %21 = "dataflow.process"(%12, %2, %3) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %22 = "dataflow.process"(%10, %1, %21) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %23 = "dataflow.process"(%8, %0, %22) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %24 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %25 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %26 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %27 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %29 = aievec.upd %24[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %29, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %30 = aievec.upd %27[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %31 = aievec.ups %30 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %32 = aievec.upd %26[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %33 = aievec.upd %25[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %34 = aievec.concat %33, %33 : vector<8xf32>, vector<16xf32>
            %35 = aievec.mac %34, %32, %31 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %36 = aievec.srs %35 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %36, %27[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %28 = bufferization.to_tensor %27 : memref<32x32xf32>
      "dataflow.return"(%28) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.leaf, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.tensor_store"(%arg0, %23) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, tensor<32x32xf32>) -> ()
    "dataflow.return"() : () -> ()
  }
}


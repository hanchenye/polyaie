module {
  dataflow.func @gemm(%arg0: memref<128x128xf32>, %arg1: memref<128x128xf32>, %arg2: memref<128x128xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0:8 = "dataflow.process"(%arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg0, %40, %arg0, %44, %arg0, %48, %arg0, %52, %arg0, %56, %arg0, %60, %arg0, %64, %arg0, %68) ({
    ^bb0(%arg3: memref<128x128xf32>, %arg4: memref<128x128xf32>, %arg5: memref<128x128xf32>, %arg6: memref<128x128xf32>, %arg7: memref<128x128xf32>, %arg8: memref<128x128xf32>, %arg9: memref<128x128xf32>, %arg10: memref<128x128xf32>, %arg11: memref<128x128xf32>, %arg12: tensor<32x32xf32>, %arg13: memref<128x128xf32>, %arg14: tensor<32x32xf32>, %arg15: memref<128x128xf32>, %arg16: tensor<32x32xf32>, %arg17: memref<128x128xf32>, %arg18: tensor<32x32xf32>, %arg19: memref<128x128xf32>, %arg20: tensor<32x32xf32>, %arg21: memref<128x128xf32>, %arg22: tensor<32x32xf32>, %arg23: memref<128x128xf32>, %arg24: tensor<32x32xf32>, %arg25: memref<128x128xf32>, %arg26: tensor<32x32xf32>):
      %69 = "dataflow.tensor_load"(%arg3) {offsets = [96, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %70 = "dataflow.tensor_load"(%arg3) {offsets = [96, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %71 = "dataflow.tensor_load"(%arg3) {offsets = [96, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %72 = "dataflow.tensor_load"(%arg3) {offsets = [96, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %73 = "dataflow.tensor_load"(%arg3) {offsets = [64, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %74 = "dataflow.tensor_load"(%arg3) {offsets = [64, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %75 = "dataflow.tensor_load"(%arg3) {offsets = [64, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %76 = "dataflow.tensor_load"(%arg3) {offsets = [64, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg11, %arg12) {offsets = [64, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg14) {offsets = [64, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg16) {offsets = [64, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg18) {offsets = [64, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg20) {offsets = [96, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg22) {offsets = [96, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg24) {offsets = [96, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg26) {offsets = [96, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%69, %70, %71, %72, %73, %74, %75, %76) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 19 : i64, polyaie.row = 0 : i64} : (memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %1:8 = "dataflow.process"(%arg1, %arg2, %arg1, %arg2, %arg1, %arg2, %arg1, %arg2) ({
    ^bb0(%arg3: memref<128x128xf32>, %arg4: memref<128x128xf32>, %arg5: memref<128x128xf32>, %arg6: memref<128x128xf32>, %arg7: memref<128x128xf32>, %arg8: memref<128x128xf32>, %arg9: memref<128x128xf32>, %arg10: memref<128x128xf32>):
      %69 = "dataflow.tensor_load"(%arg3) {offsets = [0, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %70 = "dataflow.tensor_load"(%arg4) {offsets = [96, 0], polyaie.PackID = 7 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %71 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %72 = "dataflow.tensor_load"(%arg4) {offsets = [64, 0], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %73 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %74 = "dataflow.tensor_load"(%arg4) {offsets = [32, 0], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %75 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %76 = "dataflow.tensor_load"(%arg4) {offsets = [0, 0], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%69, %70, %71, %72, %73, %74, %75, %76) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 10 : i64, polyaie.row = 0 : i64} : (memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %2:8 = "dataflow.process"(%arg1, %arg1, %arg1, %arg1, %arg2, %arg2, %arg2, %arg2, %arg0, %8, %arg0, %12, %arg0, %16, %arg0, %20, %arg0, %24, %arg0, %28, %arg0, %32, %arg0, %36) ({
    ^bb0(%arg3: memref<128x128xf32>, %arg4: memref<128x128xf32>, %arg5: memref<128x128xf32>, %arg6: memref<128x128xf32>, %arg7: memref<128x128xf32>, %arg8: memref<128x128xf32>, %arg9: memref<128x128xf32>, %arg10: memref<128x128xf32>, %arg11: memref<128x128xf32>, %arg12: tensor<32x32xf32>, %arg13: memref<128x128xf32>, %arg14: tensor<32x32xf32>, %arg15: memref<128x128xf32>, %arg16: tensor<32x32xf32>, %arg17: memref<128x128xf32>, %arg18: tensor<32x32xf32>, %arg19: memref<128x128xf32>, %arg20: tensor<32x32xf32>, %arg21: memref<128x128xf32>, %arg22: tensor<32x32xf32>, %arg23: memref<128x128xf32>, %arg24: tensor<32x32xf32>, %arg25: memref<128x128xf32>, %arg26: tensor<32x32xf32>):
      %69 = "dataflow.tensor_load"(%arg3) {offsets = [32, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %70 = "dataflow.tensor_load"(%arg3) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %71 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %72 = "dataflow.tensor_load"(%arg3) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %73 = "dataflow.tensor_load"(%arg7) {offsets = [96, 96], polyaie.PackID = 7 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %74 = "dataflow.tensor_load"(%arg7) {offsets = [64, 96], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %75 = "dataflow.tensor_load"(%arg7) {offsets = [32, 96], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %76 = "dataflow.tensor_load"(%arg7) {offsets = [0, 96], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      "dataflow.tensor_store"(%arg11, %arg12) {offsets = [0, 0], polyaie.PackID = 0 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg14) {offsets = [0, 32], polyaie.PackID = 1 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg16) {offsets = [0, 64], polyaie.PackID = 2 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg18) {offsets = [0, 96], polyaie.PackID = 3 : i64, polyaie.channel = 0 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg20) {offsets = [32, 0], polyaie.PackID = 0 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg22) {offsets = [32, 32], polyaie.PackID = 1 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg24) {offsets = [32, 64], polyaie.PackID = 2 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.tensor_store"(%arg11, %arg26) {offsets = [32, 96], polyaie.PackID = 3 : i64, polyaie.channel = 1 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, tensor<32x32xf32>) -> ()
      "dataflow.return"(%69, %70, %71, %72, %73, %74, %75, %76) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 18 : i64, polyaie.row = 0 : i64} : (memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>, memref<128x128xf32>, tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %3:8 = "dataflow.process"(%arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg2) ({
    ^bb0(%arg3: memref<128x128xf32>, %arg4: memref<128x128xf32>, %arg5: memref<128x128xf32>, %arg6: memref<128x128xf32>, %arg7: memref<128x128xf32>, %arg8: memref<128x128xf32>, %arg9: memref<128x128xf32>, %arg10: memref<128x128xf32>):
      %69 = "dataflow.tensor_load"(%arg3) {offsets = [96, 64], polyaie.PackID = 7 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %70 = "dataflow.tensor_load"(%arg3) {offsets = [64, 64], polyaie.PackID = 6 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %71 = "dataflow.tensor_load"(%arg3) {offsets = [32, 64], polyaie.PackID = 5 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %72 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.PackID = 4 : i64, polyaie.channel = 1 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %73 = "dataflow.tensor_load"(%arg3) {offsets = [96, 32], polyaie.PackID = 7 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %74 = "dataflow.tensor_load"(%arg3) {offsets = [64, 32], polyaie.PackID = 6 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %75 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.PackID = 5 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %76 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.PackID = 4 : i64, polyaie.channel = 0 : i64, polyaie.reuse = 4 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%69, %70, %71, %72, %73, %74, %75, %76) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 11 : i64, polyaie.row = 0 : i64} : (memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %4:16 = "dataflow.process"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0) ({
    ^bb0(%arg3: memref<128x128xf32>, %arg4: memref<128x128xf32>, %arg5: memref<128x128xf32>, %arg6: memref<128x128xf32>, %arg7: memref<128x128xf32>, %arg8: memref<128x128xf32>, %arg9: memref<128x128xf32>, %arg10: memref<128x128xf32>, %arg11: memref<128x128xf32>, %arg12: memref<128x128xf32>, %arg13: memref<128x128xf32>, %arg14: memref<128x128xf32>, %arg15: memref<128x128xf32>, %arg16: memref<128x128xf32>, %arg17: memref<128x128xf32>, %arg18: memref<128x128xf32>):
      %69 = "dataflow.tensor_load"(%arg3) {offsets = [96, 96], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %70 = "dataflow.tensor_load"(%arg3) {offsets = [96, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %71 = "dataflow.tensor_load"(%arg3) {offsets = [96, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %72 = "dataflow.tensor_load"(%arg3) {offsets = [96, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %73 = "dataflow.tensor_load"(%arg3) {offsets = [64, 96], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %74 = "dataflow.tensor_load"(%arg3) {offsets = [64, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %75 = "dataflow.tensor_load"(%arg3) {offsets = [64, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %76 = "dataflow.tensor_load"(%arg3) {offsets = [64, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %77 = "dataflow.tensor_load"(%arg3) {offsets = [32, 96], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %78 = "dataflow.tensor_load"(%arg3) {offsets = [32, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %79 = "dataflow.tensor_load"(%arg3) {offsets = [32, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %80 = "dataflow.tensor_load"(%arg3) {offsets = [32, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %81 = "dataflow.tensor_load"(%arg3) {offsets = [0, 96], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %82 = "dataflow.tensor_load"(%arg3) {offsets = [0, 64], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %83 = "dataflow.tensor_load"(%arg3) {offsets = [0, 32], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      %84 = "dataflow.tensor_load"(%arg3) {offsets = [0, 0], polyaie.channel = 2 : i64, sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>) -> tensor<32x32xf32>
      "dataflow.return"(%69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81, %82, %83, %84) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> ()
    }) {kind = 1 : i64, polyaie.col = 0 : i64, polyaie.row = 0 : i64} : (memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>, memref<128x128xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>)
    %5 = "dataflow.process"(%1#6, %1#7, %4#15) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %6 = "dataflow.process"(%1#4, %1#5, %5) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %7 = "dataflow.process"(%1#2, %1#3, %6) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %8 = "dataflow.process"(%1#0, %1#1, %7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 10 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %9 = "dataflow.process"(%1#6, %3#7, %4#14) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %10 = "dataflow.process"(%1#4, %3#6, %9) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %11 = "dataflow.process"(%1#2, %3#5, %10) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %12 = "dataflow.process"(%1#0, %3#4, %11) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 11 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %13 = "dataflow.process"(%1#6, %3#3, %4#13) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %14 = "dataflow.process"(%1#4, %3#2, %13) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %15 = "dataflow.process"(%1#2, %3#1, %14) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %16 = "dataflow.process"(%1#0, %3#0, %15) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 12 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %17 = "dataflow.process"(%1#6, %2#7, %4#12) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %18 = "dataflow.process"(%1#4, %2#6, %17) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %19 = "dataflow.process"(%1#2, %2#5, %18) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %20 = "dataflow.process"(%1#0, %2#4, %19) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 13 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %21 = "dataflow.process"(%2#3, %1#7, %4#11) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %22 = "dataflow.process"(%2#2, %1#5, %21) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %23 = "dataflow.process"(%2#1, %1#3, %22) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %24 = "dataflow.process"(%2#0, %1#1, %23) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 14 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %25 = "dataflow.process"(%2#3, %3#7, %4#10) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %26 = "dataflow.process"(%2#2, %3#6, %25) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %27 = "dataflow.process"(%2#1, %3#5, %26) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %28 = "dataflow.process"(%2#0, %3#4, %27) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 15 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %29 = "dataflow.process"(%2#3, %3#3, %4#9) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %30 = "dataflow.process"(%2#2, %3#2, %29) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %31 = "dataflow.process"(%2#1, %3#1, %30) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %32 = "dataflow.process"(%2#0, %3#0, %31) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 16 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %33 = "dataflow.process"(%2#3, %2#7, %4#8) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %34 = "dataflow.process"(%2#2, %2#6, %33) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %35 = "dataflow.process"(%2#1, %2#5, %34) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %36 = "dataflow.process"(%2#0, %2#4, %35) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 17 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %37 = "dataflow.process"(%0#7, %1#7, %4#7) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %38 = "dataflow.process"(%0#6, %1#5, %37) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %39 = "dataflow.process"(%0#5, %1#3, %38) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %40 = "dataflow.process"(%0#4, %1#1, %39) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 18 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %41 = "dataflow.process"(%0#7, %3#7, %4#6) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %42 = "dataflow.process"(%0#6, %3#6, %41) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %43 = "dataflow.process"(%0#5, %3#5, %42) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %44 = "dataflow.process"(%0#4, %3#4, %43) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 19 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %45 = "dataflow.process"(%0#7, %3#3, %4#5) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %46 = "dataflow.process"(%0#6, %3#2, %45) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %47 = "dataflow.process"(%0#5, %3#1, %46) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %48 = "dataflow.process"(%0#4, %3#0, %47) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 20 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %49 = "dataflow.process"(%0#7, %2#7, %4#4) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %50 = "dataflow.process"(%0#6, %2#6, %49) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %51 = "dataflow.process"(%0#5, %2#5, %50) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %52 = "dataflow.process"(%0#4, %2#4, %51) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 21 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %53 = "dataflow.process"(%0#3, %1#7, %4#3) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %54 = "dataflow.process"(%0#2, %1#5, %53) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %55 = "dataflow.process"(%0#1, %1#3, %54) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %56 = "dataflow.process"(%0#0, %1#1, %55) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 22 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %57 = "dataflow.process"(%0#3, %3#7, %4#2) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %58 = "dataflow.process"(%0#2, %3#6, %57) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %59 = "dataflow.process"(%0#1, %3#5, %58) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %60 = "dataflow.process"(%0#0, %3#4, %59) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 23 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %61 = "dataflow.process"(%0#3, %3#3, %4#1) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %62 = "dataflow.process"(%0#2, %3#2, %61) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %63 = "dataflow.process"(%0#1, %3#1, %62) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %64 = "dataflow.process"(%0#0, %3#0, %63) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 24 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %65 = "dataflow.process"(%0#3, %2#7, %4#0) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.row = 2 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %66 = "dataflow.process"(%0#2, %2#6, %65) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.row = 3 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %67 = "dataflow.process"(%0#1, %2#5, %66) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.row = 4 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    %68 = "dataflow.process"(%0#0, %2#4, %67) ({
    ^bb0(%arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>):
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %69 = bufferization.to_memref %arg5 : memref<32x32xf32>
      %70 = bufferization.to_memref %arg4 : memref<32x32xf32>
      %71 = bufferization.to_memref %arg3 : memref<32x32xf32>
      %72 = memref.alloc() : memref<32x32xf32>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        scf.for %arg7 = %c0 to %c32 step %c8 {
          %74 = aievec.upd %69[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %74, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %75 = aievec.upd %72[%arg6, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %76 = aievec.ups %75 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg8 = %c0 to %c32 step %c1 {
            %77 = aievec.upd %71[%arg6, %arg8] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %78 = aievec.upd %70[%arg8, %arg7] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %79 = aievec.concat %78, %78 : vector<8xf32>, vector<16xf32>
            %80 = aievec.mac %79, %77, %76 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %81 = aievec.srs %80 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %81, %72[%arg6, %arg7] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      %73 = bufferization.to_tensor %72 : memref<32x32xf32>
      "dataflow.return"(%73) : (tensor<32x32xf32>) -> ()
    }) {kind = 0 : i64, polyaie.col = 25 : i64, polyaie.leaf, polyaie.row = 5 : i64} : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "dataflow.return"() : () -> ()
  }
}


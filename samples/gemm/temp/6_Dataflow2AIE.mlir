module {
  dataflow.func @gemm(%arg0: memref<32x32xf32>, %arg1: memref<32x32xf32>, %arg2: memref<32x32xf32>, ...) attributes {argNames = ["in0", "in1", "in2"], polyaie.top_func, resNames = []} {
    %0 = AIE.tile(27, 0)
    %1 = AIE.external_buffer 16384 : memref<32x32xf32>
    "dataflow.runtime.host_dma"(%1, %arg2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
    %2 = AIE.core(%0) {
      AIE.end
    }
    %3 = AIE.tile(26, 0)
    %4 = AIE.external_buffer 20480 : memref<32x32xf32>
    "dataflow.runtime.host_dma"(%4, %arg1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
    %5 = AIE.external_buffer 24576 : memref<32x32xf32>
    "dataflow.runtime.host_dma"(%5, %arg0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
    %6 = AIE.external_buffer 28672 : memref<32x32xf32>
    "dataflow.runtime.host_dma"(%arg0, %6) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
    %7 = AIE.core(%3) {
      AIE.end
    }
    %8 = AIE.tile(25, 2) {polyaie.leaf}
    %9 = AIE.buffer(%8) : memref<32x32xf32>
    %10 = AIE.buffer(%8) : memref<32x32xf32>
    %11 = AIE.buffer(%8) : memref<32x32xf32>
    %12 = AIE.buffer(%8) : memref<32x32xf32>
    %13 = AIE.core(%8) {
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      scf.for %arg3 = %c0 to %c32 step %c1 {
        scf.for %arg4 = %c0 to %c32 step %c8 {
          %14 = aievec.upd %12[%arg3, %arg4] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          vector.transfer_write %14, %9[%arg3, %arg4] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          %15 = aievec.upd %9[%arg3, %arg4] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %16 = aievec.ups %15 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
          scf.for %arg5 = %c0 to %c32 step %c1 {
            %17 = aievec.upd %10[%arg3, %arg5] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %18 = aievec.upd %11[%arg5, %arg4] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
            %19 = aievec.concat %18, %18 : vector<8xf32>, vector<16xf32>
            %20 = aievec.mac %19, %17, %16 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
            %21 = aievec.srs %20 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
            vector.transfer_write %21, %9[%arg3, %arg4] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
          }
        }
      }
      AIE.end
    }
    "dataflow.return"() : () -> ()
  }
}


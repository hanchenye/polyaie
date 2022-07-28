module @gemm {
  %0 = memref.alloc() : memref<32x32xf32>
  %1 = memref.alloc() : memref<32x32xf32>
  %2 = memref.alloc() : memref<32x32xf32>
  %3 = AIE.tile(27, 0)
  "dataflow.aie.interface"(%3, %4) : (index, memref<32x32xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %5 = AIE.core(%3) {
    AIE.end
  }
  %6 = AIE.tile(26, 0)
  "dataflow.aie.interface"(%6, %7, %8, %9) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %7 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %8 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %9 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %9) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %10 = AIE.core(%6) {
    AIE.end
  }
  %11 = AIE.tile(25, 2) {polyaie.leaf}
  %12 = AIE.buffer(%11) : memref<32x32xf32>
  %13 = AIE.buffer(%11) : memref<32x32xf32>
  %14 = AIE.buffer(%11) : memref<32x32xf32>
  %15 = AIE.buffer(%11) : memref<32x32xf32>
  %16 = AIE.core(%11) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %17 = aievec.upd %15[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %17, %12[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %18 = aievec.upd %12[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %19 = aievec.ups %18 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %20 = aievec.upd %13[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %21 = aievec.upd %14[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %22 = aievec.concat %21, %21 : vector<8xf32>, vector<16xf32>
          %23 = aievec.mac %22, %20, %19 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %24 = aievec.srs %23 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %24, %12[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  "dataflow.aie.broadcast"(%12, %9) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%8, %15) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %13) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %14) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
}


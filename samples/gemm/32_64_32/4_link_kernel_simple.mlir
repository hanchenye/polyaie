module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<32x32xf32>
  %1 = memref.alloc() : memref<32x64xf32>
  %2 = memref.alloc() : memref<64x32xf32>
  %3 = AIE.tile(26, 0)
  "dataflow.aie.interface"(%3, %4, %5, %6, %7, %8) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x32xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x32xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %8) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  %9 = AIE.core(%3) {
    AIE.end
  }
  %10 = AIE.tile(0, 0)
  %11 = AIE.core(%10) {
    AIE.end
  }
  %12 = AIE.tile(26, 2)
  %13 = AIE.buffer(%12) : memref<32x32xf32>
  %14 = AIE.buffer(%12) : memref<32x32xf32>
  %15 = AIE.buffer(%12) : memref<32x32xf32>
  %16 = AIE.buffer(%12) : memref<32x32xf32>
  %17 = AIE.core(%12) {
    call @extern_kernel(%16, %13, %14, %15) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %18 = AIE.tile(26, 3) {polyaie.leaf}
  %19 = AIE.buffer(%18) : memref<32x32xf32>
  %20 = AIE.buffer(%18) : memref<32x32xf32>
  %21 = AIE.buffer(%18) : memref<32x32xf32>
  %22 = AIE.buffer(%18) : memref<32x32xf32>
  %23 = AIE.core(%18) {
    call @extern_kernel(%22, %19, %20, %21) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  "dataflow.aie.broadcast"(%19, %8) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 26 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %15) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%6, %14) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 1 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%5, %21) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %20) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 1 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%13, %22) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
}


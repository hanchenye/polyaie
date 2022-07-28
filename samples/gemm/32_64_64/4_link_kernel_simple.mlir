module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<32x64xf32>
  %1 = memref.alloc() : memref<32x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(27, 0)
  "dataflow.aie.interface"(%3, %4, %5) : (index, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %6 = AIE.core(%3) {
    AIE.end
  }
  %7 = AIE.tile(26, 0)
  "dataflow.aie.interface"(%7, %8, %9, %10, %11, %12, %13) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %8 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %9 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %10 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %11 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %12 = AIE.external_buffer 40960 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %13 = AIE.external_buffer 45060 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %13) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %14 = AIE.core(%7) {
    AIE.end
  }
  %15 = AIE.tile(0, 0)
  %16 = AIE.core(%15) {
    AIE.end
  }
  %17 = AIE.tile(26, 2)
  %18 = AIE.buffer(%17) : memref<32x32xf32>
  %19 = AIE.buffer(%17) : memref<32x32xf32>
  %20 = AIE.buffer(%17) : memref<32x32xf32>
  %21 = AIE.buffer(%17) : memref<32x32xf32>
  %22 = AIE.core(%17) {
    call @extern_kernel(%21, %18, %19, %20) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %23 = AIE.tile(26, 3) {polyaie.leaf}
  %24 = AIE.buffer(%23) : memref<32x32xf32>
  %25 = AIE.buffer(%23) : memref<32x32xf32>
  %26 = AIE.buffer(%23) : memref<32x32xf32>
  %27 = AIE.buffer(%23) : memref<32x32xf32>
  %28 = AIE.core(%23) {
    call @extern_kernel(%27, %24, %25, %26) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %29 = AIE.tile(27, 2)
  %30 = AIE.buffer(%29) : memref<32x32xf32>
  %31 = AIE.buffer(%29) : memref<32x32xf32>
  %32 = AIE.buffer(%29) : memref<32x32xf32>
  %33 = AIE.buffer(%29) : memref<32x32xf32>
  %34 = AIE.core(%29) {
    call @extern_kernel(%33, %30, %31, %32) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %35 = AIE.tile(27, 3) {polyaie.leaf}
  %36 = AIE.buffer(%35) : memref<32x32xf32>
  %37 = AIE.buffer(%35) : memref<32x32xf32>
  %38 = AIE.buffer(%35) : memref<32x32xf32>
  %39 = AIE.buffer(%35) : memref<32x32xf32>
  %40 = AIE.core(%35) {
    call @extern_kernel(%39, %36, %37, %38) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  "dataflow.aie.broadcast"(%5, %32) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 27 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %38) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 27 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%36, %13) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 26 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%24, %12) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 26 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%8, %25, %37) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%9, %26) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%18, %27) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%11, %20) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%10, %19, %31) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%30, %39) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
}


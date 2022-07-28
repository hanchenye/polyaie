module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<64x64xf32>
  %1 = memref.alloc() : memref<64x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(10, 0)
  "dataflow.aie.interface"(%3, %4, %5, %6, %7) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %8 = AIE.core(%3) {
    AIE.end
  }
  %9 = AIE.tile(11, 0)
  "dataflow.aie.interface"(%9, %10, %11, %12, %13, %14, %15, %16, %17) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %10 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %11 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %12 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %13 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %14 = AIE.external_buffer 49152 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %15 = AIE.external_buffer 57344 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %16 = AIE.external_buffer 65536 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %17 = AIE.external_buffer 73728 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %18 = AIE.core(%9) {
    AIE.end
  }
  %19 = AIE.tile(0, 0)
  %20 = AIE.core(%19) {
    AIE.end
  }
  %21 = AIE.tile(10, 2)
  %22 = AIE.buffer(%21) : memref<32x32xf32>
  %23 = AIE.buffer(%21) : memref<32x32xf32>
  %24 = AIE.buffer(%21) : memref<32x32xf32>
  %25 = AIE.buffer(%21) : memref<32x32xf32>
  %26 = AIE.core(%21) {
    call @extern_kernel(%25, %22, %23, %24) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %27 = AIE.tile(10, 3) {polyaie.leaf}
  %28 = AIE.buffer(%27) : memref<32x32xf32>
  %29 = AIE.buffer(%27) : memref<32x32xf32>
  %30 = AIE.buffer(%27) : memref<32x32xf32>
  %31 = AIE.buffer(%27) : memref<32x32xf32>
  %32 = AIE.core(%27) {
    call @extern_kernel(%31, %28, %29, %30) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %33 = AIE.tile(11, 2)
  %34 = AIE.buffer(%33) : memref<32x32xf32>
  %35 = AIE.buffer(%33) : memref<32x32xf32>
  %36 = AIE.buffer(%33) : memref<32x32xf32>
  %37 = AIE.buffer(%33) : memref<32x32xf32>
  %38 = AIE.core(%33) {
    call @extern_kernel(%37, %34, %35, %36) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %39 = AIE.tile(11, 3) {polyaie.leaf}
  %40 = AIE.buffer(%39) : memref<32x32xf32>
  %41 = AIE.buffer(%39) : memref<32x32xf32>
  %42 = AIE.buffer(%39) : memref<32x32xf32>
  %43 = AIE.buffer(%39) : memref<32x32xf32>
  %44 = AIE.core(%39) {
    call @extern_kernel(%43, %40, %41, %42) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %45 = AIE.tile(12, 2)
  %46 = AIE.buffer(%45) : memref<32x32xf32>
  %47 = AIE.buffer(%45) : memref<32x32xf32>
  %48 = AIE.buffer(%45) : memref<32x32xf32>
  %49 = AIE.buffer(%45) : memref<32x32xf32>
  %50 = AIE.core(%45) {
    call @extern_kernel(%49, %46, %47, %48) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %51 = AIE.tile(12, 3) {polyaie.leaf}
  %52 = AIE.buffer(%51) : memref<32x32xf32>
  %53 = AIE.buffer(%51) : memref<32x32xf32>
  %54 = AIE.buffer(%51) : memref<32x32xf32>
  %55 = AIE.buffer(%51) : memref<32x32xf32>
  %56 = AIE.core(%51) {
    call @extern_kernel(%55, %52, %53, %54) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %57 = AIE.tile(13, 2)
  %58 = AIE.buffer(%57) : memref<32x32xf32>
  %59 = AIE.buffer(%57) : memref<32x32xf32>
  %60 = AIE.buffer(%57) : memref<32x32xf32>
  %61 = AIE.buffer(%57) : memref<32x32xf32>
  %62 = AIE.core(%57) {
    call @extern_kernel(%61, %58, %59, %60) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %63 = AIE.tile(13, 3) {polyaie.leaf}
  %64 = AIE.buffer(%63) : memref<32x32xf32>
  %65 = AIE.buffer(%63) : memref<32x32xf32>
  %66 = AIE.buffer(%63) : memref<32x32xf32>
  %67 = AIE.buffer(%63) : memref<32x32xf32>
  %68 = AIE.core(%63) {
    call @extern_kernel(%67, %64, %65, %66) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  "dataflow.aie.broadcast"(%40, %15) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%64, %17) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%34, %43) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%5, %30, %54) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%52, %16) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %24, %48) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%6, %23, %35) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%22, %31) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%28, %14) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%58, %67) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%12, %42, %66) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%46, %55) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%13, %36, %60) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%11, %47, %59) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%10, %53, %65) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %29, %41) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
}


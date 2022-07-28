module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<128x128xf32>
  %1 = memref.alloc() : memref<128x128xf32>
  %2 = memref.alloc() : memref<128x128xf32>
  %3 = AIE.tile(19, 0)
  "dataflow.aie.interface"(%3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %8 = AIE.external_buffer 147456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %8) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %9 = AIE.external_buffer 155648 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %9) {kind = 2 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %10 = AIE.external_buffer 163840 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %10) {kind = 2 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %11 = AIE.external_buffer 172032 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %11) {kind = 2 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %12 = AIE.external_buffer 180224 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %13 = AIE.external_buffer 188416 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %13) {kind = 2 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %14 = AIE.external_buffer 196608 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %15 = AIE.external_buffer 204800 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %16 = AIE.core(%3) {
    AIE.end
  }
  %17 = AIE.tile(10, 0)
  "dataflow.aie.interface"(%17, %18, %19, %20, %21, %22, %23, %24, %25) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %18 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %19 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %20 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %21 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %22 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %23 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %24 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %25 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %26 = AIE.core(%17) {
    AIE.end
  }
  %27 = AIE.tile(27, 0)
  "dataflow.aie.interface"(%27, %28, %29, %30, %31) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %28 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%28, %1) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %29 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %1) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %30 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %1) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %31 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %1) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %32 = AIE.core(%27) {
    AIE.end
  }
  %33 = AIE.tile(18, 0)
  "dataflow.aie.interface"(%33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %34 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %35 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %36 = AIE.external_buffer 90112 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %37 = AIE.external_buffer 94208 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %38 = AIE.external_buffer 98304 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %39 = AIE.external_buffer 102400 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %40 = AIE.external_buffer 106496 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%40, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %41 = AIE.external_buffer 110592 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%41, %2) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %42 = AIE.external_buffer 212992 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %42) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %43 = AIE.external_buffer 221184 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %43) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %44 = AIE.external_buffer 229376 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %44) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %45 = AIE.external_buffer 237568 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %45) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %46 = AIE.external_buffer 245760 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %46) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %47 = AIE.external_buffer 253952 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %47) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %48 = AIE.external_buffer 262144 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %48) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %49 = AIE.external_buffer 270336 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %49) {kind = 2 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %50 = AIE.core(%33) {
    AIE.end
  }
  %51 = AIE.tile(11, 0)
  "dataflow.aie.interface"(%51, %52, %53, %54, %55, %56, %57, %58, %59) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %52 = AIE.external_buffer 114688 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%52, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %53 = AIE.external_buffer 118784 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%53, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %54 = AIE.external_buffer 122880 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%54, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %55 = AIE.external_buffer 126976 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%55, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %56 = AIE.external_buffer 131072 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %57 = AIE.external_buffer 135168 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %58 = AIE.external_buffer 139264 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%58, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %59 = AIE.external_buffer 143360 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%59, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %60 = AIE.core(%51) {
    AIE.end
  }
  %61 = AIE.tile(0, 0)
  %62 = AIE.core(%61) {
    AIE.end
  }
  %63 = AIE.tile(10, 2)
  %64 = AIE.buffer(%63) : memref<32x32xf32>
  %65 = AIE.buffer(%63) : memref<32x32xf32>
  %66 = AIE.buffer(%63) : memref<32x32xf32>
  %67 = AIE.buffer(%63) : memref<32x32xf32>
  %68 = AIE.core(%63) {
    call @extern_kernel(%67, %64, %65, %66) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %69 = AIE.tile(10, 3)
  %70 = AIE.buffer(%69) : memref<32x32xf32>
  %71 = AIE.buffer(%69) : memref<32x32xf32>
  %72 = AIE.buffer(%69) : memref<32x32xf32>
  %73 = AIE.buffer(%69) : memref<32x32xf32>
  %74 = AIE.core(%69) {
    call @extern_kernel(%73, %70, %71, %72) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %75 = AIE.tile(10, 4)
  %76 = AIE.buffer(%75) : memref<32x32xf32>
  %77 = AIE.buffer(%75) : memref<32x32xf32>
  %78 = AIE.buffer(%75) : memref<32x32xf32>
  %79 = AIE.buffer(%75) : memref<32x32xf32>
  %80 = AIE.core(%75) {
    call @extern_kernel(%79, %76, %77, %78) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %81 = AIE.tile(10, 5) {polyaie.leaf}
  %82 = AIE.buffer(%81) : memref<32x32xf32>
  %83 = AIE.buffer(%81) : memref<32x32xf32>
  %84 = AIE.buffer(%81) : memref<32x32xf32>
  %85 = AIE.buffer(%81) : memref<32x32xf32>
  %86 = AIE.core(%81) {
    call @extern_kernel(%85, %82, %83, %84) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %87 = AIE.tile(11, 2)
  %88 = AIE.buffer(%87) : memref<32x32xf32>
  %89 = AIE.buffer(%87) : memref<32x32xf32>
  %90 = AIE.buffer(%87) : memref<32x32xf32>
  %91 = AIE.buffer(%87) : memref<32x32xf32>
  %92 = AIE.core(%87) {
    call @extern_kernel(%91, %88, %89, %90) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %93 = AIE.tile(11, 3)
  %94 = AIE.buffer(%93) : memref<32x32xf32>
  %95 = AIE.buffer(%93) : memref<32x32xf32>
  %96 = AIE.buffer(%93) : memref<32x32xf32>
  %97 = AIE.buffer(%93) : memref<32x32xf32>
  %98 = AIE.core(%93) {
    call @extern_kernel(%97, %94, %95, %96) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %99 = AIE.tile(11, 4)
  %100 = AIE.buffer(%99) : memref<32x32xf32>
  %101 = AIE.buffer(%99) : memref<32x32xf32>
  %102 = AIE.buffer(%99) : memref<32x32xf32>
  %103 = AIE.buffer(%99) : memref<32x32xf32>
  %104 = AIE.core(%99) {
    call @extern_kernel(%103, %100, %101, %102) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %105 = AIE.tile(11, 5) {polyaie.leaf}
  %106 = AIE.buffer(%105) : memref<32x32xf32>
  %107 = AIE.buffer(%105) : memref<32x32xf32>
  %108 = AIE.buffer(%105) : memref<32x32xf32>
  %109 = AIE.buffer(%105) : memref<32x32xf32>
  %110 = AIE.core(%105) {
    call @extern_kernel(%109, %106, %107, %108) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %111 = AIE.tile(12, 2)
  %112 = AIE.buffer(%111) : memref<32x32xf32>
  %113 = AIE.buffer(%111) : memref<32x32xf32>
  %114 = AIE.buffer(%111) : memref<32x32xf32>
  %115 = AIE.buffer(%111) : memref<32x32xf32>
  %116 = AIE.core(%111) {
    call @extern_kernel(%115, %112, %113, %114) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %117 = AIE.tile(12, 3)
  %118 = AIE.buffer(%117) : memref<32x32xf32>
  %119 = AIE.buffer(%117) : memref<32x32xf32>
  %120 = AIE.buffer(%117) : memref<32x32xf32>
  %121 = AIE.buffer(%117) : memref<32x32xf32>
  %122 = AIE.core(%117) {
    call @extern_kernel(%121, %118, %119, %120) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %123 = AIE.tile(12, 4)
  %124 = AIE.buffer(%123) : memref<32x32xf32>
  %125 = AIE.buffer(%123) : memref<32x32xf32>
  %126 = AIE.buffer(%123) : memref<32x32xf32>
  %127 = AIE.buffer(%123) : memref<32x32xf32>
  %128 = AIE.core(%123) {
    call @extern_kernel(%127, %124, %125, %126) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %129 = AIE.tile(12, 5) {polyaie.leaf}
  %130 = AIE.buffer(%129) : memref<32x32xf32>
  %131 = AIE.buffer(%129) : memref<32x32xf32>
  %132 = AIE.buffer(%129) : memref<32x32xf32>
  %133 = AIE.buffer(%129) : memref<32x32xf32>
  %134 = AIE.core(%129) {
    call @extern_kernel(%133, %130, %131, %132) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %135 = AIE.tile(13, 2)
  %136 = AIE.buffer(%135) : memref<32x32xf32>
  %137 = AIE.buffer(%135) : memref<32x32xf32>
  %138 = AIE.buffer(%135) : memref<32x32xf32>
  %139 = AIE.buffer(%135) : memref<32x32xf32>
  %140 = AIE.core(%135) {
    call @extern_kernel(%139, %136, %137, %138) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %141 = AIE.tile(13, 3)
  %142 = AIE.buffer(%141) : memref<32x32xf32>
  %143 = AIE.buffer(%141) : memref<32x32xf32>
  %144 = AIE.buffer(%141) : memref<32x32xf32>
  %145 = AIE.buffer(%141) : memref<32x32xf32>
  %146 = AIE.core(%141) {
    call @extern_kernel(%145, %142, %143, %144) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %147 = AIE.tile(13, 4)
  %148 = AIE.buffer(%147) : memref<32x32xf32>
  %149 = AIE.buffer(%147) : memref<32x32xf32>
  %150 = AIE.buffer(%147) : memref<32x32xf32>
  %151 = AIE.buffer(%147) : memref<32x32xf32>
  %152 = AIE.core(%147) {
    call @extern_kernel(%151, %148, %149, %150) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %153 = AIE.tile(13, 5) {polyaie.leaf}
  %154 = AIE.buffer(%153) : memref<32x32xf32>
  %155 = AIE.buffer(%153) : memref<32x32xf32>
  %156 = AIE.buffer(%153) : memref<32x32xf32>
  %157 = AIE.buffer(%153) : memref<32x32xf32>
  %158 = AIE.core(%153) {
    call @extern_kernel(%157, %154, %155, %156) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %159 = AIE.tile(14, 2)
  %160 = AIE.buffer(%159) : memref<32x32xf32>
  %161 = AIE.buffer(%159) : memref<32x32xf32>
  %162 = AIE.buffer(%159) : memref<32x32xf32>
  %163 = AIE.buffer(%159) : memref<32x32xf32>
  %164 = AIE.core(%159) {
    call @extern_kernel(%163, %160, %161, %162) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %165 = AIE.tile(14, 3)
  %166 = AIE.buffer(%165) : memref<32x32xf32>
  %167 = AIE.buffer(%165) : memref<32x32xf32>
  %168 = AIE.buffer(%165) : memref<32x32xf32>
  %169 = AIE.buffer(%165) : memref<32x32xf32>
  %170 = AIE.core(%165) {
    call @extern_kernel(%169, %166, %167, %168) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %171 = AIE.tile(14, 4)
  %172 = AIE.buffer(%171) : memref<32x32xf32>
  %173 = AIE.buffer(%171) : memref<32x32xf32>
  %174 = AIE.buffer(%171) : memref<32x32xf32>
  %175 = AIE.buffer(%171) : memref<32x32xf32>
  %176 = AIE.core(%171) {
    call @extern_kernel(%175, %172, %173, %174) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %177 = AIE.tile(14, 5) {polyaie.leaf}
  %178 = AIE.buffer(%177) : memref<32x32xf32>
  %179 = AIE.buffer(%177) : memref<32x32xf32>
  %180 = AIE.buffer(%177) : memref<32x32xf32>
  %181 = AIE.buffer(%177) : memref<32x32xf32>
  %182 = AIE.core(%177) {
    call @extern_kernel(%181, %178, %179, %180) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %183 = AIE.tile(15, 2)
  %184 = AIE.buffer(%183) : memref<32x32xf32>
  %185 = AIE.buffer(%183) : memref<32x32xf32>
  %186 = AIE.buffer(%183) : memref<32x32xf32>
  %187 = AIE.buffer(%183) : memref<32x32xf32>
  %188 = AIE.core(%183) {
    call @extern_kernel(%187, %184, %185, %186) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %189 = AIE.tile(15, 3)
  %190 = AIE.buffer(%189) : memref<32x32xf32>
  %191 = AIE.buffer(%189) : memref<32x32xf32>
  %192 = AIE.buffer(%189) : memref<32x32xf32>
  %193 = AIE.buffer(%189) : memref<32x32xf32>
  %194 = AIE.core(%189) {
    call @extern_kernel(%193, %190, %191, %192) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %195 = AIE.tile(15, 4)
  %196 = AIE.buffer(%195) : memref<32x32xf32>
  %197 = AIE.buffer(%195) : memref<32x32xf32>
  %198 = AIE.buffer(%195) : memref<32x32xf32>
  %199 = AIE.buffer(%195) : memref<32x32xf32>
  %200 = AIE.core(%195) {
    call @extern_kernel(%199, %196, %197, %198) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %201 = AIE.tile(15, 5) {polyaie.leaf}
  %202 = AIE.buffer(%201) : memref<32x32xf32>
  %203 = AIE.buffer(%201) : memref<32x32xf32>
  %204 = AIE.buffer(%201) : memref<32x32xf32>
  %205 = AIE.buffer(%201) : memref<32x32xf32>
  %206 = AIE.core(%201) {
    call @extern_kernel(%205, %202, %203, %204) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %207 = AIE.tile(16, 2)
  %208 = AIE.buffer(%207) : memref<32x32xf32>
  %209 = AIE.buffer(%207) : memref<32x32xf32>
  %210 = AIE.buffer(%207) : memref<32x32xf32>
  %211 = AIE.buffer(%207) : memref<32x32xf32>
  %212 = AIE.core(%207) {
    call @extern_kernel(%211, %208, %209, %210) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %213 = AIE.tile(16, 3)
  %214 = AIE.buffer(%213) : memref<32x32xf32>
  %215 = AIE.buffer(%213) : memref<32x32xf32>
  %216 = AIE.buffer(%213) : memref<32x32xf32>
  %217 = AIE.buffer(%213) : memref<32x32xf32>
  %218 = AIE.core(%213) {
    call @extern_kernel(%217, %214, %215, %216) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %219 = AIE.tile(16, 4)
  %220 = AIE.buffer(%219) : memref<32x32xf32>
  %221 = AIE.buffer(%219) : memref<32x32xf32>
  %222 = AIE.buffer(%219) : memref<32x32xf32>
  %223 = AIE.buffer(%219) : memref<32x32xf32>
  %224 = AIE.core(%219) {
    call @extern_kernel(%223, %220, %221, %222) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %225 = AIE.tile(16, 5) {polyaie.leaf}
  %226 = AIE.buffer(%225) : memref<32x32xf32>
  %227 = AIE.buffer(%225) : memref<32x32xf32>
  %228 = AIE.buffer(%225) : memref<32x32xf32>
  %229 = AIE.buffer(%225) : memref<32x32xf32>
  %230 = AIE.core(%225) {
    call @extern_kernel(%229, %226, %227, %228) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %231 = AIE.tile(17, 2)
  %232 = AIE.buffer(%231) : memref<32x32xf32>
  %233 = AIE.buffer(%231) : memref<32x32xf32>
  %234 = AIE.buffer(%231) : memref<32x32xf32>
  %235 = AIE.buffer(%231) : memref<32x32xf32>
  %236 = AIE.core(%231) {
    call @extern_kernel(%235, %232, %233, %234) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %237 = AIE.tile(17, 3)
  %238 = AIE.buffer(%237) : memref<32x32xf32>
  %239 = AIE.buffer(%237) : memref<32x32xf32>
  %240 = AIE.buffer(%237) : memref<32x32xf32>
  %241 = AIE.buffer(%237) : memref<32x32xf32>
  %242 = AIE.core(%237) {
    call @extern_kernel(%241, %238, %239, %240) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %243 = AIE.tile(17, 4)
  %244 = AIE.buffer(%243) : memref<32x32xf32>
  %245 = AIE.buffer(%243) : memref<32x32xf32>
  %246 = AIE.buffer(%243) : memref<32x32xf32>
  %247 = AIE.buffer(%243) : memref<32x32xf32>
  %248 = AIE.core(%243) {
    call @extern_kernel(%247, %244, %245, %246) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %249 = AIE.tile(17, 5) {polyaie.leaf}
  %250 = AIE.buffer(%249) : memref<32x32xf32>
  %251 = AIE.buffer(%249) : memref<32x32xf32>
  %252 = AIE.buffer(%249) : memref<32x32xf32>
  %253 = AIE.buffer(%249) : memref<32x32xf32>
  %254 = AIE.core(%249) {
    call @extern_kernel(%253, %250, %251, %252) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %255 = AIE.tile(18, 2)
  %256 = AIE.buffer(%255) : memref<32x32xf32>
  %257 = AIE.buffer(%255) : memref<32x32xf32>
  %258 = AIE.buffer(%255) : memref<32x32xf32>
  %259 = AIE.buffer(%255) : memref<32x32xf32>
  %260 = AIE.core(%255) {
    call @extern_kernel(%259, %256, %257, %258) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %261 = AIE.tile(18, 3)
  %262 = AIE.buffer(%261) : memref<32x32xf32>
  %263 = AIE.buffer(%261) : memref<32x32xf32>
  %264 = AIE.buffer(%261) : memref<32x32xf32>
  %265 = AIE.buffer(%261) : memref<32x32xf32>
  %266 = AIE.core(%261) {
    call @extern_kernel(%265, %262, %263, %264) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %267 = AIE.tile(18, 4)
  %268 = AIE.buffer(%267) : memref<32x32xf32>
  %269 = AIE.buffer(%267) : memref<32x32xf32>
  %270 = AIE.buffer(%267) : memref<32x32xf32>
  %271 = AIE.buffer(%267) : memref<32x32xf32>
  %272 = AIE.core(%267) {
    call @extern_kernel(%271, %268, %269, %270) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %273 = AIE.tile(18, 5) {polyaie.leaf}
  %274 = AIE.buffer(%273) : memref<32x32xf32>
  %275 = AIE.buffer(%273) : memref<32x32xf32>
  %276 = AIE.buffer(%273) : memref<32x32xf32>
  %277 = AIE.buffer(%273) : memref<32x32xf32>
  %278 = AIE.core(%273) {
    call @extern_kernel(%277, %274, %275, %276) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %279 = AIE.tile(19, 2)
  %280 = AIE.buffer(%279) : memref<32x32xf32>
  %281 = AIE.buffer(%279) : memref<32x32xf32>
  %282 = AIE.buffer(%279) : memref<32x32xf32>
  %283 = AIE.buffer(%279) : memref<32x32xf32>
  %284 = AIE.core(%279) {
    call @extern_kernel(%283, %280, %281, %282) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %285 = AIE.tile(19, 3)
  %286 = AIE.buffer(%285) : memref<32x32xf32>
  %287 = AIE.buffer(%285) : memref<32x32xf32>
  %288 = AIE.buffer(%285) : memref<32x32xf32>
  %289 = AIE.buffer(%285) : memref<32x32xf32>
  %290 = AIE.core(%285) {
    call @extern_kernel(%289, %286, %287, %288) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %291 = AIE.tile(19, 4)
  %292 = AIE.buffer(%291) : memref<32x32xf32>
  %293 = AIE.buffer(%291) : memref<32x32xf32>
  %294 = AIE.buffer(%291) : memref<32x32xf32>
  %295 = AIE.buffer(%291) : memref<32x32xf32>
  %296 = AIE.core(%291) {
    call @extern_kernel(%295, %292, %293, %294) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %297 = AIE.tile(19, 5) {polyaie.leaf}
  %298 = AIE.buffer(%297) : memref<32x32xf32>
  %299 = AIE.buffer(%297) : memref<32x32xf32>
  %300 = AIE.buffer(%297) : memref<32x32xf32>
  %301 = AIE.buffer(%297) : memref<32x32xf32>
  %302 = AIE.core(%297) {
    call @extern_kernel(%301, %298, %299, %300) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %303 = AIE.tile(20, 2)
  %304 = AIE.buffer(%303) : memref<32x32xf32>
  %305 = AIE.buffer(%303) : memref<32x32xf32>
  %306 = AIE.buffer(%303) : memref<32x32xf32>
  %307 = AIE.buffer(%303) : memref<32x32xf32>
  %308 = AIE.core(%303) {
    call @extern_kernel(%307, %304, %305, %306) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %309 = AIE.tile(20, 3)
  %310 = AIE.buffer(%309) : memref<32x32xf32>
  %311 = AIE.buffer(%309) : memref<32x32xf32>
  %312 = AIE.buffer(%309) : memref<32x32xf32>
  %313 = AIE.buffer(%309) : memref<32x32xf32>
  %314 = AIE.core(%309) {
    call @extern_kernel(%313, %310, %311, %312) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %315 = AIE.tile(20, 4)
  %316 = AIE.buffer(%315) : memref<32x32xf32>
  %317 = AIE.buffer(%315) : memref<32x32xf32>
  %318 = AIE.buffer(%315) : memref<32x32xf32>
  %319 = AIE.buffer(%315) : memref<32x32xf32>
  %320 = AIE.core(%315) {
    call @extern_kernel(%319, %316, %317, %318) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %321 = AIE.tile(20, 5) {polyaie.leaf}
  %322 = AIE.buffer(%321) : memref<32x32xf32>
  %323 = AIE.buffer(%321) : memref<32x32xf32>
  %324 = AIE.buffer(%321) : memref<32x32xf32>
  %325 = AIE.buffer(%321) : memref<32x32xf32>
  %326 = AIE.core(%321) {
    call @extern_kernel(%325, %322, %323, %324) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %327 = AIE.tile(21, 2)
  %328 = AIE.buffer(%327) : memref<32x32xf32>
  %329 = AIE.buffer(%327) : memref<32x32xf32>
  %330 = AIE.buffer(%327) : memref<32x32xf32>
  %331 = AIE.buffer(%327) : memref<32x32xf32>
  %332 = AIE.core(%327) {
    call @extern_kernel(%331, %328, %329, %330) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %333 = AIE.tile(21, 3)
  %334 = AIE.buffer(%333) : memref<32x32xf32>
  %335 = AIE.buffer(%333) : memref<32x32xf32>
  %336 = AIE.buffer(%333) : memref<32x32xf32>
  %337 = AIE.buffer(%333) : memref<32x32xf32>
  %338 = AIE.core(%333) {
    call @extern_kernel(%337, %334, %335, %336) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %339 = AIE.tile(21, 4)
  %340 = AIE.buffer(%339) : memref<32x32xf32>
  %341 = AIE.buffer(%339) : memref<32x32xf32>
  %342 = AIE.buffer(%339) : memref<32x32xf32>
  %343 = AIE.buffer(%339) : memref<32x32xf32>
  %344 = AIE.core(%339) {
    call @extern_kernel(%343, %340, %341, %342) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %345 = AIE.tile(21, 5) {polyaie.leaf}
  %346 = AIE.buffer(%345) : memref<32x32xf32>
  %347 = AIE.buffer(%345) : memref<32x32xf32>
  %348 = AIE.buffer(%345) : memref<32x32xf32>
  %349 = AIE.buffer(%345) : memref<32x32xf32>
  %350 = AIE.core(%345) {
    call @extern_kernel(%349, %346, %347, %348) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %351 = AIE.tile(22, 2)
  %352 = AIE.buffer(%351) : memref<32x32xf32>
  %353 = AIE.buffer(%351) : memref<32x32xf32>
  %354 = AIE.buffer(%351) : memref<32x32xf32>
  %355 = AIE.buffer(%351) : memref<32x32xf32>
  %356 = AIE.core(%351) {
    call @extern_kernel(%355, %352, %353, %354) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %357 = AIE.tile(22, 3)
  %358 = AIE.buffer(%357) : memref<32x32xf32>
  %359 = AIE.buffer(%357) : memref<32x32xf32>
  %360 = AIE.buffer(%357) : memref<32x32xf32>
  %361 = AIE.buffer(%357) : memref<32x32xf32>
  %362 = AIE.core(%357) {
    call @extern_kernel(%361, %358, %359, %360) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %363 = AIE.tile(22, 4)
  %364 = AIE.buffer(%363) : memref<32x32xf32>
  %365 = AIE.buffer(%363) : memref<32x32xf32>
  %366 = AIE.buffer(%363) : memref<32x32xf32>
  %367 = AIE.buffer(%363) : memref<32x32xf32>
  %368 = AIE.core(%363) {
    call @extern_kernel(%367, %364, %365, %366) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %369 = AIE.tile(22, 5) {polyaie.leaf}
  %370 = AIE.buffer(%369) : memref<32x32xf32>
  %371 = AIE.buffer(%369) : memref<32x32xf32>
  %372 = AIE.buffer(%369) : memref<32x32xf32>
  %373 = AIE.buffer(%369) : memref<32x32xf32>
  %374 = AIE.core(%369) {
    call @extern_kernel(%373, %370, %371, %372) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %375 = AIE.tile(23, 2)
  %376 = AIE.buffer(%375) : memref<32x32xf32>
  %377 = AIE.buffer(%375) : memref<32x32xf32>
  %378 = AIE.buffer(%375) : memref<32x32xf32>
  %379 = AIE.buffer(%375) : memref<32x32xf32>
  %380 = AIE.core(%375) {
    call @extern_kernel(%379, %376, %377, %378) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %381 = AIE.tile(23, 3)
  %382 = AIE.buffer(%381) : memref<32x32xf32>
  %383 = AIE.buffer(%381) : memref<32x32xf32>
  %384 = AIE.buffer(%381) : memref<32x32xf32>
  %385 = AIE.buffer(%381) : memref<32x32xf32>
  %386 = AIE.core(%381) {
    call @extern_kernel(%385, %382, %383, %384) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %387 = AIE.tile(23, 4)
  %388 = AIE.buffer(%387) : memref<32x32xf32>
  %389 = AIE.buffer(%387) : memref<32x32xf32>
  %390 = AIE.buffer(%387) : memref<32x32xf32>
  %391 = AIE.buffer(%387) : memref<32x32xf32>
  %392 = AIE.core(%387) {
    call @extern_kernel(%391, %388, %389, %390) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %393 = AIE.tile(23, 5) {polyaie.leaf}
  %394 = AIE.buffer(%393) : memref<32x32xf32>
  %395 = AIE.buffer(%393) : memref<32x32xf32>
  %396 = AIE.buffer(%393) : memref<32x32xf32>
  %397 = AIE.buffer(%393) : memref<32x32xf32>
  %398 = AIE.core(%393) {
    call @extern_kernel(%397, %394, %395, %396) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %399 = AIE.tile(24, 2)
  %400 = AIE.buffer(%399) : memref<32x32xf32>
  %401 = AIE.buffer(%399) : memref<32x32xf32>
  %402 = AIE.buffer(%399) : memref<32x32xf32>
  %403 = AIE.buffer(%399) : memref<32x32xf32>
  %404 = AIE.core(%399) {
    call @extern_kernel(%403, %400, %401, %402) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %405 = AIE.tile(24, 3)
  %406 = AIE.buffer(%405) : memref<32x32xf32>
  %407 = AIE.buffer(%405) : memref<32x32xf32>
  %408 = AIE.buffer(%405) : memref<32x32xf32>
  %409 = AIE.buffer(%405) : memref<32x32xf32>
  %410 = AIE.core(%405) {
    call @extern_kernel(%409, %406, %407, %408) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %411 = AIE.tile(24, 4)
  %412 = AIE.buffer(%411) : memref<32x32xf32>
  %413 = AIE.buffer(%411) : memref<32x32xf32>
  %414 = AIE.buffer(%411) : memref<32x32xf32>
  %415 = AIE.buffer(%411) : memref<32x32xf32>
  %416 = AIE.core(%411) {
    call @extern_kernel(%415, %412, %413, %414) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %417 = AIE.tile(24, 5) {polyaie.leaf}
  %418 = AIE.buffer(%417) : memref<32x32xf32>
  %419 = AIE.buffer(%417) : memref<32x32xf32>
  %420 = AIE.buffer(%417) : memref<32x32xf32>
  %421 = AIE.buffer(%417) : memref<32x32xf32>
  %422 = AIE.core(%417) {
    call @extern_kernel(%421, %418, %419, %420) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %423 = AIE.tile(25, 2)
  %424 = AIE.buffer(%423) : memref<32x32xf32>
  %425 = AIE.buffer(%423) : memref<32x32xf32>
  %426 = AIE.buffer(%423) : memref<32x32xf32>
  %427 = AIE.buffer(%423) : memref<32x32xf32>
  %428 = AIE.core(%423) {
    call @extern_kernel(%427, %424, %425, %426) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %429 = AIE.tile(25, 3)
  %430 = AIE.buffer(%429) : memref<32x32xf32>
  %431 = AIE.buffer(%429) : memref<32x32xf32>
  %432 = AIE.buffer(%429) : memref<32x32xf32>
  %433 = AIE.buffer(%429) : memref<32x32xf32>
  %434 = AIE.core(%429) {
    call @extern_kernel(%433, %430, %431, %432) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %435 = AIE.tile(25, 4)
  %436 = AIE.buffer(%435) : memref<32x32xf32>
  %437 = AIE.buffer(%435) : memref<32x32xf32>
  %438 = AIE.buffer(%435) : memref<32x32xf32>
  %439 = AIE.buffer(%435) : memref<32x32xf32>
  %440 = AIE.core(%435) {
    call @extern_kernel(%439, %436, %437, %438) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %441 = AIE.tile(25, 5) {polyaie.leaf}
  %442 = AIE.buffer(%441) : memref<32x32xf32>
  %443 = AIE.buffer(%441) : memref<32x32xf32>
  %444 = AIE.buffer(%441) : memref<32x32xf32>
  %445 = AIE.buffer(%441) : memref<32x32xf32>
  %446 = AIE.core(%441) {
    call @extern_kernel(%445, %442, %443, %444) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  "dataflow.aie.broadcast"(%130, %44) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%22, %71, %95, %119, %143) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%298, %9) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%118, %127) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%358, %367) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%100, %109) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%58, %96, %192, %288, %384) {polyaie.PackID0 = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%412, %421) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%262, %271) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%31, %353, %377, %401, %425) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 27 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%39, %150, %246, %342, %438) {polyaie.PackID0 = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%274, %8) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%382, %391) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%76, %85) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%340, %349) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%304, %313) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%5, %269, %293, %317, %341) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%352, %361) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%250, %49) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%310, %319) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%388, %397) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%178, %46) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%23, %72, %168, %264, %360) {polyaie.PackID0 = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%40, %144, %240, %336, %432) {polyaie.PackID0 = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%106, %43) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%52, %132, %228, %324, %420) {polyaie.PackID0 = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%244, %253) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%334, %343) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%166, %175) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%268, %277) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%30, %359, %383, %407, %431) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 27 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%220, %229) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%280, %289) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%286, %295) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%172, %181) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%28, %371, %395, %419, %443) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 27 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%154, %45) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%36, %167, %191, %215, %239) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%6, %263, %287, %311, %335) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%160, %169) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%41, %138, %234, %330, %426) {polyaie.PackID0 = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%196, %205) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%24, %65, %89, %113, %137) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%55, %114, %210, %306, %402) {polyaie.PackID0 = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%20, %77, %101, %125, %149) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%328, %337) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%316, %325) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%29, %365, %389, %413, %437) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 27 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%418, %14) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%88, %97) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %257, %281, %305, %329) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%64, %73) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%430, %439) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%94, %103) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%56, %108, %204, %300, %396) {polyaie.PackID0 = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%346, %11) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%35, %173, %197, %221, %245) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%54, %120, %216, %312, %408) {polyaie.PackID0 = 5 : i64, polyaie.PackID1 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%208, %217) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%148, %157) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%202, %47) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%70, %79) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%59, %90, %186, %282, %378) {polyaie.PackID0 = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%376, %385) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%37, %161, %185, %209, %233) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%436, %445) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %275, %299, %323, %347) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%400, %409) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%226, %48) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%82, %42) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%370, %12) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%142, %151) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%424, %433) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%322, %10) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%184, %193) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%394, %13) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%112, %121) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%21, %78, %174, %270, %366) {polyaie.PackID0 = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%190, %199) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%53, %126, %222, %318, %414) {polyaie.PackID0 = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%406, %415) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%25, %66, %162, %258, %354) {polyaie.PackID0 = 4 : i64, polyaie.PackID1 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%256, %265) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%238, %247) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%34, %179, %203, %227, %251) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%136, %145) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%364, %373) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%57, %102, %198, %294, %390) {polyaie.PackID0 = 6 : i64, polyaie.PackID1 = 6 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.col1 = 26 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%214, %223) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%18, %83, %107, %131, %155) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%442, %15) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%232, %241) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%19, %84, %180, %276, %372) {polyaie.PackID0 = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel0 = 1 : i64, polyaie.channel1 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.col1 = 19 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%292, %301) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%124, %133) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%38, %156, %252, %348, %444) {polyaie.PackID0 = 7 : i64, polyaie.PackID1 = 7 : i64, polyaie.channel0 = 0 : i64, polyaie.channel1 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.col1 = 27 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
}


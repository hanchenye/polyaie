module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<128x128xf32>
  %1 = memref.alloc() : memref<128x128xf32>
  %2 = memref.alloc() : memref<128x128xf32>
  %3 = AIE.tile(19, 0)
  "dataflow.aie.interface"(%3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %1) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %1) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %9 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %10 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %11 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %12 = AIE.external_buffer 147456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %13 = AIE.external_buffer 151556 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %13) {kind = 2 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %14 = AIE.external_buffer 155656 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %15 = AIE.external_buffer 159756 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %16 = AIE.external_buffer 163856 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %17 = AIE.external_buffer 167956 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %18 = AIE.external_buffer 172056 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %18) {kind = 2 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %19 = AIE.external_buffer 176156 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %19) {kind = 2 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %20 = AIE.core(%3) {
    AIE.end
  }
  %21 = AIE.tile(10, 0)
  "dataflow.aie.interface"(%21, %22, %23, %24, %25, %26, %27, %28, %29) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %22 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %23 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %24 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %25 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %26 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %27 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%27, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %28 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%28, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %29 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %30 = AIE.core(%21) {
    AIE.end
  }
  %31 = AIE.tile(18, 0)
  "dataflow.aie.interface"(%31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %32 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%32, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %33 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %34 = AIE.external_buffer 90112 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %35 = AIE.external_buffer 94208 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %36 = AIE.external_buffer 98304 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %37 = AIE.external_buffer 102400 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %38 = AIE.external_buffer 106496 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %39 = AIE.external_buffer 110592 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %2) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %40 = AIE.external_buffer 180256 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %40) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %41 = AIE.external_buffer 184356 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %41) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %42 = AIE.external_buffer 188456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %42) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %43 = AIE.external_buffer 192556 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %43) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %44 = AIE.external_buffer 196656 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %44) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %45 = AIE.external_buffer 200756 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %45) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %46 = AIE.external_buffer 204856 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %46) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %47 = AIE.external_buffer 208956 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %47) {kind = 2 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %48 = AIE.core(%31) {
    AIE.end
  }
  %49 = AIE.tile(11, 0)
  "dataflow.aie.interface"(%49, %50, %51, %52, %53, %54, %55, %56, %57) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %50 = AIE.external_buffer 114688 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%50, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %51 = AIE.external_buffer 118784 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%51, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %52 = AIE.external_buffer 122880 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%52, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %53 = AIE.external_buffer 126976 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%53, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %54 = AIE.external_buffer 131072 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%54, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %55 = AIE.external_buffer 135168 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%55, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %56 = AIE.external_buffer 139264 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %57 = AIE.external_buffer 143360 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %58 = AIE.core(%49) {
    AIE.end
  }
  %59 = AIE.tile(0, 0)
  %60 = AIE.core(%59) {
    AIE.end
  }
  %61 = AIE.tile(10, 2)
  %62 = AIE.buffer(%61) : memref<32x32xf32>
  %63 = AIE.buffer(%61) : memref<32x32xf32>
  %64 = AIE.buffer(%61) : memref<32x32xf32>
  %65 = AIE.buffer(%61) : memref<32x32xf32>
  %66 = AIE.core(%61) {
    call @extern_kernel(%65, %62, %63, %64) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %67 = AIE.tile(10, 3)
  %68 = AIE.buffer(%67) : memref<32x32xf32>
  %69 = AIE.buffer(%67) : memref<32x32xf32>
  %70 = AIE.buffer(%67) : memref<32x32xf32>
  %71 = AIE.buffer(%67) : memref<32x32xf32>
  %72 = AIE.core(%67) {
    call @extern_kernel(%71, %68, %69, %70) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %73 = AIE.tile(10, 4)
  %74 = AIE.buffer(%73) : memref<32x32xf32>
  %75 = AIE.buffer(%73) : memref<32x32xf32>
  %76 = AIE.buffer(%73) : memref<32x32xf32>
  %77 = AIE.buffer(%73) : memref<32x32xf32>
  %78 = AIE.core(%73) {
    call @extern_kernel(%77, %74, %75, %76) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %79 = AIE.tile(10, 5) {polyaie.leaf}
  %80 = AIE.buffer(%79) : memref<32x32xf32>
  %81 = AIE.buffer(%79) : memref<32x32xf32>
  %82 = AIE.buffer(%79) : memref<32x32xf32>
  %83 = AIE.buffer(%79) : memref<32x32xf32>
  %84 = AIE.core(%79) {
    call @extern_kernel(%83, %80, %81, %82) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %85 = AIE.tile(11, 2)
  %86 = AIE.buffer(%85) : memref<32x32xf32>
  %87 = AIE.buffer(%85) : memref<32x32xf32>
  %88 = AIE.buffer(%85) : memref<32x32xf32>
  %89 = AIE.buffer(%85) : memref<32x32xf32>
  %90 = AIE.core(%85) {
    call @extern_kernel(%89, %86, %87, %88) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %91 = AIE.tile(11, 3)
  %92 = AIE.buffer(%91) : memref<32x32xf32>
  %93 = AIE.buffer(%91) : memref<32x32xf32>
  %94 = AIE.buffer(%91) : memref<32x32xf32>
  %95 = AIE.buffer(%91) : memref<32x32xf32>
  %96 = AIE.core(%91) {
    call @extern_kernel(%95, %92, %93, %94) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %97 = AIE.tile(11, 4)
  %98 = AIE.buffer(%97) : memref<32x32xf32>
  %99 = AIE.buffer(%97) : memref<32x32xf32>
  %100 = AIE.buffer(%97) : memref<32x32xf32>
  %101 = AIE.buffer(%97) : memref<32x32xf32>
  %102 = AIE.core(%97) {
    call @extern_kernel(%101, %98, %99, %100) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %103 = AIE.tile(11, 5) {polyaie.leaf}
  %104 = AIE.buffer(%103) : memref<32x32xf32>
  %105 = AIE.buffer(%103) : memref<32x32xf32>
  %106 = AIE.buffer(%103) : memref<32x32xf32>
  %107 = AIE.buffer(%103) : memref<32x32xf32>
  %108 = AIE.core(%103) {
    call @extern_kernel(%107, %104, %105, %106) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %109 = AIE.tile(12, 2)
  %110 = AIE.buffer(%109) : memref<32x32xf32>
  %111 = AIE.buffer(%109) : memref<32x32xf32>
  %112 = AIE.buffer(%109) : memref<32x32xf32>
  %113 = AIE.buffer(%109) : memref<32x32xf32>
  %114 = AIE.core(%109) {
    call @extern_kernel(%113, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %115 = AIE.tile(12, 3)
  %116 = AIE.buffer(%115) : memref<32x32xf32>
  %117 = AIE.buffer(%115) : memref<32x32xf32>
  %118 = AIE.buffer(%115) : memref<32x32xf32>
  %119 = AIE.buffer(%115) : memref<32x32xf32>
  %120 = AIE.core(%115) {
    call @extern_kernel(%119, %116, %117, %118) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %121 = AIE.tile(12, 4)
  %122 = AIE.buffer(%121) : memref<32x32xf32>
  %123 = AIE.buffer(%121) : memref<32x32xf32>
  %124 = AIE.buffer(%121) : memref<32x32xf32>
  %125 = AIE.buffer(%121) : memref<32x32xf32>
  %126 = AIE.core(%121) {
    call @extern_kernel(%125, %122, %123, %124) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %127 = AIE.tile(12, 5) {polyaie.leaf}
  %128 = AIE.buffer(%127) : memref<32x32xf32>
  %129 = AIE.buffer(%127) : memref<32x32xf32>
  %130 = AIE.buffer(%127) : memref<32x32xf32>
  %131 = AIE.buffer(%127) : memref<32x32xf32>
  %132 = AIE.core(%127) {
    call @extern_kernel(%131, %128, %129, %130) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %133 = AIE.tile(13, 2)
  %134 = AIE.buffer(%133) : memref<32x32xf32>
  %135 = AIE.buffer(%133) : memref<32x32xf32>
  %136 = AIE.buffer(%133) : memref<32x32xf32>
  %137 = AIE.buffer(%133) : memref<32x32xf32>
  %138 = AIE.core(%133) {
    call @extern_kernel(%137, %134, %135, %136) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %139 = AIE.tile(13, 3)
  %140 = AIE.buffer(%139) : memref<32x32xf32>
  %141 = AIE.buffer(%139) : memref<32x32xf32>
  %142 = AIE.buffer(%139) : memref<32x32xf32>
  %143 = AIE.buffer(%139) : memref<32x32xf32>
  %144 = AIE.core(%139) {
    call @extern_kernel(%143, %140, %141, %142) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %145 = AIE.tile(13, 4)
  %146 = AIE.buffer(%145) : memref<32x32xf32>
  %147 = AIE.buffer(%145) : memref<32x32xf32>
  %148 = AIE.buffer(%145) : memref<32x32xf32>
  %149 = AIE.buffer(%145) : memref<32x32xf32>
  %150 = AIE.core(%145) {
    call @extern_kernel(%149, %146, %147, %148) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %151 = AIE.tile(13, 5) {polyaie.leaf}
  %152 = AIE.buffer(%151) : memref<32x32xf32>
  %153 = AIE.buffer(%151) : memref<32x32xf32>
  %154 = AIE.buffer(%151) : memref<32x32xf32>
  %155 = AIE.buffer(%151) : memref<32x32xf32>
  %156 = AIE.core(%151) {
    call @extern_kernel(%155, %152, %153, %154) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %157 = AIE.tile(14, 2)
  %158 = AIE.buffer(%157) : memref<32x32xf32>
  %159 = AIE.buffer(%157) : memref<32x32xf32>
  %160 = AIE.buffer(%157) : memref<32x32xf32>
  %161 = AIE.buffer(%157) : memref<32x32xf32>
  %162 = AIE.core(%157) {
    call @extern_kernel(%161, %158, %159, %160) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %163 = AIE.tile(14, 3)
  %164 = AIE.buffer(%163) : memref<32x32xf32>
  %165 = AIE.buffer(%163) : memref<32x32xf32>
  %166 = AIE.buffer(%163) : memref<32x32xf32>
  %167 = AIE.buffer(%163) : memref<32x32xf32>
  %168 = AIE.core(%163) {
    call @extern_kernel(%167, %164, %165, %166) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %169 = AIE.tile(14, 4)
  %170 = AIE.buffer(%169) : memref<32x32xf32>
  %171 = AIE.buffer(%169) : memref<32x32xf32>
  %172 = AIE.buffer(%169) : memref<32x32xf32>
  %173 = AIE.buffer(%169) : memref<32x32xf32>
  %174 = AIE.core(%169) {
    call @extern_kernel(%173, %170, %171, %172) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %175 = AIE.tile(14, 5) {polyaie.leaf}
  %176 = AIE.buffer(%175) : memref<32x32xf32>
  %177 = AIE.buffer(%175) : memref<32x32xf32>
  %178 = AIE.buffer(%175) : memref<32x32xf32>
  %179 = AIE.buffer(%175) : memref<32x32xf32>
  %180 = AIE.core(%175) {
    call @extern_kernel(%179, %176, %177, %178) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %181 = AIE.tile(15, 2)
  %182 = AIE.buffer(%181) : memref<32x32xf32>
  %183 = AIE.buffer(%181) : memref<32x32xf32>
  %184 = AIE.buffer(%181) : memref<32x32xf32>
  %185 = AIE.buffer(%181) : memref<32x32xf32>
  %186 = AIE.core(%181) {
    call @extern_kernel(%185, %182, %183, %184) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %187 = AIE.tile(15, 3)
  %188 = AIE.buffer(%187) : memref<32x32xf32>
  %189 = AIE.buffer(%187) : memref<32x32xf32>
  %190 = AIE.buffer(%187) : memref<32x32xf32>
  %191 = AIE.buffer(%187) : memref<32x32xf32>
  %192 = AIE.core(%187) {
    call @extern_kernel(%191, %188, %189, %190) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %193 = AIE.tile(15, 4)
  %194 = AIE.buffer(%193) : memref<32x32xf32>
  %195 = AIE.buffer(%193) : memref<32x32xf32>
  %196 = AIE.buffer(%193) : memref<32x32xf32>
  %197 = AIE.buffer(%193) : memref<32x32xf32>
  %198 = AIE.core(%193) {
    call @extern_kernel(%197, %194, %195, %196) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %199 = AIE.tile(15, 5) {polyaie.leaf}
  %200 = AIE.buffer(%199) : memref<32x32xf32>
  %201 = AIE.buffer(%199) : memref<32x32xf32>
  %202 = AIE.buffer(%199) : memref<32x32xf32>
  %203 = AIE.buffer(%199) : memref<32x32xf32>
  %204 = AIE.core(%199) {
    call @extern_kernel(%203, %200, %201, %202) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %205 = AIE.tile(16, 2)
  %206 = AIE.buffer(%205) : memref<32x32xf32>
  %207 = AIE.buffer(%205) : memref<32x32xf32>
  %208 = AIE.buffer(%205) : memref<32x32xf32>
  %209 = AIE.buffer(%205) : memref<32x32xf32>
  %210 = AIE.core(%205) {
    call @extern_kernel(%209, %206, %207, %208) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %211 = AIE.tile(16, 3)
  %212 = AIE.buffer(%211) : memref<32x32xf32>
  %213 = AIE.buffer(%211) : memref<32x32xf32>
  %214 = AIE.buffer(%211) : memref<32x32xf32>
  %215 = AIE.buffer(%211) : memref<32x32xf32>
  %216 = AIE.core(%211) {
    call @extern_kernel(%215, %212, %213, %214) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %217 = AIE.tile(16, 4)
  %218 = AIE.buffer(%217) : memref<32x32xf32>
  %219 = AIE.buffer(%217) : memref<32x32xf32>
  %220 = AIE.buffer(%217) : memref<32x32xf32>
  %221 = AIE.buffer(%217) : memref<32x32xf32>
  %222 = AIE.core(%217) {
    call @extern_kernel(%221, %218, %219, %220) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %223 = AIE.tile(16, 5) {polyaie.leaf}
  %224 = AIE.buffer(%223) : memref<32x32xf32>
  %225 = AIE.buffer(%223) : memref<32x32xf32>
  %226 = AIE.buffer(%223) : memref<32x32xf32>
  %227 = AIE.buffer(%223) : memref<32x32xf32>
  %228 = AIE.core(%223) {
    call @extern_kernel(%227, %224, %225, %226) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %229 = AIE.tile(17, 2)
  %230 = AIE.buffer(%229) : memref<32x32xf32>
  %231 = AIE.buffer(%229) : memref<32x32xf32>
  %232 = AIE.buffer(%229) : memref<32x32xf32>
  %233 = AIE.buffer(%229) : memref<32x32xf32>
  %234 = AIE.core(%229) {
    call @extern_kernel(%233, %230, %231, %232) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %235 = AIE.tile(17, 3)
  %236 = AIE.buffer(%235) : memref<32x32xf32>
  %237 = AIE.buffer(%235) : memref<32x32xf32>
  %238 = AIE.buffer(%235) : memref<32x32xf32>
  %239 = AIE.buffer(%235) : memref<32x32xf32>
  %240 = AIE.core(%235) {
    call @extern_kernel(%239, %236, %237, %238) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %241 = AIE.tile(17, 4)
  %242 = AIE.buffer(%241) : memref<32x32xf32>
  %243 = AIE.buffer(%241) : memref<32x32xf32>
  %244 = AIE.buffer(%241) : memref<32x32xf32>
  %245 = AIE.buffer(%241) : memref<32x32xf32>
  %246 = AIE.core(%241) {
    call @extern_kernel(%245, %242, %243, %244) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %247 = AIE.tile(17, 5) {polyaie.leaf}
  %248 = AIE.buffer(%247) : memref<32x32xf32>
  %249 = AIE.buffer(%247) : memref<32x32xf32>
  %250 = AIE.buffer(%247) : memref<32x32xf32>
  %251 = AIE.buffer(%247) : memref<32x32xf32>
  %252 = AIE.core(%247) {
    call @extern_kernel(%251, %248, %249, %250) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %253 = AIE.tile(18, 2)
  %254 = AIE.buffer(%253) : memref<32x32xf32>
  %255 = AIE.buffer(%253) : memref<32x32xf32>
  %256 = AIE.buffer(%253) : memref<32x32xf32>
  %257 = AIE.buffer(%253) : memref<32x32xf32>
  %258 = AIE.core(%253) {
    call @extern_kernel(%257, %254, %255, %256) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %259 = AIE.tile(18, 3)
  %260 = AIE.buffer(%259) : memref<32x32xf32>
  %261 = AIE.buffer(%259) : memref<32x32xf32>
  %262 = AIE.buffer(%259) : memref<32x32xf32>
  %263 = AIE.buffer(%259) : memref<32x32xf32>
  %264 = AIE.core(%259) {
    call @extern_kernel(%263, %260, %261, %262) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %265 = AIE.tile(18, 4)
  %266 = AIE.buffer(%265) : memref<32x32xf32>
  %267 = AIE.buffer(%265) : memref<32x32xf32>
  %268 = AIE.buffer(%265) : memref<32x32xf32>
  %269 = AIE.buffer(%265) : memref<32x32xf32>
  %270 = AIE.core(%265) {
    call @extern_kernel(%269, %266, %267, %268) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %271 = AIE.tile(18, 5) {polyaie.leaf}
  %272 = AIE.buffer(%271) : memref<32x32xf32>
  %273 = AIE.buffer(%271) : memref<32x32xf32>
  %274 = AIE.buffer(%271) : memref<32x32xf32>
  %275 = AIE.buffer(%271) : memref<32x32xf32>
  %276 = AIE.core(%271) {
    call @extern_kernel(%275, %272, %273, %274) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %277 = AIE.tile(19, 2)
  %278 = AIE.buffer(%277) : memref<32x32xf32>
  %279 = AIE.buffer(%277) : memref<32x32xf32>
  %280 = AIE.buffer(%277) : memref<32x32xf32>
  %281 = AIE.buffer(%277) : memref<32x32xf32>
  %282 = AIE.core(%277) {
    call @extern_kernel(%281, %278, %279, %280) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %283 = AIE.tile(19, 3)
  %284 = AIE.buffer(%283) : memref<32x32xf32>
  %285 = AIE.buffer(%283) : memref<32x32xf32>
  %286 = AIE.buffer(%283) : memref<32x32xf32>
  %287 = AIE.buffer(%283) : memref<32x32xf32>
  %288 = AIE.core(%283) {
    call @extern_kernel(%287, %284, %285, %286) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %289 = AIE.tile(19, 4)
  %290 = AIE.buffer(%289) : memref<32x32xf32>
  %291 = AIE.buffer(%289) : memref<32x32xf32>
  %292 = AIE.buffer(%289) : memref<32x32xf32>
  %293 = AIE.buffer(%289) : memref<32x32xf32>
  %294 = AIE.core(%289) {
    call @extern_kernel(%293, %290, %291, %292) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %295 = AIE.tile(19, 5) {polyaie.leaf}
  %296 = AIE.buffer(%295) : memref<32x32xf32>
  %297 = AIE.buffer(%295) : memref<32x32xf32>
  %298 = AIE.buffer(%295) : memref<32x32xf32>
  %299 = AIE.buffer(%295) : memref<32x32xf32>
  %300 = AIE.core(%295) {
    call @extern_kernel(%299, %296, %297, %298) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %301 = AIE.tile(20, 2)
  %302 = AIE.buffer(%301) : memref<32x32xf32>
  %303 = AIE.buffer(%301) : memref<32x32xf32>
  %304 = AIE.buffer(%301) : memref<32x32xf32>
  %305 = AIE.buffer(%301) : memref<32x32xf32>
  %306 = AIE.core(%301) {
    call @extern_kernel(%305, %302, %303, %304) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %307 = AIE.tile(20, 3)
  %308 = AIE.buffer(%307) : memref<32x32xf32>
  %309 = AIE.buffer(%307) : memref<32x32xf32>
  %310 = AIE.buffer(%307) : memref<32x32xf32>
  %311 = AIE.buffer(%307) : memref<32x32xf32>
  %312 = AIE.core(%307) {
    call @extern_kernel(%311, %308, %309, %310) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %313 = AIE.tile(20, 4)
  %314 = AIE.buffer(%313) : memref<32x32xf32>
  %315 = AIE.buffer(%313) : memref<32x32xf32>
  %316 = AIE.buffer(%313) : memref<32x32xf32>
  %317 = AIE.buffer(%313) : memref<32x32xf32>
  %318 = AIE.core(%313) {
    call @extern_kernel(%317, %314, %315, %316) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %319 = AIE.tile(20, 5) {polyaie.leaf}
  %320 = AIE.buffer(%319) : memref<32x32xf32>
  %321 = AIE.buffer(%319) : memref<32x32xf32>
  %322 = AIE.buffer(%319) : memref<32x32xf32>
  %323 = AIE.buffer(%319) : memref<32x32xf32>
  %324 = AIE.core(%319) {
    call @extern_kernel(%323, %320, %321, %322) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %325 = AIE.tile(21, 2)
  %326 = AIE.buffer(%325) : memref<32x32xf32>
  %327 = AIE.buffer(%325) : memref<32x32xf32>
  %328 = AIE.buffer(%325) : memref<32x32xf32>
  %329 = AIE.buffer(%325) : memref<32x32xf32>
  %330 = AIE.core(%325) {
    call @extern_kernel(%329, %326, %327, %328) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %331 = AIE.tile(21, 3)
  %332 = AIE.buffer(%331) : memref<32x32xf32>
  %333 = AIE.buffer(%331) : memref<32x32xf32>
  %334 = AIE.buffer(%331) : memref<32x32xf32>
  %335 = AIE.buffer(%331) : memref<32x32xf32>
  %336 = AIE.core(%331) {
    call @extern_kernel(%335, %332, %333, %334) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %337 = AIE.tile(21, 4)
  %338 = AIE.buffer(%337) : memref<32x32xf32>
  %339 = AIE.buffer(%337) : memref<32x32xf32>
  %340 = AIE.buffer(%337) : memref<32x32xf32>
  %341 = AIE.buffer(%337) : memref<32x32xf32>
  %342 = AIE.core(%337) {
    call @extern_kernel(%341, %338, %339, %340) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %343 = AIE.tile(21, 5) {polyaie.leaf}
  %344 = AIE.buffer(%343) : memref<32x32xf32>
  %345 = AIE.buffer(%343) : memref<32x32xf32>
  %346 = AIE.buffer(%343) : memref<32x32xf32>
  %347 = AIE.buffer(%343) : memref<32x32xf32>
  %348 = AIE.core(%343) {
    call @extern_kernel(%347, %344, %345, %346) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %349 = AIE.tile(22, 2)
  %350 = AIE.buffer(%349) : memref<32x32xf32>
  %351 = AIE.buffer(%349) : memref<32x32xf32>
  %352 = AIE.buffer(%349) : memref<32x32xf32>
  %353 = AIE.buffer(%349) : memref<32x32xf32>
  %354 = AIE.core(%349) {
    call @extern_kernel(%353, %350, %351, %352) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %355 = AIE.tile(22, 3)
  %356 = AIE.buffer(%355) : memref<32x32xf32>
  %357 = AIE.buffer(%355) : memref<32x32xf32>
  %358 = AIE.buffer(%355) : memref<32x32xf32>
  %359 = AIE.buffer(%355) : memref<32x32xf32>
  %360 = AIE.core(%355) {
    call @extern_kernel(%359, %356, %357, %358) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %361 = AIE.tile(22, 4)
  %362 = AIE.buffer(%361) : memref<32x32xf32>
  %363 = AIE.buffer(%361) : memref<32x32xf32>
  %364 = AIE.buffer(%361) : memref<32x32xf32>
  %365 = AIE.buffer(%361) : memref<32x32xf32>
  %366 = AIE.core(%361) {
    call @extern_kernel(%365, %362, %363, %364) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %367 = AIE.tile(22, 5) {polyaie.leaf}
  %368 = AIE.buffer(%367) : memref<32x32xf32>
  %369 = AIE.buffer(%367) : memref<32x32xf32>
  %370 = AIE.buffer(%367) : memref<32x32xf32>
  %371 = AIE.buffer(%367) : memref<32x32xf32>
  %372 = AIE.core(%367) {
    call @extern_kernel(%371, %368, %369, %370) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %373 = AIE.tile(23, 2)
  %374 = AIE.buffer(%373) : memref<32x32xf32>
  %375 = AIE.buffer(%373) : memref<32x32xf32>
  %376 = AIE.buffer(%373) : memref<32x32xf32>
  %377 = AIE.buffer(%373) : memref<32x32xf32>
  %378 = AIE.core(%373) {
    call @extern_kernel(%377, %374, %375, %376) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %379 = AIE.tile(23, 3)
  %380 = AIE.buffer(%379) : memref<32x32xf32>
  %381 = AIE.buffer(%379) : memref<32x32xf32>
  %382 = AIE.buffer(%379) : memref<32x32xf32>
  %383 = AIE.buffer(%379) : memref<32x32xf32>
  %384 = AIE.core(%379) {
    call @extern_kernel(%383, %380, %381, %382) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %385 = AIE.tile(23, 4)
  %386 = AIE.buffer(%385) : memref<32x32xf32>
  %387 = AIE.buffer(%385) : memref<32x32xf32>
  %388 = AIE.buffer(%385) : memref<32x32xf32>
  %389 = AIE.buffer(%385) : memref<32x32xf32>
  %390 = AIE.core(%385) {
    call @extern_kernel(%389, %386, %387, %388) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %391 = AIE.tile(23, 5) {polyaie.leaf}
  %392 = AIE.buffer(%391) : memref<32x32xf32>
  %393 = AIE.buffer(%391) : memref<32x32xf32>
  %394 = AIE.buffer(%391) : memref<32x32xf32>
  %395 = AIE.buffer(%391) : memref<32x32xf32>
  %396 = AIE.core(%391) {
    call @extern_kernel(%395, %392, %393, %394) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %397 = AIE.tile(24, 2)
  %398 = AIE.buffer(%397) : memref<32x32xf32>
  %399 = AIE.buffer(%397) : memref<32x32xf32>
  %400 = AIE.buffer(%397) : memref<32x32xf32>
  %401 = AIE.buffer(%397) : memref<32x32xf32>
  %402 = AIE.core(%397) {
    call @extern_kernel(%401, %398, %399, %400) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %403 = AIE.tile(24, 3)
  %404 = AIE.buffer(%403) : memref<32x32xf32>
  %405 = AIE.buffer(%403) : memref<32x32xf32>
  %406 = AIE.buffer(%403) : memref<32x32xf32>
  %407 = AIE.buffer(%403) : memref<32x32xf32>
  %408 = AIE.core(%403) {
    call @extern_kernel(%407, %404, %405, %406) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %409 = AIE.tile(24, 4)
  %410 = AIE.buffer(%409) : memref<32x32xf32>
  %411 = AIE.buffer(%409) : memref<32x32xf32>
  %412 = AIE.buffer(%409) : memref<32x32xf32>
  %413 = AIE.buffer(%409) : memref<32x32xf32>
  %414 = AIE.core(%409) {
    call @extern_kernel(%413, %410, %411, %412) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %415 = AIE.tile(24, 5) {polyaie.leaf}
  %416 = AIE.buffer(%415) : memref<32x32xf32>
  %417 = AIE.buffer(%415) : memref<32x32xf32>
  %418 = AIE.buffer(%415) : memref<32x32xf32>
  %419 = AIE.buffer(%415) : memref<32x32xf32>
  %420 = AIE.core(%415) {
    call @extern_kernel(%419, %416, %417, %418) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %421 = AIE.tile(25, 2)
  %422 = AIE.buffer(%421) : memref<32x32xf32>
  %423 = AIE.buffer(%421) : memref<32x32xf32>
  %424 = AIE.buffer(%421) : memref<32x32xf32>
  %425 = AIE.buffer(%421) : memref<32x32xf32>
  %426 = AIE.core(%421) {
    call @extern_kernel(%425, %422, %423, %424) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %427 = AIE.tile(25, 3)
  %428 = AIE.buffer(%427) : memref<32x32xf32>
  %429 = AIE.buffer(%427) : memref<32x32xf32>
  %430 = AIE.buffer(%427) : memref<32x32xf32>
  %431 = AIE.buffer(%427) : memref<32x32xf32>
  %432 = AIE.core(%427) {
    call @extern_kernel(%431, %428, %429, %430) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %433 = AIE.tile(25, 4)
  %434 = AIE.buffer(%433) : memref<32x32xf32>
  %435 = AIE.buffer(%433) : memref<32x32xf32>
  %436 = AIE.buffer(%433) : memref<32x32xf32>
  %437 = AIE.buffer(%433) : memref<32x32xf32>
  %438 = AIE.core(%433) {
    call @extern_kernel(%437, %434, %435, %436) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %439 = AIE.tile(25, 5) {polyaie.leaf}
  %440 = AIE.buffer(%439) : memref<32x32xf32>
  %441 = AIE.buffer(%439) : memref<32x32xf32>
  %442 = AIE.buffer(%439) : memref<32x32xf32>
  %443 = AIE.buffer(%439) : memref<32x32xf32>
  %444 = AIE.core(%439) {
    call @extern_kernel(%443, %440, %441, %442) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  "dataflow.aie.broadcast"(%34, %165, %189, %213, %237) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%32, %177, %201, %225, %249) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%158, %167) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%8, %273, %297, %321, %345) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%33, %171, %195, %219, %243) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%39, %136, %232, %328, %424) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%434, %443) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%380, %389) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%128, %42) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%62, %71) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%248, %47) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%164, %173) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%140, %149) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%284, %293) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %369, %393, %417, %441) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%51, %124, %220, %316, %412) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%146, %155) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%74, %83) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%398, %407) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%110, %119) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%326, %335) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%56, %94, %190, %286, %382) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%50, %130, %226, %322, %418) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%362, %371) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%6, %357, %381, %405, %429) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%25, %76, %172, %268, %364) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%356, %365) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%22, %81, %105, %129, %153) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%278, %287) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%52, %118, %214, %310, %406) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%272, %12) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%29, %64, %160, %256, %352) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%57, %88, %184, %280, %376) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%38, %142, %238, %334, %430) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%242, %251) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%188, %197) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%422, %431) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%224, %46) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%35, %159, %183, %207, %231) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%266, %275) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%236, %245) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%350, %359) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%440, %19) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%104, %41) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%54, %106, %202, %298, %394) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%302, %311) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%386, %395) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%23, %82, %178, %274, %370) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%9, %267, %291, %315, %339) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%200, %45) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%98, %107) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%344, %15) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%27, %70, %166, %262, %358) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%296, %13) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%122, %131) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %351, %375, %399, %423) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%24, %75, %99, %123, %147) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%254, %263) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%26, %69, %93, %117, %141) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%230, %239) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%36, %154, %250, %346, %442) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%428, %437) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%416, %18) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%320, %14) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%392, %17) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%68, %77) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%182, %191) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%86, %95) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%404, %413) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%206, %215) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%37, %148, %244, %340, %436) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%152, %43) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%194, %203) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%92, %101) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%332, %341) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%170, %179) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%308, %317) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%374, %383) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%10, %261, %285, %309, %333) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%218, %227) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%368, %16) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%80, %40) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%212, %221) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%134, %143) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%338, %347) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%53, %112, %208, %304, %400) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%176, %44) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%260, %269) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%55, %100, %196, %292, %388) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%290, %299) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%314, %323) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%116, %125) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%11, %255, %279, %303, %327) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%28, %63, %87, %111, %135) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%410, %419) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%5, %363, %387, %411, %435) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 19 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
}


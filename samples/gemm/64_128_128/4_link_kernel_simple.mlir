module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<64x128xf32>
  %1 = memref.alloc() : memref<64x128xf32>
  %2 = memref.alloc() : memref<128x128xf32>
  %3 = AIE.tile(10, 0)
  "dataflow.aie.interface"(%3, %4, %5, %6, %7, %8, %9, %10, %11) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %9 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %10 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %11 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %12 = AIE.core(%3) {
    AIE.end
  }
  %13 = AIE.tile(18, 0)
  "dataflow.aie.interface"(%13, %14, %15, %16, %17, %18, %19, %20, %21) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %14 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %15 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %16 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %17 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %18 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %19 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %20 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %21 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %2) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %22 = AIE.core(%13) {
    AIE.end
  }
  %23 = AIE.tile(11, 0)
  "dataflow.aie.interface"(%23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %24 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %25 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %26 = AIE.external_buffer 90112 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %27 = AIE.external_buffer 94208 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%27, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %28 = AIE.external_buffer 98304 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%28, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %29 = AIE.external_buffer 102400 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %30 = AIE.external_buffer 106496 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %31 = AIE.external_buffer 110592 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %32 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %32) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %33 = AIE.external_buffer 118788 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %33) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %34 = AIE.external_buffer 122888 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %34) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %35 = AIE.external_buffer 126988 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %35) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %36 = AIE.external_buffer 131088 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %36) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %37 = AIE.external_buffer 135188 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %37) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %38 = AIE.external_buffer 139288 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %38) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %39 = AIE.external_buffer 143388 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %39) {kind = 2 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %40 = AIE.core(%23) {
    AIE.end
  }
  %41 = AIE.tile(0, 0)
  %42 = AIE.core(%41) {
    AIE.end
  }
  %43 = AIE.tile(10, 2)
  %44 = AIE.buffer(%43) : memref<32x32xf32>
  %45 = AIE.buffer(%43) : memref<32x32xf32>
  %46 = AIE.buffer(%43) : memref<32x32xf32>
  %47 = AIE.buffer(%43) : memref<32x32xf32>
  %48 = AIE.core(%43) {
    call @extern_kernel(%47, %44, %45, %46) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %49 = AIE.tile(10, 3)
  %50 = AIE.buffer(%49) : memref<32x32xf32>
  %51 = AIE.buffer(%49) : memref<32x32xf32>
  %52 = AIE.buffer(%49) : memref<32x32xf32>
  %53 = AIE.buffer(%49) : memref<32x32xf32>
  %54 = AIE.core(%49) {
    call @extern_kernel(%53, %50, %51, %52) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %55 = AIE.tile(10, 4)
  %56 = AIE.buffer(%55) : memref<32x32xf32>
  %57 = AIE.buffer(%55) : memref<32x32xf32>
  %58 = AIE.buffer(%55) : memref<32x32xf32>
  %59 = AIE.buffer(%55) : memref<32x32xf32>
  %60 = AIE.core(%55) {
    call @extern_kernel(%59, %56, %57, %58) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %61 = AIE.tile(10, 5) {polyaie.leaf}
  %62 = AIE.buffer(%61) : memref<32x32xf32>
  %63 = AIE.buffer(%61) : memref<32x32xf32>
  %64 = AIE.buffer(%61) : memref<32x32xf32>
  %65 = AIE.buffer(%61) : memref<32x32xf32>
  %66 = AIE.core(%61) {
    call @extern_kernel(%65, %62, %63, %64) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %67 = AIE.tile(11, 2)
  %68 = AIE.buffer(%67) : memref<32x32xf32>
  %69 = AIE.buffer(%67) : memref<32x32xf32>
  %70 = AIE.buffer(%67) : memref<32x32xf32>
  %71 = AIE.buffer(%67) : memref<32x32xf32>
  %72 = AIE.core(%67) {
    call @extern_kernel(%71, %68, %69, %70) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %73 = AIE.tile(11, 3)
  %74 = AIE.buffer(%73) : memref<32x32xf32>
  %75 = AIE.buffer(%73) : memref<32x32xf32>
  %76 = AIE.buffer(%73) : memref<32x32xf32>
  %77 = AIE.buffer(%73) : memref<32x32xf32>
  %78 = AIE.core(%73) {
    call @extern_kernel(%77, %74, %75, %76) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %79 = AIE.tile(11, 4)
  %80 = AIE.buffer(%79) : memref<32x32xf32>
  %81 = AIE.buffer(%79) : memref<32x32xf32>
  %82 = AIE.buffer(%79) : memref<32x32xf32>
  %83 = AIE.buffer(%79) : memref<32x32xf32>
  %84 = AIE.core(%79) {
    call @extern_kernel(%83, %80, %81, %82) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %85 = AIE.tile(11, 5) {polyaie.leaf}
  %86 = AIE.buffer(%85) : memref<32x32xf32>
  %87 = AIE.buffer(%85) : memref<32x32xf32>
  %88 = AIE.buffer(%85) : memref<32x32xf32>
  %89 = AIE.buffer(%85) : memref<32x32xf32>
  %90 = AIE.core(%85) {
    call @extern_kernel(%89, %86, %87, %88) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %91 = AIE.tile(12, 2)
  %92 = AIE.buffer(%91) : memref<32x32xf32>
  %93 = AIE.buffer(%91) : memref<32x32xf32>
  %94 = AIE.buffer(%91) : memref<32x32xf32>
  %95 = AIE.buffer(%91) : memref<32x32xf32>
  %96 = AIE.core(%91) {
    call @extern_kernel(%95, %92, %93, %94) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %97 = AIE.tile(12, 3)
  %98 = AIE.buffer(%97) : memref<32x32xf32>
  %99 = AIE.buffer(%97) : memref<32x32xf32>
  %100 = AIE.buffer(%97) : memref<32x32xf32>
  %101 = AIE.buffer(%97) : memref<32x32xf32>
  %102 = AIE.core(%97) {
    call @extern_kernel(%101, %98, %99, %100) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %103 = AIE.tile(12, 4)
  %104 = AIE.buffer(%103) : memref<32x32xf32>
  %105 = AIE.buffer(%103) : memref<32x32xf32>
  %106 = AIE.buffer(%103) : memref<32x32xf32>
  %107 = AIE.buffer(%103) : memref<32x32xf32>
  %108 = AIE.core(%103) {
    call @extern_kernel(%107, %104, %105, %106) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %109 = AIE.tile(12, 5) {polyaie.leaf}
  %110 = AIE.buffer(%109) : memref<32x32xf32>
  %111 = AIE.buffer(%109) : memref<32x32xf32>
  %112 = AIE.buffer(%109) : memref<32x32xf32>
  %113 = AIE.buffer(%109) : memref<32x32xf32>
  %114 = AIE.core(%109) {
    call @extern_kernel(%113, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %115 = AIE.tile(13, 2)
  %116 = AIE.buffer(%115) : memref<32x32xf32>
  %117 = AIE.buffer(%115) : memref<32x32xf32>
  %118 = AIE.buffer(%115) : memref<32x32xf32>
  %119 = AIE.buffer(%115) : memref<32x32xf32>
  %120 = AIE.core(%115) {
    call @extern_kernel(%119, %116, %117, %118) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %121 = AIE.tile(13, 3)
  %122 = AIE.buffer(%121) : memref<32x32xf32>
  %123 = AIE.buffer(%121) : memref<32x32xf32>
  %124 = AIE.buffer(%121) : memref<32x32xf32>
  %125 = AIE.buffer(%121) : memref<32x32xf32>
  %126 = AIE.core(%121) {
    call @extern_kernel(%125, %122, %123, %124) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %127 = AIE.tile(13, 4)
  %128 = AIE.buffer(%127) : memref<32x32xf32>
  %129 = AIE.buffer(%127) : memref<32x32xf32>
  %130 = AIE.buffer(%127) : memref<32x32xf32>
  %131 = AIE.buffer(%127) : memref<32x32xf32>
  %132 = AIE.core(%127) {
    call @extern_kernel(%131, %128, %129, %130) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %133 = AIE.tile(13, 5) {polyaie.leaf}
  %134 = AIE.buffer(%133) : memref<32x32xf32>
  %135 = AIE.buffer(%133) : memref<32x32xf32>
  %136 = AIE.buffer(%133) : memref<32x32xf32>
  %137 = AIE.buffer(%133) : memref<32x32xf32>
  %138 = AIE.core(%133) {
    call @extern_kernel(%137, %134, %135, %136) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %139 = AIE.tile(14, 2)
  %140 = AIE.buffer(%139) : memref<32x32xf32>
  %141 = AIE.buffer(%139) : memref<32x32xf32>
  %142 = AIE.buffer(%139) : memref<32x32xf32>
  %143 = AIE.buffer(%139) : memref<32x32xf32>
  %144 = AIE.core(%139) {
    call @extern_kernel(%143, %140, %141, %142) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %145 = AIE.tile(14, 3)
  %146 = AIE.buffer(%145) : memref<32x32xf32>
  %147 = AIE.buffer(%145) : memref<32x32xf32>
  %148 = AIE.buffer(%145) : memref<32x32xf32>
  %149 = AIE.buffer(%145) : memref<32x32xf32>
  %150 = AIE.core(%145) {
    call @extern_kernel(%149, %146, %147, %148) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %151 = AIE.tile(14, 4)
  %152 = AIE.buffer(%151) : memref<32x32xf32>
  %153 = AIE.buffer(%151) : memref<32x32xf32>
  %154 = AIE.buffer(%151) : memref<32x32xf32>
  %155 = AIE.buffer(%151) : memref<32x32xf32>
  %156 = AIE.core(%151) {
    call @extern_kernel(%155, %152, %153, %154) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %157 = AIE.tile(14, 5) {polyaie.leaf}
  %158 = AIE.buffer(%157) : memref<32x32xf32>
  %159 = AIE.buffer(%157) : memref<32x32xf32>
  %160 = AIE.buffer(%157) : memref<32x32xf32>
  %161 = AIE.buffer(%157) : memref<32x32xf32>
  %162 = AIE.core(%157) {
    call @extern_kernel(%161, %158, %159, %160) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %163 = AIE.tile(15, 2)
  %164 = AIE.buffer(%163) : memref<32x32xf32>
  %165 = AIE.buffer(%163) : memref<32x32xf32>
  %166 = AIE.buffer(%163) : memref<32x32xf32>
  %167 = AIE.buffer(%163) : memref<32x32xf32>
  %168 = AIE.core(%163) {
    call @extern_kernel(%167, %164, %165, %166) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %169 = AIE.tile(15, 3)
  %170 = AIE.buffer(%169) : memref<32x32xf32>
  %171 = AIE.buffer(%169) : memref<32x32xf32>
  %172 = AIE.buffer(%169) : memref<32x32xf32>
  %173 = AIE.buffer(%169) : memref<32x32xf32>
  %174 = AIE.core(%169) {
    call @extern_kernel(%173, %170, %171, %172) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %175 = AIE.tile(15, 4)
  %176 = AIE.buffer(%175) : memref<32x32xf32>
  %177 = AIE.buffer(%175) : memref<32x32xf32>
  %178 = AIE.buffer(%175) : memref<32x32xf32>
  %179 = AIE.buffer(%175) : memref<32x32xf32>
  %180 = AIE.core(%175) {
    call @extern_kernel(%179, %176, %177, %178) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %181 = AIE.tile(15, 5) {polyaie.leaf}
  %182 = AIE.buffer(%181) : memref<32x32xf32>
  %183 = AIE.buffer(%181) : memref<32x32xf32>
  %184 = AIE.buffer(%181) : memref<32x32xf32>
  %185 = AIE.buffer(%181) : memref<32x32xf32>
  %186 = AIE.core(%181) {
    call @extern_kernel(%185, %182, %183, %184) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %187 = AIE.tile(16, 2)
  %188 = AIE.buffer(%187) : memref<32x32xf32>
  %189 = AIE.buffer(%187) : memref<32x32xf32>
  %190 = AIE.buffer(%187) : memref<32x32xf32>
  %191 = AIE.buffer(%187) : memref<32x32xf32>
  %192 = AIE.core(%187) {
    call @extern_kernel(%191, %188, %189, %190) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %193 = AIE.tile(16, 3)
  %194 = AIE.buffer(%193) : memref<32x32xf32>
  %195 = AIE.buffer(%193) : memref<32x32xf32>
  %196 = AIE.buffer(%193) : memref<32x32xf32>
  %197 = AIE.buffer(%193) : memref<32x32xf32>
  %198 = AIE.core(%193) {
    call @extern_kernel(%197, %194, %195, %196) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %199 = AIE.tile(16, 4)
  %200 = AIE.buffer(%199) : memref<32x32xf32>
  %201 = AIE.buffer(%199) : memref<32x32xf32>
  %202 = AIE.buffer(%199) : memref<32x32xf32>
  %203 = AIE.buffer(%199) : memref<32x32xf32>
  %204 = AIE.core(%199) {
    call @extern_kernel(%203, %200, %201, %202) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %205 = AIE.tile(16, 5) {polyaie.leaf}
  %206 = AIE.buffer(%205) : memref<32x32xf32>
  %207 = AIE.buffer(%205) : memref<32x32xf32>
  %208 = AIE.buffer(%205) : memref<32x32xf32>
  %209 = AIE.buffer(%205) : memref<32x32xf32>
  %210 = AIE.core(%205) {
    call @extern_kernel(%209, %206, %207, %208) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %211 = AIE.tile(17, 2)
  %212 = AIE.buffer(%211) : memref<32x32xf32>
  %213 = AIE.buffer(%211) : memref<32x32xf32>
  %214 = AIE.buffer(%211) : memref<32x32xf32>
  %215 = AIE.buffer(%211) : memref<32x32xf32>
  %216 = AIE.core(%211) {
    call @extern_kernel(%215, %212, %213, %214) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %217 = AIE.tile(17, 3)
  %218 = AIE.buffer(%217) : memref<32x32xf32>
  %219 = AIE.buffer(%217) : memref<32x32xf32>
  %220 = AIE.buffer(%217) : memref<32x32xf32>
  %221 = AIE.buffer(%217) : memref<32x32xf32>
  %222 = AIE.core(%217) {
    call @extern_kernel(%221, %218, %219, %220) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %223 = AIE.tile(17, 4)
  %224 = AIE.buffer(%223) : memref<32x32xf32>
  %225 = AIE.buffer(%223) : memref<32x32xf32>
  %226 = AIE.buffer(%223) : memref<32x32xf32>
  %227 = AIE.buffer(%223) : memref<32x32xf32>
  %228 = AIE.core(%223) {
    call @extern_kernel(%227, %224, %225, %226) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %229 = AIE.tile(17, 5) {polyaie.leaf}
  %230 = AIE.buffer(%229) : memref<32x32xf32>
  %231 = AIE.buffer(%229) : memref<32x32xf32>
  %232 = AIE.buffer(%229) : memref<32x32xf32>
  %233 = AIE.buffer(%229) : memref<32x32xf32>
  %234 = AIE.core(%229) {
    call @extern_kernel(%233, %230, %231, %232) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  "dataflow.aie.broadcast"(%11, %46, %142) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%18, %136, %232) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%56, %65) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%176, %185) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%28, %88, %184) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%92, %101) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%16, %147, %171, %195, %219) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%26, %100, %196) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%122, %131) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%24, %112, %208) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%25, %106, %202) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%6, %57, %81, %105, %129) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%200, %209) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%9, %52, %148) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%116, %125) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%74, %83) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%8, %51, %75, %99, %123) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%30, %76, %172) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%80, %89) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%224, %233) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%134, %35) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%29, %82, %178) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%230, %39) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%86, %33) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%68, %77) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%152, %161) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%218, %227) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%164, %173) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%146, %155) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %63, %87, %111, %135) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%5, %64, %160) {polyaie.PackID0 = 7 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%21, %118, %214) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%104, %113) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%44, %53) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%158, %36) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%206, %38) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%50, %59) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%27, %94, %190) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%98, %107) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%170, %179) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%31, %70, %166) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%17, %141, %165, %189, %213) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%110, %34) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%10, %45, %69, %93, %117) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%20, %124, %220) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%62, %32) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%194, %203) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%212, %221) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%140, %149) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%14, %159, %183, %207, %231) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%188, %197) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%19, %130, %226) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%182, %37) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%15, %153, %177, %201, %225) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 4 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %58, %154) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 2 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%128, %137) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
}


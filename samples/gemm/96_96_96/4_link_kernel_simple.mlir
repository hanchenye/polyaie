module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<96x96xf32>
  %1 = memref.alloc() : memref<96x96xf32>
  %2 = memref.alloc() : memref<96x96xf32>
  %3 = AIE.tile(10, 0)
  "dataflow.aie.interface"(%3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>, memref<1025xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %9 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %10 = AIE.external_buffer 90112 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %10) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %11 = AIE.external_buffer 98304 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %11) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %12 = AIE.external_buffer 106496 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %13 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %13) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %14 = AIE.external_buffer 122880 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %15 = AIE.external_buffer 131072 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %16 = AIE.external_buffer 139264 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %17 = AIE.external_buffer 147456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %18 = AIE.core(%3) {
    AIE.end
  }
  %19 = AIE.tile(18, 0)
  "dataflow.aie.interface"(%19, %20, %21, %22, %23, %24, %25) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %20 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %21 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %22 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %23 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %24 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %25 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %26 = AIE.core(%19) {
    AIE.end
  }
  %27 = AIE.tile(11, 0)
  "dataflow.aie.interface"(%27, %28, %29, %30, %31, %32, %33, %34) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<1025xf32>) -> ()
  %28 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%28, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %29 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %30 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %31 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %32 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%32, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %33 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %34 = AIE.external_buffer 155648 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %34) {kind = 2 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %35 = AIE.core(%27) {
    AIE.end
  }
  %36 = AIE.tile(0, 0)
  %37 = AIE.core(%36) {
    AIE.end
  }
  %38 = AIE.tile(10, 2)
  %39 = AIE.buffer(%38) : memref<32x32xf32>
  %40 = AIE.buffer(%38) : memref<32x32xf32>
  %41 = AIE.buffer(%38) : memref<32x32xf32>
  %42 = AIE.buffer(%38) : memref<32x32xf32>
  %43 = AIE.core(%38) {
    call @extern_kernel(%42, %39, %40, %41) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %44 = AIE.tile(10, 3)
  %45 = AIE.buffer(%44) : memref<32x32xf32>
  %46 = AIE.buffer(%44) : memref<32x32xf32>
  %47 = AIE.buffer(%44) : memref<32x32xf32>
  %48 = AIE.buffer(%44) : memref<32x32xf32>
  %49 = AIE.core(%44) {
    call @extern_kernel(%48, %45, %46, %47) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %50 = AIE.tile(10, 4) {polyaie.leaf}
  %51 = AIE.buffer(%50) : memref<32x32xf32>
  %52 = AIE.buffer(%50) : memref<32x32xf32>
  %53 = AIE.buffer(%50) : memref<32x32xf32>
  %54 = AIE.buffer(%50) : memref<32x32xf32>
  %55 = AIE.core(%50) {
    call @extern_kernel(%54, %51, %52, %53) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %56 = AIE.tile(11, 2)
  %57 = AIE.buffer(%56) : memref<32x32xf32>
  %58 = AIE.buffer(%56) : memref<32x32xf32>
  %59 = AIE.buffer(%56) : memref<32x32xf32>
  %60 = AIE.buffer(%56) : memref<32x32xf32>
  %61 = AIE.core(%56) {
    call @extern_kernel(%60, %57, %58, %59) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %62 = AIE.tile(11, 3)
  %63 = AIE.buffer(%62) : memref<32x32xf32>
  %64 = AIE.buffer(%62) : memref<32x32xf32>
  %65 = AIE.buffer(%62) : memref<32x32xf32>
  %66 = AIE.buffer(%62) : memref<32x32xf32>
  %67 = AIE.core(%62) {
    call @extern_kernel(%66, %63, %64, %65) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %68 = AIE.tile(11, 4) {polyaie.leaf}
  %69 = AIE.buffer(%68) : memref<32x32xf32>
  %70 = AIE.buffer(%68) : memref<32x32xf32>
  %71 = AIE.buffer(%68) : memref<32x32xf32>
  %72 = AIE.buffer(%68) : memref<32x32xf32>
  %73 = AIE.core(%68) {
    call @extern_kernel(%72, %69, %70, %71) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %74 = AIE.tile(12, 2)
  %75 = AIE.buffer(%74) : memref<32x32xf32>
  %76 = AIE.buffer(%74) : memref<32x32xf32>
  %77 = AIE.buffer(%74) : memref<32x32xf32>
  %78 = AIE.buffer(%74) : memref<32x32xf32>
  %79 = AIE.core(%74) {
    call @extern_kernel(%78, %75, %76, %77) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %80 = AIE.tile(12, 3)
  %81 = AIE.buffer(%80) : memref<32x32xf32>
  %82 = AIE.buffer(%80) : memref<32x32xf32>
  %83 = AIE.buffer(%80) : memref<32x32xf32>
  %84 = AIE.buffer(%80) : memref<32x32xf32>
  %85 = AIE.core(%80) {
    call @extern_kernel(%84, %81, %82, %83) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %86 = AIE.tile(12, 4) {polyaie.leaf}
  %87 = AIE.buffer(%86) : memref<32x32xf32>
  %88 = AIE.buffer(%86) : memref<32x32xf32>
  %89 = AIE.buffer(%86) : memref<32x32xf32>
  %90 = AIE.buffer(%86) : memref<32x32xf32>
  %91 = AIE.core(%86) {
    call @extern_kernel(%90, %87, %88, %89) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %92 = AIE.tile(13, 2)
  %93 = AIE.buffer(%92) : memref<32x32xf32>
  %94 = AIE.buffer(%92) : memref<32x32xf32>
  %95 = AIE.buffer(%92) : memref<32x32xf32>
  %96 = AIE.buffer(%92) : memref<32x32xf32>
  %97 = AIE.core(%92) {
    call @extern_kernel(%96, %93, %94, %95) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %98 = AIE.tile(13, 3)
  %99 = AIE.buffer(%98) : memref<32x32xf32>
  %100 = AIE.buffer(%98) : memref<32x32xf32>
  %101 = AIE.buffer(%98) : memref<32x32xf32>
  %102 = AIE.buffer(%98) : memref<32x32xf32>
  %103 = AIE.core(%98) {
    call @extern_kernel(%102, %99, %100, %101) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %104 = AIE.tile(13, 4) {polyaie.leaf}
  %105 = AIE.buffer(%104) : memref<32x32xf32>
  %106 = AIE.buffer(%104) : memref<32x32xf32>
  %107 = AIE.buffer(%104) : memref<32x32xf32>
  %108 = AIE.buffer(%104) : memref<32x32xf32>
  %109 = AIE.core(%104) {
    call @extern_kernel(%108, %105, %106, %107) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %110 = AIE.tile(14, 2)
  %111 = AIE.buffer(%110) : memref<32x32xf32>
  %112 = AIE.buffer(%110) : memref<32x32xf32>
  %113 = AIE.buffer(%110) : memref<32x32xf32>
  %114 = AIE.buffer(%110) : memref<32x32xf32>
  %115 = AIE.core(%110) {
    call @extern_kernel(%114, %111, %112, %113) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %116 = AIE.tile(14, 3)
  %117 = AIE.buffer(%116) : memref<32x32xf32>
  %118 = AIE.buffer(%116) : memref<32x32xf32>
  %119 = AIE.buffer(%116) : memref<32x32xf32>
  %120 = AIE.buffer(%116) : memref<32x32xf32>
  %121 = AIE.core(%116) {
    call @extern_kernel(%120, %117, %118, %119) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %122 = AIE.tile(14, 4) {polyaie.leaf}
  %123 = AIE.buffer(%122) : memref<32x32xf32>
  %124 = AIE.buffer(%122) : memref<32x32xf32>
  %125 = AIE.buffer(%122) : memref<32x32xf32>
  %126 = AIE.buffer(%122) : memref<32x32xf32>
  %127 = AIE.core(%122) {
    call @extern_kernel(%126, %123, %124, %125) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %128 = AIE.tile(15, 2)
  %129 = AIE.buffer(%128) : memref<32x32xf32>
  %130 = AIE.buffer(%128) : memref<32x32xf32>
  %131 = AIE.buffer(%128) : memref<32x32xf32>
  %132 = AIE.buffer(%128) : memref<32x32xf32>
  %133 = AIE.core(%128) {
    call @extern_kernel(%132, %129, %130, %131) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %134 = AIE.tile(15, 3)
  %135 = AIE.buffer(%134) : memref<32x32xf32>
  %136 = AIE.buffer(%134) : memref<32x32xf32>
  %137 = AIE.buffer(%134) : memref<32x32xf32>
  %138 = AIE.buffer(%134) : memref<32x32xf32>
  %139 = AIE.core(%134) {
    call @extern_kernel(%138, %135, %136, %137) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %140 = AIE.tile(15, 4) {polyaie.leaf}
  %141 = AIE.buffer(%140) : memref<32x32xf32>
  %142 = AIE.buffer(%140) : memref<32x32xf32>
  %143 = AIE.buffer(%140) : memref<32x32xf32>
  %144 = AIE.buffer(%140) : memref<32x32xf32>
  %145 = AIE.core(%140) {
    call @extern_kernel(%144, %141, %142, %143) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %146 = AIE.tile(16, 2)
  %147 = AIE.buffer(%146) : memref<32x32xf32>
  %148 = AIE.buffer(%146) : memref<32x32xf32>
  %149 = AIE.buffer(%146) : memref<32x32xf32>
  %150 = AIE.buffer(%146) : memref<32x32xf32>
  %151 = AIE.core(%146) {
    call @extern_kernel(%150, %147, %148, %149) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %152 = AIE.tile(16, 3)
  %153 = AIE.buffer(%152) : memref<32x32xf32>
  %154 = AIE.buffer(%152) : memref<32x32xf32>
  %155 = AIE.buffer(%152) : memref<32x32xf32>
  %156 = AIE.buffer(%152) : memref<32x32xf32>
  %157 = AIE.core(%152) {
    call @extern_kernel(%156, %153, %154, %155) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %158 = AIE.tile(16, 4) {polyaie.leaf}
  %159 = AIE.buffer(%158) : memref<32x32xf32>
  %160 = AIE.buffer(%158) : memref<32x32xf32>
  %161 = AIE.buffer(%158) : memref<32x32xf32>
  %162 = AIE.buffer(%158) : memref<32x32xf32>
  %163 = AIE.core(%158) {
    call @extern_kernel(%162, %159, %160, %161) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %164 = AIE.tile(17, 2)
  %165 = AIE.buffer(%164) : memref<32x32xf32>
  %166 = AIE.buffer(%164) : memref<32x32xf32>
  %167 = AIE.buffer(%164) : memref<32x32xf32>
  %168 = AIE.buffer(%164) : memref<32x32xf32>
  %169 = AIE.core(%164) {
    call @extern_kernel(%168, %165, %166, %167) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %170 = AIE.tile(17, 3)
  %171 = AIE.buffer(%170) : memref<32x32xf32>
  %172 = AIE.buffer(%170) : memref<32x32xf32>
  %173 = AIE.buffer(%170) : memref<32x32xf32>
  %174 = AIE.buffer(%170) : memref<32x32xf32>
  %175 = AIE.core(%170) {
    call @extern_kernel(%174, %171, %172, %173) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %176 = AIE.tile(17, 4) {polyaie.leaf}
  %177 = AIE.buffer(%176) : memref<32x32xf32>
  %178 = AIE.buffer(%176) : memref<32x32xf32>
  %179 = AIE.buffer(%176) : memref<32x32xf32>
  %180 = AIE.buffer(%176) : memref<32x32xf32>
  %181 = AIE.core(%176) {
    call @extern_kernel(%180, %177, %178, %179) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %182 = AIE.tile(18, 2)
  %183 = AIE.buffer(%182) : memref<32x32xf32>
  %184 = AIE.buffer(%182) : memref<32x32xf32>
  %185 = AIE.buffer(%182) : memref<32x32xf32>
  %186 = AIE.buffer(%182) : memref<32x32xf32>
  %187 = AIE.core(%182) {
    call @extern_kernel(%186, %183, %184, %185) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %188 = AIE.tile(18, 3)
  %189 = AIE.buffer(%188) : memref<32x32xf32>
  %190 = AIE.buffer(%188) : memref<32x32xf32>
  %191 = AIE.buffer(%188) : memref<32x32xf32>
  %192 = AIE.buffer(%188) : memref<32x32xf32>
  %193 = AIE.core(%188) {
    call @extern_kernel(%192, %189, %190, %191) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  %194 = AIE.tile(18, 4) {polyaie.leaf}
  %195 = AIE.buffer(%194) : memref<32x32xf32>
  %196 = AIE.buffer(%194) : memref<32x32xf32>
  %197 = AIE.buffer(%194) : memref<32x32xf32>
  %198 = AIE.buffer(%194) : memref<32x32xf32>
  %199 = AIE.core(%194) {
    call @extern_kernel(%198, %195, %196, %197) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.end
  } {link_with = "kernel.o"}
  "dataflow.aie.broadcast"(%135, %144) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %52, %70, %88) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%30, %77, %131, %185) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%87, %12) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%141, %15) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%69, %11) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%81, %90) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%21, %154, %172, %190) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%29, %83, %137, %191) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%9, %41, %95, %149) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%171, %180) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %47, %101, %155) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%195, %34) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%75, %84) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%28, %89, %143, %197) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%177, %17) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%32, %65, %119, %173) {polyaie.PackID0 = 5 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%24, %100, %118, %136) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%25, %94, %112, %130) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%129, %138) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%159, %16) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%189, %198) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%111, %120) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%153, %162) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%105, %13) {polyaie.PackID0 = 3 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%39, %48) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%183, %192) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%147, %156) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%51, %10) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%117, %126) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%20, %160, %178, %196) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%57, %66) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%6, %46, %64, %82) {polyaie.PackID0 = 1 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%165, %174) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%8, %40, %58, %76) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%93, %102) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%123, %14) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  "dataflow.aie.broadcast"(%5, %53, %107, %161) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 10 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%63, %72) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%99, %108) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%23, %106, %124, %142) {polyaie.PackID0 = 2 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%22, %148, %166, %184) {polyaie.PackID0 = 0 : i64, polyaie.channel0 = 1 : i64, polyaie.col0 = 18 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%33, %59, %113, %167) {polyaie.PackID0 = 4 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%45, %54) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%31, %71, %125, %179) {polyaie.PackID0 = 6 : i64, polyaie.channel0 = 0 : i64, polyaie.col0 = 11 : i64, polyaie.reuse = 3 : i64} : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
}


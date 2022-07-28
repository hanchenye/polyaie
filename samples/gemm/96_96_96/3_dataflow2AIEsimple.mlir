module @gemm {
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
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %42[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %39[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %39[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %40[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %41[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %39[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %44 = AIE.tile(10, 3)
  %45 = AIE.buffer(%44) : memref<32x32xf32>
  %46 = AIE.buffer(%44) : memref<32x32xf32>
  %47 = AIE.buffer(%44) : memref<32x32xf32>
  %48 = AIE.buffer(%44) : memref<32x32xf32>
  %49 = AIE.core(%44) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %48[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %45[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %45[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %46[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %47[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %45[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %50 = AIE.tile(10, 4) {polyaie.leaf}
  %51 = AIE.buffer(%50) : memref<32x32xf32>
  %52 = AIE.buffer(%50) : memref<32x32xf32>
  %53 = AIE.buffer(%50) : memref<32x32xf32>
  %54 = AIE.buffer(%50) : memref<32x32xf32>
  %55 = AIE.core(%50) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %54[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %51[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %51[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %52[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %53[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %51[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %56 = AIE.tile(11, 2)
  %57 = AIE.buffer(%56) : memref<32x32xf32>
  %58 = AIE.buffer(%56) : memref<32x32xf32>
  %59 = AIE.buffer(%56) : memref<32x32xf32>
  %60 = AIE.buffer(%56) : memref<32x32xf32>
  %61 = AIE.core(%56) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %60[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %57[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %57[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %58[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %59[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %57[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %62 = AIE.tile(11, 3)
  %63 = AIE.buffer(%62) : memref<32x32xf32>
  %64 = AIE.buffer(%62) : memref<32x32xf32>
  %65 = AIE.buffer(%62) : memref<32x32xf32>
  %66 = AIE.buffer(%62) : memref<32x32xf32>
  %67 = AIE.core(%62) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %66[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %63[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %63[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %64[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %65[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %63[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %68 = AIE.tile(11, 4) {polyaie.leaf}
  %69 = AIE.buffer(%68) : memref<32x32xf32>
  %70 = AIE.buffer(%68) : memref<32x32xf32>
  %71 = AIE.buffer(%68) : memref<32x32xf32>
  %72 = AIE.buffer(%68) : memref<32x32xf32>
  %73 = AIE.core(%68) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %72[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %69[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %69[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %70[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %71[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %69[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %74 = AIE.tile(12, 2)
  %75 = AIE.buffer(%74) : memref<32x32xf32>
  %76 = AIE.buffer(%74) : memref<32x32xf32>
  %77 = AIE.buffer(%74) : memref<32x32xf32>
  %78 = AIE.buffer(%74) : memref<32x32xf32>
  %79 = AIE.core(%74) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %78[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %75[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %75[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %76[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %77[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %75[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %80 = AIE.tile(12, 3)
  %81 = AIE.buffer(%80) : memref<32x32xf32>
  %82 = AIE.buffer(%80) : memref<32x32xf32>
  %83 = AIE.buffer(%80) : memref<32x32xf32>
  %84 = AIE.buffer(%80) : memref<32x32xf32>
  %85 = AIE.core(%80) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %84[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %81[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %81[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %82[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %83[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %81[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %86 = AIE.tile(12, 4) {polyaie.leaf}
  %87 = AIE.buffer(%86) : memref<32x32xf32>
  %88 = AIE.buffer(%86) : memref<32x32xf32>
  %89 = AIE.buffer(%86) : memref<32x32xf32>
  %90 = AIE.buffer(%86) : memref<32x32xf32>
  %91 = AIE.core(%86) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %90[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %87[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %87[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %88[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %89[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %87[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %92 = AIE.tile(13, 2)
  %93 = AIE.buffer(%92) : memref<32x32xf32>
  %94 = AIE.buffer(%92) : memref<32x32xf32>
  %95 = AIE.buffer(%92) : memref<32x32xf32>
  %96 = AIE.buffer(%92) : memref<32x32xf32>
  %97 = AIE.core(%92) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %96[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %93[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %93[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %94[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %95[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %93[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %98 = AIE.tile(13, 3)
  %99 = AIE.buffer(%98) : memref<32x32xf32>
  %100 = AIE.buffer(%98) : memref<32x32xf32>
  %101 = AIE.buffer(%98) : memref<32x32xf32>
  %102 = AIE.buffer(%98) : memref<32x32xf32>
  %103 = AIE.core(%98) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %102[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %99[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %99[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %100[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %101[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %99[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %104 = AIE.tile(13, 4) {polyaie.leaf}
  %105 = AIE.buffer(%104) : memref<32x32xf32>
  %106 = AIE.buffer(%104) : memref<32x32xf32>
  %107 = AIE.buffer(%104) : memref<32x32xf32>
  %108 = AIE.buffer(%104) : memref<32x32xf32>
  %109 = AIE.core(%104) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %108[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %105[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %105[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %106[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %107[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %105[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %110 = AIE.tile(14, 2)
  %111 = AIE.buffer(%110) : memref<32x32xf32>
  %112 = AIE.buffer(%110) : memref<32x32xf32>
  %113 = AIE.buffer(%110) : memref<32x32xf32>
  %114 = AIE.buffer(%110) : memref<32x32xf32>
  %115 = AIE.core(%110) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %114[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %111[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %111[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %112[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %113[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %111[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %116 = AIE.tile(14, 3)
  %117 = AIE.buffer(%116) : memref<32x32xf32>
  %118 = AIE.buffer(%116) : memref<32x32xf32>
  %119 = AIE.buffer(%116) : memref<32x32xf32>
  %120 = AIE.buffer(%116) : memref<32x32xf32>
  %121 = AIE.core(%116) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %120[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %117[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %117[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %118[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %119[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %117[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %122 = AIE.tile(14, 4) {polyaie.leaf}
  %123 = AIE.buffer(%122) : memref<32x32xf32>
  %124 = AIE.buffer(%122) : memref<32x32xf32>
  %125 = AIE.buffer(%122) : memref<32x32xf32>
  %126 = AIE.buffer(%122) : memref<32x32xf32>
  %127 = AIE.core(%122) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %126[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %123[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %123[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %124[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %125[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %123[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %128 = AIE.tile(15, 2)
  %129 = AIE.buffer(%128) : memref<32x32xf32>
  %130 = AIE.buffer(%128) : memref<32x32xf32>
  %131 = AIE.buffer(%128) : memref<32x32xf32>
  %132 = AIE.buffer(%128) : memref<32x32xf32>
  %133 = AIE.core(%128) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %132[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %129[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %129[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %130[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %131[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %129[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %134 = AIE.tile(15, 3)
  %135 = AIE.buffer(%134) : memref<32x32xf32>
  %136 = AIE.buffer(%134) : memref<32x32xf32>
  %137 = AIE.buffer(%134) : memref<32x32xf32>
  %138 = AIE.buffer(%134) : memref<32x32xf32>
  %139 = AIE.core(%134) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %138[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %135[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %135[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %136[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %137[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %135[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %140 = AIE.tile(15, 4) {polyaie.leaf}
  %141 = AIE.buffer(%140) : memref<32x32xf32>
  %142 = AIE.buffer(%140) : memref<32x32xf32>
  %143 = AIE.buffer(%140) : memref<32x32xf32>
  %144 = AIE.buffer(%140) : memref<32x32xf32>
  %145 = AIE.core(%140) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %144[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %141[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %141[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %142[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %143[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %141[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %146 = AIE.tile(16, 2)
  %147 = AIE.buffer(%146) : memref<32x32xf32>
  %148 = AIE.buffer(%146) : memref<32x32xf32>
  %149 = AIE.buffer(%146) : memref<32x32xf32>
  %150 = AIE.buffer(%146) : memref<32x32xf32>
  %151 = AIE.core(%146) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %150[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %147[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %147[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %148[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %149[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %147[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %152 = AIE.tile(16, 3)
  %153 = AIE.buffer(%152) : memref<32x32xf32>
  %154 = AIE.buffer(%152) : memref<32x32xf32>
  %155 = AIE.buffer(%152) : memref<32x32xf32>
  %156 = AIE.buffer(%152) : memref<32x32xf32>
  %157 = AIE.core(%152) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %156[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %153[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %153[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %154[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %155[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %153[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %158 = AIE.tile(16, 4) {polyaie.leaf}
  %159 = AIE.buffer(%158) : memref<32x32xf32>
  %160 = AIE.buffer(%158) : memref<32x32xf32>
  %161 = AIE.buffer(%158) : memref<32x32xf32>
  %162 = AIE.buffer(%158) : memref<32x32xf32>
  %163 = AIE.core(%158) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %162[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %159[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %159[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %160[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %161[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %159[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %164 = AIE.tile(17, 2)
  %165 = AIE.buffer(%164) : memref<32x32xf32>
  %166 = AIE.buffer(%164) : memref<32x32xf32>
  %167 = AIE.buffer(%164) : memref<32x32xf32>
  %168 = AIE.buffer(%164) : memref<32x32xf32>
  %169 = AIE.core(%164) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %168[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %165[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %165[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %166[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %167[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %165[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %170 = AIE.tile(17, 3)
  %171 = AIE.buffer(%170) : memref<32x32xf32>
  %172 = AIE.buffer(%170) : memref<32x32xf32>
  %173 = AIE.buffer(%170) : memref<32x32xf32>
  %174 = AIE.buffer(%170) : memref<32x32xf32>
  %175 = AIE.core(%170) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %174[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %171[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %171[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %172[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %173[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %171[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %176 = AIE.tile(17, 4) {polyaie.leaf}
  %177 = AIE.buffer(%176) : memref<32x32xf32>
  %178 = AIE.buffer(%176) : memref<32x32xf32>
  %179 = AIE.buffer(%176) : memref<32x32xf32>
  %180 = AIE.buffer(%176) : memref<32x32xf32>
  %181 = AIE.core(%176) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %180[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %177[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %177[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %178[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %179[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %177[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %182 = AIE.tile(18, 2)
  %183 = AIE.buffer(%182) : memref<32x32xf32>
  %184 = AIE.buffer(%182) : memref<32x32xf32>
  %185 = AIE.buffer(%182) : memref<32x32xf32>
  %186 = AIE.buffer(%182) : memref<32x32xf32>
  %187 = AIE.core(%182) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %186[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %183[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %183[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %184[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %185[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %183[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %188 = AIE.tile(18, 3)
  %189 = AIE.buffer(%188) : memref<32x32xf32>
  %190 = AIE.buffer(%188) : memref<32x32xf32>
  %191 = AIE.buffer(%188) : memref<32x32xf32>
  %192 = AIE.buffer(%188) : memref<32x32xf32>
  %193 = AIE.core(%188) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %192[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %189[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %189[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %190[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %191[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %189[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %194 = AIE.tile(18, 4) {polyaie.leaf}
  %195 = AIE.buffer(%194) : memref<32x32xf32>
  %196 = AIE.buffer(%194) : memref<32x32xf32>
  %197 = AIE.buffer(%194) : memref<32x32xf32>
  %198 = AIE.buffer(%194) : memref<32x32xf32>
  %199 = AIE.core(%194) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %200 = aievec.upd %198[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %200, %195[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %201 = aievec.upd %195[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %202 = aievec.ups %201 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %203 = aievec.upd %196[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %204 = aievec.upd %197[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %205 = aievec.concat %204, %204 : vector<8xf32>, vector<16xf32>
          %206 = aievec.mac %205, %203, %202 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %207 = aievec.srs %206 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %207, %195[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
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


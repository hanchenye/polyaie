module @gemm {
  %0 = memref.alloc() : memref<64x64xf32>
  %1 = memref.alloc() : memref<64x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(19, 0)
  "dataflow.aie.interface"(%3, %4, %5, %6) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %6 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %6) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %7 = AIE.core(%3) {
    AIE.end
  }
  %8 = AIE.tile(34, 0)
  "dataflow.aie.interface"(%8, %9, %10) : (index, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %9 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %10 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %11 = AIE.core(%8) {
    AIE.end
  }
  %12 = AIE.tile(27, 0)
  "dataflow.aie.interface"(%12, %13, %14, %15, %16) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %13 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %14 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %15 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %16 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %17 = AIE.core(%12) {
    AIE.end
  }
  %18 = AIE.tile(18, 0)
  "dataflow.aie.interface"(%18, %19, %20) : (index, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %19 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %0) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %20 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %0) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %21 = AIE.core(%18) {
    AIE.end
  }
  %22 = AIE.tile(35, 0)
  "dataflow.aie.interface"(%22, %23) : (index, memref<32x32xf32>) -> ()
  %23 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %24 = AIE.core(%22) {
    AIE.end
  }
  %25 = AIE.tile(47, 0)
  "dataflow.aie.interface"(%25, %26) : (index, memref<32x32xf32>) -> ()
  %26 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %0) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %27 = AIE.core(%25) {
    AIE.end
  }
  %28 = AIE.tile(26, 0)
  "dataflow.aie.interface"(%28, %29, %30, %31) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %29 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %30 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %31 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %31) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %32 = AIE.core(%28) {
    AIE.end
  }
  %33 = AIE.tile(26, 4)
  %34 = AIE.buffer(%33) : memref<32x32xf32>
  %35 = AIE.buffer(%33) : memref<32x32xf32>
  %36 = AIE.buffer(%33) : memref<32x32xf32>
  %37 = AIE.buffer(%33) : memref<32x32xf32>
  %38 = AIE.core(%33) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %37[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %34[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %34[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %35[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %36[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %34[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %39 = AIE.tile(25, 4) {polyaie.leaf}
  %40 = AIE.buffer(%39) : memref<32x32xf32>
  %41 = AIE.buffer(%39) : memref<32x32xf32>
  %42 = AIE.buffer(%39) : memref<32x32xf32>
  %43 = AIE.buffer(%39) : memref<32x32xf32>
  %44 = AIE.core(%39) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %43[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %40[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %40[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %41[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %42[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %40[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %45 = AIE.tile(23, 2)
  %46 = AIE.buffer(%45) : memref<32x32xf32>
  %47 = AIE.buffer(%45) : memref<32x32xf32>
  %48 = AIE.buffer(%45) : memref<32x32xf32>
  %49 = AIE.buffer(%45) : memref<32x32xf32>
  %50 = AIE.core(%45) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %49[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %46[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %46[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %47[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %48[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %46[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %51 = AIE.tile(23, 3) {polyaie.leaf}
  %52 = AIE.buffer(%51) : memref<32x32xf32>
  %53 = AIE.buffer(%51) : memref<32x32xf32>
  %54 = AIE.buffer(%51) : memref<32x32xf32>
  %55 = AIE.buffer(%51) : memref<32x32xf32>
  %56 = AIE.core(%51) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %55[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %52[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %52[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %53[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %54[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %52[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %57 = AIE.tile(26, 2)
  %58 = AIE.buffer(%57) : memref<32x32xf32>
  %59 = AIE.buffer(%57) : memref<32x32xf32>
  %60 = AIE.buffer(%57) : memref<32x32xf32>
  %61 = AIE.buffer(%57) : memref<32x32xf32>
  %62 = AIE.core(%57) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %61[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %58[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %58[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %59[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %60[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %58[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %63 = AIE.tile(26, 3) {polyaie.leaf}
  %64 = AIE.buffer(%63) : memref<32x32xf32>
  %65 = AIE.buffer(%63) : memref<32x32xf32>
  %66 = AIE.buffer(%63) : memref<32x32xf32>
  %67 = AIE.buffer(%63) : memref<32x32xf32>
  %68 = AIE.core(%63) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %67[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %64[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %64[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %65[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %66[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %64[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %69 = AIE.tile(24, 2)
  %70 = AIE.buffer(%69) : memref<32x32xf32>
  %71 = AIE.buffer(%69) : memref<32x32xf32>
  %72 = AIE.buffer(%69) : memref<32x32xf32>
  %73 = AIE.buffer(%69) : memref<32x32xf32>
  %74 = AIE.core(%69) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %73[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %70[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %70[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %71[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %72[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %70[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %75 = AIE.tile(25, 2) {polyaie.leaf}
  %76 = AIE.buffer(%75) : memref<32x32xf32>
  %77 = AIE.buffer(%75) : memref<32x32xf32>
  %78 = AIE.buffer(%75) : memref<32x32xf32>
  %79 = AIE.buffer(%75) : memref<32x32xf32>
  %80 = AIE.core(%75) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %81 = aievec.upd %79[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %81, %76[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %82 = aievec.upd %76[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %83 = aievec.ups %82 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %84 = aievec.upd %77[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %85 = aievec.upd %78[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %86 = aievec.concat %85, %85 : vector<8xf32>, vector<16xf32>
          %87 = aievec.mac %86, %84, %83 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %88 = aievec.srs %87 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %88, %76[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  "dataflow.aie.broadcast"(%64, %6) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%10, %35, %47) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%30, %41, %53) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%52, %15) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%20, %49) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%9, %42, %66) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%70, %79) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%34, %43) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%40, %31) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%13, %48, %72) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%46, %55) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%19, %61) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%23, %65, %77) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%76, %16) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%58, %67) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%5, %37) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %59, %71) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%26, %73) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%14, %36, %60) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%29, %54, %78) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
}


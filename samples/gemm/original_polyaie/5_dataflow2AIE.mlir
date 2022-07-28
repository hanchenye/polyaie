module @gemm {
  %0 = memref.alloc() : memref<32x64xf32>
  %1 = memref.alloc() : memref<32x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(19, 0)
  "dataflow.aie.interface"(%3, %4) : (index, memref<32x32xf32>) -> ()
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %5 = AIE.core(%3) {
    AIE.end
  }
  %6 = AIE.tile(34, 0)
  "dataflow.aie.interface"(%6, %7) : (index, memref<32x32xf32>) -> ()
  %7 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %8 = AIE.core(%6) {
    AIE.end
  }
  %9 = AIE.tile(27, 0)
  "dataflow.aie.interface"(%9, %10, %11, %12) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %10 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %0) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %11 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %12 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<32x32xf32>) -> ()
  %13 = AIE.core(%9) {
    AIE.end
  }
  %14 = AIE.tile(18, 0)
  "dataflow.aie.interface"(%14, %15) : (index, memref<32x32xf32>) -> ()
  %15 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %16 = AIE.core(%14) {
    AIE.end
  }
  %17 = AIE.tile(35, 0)
  "dataflow.aie.interface"(%17, %18) : (index, memref<32x32xf32>) -> ()
  %18 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %19 = AIE.core(%17) {
    AIE.end
  }
  %20 = AIE.tile(26, 0)
  "dataflow.aie.interface"(%20, %21, %22, %23) : (index, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  %21 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %22 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %23 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %23) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<32x32xf32>) -> ()
  %24 = AIE.core(%20) {
    AIE.end
  }
  %25 = AIE.tile(25, 3)
  %26 = AIE.buffer(%25) : memref<32x32xf32>
  %27 = AIE.buffer(%25) : memref<32x32xf32>
  %28 = AIE.buffer(%25) : memref<32x32xf32>
  %29 = AIE.buffer(%25) : memref<32x32xf32>
  %30 = AIE.core(%25) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %49 = aievec.upd %29[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %49, %26[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %50 = aievec.upd %26[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %51 = aievec.ups %50 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %52 = aievec.upd %27[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %53 = aievec.upd %28[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %54 = aievec.concat %53, %53 : vector<8xf32>, vector<16xf32>
          %55 = aievec.mac %54, %52, %51 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %56 = aievec.srs %55 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %56, %26[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %31 = AIE.tile(24, 3) {polyaie.leaf}
  %32 = AIE.buffer(%31) : memref<32x32xf32>
  %33 = AIE.buffer(%31) : memref<32x32xf32>
  %34 = AIE.buffer(%31) : memref<32x32xf32>
  %35 = AIE.buffer(%31) : memref<32x32xf32>
  %36 = AIE.core(%31) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %49 = aievec.upd %35[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %49, %32[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %50 = aievec.upd %32[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %51 = aievec.ups %50 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %52 = aievec.upd %33[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %53 = aievec.upd %34[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %54 = aievec.concat %53, %53 : vector<8xf32>, vector<16xf32>
          %55 = aievec.mac %54, %52, %51 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %56 = aievec.srs %55 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %56, %32[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %37 = AIE.tile(25, 2)
  %38 = AIE.buffer(%37) : memref<32x32xf32>
  %39 = AIE.buffer(%37) : memref<32x32xf32>
  %40 = AIE.buffer(%37) : memref<32x32xf32>
  %41 = AIE.buffer(%37) : memref<32x32xf32>
  %42 = AIE.core(%37) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %49 = aievec.upd %41[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %49, %38[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %50 = aievec.upd %38[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %51 = aievec.ups %50 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %52 = aievec.upd %39[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %53 = aievec.upd %40[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %54 = aievec.concat %53, %53 : vector<8xf32>, vector<16xf32>
          %55 = aievec.mac %54, %52, %51 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %56 = aievec.srs %55 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %56, %38[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  %43 = AIE.tile(24, 2) {polyaie.leaf}
  %44 = AIE.buffer(%43) : memref<32x32xf32>
  %45 = AIE.buffer(%43) : memref<32x32xf32>
  %46 = AIE.buffer(%43) : memref<32x32xf32>
  %47 = AIE.buffer(%43) : memref<32x32xf32>
  %48 = AIE.core(%43) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %49 = aievec.upd %47[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %49, %44[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %50 = aievec.upd %44[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %51 = aievec.ups %50 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %52 = aievec.upd %45[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %53 = aievec.upd %46[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %54 = aievec.concat %53, %53 : vector<8xf32>, vector<16xf32>
          %55 = aievec.mac %54, %52, %51 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %56 = aievec.srs %55 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %56, %44[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.end
  }
  "dataflow.aie.broadcast"(%15, %34) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%32, %23) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%4, %33, %45) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%44, %12) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%22, %28) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%18, %40) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%21, %46) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%26, %35) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%11, %29) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%7, %27, %39) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%10, %41) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  "dataflow.aie.broadcast"(%38, %47) : (memref<32x32xf32>, memref<32x32xf32>) -> ()
}


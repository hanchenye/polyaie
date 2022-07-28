module @gemm {
  AIE.token(0) {sym_name = "token11"}
  AIE.token(0) {sym_name = "token10"}
  AIE.token(0) {sym_name = "token9"}
  AIE.token(0) {sym_name = "token8"}
  AIE.token(0) {sym_name = "token7"}
  AIE.token(0) {sym_name = "token6"}
  AIE.token(0) {sym_name = "token5"}
  AIE.token(0) {sym_name = "token4"}
  AIE.token(0) {sym_name = "token3"}
  AIE.token(0) {sym_name = "token2"}
  AIE.token(0) {sym_name = "token1"}
  AIE.token(0) {sym_name = "token0"}
  %0 = memref.alloc() : memref<32x64xf32>
  %1 = memref.alloc() : memref<32x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(19, 0)
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %5 = AIE.core(%3) {
    AIE.useToken @token2(Acquire, 0)
    AIE.useToken @token2(Release, 1)
    AIE.end
  }
  %6 = AIE.shimDMA(%3) {
    %57 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%38, DMA : 1>
    AIE.packet_dest<%51, DMA : 0>
  }
  %7 = AIE.tile(34, 0)
  %8 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %9 = AIE.core(%7) {
    AIE.useToken @token9(Acquire, 0)
    AIE.useToken @token9(Release, 1)
    AIE.end
  }
  %10 = AIE.shimDMA(%7) {
    %57 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 8)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(8) {
    AIE.packet_source<%7, DMA : 0>
    AIE.packet_dest<%31, DMA : 1>
    AIE.packet_dest<%44, DMA : 1>
  }
  %11 = AIE.tile(27, 0)
  %12 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %0) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %13 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %14 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<32x32xf32>) -> ()
  %15 = AIE.core(%11) {
    AIE.useToken @token10(Acquire, 0)
    AIE.useToken @token8(Acquire, 0)
    AIE.useToken @token3(Acquire, 3)
    AIE.useToken @token3(Release, 4)
    AIE.useToken @token8(Release, 1)
    AIE.useToken @token10(Release, 1)
    AIE.end
  }
  %16 = AIE.shimDMA(%11) {
    %57 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %58 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 2)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %59 = AIE.dmaStart(MM2S1, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(9) {
    AIE.packet_source<%11, DMA : 1>
    AIE.packet_dest<%44, DMA : 1>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%11, DMA : 0>
    AIE.packet_dest<%31, DMA : 1>
  }
  %17 = AIE.tile(18, 0)
  %18 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %19 = AIE.core(%17) {
    AIE.useToken @token0(Acquire, 0)
    AIE.useToken @token0(Release, 1)
    AIE.end
  }
  %20 = AIE.shimDMA(%17) {
    %57 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%17, DMA : 0>
    AIE.packet_dest<%38, DMA : 0>
  }
  %21 = AIE.tile(35, 0)
  %22 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %23 = AIE.core(%21) {
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token5(Release, 1)
    AIE.end
  }
  %24 = AIE.shimDMA(%21) {
    %57 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%21, DMA : 0>
    AIE.packet_dest<%44, DMA : 0>
  }
  %25 = AIE.tile(26, 0)
  %26 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %27 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%27, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %28 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %28) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<32x32xf32>) -> ()
  %29 = AIE.core(%25) {
    AIE.useToken @token6(Acquire, 0)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token1(Acquire, 3)
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token6(Release, 1)
    AIE.end
  }
  %30 = AIE.shimDMA(%25) {
    %57 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%28 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %58 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%27 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %59 = AIE.dmaStart(MM2S1, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%25, DMA : 1>
    AIE.packet_dest<%51, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%25, DMA : 0>
    AIE.packet_dest<%31, DMA : 0>
  }
  %31 = AIE.tile(25, 3)
  %32 = AIE.buffer(%38) : memref<32x32xf32>
  %33 = AIE.buffer(%31) : memref<32x32xf32>
  %34 = AIE.buffer(%31) : memref<32x32xf32>
  %35 = AIE.buffer(%31) : memref<32x32xf32>
  %36 = AIE.core(%31) {
    AIE.useToken @token9(Acquire, 3)
    AIE.useToken @token8(Acquire, 3)
    AIE.useToken @token7(Acquire, 0)
    AIE.useToken @token4(Acquire, 3)
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %57 = aievec.upd %35[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %57, %32[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %58 = aievec.upd %32[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %59 = aievec.ups %58 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %60 = aievec.upd %33[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.upd %34[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %62 = aievec.concat %61, %61 : vector<8xf32>, vector<16xf32>
          %63 = aievec.mac %62, %60, %59 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %64 = aievec.srs %63 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %64, %32[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token4(Release, 4)
    AIE.useToken @token7(Release, 1)
    AIE.useToken @token8(Release, 4)
    AIE.useToken @token9(Release, 4)
    AIE.end
  }
  %37 = AIE.mem(%31) {
    %57 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %58 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 8)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 3)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %38 = AIE.tile(24, 3) {polyaie.leaf}
  %39 = AIE.buffer(%38) : memref<32x32xf32>
  %40 = AIE.buffer(%38) : memref<32x32xf32>
  %41 = AIE.buffer(%38) : memref<32x32xf32>
  %42 = AIE.core(%38) {
    AIE.useToken @token7(Acquire, 1)
    AIE.useToken @token2(Acquire, 3)
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token0(Acquire, 3)
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %57 = aievec.upd %32[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %57, %39[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %58 = aievec.upd %39[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %59 = aievec.ups %58 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %60 = aievec.upd %40[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.upd %41[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %62 = aievec.concat %61, %61 : vector<8xf32>, vector<16xf32>
          %63 = aievec.mac %62, %60, %59 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %64 = aievec.srs %63 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %64, %39[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token0(Release, 4)
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token2(Release, 4)
    AIE.useToken @token7(Release, 2)
    AIE.end
  }
  %43 = AIE.mem(%38) {
    %57 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %58 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %59 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_dest<%25, DMA : 0>
    AIE.packet_source<%38, DMA : 0>
  }
  %44 = AIE.tile(25, 2)
  %45 = AIE.buffer(%44) : memref<32x32xf32>
  %46 = AIE.buffer(%44) : memref<32x32xf32>
  %47 = AIE.buffer(%44) : memref<32x32xf32>
  %48 = AIE.buffer(%44) : memref<32x32xf32>
  %49 = AIE.core(%44) {
    AIE.useToken @token11(Acquire, 0)
    AIE.useToken @token10(Acquire, 3)
    AIE.useToken @token9(Acquire, 5)
    AIE.useToken @token5(Acquire, 3)
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %57 = aievec.upd %48[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %57, %45[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %58 = aievec.upd %45[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %59 = aievec.ups %58 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %60 = aievec.upd %46[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.upd %47[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %62 = aievec.concat %61, %61 : vector<8xf32>, vector<16xf32>
          %63 = aievec.mac %62, %60, %59 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %64 = aievec.srs %63 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %64, %45[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token5(Release, 4)
    AIE.useToken @token9(Release, 6)
    AIE.useToken @token10(Release, 4)
    AIE.useToken @token11(Release, 1)
    AIE.end
  }
  %50 = AIE.mem(%44) {
    %57 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%47 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %58 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 8)
    AIE.dmaBd(<%46 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 5)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 3)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %51 = AIE.tile(24, 2) {polyaie.leaf}
  %52 = AIE.buffer(%51) : memref<32x32xf32>
  %53 = AIE.buffer(%51) : memref<32x32xf32>
  %54 = AIE.buffer(%51) : memref<32x32xf32>
  %55 = AIE.core(%51) {
    AIE.useToken @token11(Acquire, 1)
    AIE.useToken @token6(Acquire, 3)
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token2(Acquire, 5)
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %57 = aievec.upd %45[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %57, %52[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %58 = aievec.upd %52[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %59 = aievec.ups %58 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %60 = aievec.upd %53[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %61 = aievec.upd %54[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %62 = aievec.concat %61, %61 : vector<8xf32>, vector<16xf32>
          %63 = aievec.mac %62, %60, %59 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %64 = aievec.srs %63 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %64, %52[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token2(Release, 6)
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token6(Release, 4)
    AIE.useToken @token11(Release, 2)
    AIE.end
  }
  %56 = AIE.mem(%51) {
    %57 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %58 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %59 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%52 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_dest<%11, DMA : 0>
    AIE.packet_source<%51, DMA : 0>
  }
}


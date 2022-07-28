module @gemm {
  AIE.token(0) {sym_name = "token19"}
  AIE.token(0) {sym_name = "token18"}
  AIE.token(0) {sym_name = "token17"}
  AIE.token(0) {sym_name = "token16"}
  AIE.token(0) {sym_name = "token15"}
  AIE.token(0) {sym_name = "token14"}
  AIE.token(0) {sym_name = "token13"}
  AIE.token(0) {sym_name = "token12"}
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
  %0 = memref.alloc() : memref<64x64xf32>
  %1 = memref.alloc() : memref<64x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(19, 0)
  %4 = AIE.lock(%3, 2)
  %5 = AIE.lock(%3, 1)
  %6 = AIE.lock(%3, 0)
  %7 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %8 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %9 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %9) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %10 = AIE.core(%3) {
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%6, Acquire, 1)
    AIE.useLock(%6, Release, 0)
    AIE.useLock(%4, Release, 1)
    AIE.useLock(%5, Release, 1)
    AIE.end
  }
  %11 = AIE.shimDMA(%3) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%6, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 11)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %138 = AIE.dmaStart(MM2S1, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 12)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(12) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%96, DMA : 1>
    AIE.packet_dest<%116, DMA : 1>
  }
  AIE.packet_flow(11) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%56, DMA : 1>
  }
  %12 = AIE.tile(34, 0)
  %13 = AIE.lock(%12, 1)
  %14 = AIE.lock(%12, 0)
  %15 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %16 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %17 = AIE.core(%12) {
    AIE.useLock(%13, Acquire, 0)
    AIE.useLock(%14, Acquire, 0)
    AIE.useLock(%14, Release, 1)
    AIE.useLock(%13, Release, 1)
    AIE.end
  }
  %18 = AIE.shimDMA(%12) {
    %136 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%14, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%14, Release, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%13, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%13, Release, 0)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%12, DMA : 1>
    AIE.packet_dest<%67, DMA : 1>
    AIE.packet_dest<%106, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%12, DMA : 0>
    AIE.packet_dest<%56, DMA : 0>
    AIE.packet_dest<%76, DMA : 0>
  }
  %19 = AIE.tile(27, 0)
  %20 = AIE.lock(%19, 3)
  %21 = AIE.lock(%19, 2)
  %22 = AIE.lock(%19, 1)
  %23 = AIE.lock(%19, 0)
  %24 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %25 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %26 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %26) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %27 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %27) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %28 = AIE.core(%19) {
    AIE.useLock(%23, Acquire, 0)
    AIE.useLock(%22, Acquire, 1)
    AIE.useLock(%20, Acquire, 0)
    AIE.useLock(%21, Acquire, 1)
    AIE.useLock(%21, Release, 0)
    AIE.useLock(%20, Release, 1)
    AIE.useLock(%22, Release, 0)
    AIE.useLock(%23, Release, 1)
    AIE.end
  }
  %29 = AIE.shimDMA(%19) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%21, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%22, Acquire, 0)
    AIE.dmaBdPacket(0, 10)
    AIE.dmaBd(<%27 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %138 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%20, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%24 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    %139 = AIE.dmaStart(MM2S1, ^bb7, ^bb8)
  ^bb7:  // 2 preds: ^bb6, ^bb7
    AIE.useLock(%23, Acquire, 1)
    AIE.dmaBdPacket(0, 14)
    AIE.dmaBd(<%25 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 0)
    br ^bb7
  ^bb8:  // pred: ^bb6
    AIE.end
  }
  AIE.packet_flow(14) {
    AIE.packet_source<%19, DMA : 1>
    AIE.packet_dest<%56, DMA : 1>
    AIE.packet_dest<%96, DMA : 1>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%19, DMA : 0>
    AIE.packet_dest<%76, DMA : 1>
    AIE.packet_dest<%116, DMA : 0>
  }
  %30 = AIE.tile(18, 0)
  %31 = AIE.lock(%30, 1)
  %32 = AIE.lock(%30, 0)
  %33 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %0) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %34 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %0) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %35 = AIE.core(%30) {
    AIE.useLock(%31, Acquire, 0)
    AIE.useLock(%32, Acquire, 0)
    AIE.useLock(%32, Release, 1)
    AIE.useLock(%31, Release, 1)
    AIE.end
  }
  %36 = AIE.shimDMA(%30) {
    %136 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%32, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBdPacket(0, 8)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 0)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  AIE.packet_flow(8) {
    AIE.packet_source<%30, DMA : 1>
    AIE.packet_dest<%96, DMA : 0>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%30, DMA : 0>
    AIE.packet_dest<%76, DMA : 1>
  }
  %37 = AIE.tile(35, 0)
  %38 = AIE.lock(%37, 0)
  %39 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %40 = AIE.core(%37) {
    AIE.useLock(%38, Acquire, 0)
    AIE.useLock(%38, Release, 1)
    AIE.end
  }
  %41 = AIE.shimDMA(%37) {
    %136 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%38, Acquire, 1)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%38, Release, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(9) {
    AIE.packet_source<%37, DMA : 0>
    AIE.packet_dest<%106, DMA : 1>
    AIE.packet_dest<%126, DMA : 0>
  }
  %42 = AIE.tile(47, 0)
  %43 = AIE.lock(%42, 0)
  %44 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%44, %0) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %45 = AIE.core(%42) {
    AIE.useLock(%43, Acquire, 0)
    AIE.useLock(%43, Release, 1)
    AIE.end
  }
  %46 = AIE.shimDMA(%42) {
    %136 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%43, Acquire, 1)
    AIE.dmaBdPacket(0, 13)
    AIE.dmaBd(<%44 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(13) {
    AIE.packet_source<%42, DMA : 0>
    AIE.packet_dest<%116, DMA : 1>
  }
  %47 = AIE.tile(26, 0)
  %48 = AIE.lock(%47, 2)
  %49 = AIE.lock(%47, 1)
  %50 = AIE.lock(%47, 0)
  %51 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%51, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %52 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%52, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %53 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %53) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %54 = AIE.core(%47) {
    AIE.useLock(%48, Acquire, 0)
    AIE.useLock(%50, Acquire, 1)
    AIE.useLock(%49, Acquire, 0)
    AIE.useLock(%49, Release, 1)
    AIE.useLock(%50, Release, 0)
    AIE.useLock(%48, Release, 1)
    AIE.end
  }
  %55 = AIE.shimDMA(%47) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%50, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%49, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%52 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 0)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %138 = AIE.dmaStart(MM2S1, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%48, Acquire, 1)
    AIE.dmaBdPacket(0, 15)
    AIE.dmaBd(<%51 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(15) {
    AIE.packet_source<%47, DMA : 1>
    AIE.packet_dest<%86, DMA : 1>
    AIE.packet_dest<%126, DMA : 1>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%47, DMA : 0>
    AIE.packet_dest<%67, DMA : 0>
    AIE.packet_dest<%86, DMA : 0>
  }
  %56 = AIE.tile(26, 4)
  %57 = AIE.lock(%56, 3)
  %58 = AIE.lock(%56, 2)
  %59 = AIE.lock(%56, 1)
  %60 = AIE.lock(%56, 0)
  %61 = AIE.buffer(%56) : memref<32x32xf32>
  %62 = AIE.buffer(%56) : memref<32x32xf32>
  %63 = AIE.buffer(%56) : memref<32x32xf32>
  %64 = AIE.buffer(%56) : memref<32x32xf32>
  %65 = AIE.core(%56) {
    AIE.useLock(%60, Acquire, 1)
    AIE.useLock(%57, Acquire, 1)
    AIE.useLock(%58, Acquire, 0)
    AIE.useLock(%59, Acquire, 1)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %64[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %61[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %61[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %62[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %63[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %61[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%59, Release, 0)
    AIE.useLock(%58, Release, 1)
    AIE.useLock(%57, Release, 0)
    AIE.useLock(%60, Release, 0)
    AIE.end
  }
  %66 = AIE.mem(%56) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%59, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%59, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%57, Acquire, 0)
    AIE.dmaBdPacket(0, 11)
    AIE.dmaBd(<%64 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 1)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 14)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %67 = AIE.tile(25, 4) {polyaie.leaf}
  %68 = AIE.lock(%67, 2)
  %69 = AIE.lock(%67, 1)
  %70 = AIE.lock(%67, 0)
  %71 = AIE.buffer(%67) : memref<32x32xf32>
  %72 = AIE.buffer(%67) : memref<32x32xf32>
  %73 = AIE.buffer(%67) : memref<32x32xf32>
  %74 = AIE.core(%67) {
    AIE.useLock(%69, Acquire, 0)
    AIE.useLock(%58, Acquire, 1)
    AIE.useLock(%70, Acquire, 1)
    AIE.useLock(%68, Acquire, 1)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %61[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %71[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %71[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %72[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %73[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %71[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%68, Release, 0)
    AIE.useLock(%70, Release, 0)
    AIE.useLock(%58, Release, 0)
    AIE.useLock(%69, Release, 1)
    AIE.end
  }
  %75 = AIE.mem(%67) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%68, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%72 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%68, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%70, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%73 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%70, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %138 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%69, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%71 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%69, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(6) {
    AIE.packet_dest<%47, DMA : 0>
    AIE.packet_source<%67, DMA : 0>
  }
  %76 = AIE.tile(23, 2)
  %77 = AIE.lock(%76, 2)
  %78 = AIE.lock(%76, 1)
  %79 = AIE.lock(%76, 0)
  %80 = AIE.buffer(%76) : memref<32x32xf32>
  %81 = AIE.buffer(%76) : memref<32x32xf32>
  %82 = AIE.buffer(%76) : memref<32x32xf32>
  %83 = AIE.buffer(%76) : memref<32x32xf32>
  %84 = AIE.core(%76) {
    AIE.useLock(%88, Acquire, 0)
    AIE.useLock(%78, Acquire, 1)
    AIE.useLock(%77, Acquire, 1)
    AIE.useLock(%79, Acquire, 1)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %83[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %80[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %80[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %81[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %82[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %80[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%79, Release, 0)
    AIE.useLock(%77, Release, 0)
    AIE.useLock(%78, Release, 0)
    AIE.useLock(%88, Release, 1)
    AIE.end
  }
  %85 = AIE.mem(%76) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%77, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%83 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%77, Release, 1)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%78, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%78, Release, 1)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %86 = AIE.tile(23, 3) {polyaie.leaf}
  %87 = AIE.lock(%86, 3)
  %88 = AIE.lock(%86, 2)
  %89 = AIE.lock(%86, 1)
  %90 = AIE.lock(%86, 0)
  %91 = AIE.buffer(%86) : memref<32x32xf32>
  %92 = AIE.buffer(%86) : memref<32x32xf32>
  %93 = AIE.buffer(%86) : memref<32x32xf32>
  %94 = AIE.core(%86) {
    AIE.useLock(%87, Acquire, 1)
    AIE.useLock(%88, Acquire, 1)
    AIE.useLock(%89, Acquire, 0)
    AIE.useLock(%90, Acquire, 1)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %80[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %91[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %91[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %92[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %93[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %91[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%90, Release, 0)
    AIE.useLock(%89, Release, 1)
    AIE.useLock(%88, Release, 0)
    AIE.useLock(%87, Release, 0)
    AIE.end
  }
  %95 = AIE.mem(%86) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%90, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%90, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%87, Acquire, 0)
    AIE.dmaBdPacket(0, 15)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%87, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %138 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%89, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%91 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%89, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_dest<%19, DMA : 0>
    AIE.packet_source<%86, DMA : 0>
  }
  %96 = AIE.tile(26, 2)
  %97 = AIE.lock(%96, 2)
  %98 = AIE.lock(%96, 1)
  %99 = AIE.lock(%96, 0)
  %100 = AIE.buffer(%96) : memref<32x32xf32>
  %101 = AIE.buffer(%96) : memref<32x32xf32>
  %102 = AIE.buffer(%96) : memref<32x32xf32>
  %103 = AIE.buffer(%96) : memref<32x32xf32>
  %104 = AIE.core(%96) {
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%98, Acquire, 1)
    AIE.useLock(%108, Acquire, 0)
    AIE.useLock(%97, Acquire, 1)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %103[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %100[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %100[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %101[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %102[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %100[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%97, Release, 0)
    AIE.useLock(%108, Release, 1)
    AIE.useLock(%98, Release, 0)
    AIE.useLock(%99, Release, 0)
    AIE.end
  }
  %105 = AIE.mem(%96) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%97, Acquire, 0)
    AIE.dmaBdPacket(0, 8)
    AIE.dmaBd(<%103 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%97, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%98, Acquire, 0)
    AIE.dmaBdPacket(0, 12)
    AIE.dmaBd(<%101 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%98, Release, 1)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBdPacket(0, 14)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %106 = AIE.tile(26, 3) {polyaie.leaf}
  %107 = AIE.lock(%106, 3)
  %108 = AIE.lock(%106, 2)
  %109 = AIE.lock(%106, 1)
  %110 = AIE.lock(%106, 0)
  %111 = AIE.buffer(%106) : memref<32x32xf32>
  %112 = AIE.buffer(%106) : memref<32x32xf32>
  %113 = AIE.buffer(%106) : memref<32x32xf32>
  %114 = AIE.core(%106) {
    AIE.useLock(%108, Acquire, 1)
    AIE.useLock(%107, Acquire, 1)
    AIE.useLock(%110, Acquire, 1)
    AIE.useLock(%109, Acquire, 0)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %100[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %111[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %111[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %112[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %113[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %111[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%109, Release, 1)
    AIE.useLock(%110, Release, 0)
    AIE.useLock(%107, Release, 0)
    AIE.useLock(%108, Release, 0)
    AIE.end
  }
  %115 = AIE.mem(%106) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%110, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%113 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%110, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%107, Acquire, 0)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%107, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %138 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%109, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_dest<%3, DMA : 0>
    AIE.packet_source<%106, DMA : 0>
  }
  %116 = AIE.tile(24, 2)
  %117 = AIE.lock(%116, 2)
  %118 = AIE.lock(%116, 1)
  %119 = AIE.lock(%116, 0)
  %120 = AIE.buffer(%126) : memref<32x32xf32>
  %121 = AIE.buffer(%116) : memref<32x32xf32>
  %122 = AIE.buffer(%116) : memref<32x32xf32>
  %123 = AIE.buffer(%116) : memref<32x32xf32>
  %124 = AIE.core(%116) {
    AIE.useLock(%117, Acquire, 1)
    AIE.useLock(%118, Acquire, 1)
    AIE.useLock(%119, Acquire, 1)
    AIE.useLock(%130, Acquire, 0)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %123[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %120[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %120[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %121[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %122[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %120[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%130, Release, 1)
    AIE.useLock(%119, Release, 0)
    AIE.useLock(%118, Release, 0)
    AIE.useLock(%117, Release, 0)
    AIE.end
  }
  %125 = AIE.mem(%116) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%119, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%122 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%119, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%118, Acquire, 0)
    AIE.dmaBdPacket(0, 12)
    AIE.dmaBd(<%121 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%118, Release, 1)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%117, Acquire, 0)
    AIE.dmaBdPacket(0, 13)
    AIE.dmaBd(<%123 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 1)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %126 = AIE.tile(25, 2) {polyaie.leaf}
  %127 = AIE.lock(%126, 3)
  %128 = AIE.lock(%126, 2)
  %129 = AIE.lock(%126, 1)
  %130 = AIE.lock(%126, 0)
  %131 = AIE.buffer(%126) : memref<32x32xf32>
  %132 = AIE.buffer(%126) : memref<32x32xf32>
  %133 = AIE.buffer(%126) : memref<32x32xf32>
  %134 = AIE.core(%126) {
    AIE.useLock(%128, Acquire, 1)
    AIE.useLock(%129, Acquire, 0)
    AIE.useLock(%127, Acquire, 1)
    AIE.useLock(%130, Acquire, 1)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %136 = aievec.upd %120[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %136, %131[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %137 = aievec.upd %131[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %138 = aievec.ups %137 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %139 = aievec.upd %132[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %140 = aievec.upd %133[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %141 = aievec.concat %140, %140 : vector<8xf32>, vector<16xf32>
          %142 = aievec.mac %141, %139, %138 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %143 = aievec.srs %142 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %143, %131[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useLock(%130, Release, 0)
    AIE.useLock(%127, Release, 0)
    AIE.useLock(%129, Release, 1)
    AIE.useLock(%128, Release, 0)
    AIE.end
  }
  %135 = AIE.mem(%126) {
    %136 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%127, Acquire, 0)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%132 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%127, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %137 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%128, Acquire, 0)
    AIE.dmaBdPacket(0, 15)
    AIE.dmaBd(<%133 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%128, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %138 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%129, Acquire, 1)
    AIE.dmaBdPacket(0, 10)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%129, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(10) {
    AIE.packet_dest<%19, DMA : 1>
    AIE.packet_source<%126, DMA : 0>
  }
}


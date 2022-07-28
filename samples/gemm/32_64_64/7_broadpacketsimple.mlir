module @gemm {
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
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<32x64xf32>
  %1 = memref.alloc() : memref<32x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(27, 0)
  %4 = AIE.lock(%3, 1)
  %5 = AIE.lock(%3, 0)
  %6 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %7 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %8 = AIE.core(%3) {
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%4, Release, 1)
    AIE.useLock(%5, Release, 1)
    AIE.end
  }
  %9 = AIE.shimDMA(%3) {
    %63 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb1
  ^bb3:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%53, DMA : 0>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%44, DMA : 0>
  }
  %10 = AIE.tile(26, 0)
  %11 = AIE.lock(%10, 3)
  %12 = AIE.lock(%10, 2)
  %13 = AIE.lock(%10, 1)
  %14 = AIE.lock(%10, 0)
  %15 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %16 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %17 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %18 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %19 = AIE.external_buffer 40960 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %19) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %20 = AIE.external_buffer 45060 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %20) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %21 = AIE.core(%10) {
    AIE.useLock(%13, Acquire, 0)
    AIE.useLock(%11, Acquire, 0)
    AIE.useLock(%14, Acquire, 0)
    AIE.useLock(%12, Acquire, 0)
    AIE.useLock(%12, Release, 1)
    AIE.useLock(%14, Release, 1)
    AIE.useLock(%11, Release, 1)
    AIE.useLock(%13, Release, 1)
    AIE.end
  }
  %22 = AIE.shimDMA(%10) {
    %63 = AIE.dmaStart(S2MM0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%19 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%20 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb3:  // pred: ^bb0
    %64 = AIE.dmaStart(MM2S0, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%13, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%13, Release, 0)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%12, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%12, Release, 0)
    br ^bb4
  ^bb6:  // pred: ^bb3
    %65 = AIE.dmaStart(MM2S1, ^bb7, ^bb9)
  ^bb7:  // 2 preds: ^bb6, ^bb8
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%14, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%14, Release, 0)
    br ^bb7
  ^bb9:  // pred: ^bb6
    AIE.end
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%10, DMA : 1>
    AIE.packet_dest<%34, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%10, DMA : 1>
    AIE.packet_dest<%25, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%10, DMA : 0>
    AIE.packet_dest<%34, DMA : 0>
    AIE.packet_dest<%53, DMA : 1>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%10, DMA : 0>
    AIE.packet_dest<%25, DMA : 1>
    AIE.packet_dest<%44, DMA : 1>
  }
  %23 = AIE.tile(0, 0)
  %24 = AIE.core(%23) {
    AIE.end
  }
  %25 = AIE.tile(26, 2)
  %26 = AIE.lock(%25, 1)
  %27 = AIE.lock(%25, 0)
  %28 = AIE.buffer(%25) : memref<32x32xf32>
  %29 = AIE.buffer(%25) : memref<32x32xf32>
  %30 = AIE.buffer(%25) : memref<32x32xf32>
  %31 = AIE.buffer(%25) : memref<32x32xf32>
  %32 = AIE.core(%25) {
    AIE.useLock(%27, Acquire, 1)
    AIE.useLock(%26, Acquire, 1)
    AIE.useLock(%38, Acquire, 0)
    call @extern_kernel(%31, %28, %29, %30) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%38, Release, 1)
    AIE.useLock(%26, Release, 0)
    AIE.useLock(%27, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %33 = AIE.mem(%25) {
    %63 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%26, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%30 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%26, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %64 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%27, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%29 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %34 = AIE.tile(26, 3) {polyaie.leaf}
  %35 = AIE.lock(%34, 3)
  %36 = AIE.lock(%34, 2)
  %37 = AIE.lock(%34, 1)
  %38 = AIE.lock(%34, 0)
  %39 = AIE.buffer(%34) : memref<32x32xf32>
  %40 = AIE.buffer(%34) : memref<32x32xf32>
  %41 = AIE.buffer(%34) : memref<32x32xf32>
  %42 = AIE.core(%34) {
    AIE.useLock(%38, Acquire, 1)
    AIE.useLock(%37, Acquire, 1)
    AIE.useLock(%35, Acquire, 1)
    AIE.useLock(%36, Acquire, 0)
    call @extern_kernel(%28, %39, %40, %41) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%36, Release, 1)
    AIE.useLock(%35, Release, 0)
    AIE.useLock(%37, Release, 0)
    AIE.useLock(%38, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %43 = AIE.mem(%34) {
    %63 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%35, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %64 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %65 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%36, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%34, DMA : 0>
    AIE.packet_dest<%10, DMA : 0>
  }
  %44 = AIE.tile(27, 2)
  %45 = AIE.lock(%44, 1)
  %46 = AIE.lock(%44, 0)
  %47 = AIE.buffer(%44) : memref<32x32xf32>
  %48 = AIE.buffer(%44) : memref<32x32xf32>
  %49 = AIE.buffer(%44) : memref<32x32xf32>
  %50 = AIE.buffer(%44) : memref<32x32xf32>
  %51 = AIE.core(%44) {
    AIE.useLock(%55, Acquire, 0)
    AIE.useLock(%46, Acquire, 1)
    AIE.useLock(%45, Acquire, 1)
    call @extern_kernel(%50, %47, %48, %49) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%45, Release, 0)
    AIE.useLock(%46, Release, 0)
    AIE.useLock(%55, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %52 = AIE.mem(%44) {
    %63 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%49 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %64 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %53 = AIE.tile(27, 3) {polyaie.leaf}
  %54 = AIE.lock(%53, 3)
  %55 = AIE.lock(%53, 2)
  %56 = AIE.lock(%53, 1)
  %57 = AIE.lock(%53, 0)
  %58 = AIE.buffer(%53) : memref<32x32xf32>
  %59 = AIE.buffer(%53) : memref<32x32xf32>
  %60 = AIE.buffer(%53) : memref<32x32xf32>
  %61 = AIE.core(%53) {
    AIE.useLock(%55, Acquire, 1)
    AIE.useLock(%54, Acquire, 1)
    AIE.useLock(%56, Acquire, 0)
    AIE.useLock(%57, Acquire, 1)
    call @extern_kernel(%47, %58, %59, %60) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%57, Release, 0)
    AIE.useLock(%56, Release, 1)
    AIE.useLock(%54, Release, 0)
    AIE.useLock(%55, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %62 = AIE.mem(%53) {
    %63 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%57, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%60 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %64 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%54, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%54, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %65 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%56, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%56, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%53, DMA : 0>
    AIE.packet_dest<%10, DMA : 0>
  }
}


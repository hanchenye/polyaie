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
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %6 = AIE.core(%3) {
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token0(Acquire, 0)
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token1(Release, 1)
    AIE.end
  }
  %7 = AIE.shimDMA(%3) {
    %45 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb1
  ^bb3:  // pred: ^bb0
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%32, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%39, DMA : 0>
    }
  }
  %8 = AIE.tile(26, 0)
  %9 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %10 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %11 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %12 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %13 = AIE.external_buffer 40960 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %13) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %14 = AIE.external_buffer 45060 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %15 = AIE.core(%8) {
    AIE.useToken @token8(Acquire, 0)
    AIE.useToken @token7(Acquire, 0)
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token5(Release, 1)
    AIE.useToken @token7(Release, 1)
    AIE.useToken @token8(Release, 1)
    AIE.end
  }
  %16 = AIE.shimDMA(%8) {
    %45 = AIE.dmaStart(S2MM0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%13 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%14 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token2(Release, 3)
    br ^bb1
  ^bb3:  // pred: ^bb0
    %46 = AIE.dmaStart(MM2S0, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 2)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb4
  ^bb6:  // pred: ^bb3
    %47 = AIE.dmaStart(MM2S1, ^bb7, ^bb9)
  ^bb7:  // 2 preds: ^bb6, ^bb8
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 2)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 2)
    br ^bb7
  ^bb9:  // pred: ^bb6
    AIE.end
  }
  AIE.broad_packet(%8, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%19, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%26, DMA : 1>
    }
  }
  AIE.broad_packet(%8, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%19, DMA : 1>
      AIE.bp_dest<%32, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%26, DMA : 0>
      AIE.bp_dest<%39, DMA : 1>
    }
  }
  %17 = AIE.tile(0, 0)
  %18 = AIE.core(%17) {
    AIE.end
  }
  %19 = AIE.tile(26, 2)
  %20 = AIE.buffer(%19) : memref<32x32xf32>
  %21 = AIE.buffer(%19) : memref<32x32xf32>
  %22 = AIE.buffer(%19) : memref<32x32xf32>
  %23 = AIE.buffer(%19) : memref<32x32xf32>
  %24 = AIE.core(%19) {
    AIE.useToken @token8(Acquire, 3)
    AIE.useToken @token7(Acquire, 3)
    AIE.useToken @token6(Acquire, 0)
    call @extern_kernel(%23, %20, %21, %22) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 1)
    AIE.useToken @token7(Release, 4)
    AIE.useToken @token8(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %25 = AIE.mem(%19) {
    %45 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %46 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %26 = AIE.tile(26, 3) {polyaie.leaf}
  %27 = AIE.buffer(%26) : memref<32x32xf32>
  %28 = AIE.buffer(%26) : memref<32x32xf32>
  %29 = AIE.buffer(%26) : memref<32x32xf32>
  %30 = AIE.core(%26) {
    AIE.useToken @token6(Acquire, 1)
    AIE.useToken @token5(Acquire, 3)
    AIE.useToken @token4(Acquire, 3)
    AIE.useToken @token3(Acquire, 0)
    call @extern_kernel(%20, %27, %28, %29) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token4(Release, 4)
    AIE.useToken @token5(Release, 4)
    AIE.useToken @token6(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %31 = AIE.mem(%26) {
    %45 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%28 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %46 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%29 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %47 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%27 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%26, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%8, DMA : 0>
    }
  }
  %32 = AIE.tile(27, 2)
  %33 = AIE.buffer(%32) : memref<32x32xf32>
  %34 = AIE.buffer(%32) : memref<32x32xf32>
  %35 = AIE.buffer(%32) : memref<32x32xf32>
  %36 = AIE.buffer(%32) : memref<32x32xf32>
  %37 = AIE.core(%32) {
    AIE.useToken @token9(Acquire, 0)
    AIE.useToken @token8(Acquire, 5)
    AIE.useToken @token0(Acquire, 3)
    call @extern_kernel(%36, %33, %34, %35) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 4)
    AIE.useToken @token8(Release, 6)
    AIE.useToken @token9(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %38 = AIE.mem(%32) {
    %45 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %46 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %39 = AIE.tile(27, 3) {polyaie.leaf}
  %40 = AIE.buffer(%39) : memref<32x32xf32>
  %41 = AIE.buffer(%39) : memref<32x32xf32>
  %42 = AIE.buffer(%39) : memref<32x32xf32>
  %43 = AIE.core(%39) {
    AIE.useToken @token9(Acquire, 1)
    AIE.useToken @token4(Acquire, 5)
    AIE.useToken @token2(Acquire, 0)
    AIE.useToken @token1(Acquire, 3)
    call @extern_kernel(%33, %40, %41, %42) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token4(Release, 6)
    AIE.useToken @token9(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %44 = AIE.mem(%39) {
    %45 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %46 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %47 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%39, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%8, DMA : 0>
    }
  }
}


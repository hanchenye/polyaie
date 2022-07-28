module @gemm {
  AIE.token(0) {sym_name = "token5"}
  AIE.token(0) {sym_name = "token4"}
  AIE.token(0) {sym_name = "token3"}
  AIE.token(0) {sym_name = "token2"}
  AIE.token(0) {sym_name = "token1"}
  AIE.token(0) {sym_name = "token0"}
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<32x32xf32>
  %1 = memref.alloc() : memref<32x64xf32>
  %2 = memref.alloc() : memref<64x32xf32>
  %3 = AIE.tile(26, 0)
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x32xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x32xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %8) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  %9 = AIE.core(%3) {
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token2(Acquire, 0)
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token4(Release, 1)
    AIE.end
  }
  %10 = AIE.shimDMA(%3) {
    %26 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%8 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %27 = AIE.dmaStart(MM2S0, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 2)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb3
  ^bb5:  // pred: ^bb2
    %28 = AIE.dmaStart(MM2S1, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb6
  ^bb8:  // pred: ^bb5
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%13, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%20, DMA : 1>
    }
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%13, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%20, DMA : 0>
    }
  }
  %11 = AIE.tile(0, 0)
  %12 = AIE.core(%11) {
    AIE.end
  }
  %13 = AIE.tile(26, 2)
  %14 = AIE.buffer(%13) : memref<32x32xf32>
  %15 = AIE.buffer(%13) : memref<32x32xf32>
  %16 = AIE.buffer(%13) : memref<32x32xf32>
  %17 = AIE.buffer(%13) : memref<32x32xf32>
  %18 = AIE.core(%13) {
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token2(Acquire, 3)
    AIE.useToken @token1(Acquire, 3)
    call @extern_kernel(%17, %14, %15, %16) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token2(Release, 4)
    AIE.useToken @token5(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %19 = AIE.mem(%13) {
    %26 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %27 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %20 = AIE.tile(26, 3) {polyaie.leaf}
  %21 = AIE.buffer(%20) : memref<32x32xf32>
  %22 = AIE.buffer(%20) : memref<32x32xf32>
  %23 = AIE.buffer(%20) : memref<32x32xf32>
  %24 = AIE.core(%20) {
    AIE.useToken @token5(Acquire, 1)
    AIE.useToken @token4(Acquire, 3)
    AIE.useToken @token3(Acquire, 3)
    AIE.useToken @token0(Acquire, 0)
    call @extern_kernel(%14, %21, %22, %23) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token3(Release, 4)
    AIE.useToken @token4(Release, 4)
    AIE.useToken @token5(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %25 = AIE.mem(%20) {
    %26 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%23 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %27 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %28 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%20, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
}


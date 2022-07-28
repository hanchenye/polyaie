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
  %4 = AIE.lock(%3, 3)
  %5 = AIE.lock(%3, 2)
  %6 = AIE.lock(%3, 1)
  %7 = AIE.lock(%3, 0)
  %8 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %9 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x32xf32>) -> ()
  %10 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %11 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x32xf32>) -> ()
  %12 = AIE.external_buffer 32768 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<1025xf32>) -> ()
  %13 = AIE.core(%3) {
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%5, Release, 1)
    AIE.useLock(%4, Release, 1)
    AIE.end
  }
  %14 = AIE.shimDMA(%3) {
    %36 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%12 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %37 = AIE.dmaStart(MM2S0, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb3
  ^bb5:  // pred: ^bb2
    %38 = AIE.dmaStart(MM2S1, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb6
  ^bb8:  // pred: ^bb5
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%17, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%26, DMA : 1>
    }
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%17, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%26, DMA : 0>
    }
  }
  %15 = AIE.tile(0, 0)
  %16 = AIE.core(%15) {
    AIE.end
  }
  %17 = AIE.tile(26, 2)
  %18 = AIE.lock(%17, 1)
  %19 = AIE.lock(%17, 0)
  %20 = AIE.buffer(%17) : memref<32x32xf32>
  %21 = AIE.buffer(%17) : memref<32x32xf32>
  %22 = AIE.buffer(%17) : memref<32x32xf32>
  %23 = AIE.buffer(%17) : memref<32x32xf32>
  %24 = AIE.core(%17) {
    AIE.useLock(%30, Acquire, 0)
    AIE.useLock(%18, Acquire, 1)
    AIE.useLock(%19, Acquire, 1)
    call @extern_kernel(%23, %20, %21, %22) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%19, Release, 0)
    AIE.useLock(%18, Release, 0)
    AIE.useLock(%30, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %25 = AIE.mem(%17) {
    %36 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%19, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %37 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%18, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%18, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %26 = AIE.tile(26, 3) {polyaie.leaf}
  %27 = AIE.lock(%26, 3)
  %28 = AIE.lock(%26, 2)
  %29 = AIE.lock(%26, 1)
  %30 = AIE.lock(%26, 0)
  %31 = AIE.buffer(%26) : memref<32x32xf32>
  %32 = AIE.buffer(%26) : memref<32x32xf32>
  %33 = AIE.buffer(%26) : memref<32x32xf32>
  %34 = AIE.core(%26) {
    AIE.useLock(%30, Acquire, 1)
    AIE.useLock(%27, Acquire, 1)
    AIE.useLock(%29, Acquire, 1)
    AIE.useLock(%28, Acquire, 0)
    call @extern_kernel(%20, %31, %32, %33) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%28, Release, 1)
    AIE.useLock(%29, Release, 0)
    AIE.useLock(%27, Release, 0)
    AIE.useLock(%30, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %35 = AIE.mem(%26) {
    %36 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%29, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %37 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%27, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%32 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %38 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%31 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%26, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
}


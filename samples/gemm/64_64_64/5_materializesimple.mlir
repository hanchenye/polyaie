module @gemm {
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
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<64x64xf32>
  %1 = memref.alloc() : memref<64x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(10, 0)
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %8 = AIE.core(%3) {
    AIE.useToken @token15(Acquire, 0)
    AIE.useToken @token6(Acquire, 0)
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token5(Release, 1)
    AIE.useToken @token6(Release, 1)
    AIE.useToken @token15(Release, 1)
    AIE.end
  }
  %9 = AIE.shimDMA(%3) {
    %75 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 2)
    br ^bb1
  ^bb3:  // pred: ^bb0
    %76 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 2)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb4
  ^bb6:  // pred: ^bb3
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%23, DMA : 1>
      AIE.bp_dest<%36, DMA : 0>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%30, DMA : 1>
      AIE.bp_dest<%43, DMA : 1>
    }
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%23, DMA : 0>
      AIE.bp_dest<%49, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%30, DMA : 0>
      AIE.bp_dest<%56, DMA : 0>
    }
  }
  %10 = AIE.tile(11, 0)
  %11 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %12 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %13 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %14 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %15 = AIE.external_buffer 49152 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %16 = AIE.external_buffer 57344 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %17 = AIE.external_buffer 65536 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %18 = AIE.external_buffer 73728 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %18) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %19 = AIE.core(%10) {
    AIE.useToken @token14(Acquire, 0)
    AIE.useToken @token13(Acquire, 0)
    AIE.useToken @token12(Acquire, 0)
    AIE.useToken @token10(Acquire, 0)
    AIE.useToken @token10(Release, 1)
    AIE.useToken @token12(Release, 1)
    AIE.useToken @token13(Release, 1)
    AIE.useToken @token14(Release, 1)
    AIE.end
  }
  %20 = AIE.shimDMA(%10) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%15 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token8(Release, 3)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%16 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%17 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%18 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %76 = AIE.dmaStart(MM2S0, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token12(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 2)
    br ^bb6
  ^bb8:  // pred: ^bb5
    %77 = AIE.dmaStart(MM2S1, ^bb9, ^bb11)
  ^bb9:  // 2 preds: ^bb8, ^bb10
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 2)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 2)
    br ^bb9
  ^bb11:  // pred: ^bb8
    AIE.end
  }
  AIE.broad_packet(%10, DMA : 1) {
    AIE.bp_id(0) {
      AIE.bp_dest<%49, DMA : 1>
      AIE.bp_dest<%62, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%56, DMA : 1>
      AIE.bp_dest<%69, DMA : 1>
    }
  }
  AIE.broad_packet(%10, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%36, DMA : 1>
      AIE.bp_dest<%62, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%43, DMA : 0>
      AIE.bp_dest<%69, DMA : 0>
    }
  }
  %21 = AIE.tile(0, 0)
  %22 = AIE.core(%21) {
    AIE.end
  }
  %23 = AIE.tile(10, 2)
  %24 = AIE.buffer(%23) : memref<32x32xf32>
  %25 = AIE.buffer(%23) : memref<32x32xf32>
  %26 = AIE.buffer(%23) : memref<32x32xf32>
  %27 = AIE.buffer(%23) : memref<32x32xf32>
  %28 = AIE.core(%23) {
    AIE.useToken @token7(Acquire, 0)
    AIE.useToken @token6(Acquire, 3)
    AIE.useToken @token5(Acquire, 3)
    call @extern_kernel(%27, %24, %25, %26) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 4)
    AIE.useToken @token6(Release, 4)
    AIE.useToken @token7(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %29 = AIE.mem(%23) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%25 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %30 = AIE.tile(10, 3) {polyaie.leaf}
  %31 = AIE.buffer(%30) : memref<32x32xf32>
  %32 = AIE.buffer(%30) : memref<32x32xf32>
  %33 = AIE.buffer(%30) : memref<32x32xf32>
  %34 = AIE.core(%30) {
    AIE.useToken @token15(Acquire, 3)
    AIE.useToken @token8(Acquire, 0)
    AIE.useToken @token7(Acquire, 1)
    AIE.useToken @token3(Acquire, 3)
    call @extern_kernel(%24, %31, %32, %33) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 4)
    AIE.useToken @token7(Release, 2)
    AIE.useToken @token8(Release, 1)
    AIE.useToken @token15(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %35 = AIE.mem(%30) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%32 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %77 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%31 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%30, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%10, DMA : 0>
    }
  }
  %36 = AIE.tile(11, 2)
  %37 = AIE.buffer(%36) : memref<32x32xf32>
  %38 = AIE.buffer(%36) : memref<32x32xf32>
  %39 = AIE.buffer(%36) : memref<32x32xf32>
  %40 = AIE.buffer(%36) : memref<32x32xf32>
  %41 = AIE.core(%36) {
    AIE.useToken @token12(Acquire, 3)
    AIE.useToken @token6(Acquire, 5)
    AIE.useToken @token2(Acquire, 0)
    call @extern_kernel(%40, %37, %38, %39) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token6(Release, 6)
    AIE.useToken @token12(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %42 = AIE.mem(%36) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%38 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token12(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %43 = AIE.tile(11, 3) {polyaie.leaf}
  %44 = AIE.buffer(%43) : memref<32x32xf32>
  %45 = AIE.buffer(%43) : memref<32x32xf32>
  %46 = AIE.buffer(%43) : memref<32x32xf32>
  %47 = AIE.core(%43) {
    AIE.useToken @token15(Acquire, 5)
    AIE.useToken @token10(Acquire, 3)
    AIE.useToken @token2(Acquire, 1)
    AIE.useToken @token0(Acquire, 0)
    call @extern_kernel(%37, %44, %45, %46) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token2(Release, 2)
    AIE.useToken @token10(Release, 4)
    AIE.useToken @token15(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %48 = AIE.mem(%43) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%46 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%45 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %77 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%44 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%43, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%10, DMA : 0>
    }
  }
  %49 = AIE.tile(12, 2)
  %50 = AIE.buffer(%49) : memref<32x32xf32>
  %51 = AIE.buffer(%49) : memref<32x32xf32>
  %52 = AIE.buffer(%49) : memref<32x32xf32>
  %53 = AIE.buffer(%49) : memref<32x32xf32>
  %54 = AIE.core(%49) {
    AIE.useToken @token13(Acquire, 3)
    AIE.useToken @token11(Acquire, 0)
    AIE.useToken @token5(Acquire, 5)
    call @extern_kernel(%53, %50, %51, %52) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 6)
    AIE.useToken @token11(Release, 1)
    AIE.useToken @token13(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %55 = AIE.mem(%49) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%52 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%51 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %56 = AIE.tile(12, 3) {polyaie.leaf}
  %57 = AIE.buffer(%56) : memref<32x32xf32>
  %58 = AIE.buffer(%56) : memref<32x32xf32>
  %59 = AIE.buffer(%56) : memref<32x32xf32>
  %60 = AIE.core(%56) {
    AIE.useToken @token14(Acquire, 3)
    AIE.useToken @token11(Acquire, 1)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token3(Acquire, 5)
    call @extern_kernel(%50, %57, %58, %59) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 6)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token11(Release, 2)
    AIE.useToken @token14(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %61 = AIE.mem(%56) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %77 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%56, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%10, DMA : 0>
    }
  }
  %62 = AIE.tile(13, 2)
  %63 = AIE.buffer(%62) : memref<32x32xf32>
  %64 = AIE.buffer(%62) : memref<32x32xf32>
  %65 = AIE.buffer(%62) : memref<32x32xf32>
  %66 = AIE.buffer(%62) : memref<32x32xf32>
  %67 = AIE.core(%62) {
    AIE.useToken @token13(Acquire, 5)
    AIE.useToken @token12(Acquire, 5)
    AIE.useToken @token9(Acquire, 0)
    call @extern_kernel(%66, %63, %64, %65) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 1)
    AIE.useToken @token12(Release, 6)
    AIE.useToken @token13(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %68 = AIE.mem(%62) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%65 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token12(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%64 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %69 = AIE.tile(13, 3) {polyaie.leaf}
  %70 = AIE.buffer(%69) : memref<32x32xf32>
  %71 = AIE.buffer(%69) : memref<32x32xf32>
  %72 = AIE.buffer(%69) : memref<32x32xf32>
  %73 = AIE.core(%69) {
    AIE.useToken @token14(Acquire, 5)
    AIE.useToken @token10(Acquire, 5)
    AIE.useToken @token9(Acquire, 1)
    AIE.useToken @token1(Acquire, 0)
    call @extern_kernel(%63, %70, %71, %72) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token9(Release, 2)
    AIE.useToken @token10(Release, 6)
    AIE.useToken @token14(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %74 = AIE.mem(%69) {
    %75 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%72 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %76 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%71 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %77 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%70 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%69, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%10, DMA : 0>
    }
  }
}


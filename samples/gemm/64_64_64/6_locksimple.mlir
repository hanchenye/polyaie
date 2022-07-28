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
  %4 = AIE.lock(%3, 3)
  %5 = AIE.lock(%3, 2)
  %6 = AIE.lock(%3, 1)
  %7 = AIE.lock(%3, 0)
  %8 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %9 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %10 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %11 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %12 = AIE.core(%3) {
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%5, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%4, Release, 1)
    AIE.end
  }
  %13 = AIE.shimDMA(%3) {
    %107 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb1
  ^bb3:  // pred: ^bb0
    %108 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb4
  ^bb6:  // pred: ^bb3
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%31, DMA : 1>
      AIE.bp_dest<%50, DMA : 0>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%40, DMA : 1>
      AIE.bp_dest<%59, DMA : 1>
    }
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%31, DMA : 0>
      AIE.bp_dest<%69, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%40, DMA : 0>
      AIE.bp_dest<%78, DMA : 0>
    }
  }
  %14 = AIE.tile(11, 0)
  %15 = AIE.lock(%14, 3)
  %16 = AIE.lock(%14, 2)
  %17 = AIE.lock(%14, 1)
  %18 = AIE.lock(%14, 0)
  %19 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %20 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %21 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %22 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %23 = AIE.external_buffer 49152 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %23) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %24 = AIE.external_buffer 57344 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %24) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %25 = AIE.external_buffer 65536 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %25) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %26 = AIE.external_buffer 73728 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %26) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %27 = AIE.core(%14) {
    AIE.useLock(%16, Acquire, 0)
    AIE.useLock(%18, Acquire, 0)
    AIE.useLock(%15, Acquire, 0)
    AIE.useLock(%17, Acquire, 0)
    AIE.useLock(%17, Release, 1)
    AIE.useLock(%15, Release, 1)
    AIE.useLock(%18, Release, 1)
    AIE.useLock(%16, Release, 1)
    AIE.end
  }
  %28 = AIE.shimDMA(%14) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%23 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%24 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%25 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%26 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %108 = AIE.dmaStart(MM2S0, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%15, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%15, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%17, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%17, Release, 0)
    br ^bb6
  ^bb8:  // pred: ^bb5
    %109 = AIE.dmaStart(MM2S1, ^bb9, ^bb11)
  ^bb9:  // 2 preds: ^bb8, ^bb10
    AIE.useLock(%18, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%20 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%18, Release, 0)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%16, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%19 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%16, Release, 0)
    br ^bb9
  ^bb11:  // pred: ^bb8
    AIE.end
  }
  AIE.broad_packet(%14, DMA : 1) {
    AIE.bp_id(0) {
      AIE.bp_dest<%69, DMA : 1>
      AIE.bp_dest<%88, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%78, DMA : 1>
      AIE.bp_dest<%97, DMA : 1>
    }
  }
  AIE.broad_packet(%14, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%50, DMA : 1>
      AIE.bp_dest<%88, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%59, DMA : 0>
      AIE.bp_dest<%97, DMA : 0>
    }
  }
  %29 = AIE.tile(0, 0)
  %30 = AIE.core(%29) {
    AIE.end
  }
  %31 = AIE.tile(10, 2)
  %32 = AIE.lock(%31, 1)
  %33 = AIE.lock(%31, 0)
  %34 = AIE.buffer(%31) : memref<32x32xf32>
  %35 = AIE.buffer(%31) : memref<32x32xf32>
  %36 = AIE.buffer(%31) : memref<32x32xf32>
  %37 = AIE.buffer(%31) : memref<32x32xf32>
  %38 = AIE.core(%31) {
    AIE.useLock(%42, Acquire, 0)
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%32, Acquire, 1)
    call @extern_kernel(%37, %34, %35, %36) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%32, Release, 0)
    AIE.useLock(%33, Release, 0)
    AIE.useLock(%42, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %39 = AIE.mem(%31) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %40 = AIE.tile(10, 3) {polyaie.leaf}
  %41 = AIE.lock(%40, 3)
  %42 = AIE.lock(%40, 2)
  %43 = AIE.lock(%40, 1)
  %44 = AIE.lock(%40, 0)
  %45 = AIE.buffer(%40) : memref<32x32xf32>
  %46 = AIE.buffer(%40) : memref<32x32xf32>
  %47 = AIE.buffer(%40) : memref<32x32xf32>
  %48 = AIE.core(%40) {
    AIE.useLock(%41, Acquire, 1)
    AIE.useLock(%44, Acquire, 0)
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%43, Acquire, 1)
    call @extern_kernel(%34, %45, %46, %47) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%43, Release, 0)
    AIE.useLock(%42, Release, 0)
    AIE.useLock(%44, Release, 1)
    AIE.useLock(%41, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %49 = AIE.mem(%40) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%43, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%47 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%41, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%46 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%41, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %109 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%44, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%45 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%40, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%14, DMA : 0>
    }
  }
  %50 = AIE.tile(11, 2)
  %51 = AIE.lock(%50, 1)
  %52 = AIE.lock(%50, 0)
  %53 = AIE.buffer(%50) : memref<32x32xf32>
  %54 = AIE.buffer(%50) : memref<32x32xf32>
  %55 = AIE.buffer(%50) : memref<32x32xf32>
  %56 = AIE.buffer(%50) : memref<32x32xf32>
  %57 = AIE.core(%50) {
    AIE.useLock(%51, Acquire, 1)
    AIE.useLock(%52, Acquire, 1)
    AIE.useLock(%63, Acquire, 0)
    call @extern_kernel(%56, %53, %54, %55) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%63, Release, 1)
    AIE.useLock(%52, Release, 0)
    AIE.useLock(%51, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %58 = AIE.mem(%50) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%52, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%51, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%51, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %59 = AIE.tile(11, 3) {polyaie.leaf}
  %60 = AIE.lock(%59, 3)
  %61 = AIE.lock(%59, 2)
  %62 = AIE.lock(%59, 1)
  %63 = AIE.lock(%59, 0)
  %64 = AIE.buffer(%59) : memref<32x32xf32>
  %65 = AIE.buffer(%59) : memref<32x32xf32>
  %66 = AIE.buffer(%59) : memref<32x32xf32>
  %67 = AIE.core(%59) {
    AIE.useLock(%60, Acquire, 1)
    AIE.useLock(%61, Acquire, 1)
    AIE.useLock(%63, Acquire, 1)
    AIE.useLock(%62, Acquire, 0)
    call @extern_kernel(%53, %64, %65, %66) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%62, Release, 1)
    AIE.useLock(%63, Release, 0)
    AIE.useLock(%61, Release, 0)
    AIE.useLock(%60, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %68 = AIE.mem(%59) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%61, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%66 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%61, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%65 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %109 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%62, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%64 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%62, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%59, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%14, DMA : 0>
    }
  }
  %69 = AIE.tile(12, 2)
  %70 = AIE.lock(%69, 1)
  %71 = AIE.lock(%69, 0)
  %72 = AIE.buffer(%69) : memref<32x32xf32>
  %73 = AIE.buffer(%69) : memref<32x32xf32>
  %74 = AIE.buffer(%69) : memref<32x32xf32>
  %75 = AIE.buffer(%69) : memref<32x32xf32>
  %76 = AIE.core(%69) {
    AIE.useLock(%70, Acquire, 1)
    AIE.useLock(%80, Acquire, 0)
    AIE.useLock(%71, Acquire, 1)
    call @extern_kernel(%75, %72, %73, %74) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%71, Release, 0)
    AIE.useLock(%80, Release, 1)
    AIE.useLock(%70, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %77 = AIE.mem(%69) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%71, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%71, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%70, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%73 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%70, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %78 = AIE.tile(12, 3) {polyaie.leaf}
  %79 = AIE.lock(%78, 3)
  %80 = AIE.lock(%78, 2)
  %81 = AIE.lock(%78, 1)
  %82 = AIE.lock(%78, 0)
  %83 = AIE.buffer(%78) : memref<32x32xf32>
  %84 = AIE.buffer(%78) : memref<32x32xf32>
  %85 = AIE.buffer(%78) : memref<32x32xf32>
  %86 = AIE.core(%78) {
    AIE.useLock(%79, Acquire, 1)
    AIE.useLock(%80, Acquire, 1)
    AIE.useLock(%81, Acquire, 0)
    AIE.useLock(%82, Acquire, 1)
    call @extern_kernel(%72, %83, %84, %85) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%82, Release, 0)
    AIE.useLock(%81, Release, 1)
    AIE.useLock(%80, Release, 0)
    AIE.useLock(%79, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %87 = AIE.mem(%78) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%82, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%85 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%82, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%84 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %109 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%81, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%83 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%78, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%14, DMA : 0>
    }
  }
  %88 = AIE.tile(13, 2)
  %89 = AIE.lock(%88, 1)
  %90 = AIE.lock(%88, 0)
  %91 = AIE.buffer(%88) : memref<32x32xf32>
  %92 = AIE.buffer(%88) : memref<32x32xf32>
  %93 = AIE.buffer(%88) : memref<32x32xf32>
  %94 = AIE.buffer(%88) : memref<32x32xf32>
  %95 = AIE.core(%88) {
    AIE.useLock(%90, Acquire, 1)
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%100, Acquire, 0)
    call @extern_kernel(%94, %91, %92, %93) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%100, Release, 1)
    AIE.useLock(%89, Release, 0)
    AIE.useLock(%90, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %96 = AIE.mem(%88) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%89, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%89, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%90, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%90, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %97 = AIE.tile(13, 3) {polyaie.leaf}
  %98 = AIE.lock(%97, 3)
  %99 = AIE.lock(%97, 2)
  %100 = AIE.lock(%97, 1)
  %101 = AIE.lock(%97, 0)
  %102 = AIE.buffer(%97) : memref<32x32xf32>
  %103 = AIE.buffer(%97) : memref<32x32xf32>
  %104 = AIE.buffer(%97) : memref<32x32xf32>
  %105 = AIE.core(%97) {
    AIE.useLock(%98, Acquire, 1)
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%100, Acquire, 1)
    AIE.useLock(%101, Acquire, 0)
    call @extern_kernel(%91, %102, %103, %104) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%101, Release, 1)
    AIE.useLock(%100, Release, 0)
    AIE.useLock(%99, Release, 0)
    AIE.useLock(%98, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %106 = AIE.mem(%97) {
    %107 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%104 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %108 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%98, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%103 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%98, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %109 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%101, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%101, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%97, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%14, DMA : 0>
    }
  }
}


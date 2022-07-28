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
  %4 = AIE.shimmux(%3) {
    AIE.connect<DMA : 0, North : 3>
  }
  %5 = AIE.switchbox(%3) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.masterset(North : 0, %76)
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %76)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %76)
    }
  }
  %6 = AIE.lock(%3, 1)
  %7 = AIE.lock(%3, 0)
  %8 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %9 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %10 = AIE.core(%3) {
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.end
  }
  %11 = AIE.shimDMA(%3) {
    %76 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    cf.br ^bb1
  ^bb3:  // pred: ^bb0
    AIE.end
  }
  %12 = AIE.tile(26, 0)
  %13 = AIE.shimmux(%12) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %14 = AIE.switchbox(%12) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.amsel<0> (1)
    %78 = AIE.amsel<0> (2)
    %79 = AIE.masterset(South : 2, %78)
    %80 = AIE.masterset(North : 0, %77, %76)
    %81 = AIE.masterset(East : 0, %77)
    AIE.packetrules(North : 0) {
      AIE.rule(30, 0, %78)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %77)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %76)
    }
  }
  %15 = AIE.lock(%12, 3)
  %16 = AIE.lock(%12, 2)
  %17 = AIE.lock(%12, 1)
  %18 = AIE.lock(%12, 0)
  %19 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %20 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %21 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x64xf32>) -> ()
  %22 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %23 = AIE.external_buffer 40960 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %23) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %24 = AIE.external_buffer 45060 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %24) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x64xf32>, memref<1025xf32>) -> ()
  %25 = AIE.core(%12) {
    AIE.useLock(%17, Acquire, 0)
    AIE.useLock(%15, Acquire, 0)
    AIE.useLock(%18, Acquire, 0)
    AIE.useLock(%16, Acquire, 0)
    AIE.useLock(%16, Release, 1)
    AIE.useLock(%18, Release, 1)
    AIE.useLock(%15, Release, 1)
    AIE.useLock(%17, Release, 1)
    AIE.end
  }
  %26 = AIE.shimDMA(%12) {
    %76 = AIE.dmaStart(S2MM0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%23 : memref<1025xf32>, 0, 1025>, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%24 : memref<1025xf32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb3:  // pred: ^bb0
    %77 = AIE.dmaStart(MM2S0, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%17, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%17, Release, 0)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%16, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%19 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%16, Release, 0)
    cf.br ^bb4
  ^bb6:  // pred: ^bb3
    %78 = AIE.dmaStart(MM2S1, ^bb7, ^bb9)
  ^bb7:  // 2 preds: ^bb6, ^bb8
    AIE.useLock(%15, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%15, Release, 0)
    cf.br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%18, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%20 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%18, Release, 0)
    cf.br ^bb7
  ^bb9:  // pred: ^bb6
    AIE.end
  }
  %27 = AIE.tile(0, 0)
  %28 = AIE.switchbox(%27) {
  }
  %29 = AIE.core(%27) {
    AIE.end
  }
  %30 = AIE.tile(26, 2)
  %31 = AIE.switchbox(%30) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.amsel<0> (1)
    %78 = AIE.amsel<0> (2)
    %79 = AIE.amsel<0> (3)
    %80 = AIE.masterset(DMA : 0, %79)
    %81 = AIE.masterset(DMA : 1, %77)
    %82 = AIE.masterset(South : 0, %78)
    %83 = AIE.masterset(North : 0, %76)
    AIE.packetrules(North : 0) {
      AIE.rule(30, 0, %78)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %77)
      AIE.rule(27, 1, %76)
      AIE.rule(31, 4, %79)
    }
  }
  %32 = AIE.lock(%30, 1)
  %33 = AIE.lock(%30, 0)
  %34 = AIE.buffer(%30) : memref<32x32xf32>
  %35 = AIE.buffer(%30) : memref<32x32xf32>
  %36 = AIE.buffer(%30) : memref<32x32xf32>
  %37 = AIE.buffer(%30) : memref<32x32xf32>
  %38 = AIE.core(%30) {
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%32, Acquire, 1)
    AIE.useLock(%45, Acquire, 0)
    call @extern_kernel(%37, %34, %35, %36) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%45, Release, 1)
    AIE.useLock(%32, Release, 0)
    AIE.useLock(%33, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %39 = AIE.mem(%30) {
    %76 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %77 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %40 = AIE.tile(26, 3) {polyaie.leaf}
  %41 = AIE.switchbox(%40) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.amsel<0> (1)
    %78 = AIE.amsel<0> (2)
    %79 = AIE.masterset(DMA : 0, %77)
    %80 = AIE.masterset(DMA : 1, %76)
    %81 = AIE.masterset(South : 0, %78)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %78)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %78)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %77)
      AIE.rule(31, 5, %76)
    }
  }
  %42 = AIE.lock(%40, 3)
  %43 = AIE.lock(%40, 2)
  %44 = AIE.lock(%40, 1)
  %45 = AIE.lock(%40, 0)
  %46 = AIE.buffer(%40) : memref<32x32xf32>
  %47 = AIE.buffer(%40) : memref<32x32xf32>
  %48 = AIE.buffer(%40) : memref<32x32xf32>
  %49 = AIE.core(%40) {
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%44, Acquire, 1)
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%43, Acquire, 0)
    call @extern_kernel(%34, %46, %47, %48) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%43, Release, 1)
    AIE.useLock(%42, Release, 0)
    AIE.useLock(%44, Release, 0)
    AIE.useLock(%45, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %50 = AIE.mem(%40) {
    %76 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%42, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%47 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%42, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %77 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%44, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %78 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%43, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%46 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %51 = AIE.tile(27, 2)
  %52 = AIE.switchbox(%51) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.amsel<0> (1)
    %78 = AIE.amsel<0> (2)
    %79 = AIE.masterset(DMA : 0, %78)
    %80 = AIE.masterset(DMA : 1, %77)
    %81 = AIE.masterset(North : 0, %76)
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %77)
      AIE.rule(27, 1, %76)
      AIE.rule(31, 4, %78)
    }
  }
  %53 = AIE.lock(%51, 1)
  %54 = AIE.lock(%51, 0)
  %55 = AIE.buffer(%51) : memref<32x32xf32>
  %56 = AIE.buffer(%51) : memref<32x32xf32>
  %57 = AIE.buffer(%51) : memref<32x32xf32>
  %58 = AIE.buffer(%51) : memref<32x32xf32>
  %59 = AIE.core(%51) {
    AIE.useLock(%64, Acquire, 0)
    AIE.useLock(%54, Acquire, 1)
    AIE.useLock(%53, Acquire, 1)
    call @extern_kernel(%58, %55, %56, %57) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%53, Release, 0)
    AIE.useLock(%54, Release, 0)
    AIE.useLock(%64, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %60 = AIE.mem(%51) {
    %76 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%53, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %77 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%54, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%54, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %61 = AIE.tile(27, 3) {polyaie.leaf}
  %62 = AIE.switchbox(%61) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.amsel<0> (1)
    %78 = AIE.amsel<0> (2)
    %79 = AIE.masterset(DMA : 0, %78)
    %80 = AIE.masterset(DMA : 1, %76)
    %81 = AIE.masterset(West : 0, %77)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %77)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %76)
      AIE.rule(31, 5, %78)
    }
  }
  %63 = AIE.lock(%61, 3)
  %64 = AIE.lock(%61, 2)
  %65 = AIE.lock(%61, 1)
  %66 = AIE.lock(%61, 0)
  %67 = AIE.buffer(%61) : memref<32x32xf32>
  %68 = AIE.buffer(%61) : memref<32x32xf32>
  %69 = AIE.buffer(%61) : memref<32x32xf32>
  %70 = AIE.core(%61) {
    AIE.useLock(%64, Acquire, 1)
    AIE.useLock(%63, Acquire, 1)
    AIE.useLock(%65, Acquire, 0)
    AIE.useLock(%66, Acquire, 1)
    call @extern_kernel(%55, %67, %68, %69) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%66, Release, 0)
    AIE.useLock(%65, Release, 1)
    AIE.useLock(%63, Release, 0)
    AIE.useLock(%64, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %71 = AIE.mem(%61) {
    %76 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%66, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%69 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%66, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %77 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%63, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%68 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%63, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %78 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%65, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%67 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%65, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %72 = AIE.tile(27, 1)
  %73 = AIE.switchbox(%72) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.masterset(North : 0, %76)
    AIE.packetrules(South : 0) {
      AIE.rule(26, 0, %76)
    }
  }
  %74 = AIE.tile(26, 1)
  %75 = AIE.switchbox(%74) {
    %76 = AIE.amsel<0> (0)
    %77 = AIE.amsel<0> (1)
    %78 = AIE.masterset(South : 0, %76)
    %79 = AIE.masterset(North : 0, %77)
    AIE.packetrules(North : 0) {
      AIE.rule(30, 0, %76)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(26, 0, %77)
    }
  }
}


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
  %4 = AIE.shimmux(%3) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %5 = AIE.switchbox(%3) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.masterset(North : 0, %133)
    %135 = AIE.masterset(North : 1, %132)
    %136 = AIE.masterset(East : 0, %133)
    %137 = AIE.masterset(East : 1, %132)
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %132)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %133)
    }
  }
  %6 = AIE.lock(%3, 3)
  %7 = AIE.lock(%3, 2)
  %8 = AIE.lock(%3, 1)
  %9 = AIE.lock(%3, 0)
  %10 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %11 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %12 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %13 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %14 = AIE.core(%3) {
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.end
  }
  %15 = AIE.shimDMA(%3) {
    %132 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb1
  ^bb3:  // pred: ^bb0
    %133 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb4
  ^bb6:  // pred: ^bb3
    AIE.end
  }
  %16 = AIE.tile(11, 0)
  %17 = AIE.shimmux(%16) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %18 = AIE.switchbox(%16) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<1> (0)
    %134 = AIE.amsel<0> (1)
    %135 = AIE.amsel<0> (2)
    %136 = AIE.amsel<0> (3)
    %137 = AIE.masterset(South : 2, %134)
    %138 = AIE.masterset(North : 0, %132)
    %139 = AIE.masterset(North : 1, %136)
    %140 = AIE.masterset(East : 0, %135)
    %141 = AIE.masterset(East : 1, %133)
    %142 = AIE.masterset(East : 2, %136)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %134)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %134)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %134)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %134)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %136)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 0, %133)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %135)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %132)
    }
  }
  %19 = AIE.lock(%16, 3)
  %20 = AIE.lock(%16, 2)
  %21 = AIE.lock(%16, 1)
  %22 = AIE.lock(%16, 0)
  %23 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %24 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %25 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %26 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %27 = AIE.external_buffer 49152 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %27) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %28 = AIE.external_buffer 57344 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %28) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %29 = AIE.external_buffer 65536 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %29) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %30 = AIE.external_buffer 73728 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %30) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %31 = AIE.core(%16) {
    AIE.useLock(%20, Acquire, 0)
    AIE.useLock(%22, Acquire, 0)
    AIE.useLock(%19, Acquire, 0)
    AIE.useLock(%21, Acquire, 0)
    AIE.useLock(%21, Release, 1)
    AIE.useLock(%19, Release, 1)
    AIE.useLock(%22, Release, 1)
    AIE.useLock(%20, Release, 1)
    AIE.end
  }
  %32 = AIE.shimDMA(%16) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%27 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%28 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%29 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%30 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %133 = AIE.dmaStart(MM2S0, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%19, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%21, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%25 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 0)
    br ^bb6
  ^bb8:  // pred: ^bb5
    %134 = AIE.dmaStart(MM2S1, ^bb9, ^bb11)
  ^bb9:  // 2 preds: ^bb8, ^bb10
    AIE.useLock(%22, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%24 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 0)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%20, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%23 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 0)
    br ^bb9
  ^bb11:  // pred: ^bb8
    AIE.end
  }
  %33 = AIE.tile(0, 0)
  %34 = AIE.switchbox(%33) {
  }
  %35 = AIE.core(%33) {
    AIE.end
  }
  %36 = AIE.tile(10, 2)
  %37 = AIE.switchbox(%36) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.amsel<0> (2)
    %135 = AIE.amsel<0> (3)
    %136 = AIE.masterset(DMA : 0, %133)
    %137 = AIE.masterset(DMA : 1, %132)
    %138 = AIE.masterset(North : 0, %135)
    %139 = AIE.masterset(North : 1, %134)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %133)
      AIE.rule(31, 5, %134)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %132)
      AIE.rule(31, 1, %135)
    }
  }
  %38 = AIE.lock(%36, 1)
  %39 = AIE.lock(%36, 0)
  %40 = AIE.buffer(%36) : memref<32x32xf32>
  %41 = AIE.buffer(%36) : memref<32x32xf32>
  %42 = AIE.buffer(%36) : memref<32x32xf32>
  %43 = AIE.buffer(%36) : memref<32x32xf32>
  %44 = AIE.core(%36) {
    AIE.useLock(%49, Acquire, 0)
    AIE.useLock(%39, Acquire, 1)
    AIE.useLock(%38, Acquire, 1)
    call @extern_kernel(%43, %40, %41, %42) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%38, Release, 0)
    AIE.useLock(%39, Release, 0)
    AIE.useLock(%49, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %45 = AIE.mem(%36) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%38, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%38, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%39, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%39, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %46 = AIE.tile(10, 3) {polyaie.leaf}
  %47 = AIE.switchbox(%46) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.amsel<0> (2)
    %135 = AIE.masterset(DMA : 0, %134)
    %136 = AIE.masterset(DMA : 1, %132)
    %137 = AIE.masterset(East : 0, %133)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %133)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %134)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %132)
    }
  }
  %48 = AIE.lock(%46, 3)
  %49 = AIE.lock(%46, 2)
  %50 = AIE.lock(%46, 1)
  %51 = AIE.lock(%46, 0)
  %52 = AIE.buffer(%46) : memref<32x32xf32>
  %53 = AIE.buffer(%46) : memref<32x32xf32>
  %54 = AIE.buffer(%46) : memref<32x32xf32>
  %55 = AIE.core(%46) {
    AIE.useLock(%48, Acquire, 1)
    AIE.useLock(%51, Acquire, 0)
    AIE.useLock(%49, Acquire, 1)
    AIE.useLock(%50, Acquire, 1)
    call @extern_kernel(%40, %52, %53, %54) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%50, Release, 0)
    AIE.useLock(%49, Release, 0)
    AIE.useLock(%51, Release, 1)
    AIE.useLock(%48, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %56 = AIE.mem(%46) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%50, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%48, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%51, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%52 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%51, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %57 = AIE.tile(11, 2)
  %58 = AIE.switchbox(%57) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<1> (0)
    %134 = AIE.amsel<0> (1)
    %135 = AIE.amsel<1> (1)
    %136 = AIE.amsel<0> (2)
    %137 = AIE.amsel<1> (2)
    %138 = AIE.amsel<0> (3)
    %139 = AIE.amsel<1> (3)
    %140 = AIE.masterset(DMA : 0, %138)
    %141 = AIE.masterset(DMA : 1, %134)
    %142 = AIE.masterset(South : 0, %136)
    %143 = AIE.masterset(South : 1, %132)
    %144 = AIE.masterset(South : 2, %139)
    %145 = AIE.masterset(South : 3, %135)
    %146 = AIE.masterset(North : 0, %137)
    %147 = AIE.masterset(North : 1, %133)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %135)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %139)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %132)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %136)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %134)
      AIE.rule(31, 5, %133)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %138)
      AIE.rule(31, 1, %137)
    }
  }
  %59 = AIE.lock(%57, 1)
  %60 = AIE.lock(%57, 0)
  %61 = AIE.buffer(%57) : memref<32x32xf32>
  %62 = AIE.buffer(%57) : memref<32x32xf32>
  %63 = AIE.buffer(%57) : memref<32x32xf32>
  %64 = AIE.buffer(%57) : memref<32x32xf32>
  %65 = AIE.core(%57) {
    AIE.useLock(%59, Acquire, 1)
    AIE.useLock(%60, Acquire, 1)
    AIE.useLock(%72, Acquire, 0)
    call @extern_kernel(%64, %61, %62, %63) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%72, Release, 1)
    AIE.useLock(%60, Release, 0)
    AIE.useLock(%59, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %66 = AIE.mem(%57) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%59, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%59, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %67 = AIE.tile(11, 3) {polyaie.leaf}
  %68 = AIE.switchbox(%67) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<1> (0)
    %134 = AIE.amsel<0> (1)
    %135 = AIE.amsel<1> (1)
    %136 = AIE.amsel<0> (2)
    %137 = AIE.amsel<0> (3)
    %138 = AIE.masterset(DMA : 0, %137)
    %139 = AIE.masterset(DMA : 1, %134)
    %140 = AIE.masterset(South : 0, %132)
    %141 = AIE.masterset(South : 1, %136)
    %142 = AIE.masterset(South : 2, %133)
    %143 = AIE.masterset(South : 3, %135)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %135)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %133)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %136)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %132)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %137)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %134)
    }
  }
  %69 = AIE.lock(%67, 3)
  %70 = AIE.lock(%67, 2)
  %71 = AIE.lock(%67, 1)
  %72 = AIE.lock(%67, 0)
  %73 = AIE.buffer(%67) : memref<32x32xf32>
  %74 = AIE.buffer(%67) : memref<32x32xf32>
  %75 = AIE.buffer(%67) : memref<32x32xf32>
  %76 = AIE.core(%67) {
    AIE.useLock(%69, Acquire, 1)
    AIE.useLock(%70, Acquire, 1)
    AIE.useLock(%72, Acquire, 1)
    AIE.useLock(%71, Acquire, 0)
    call @extern_kernel(%61, %73, %74, %75) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%71, Release, 1)
    AIE.useLock(%72, Release, 0)
    AIE.useLock(%70, Release, 0)
    AIE.useLock(%69, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %77 = AIE.mem(%67) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%70, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%75 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%70, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%69, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%69, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%71, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%73 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%71, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %78 = AIE.tile(12, 2)
  %79 = AIE.switchbox(%78) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.amsel<0> (2)
    %135 = AIE.amsel<0> (3)
    %136 = AIE.masterset(DMA : 0, %133)
    %137 = AIE.masterset(DMA : 1, %135)
    %138 = AIE.masterset(North : 0, %134)
    %139 = AIE.masterset(North : 1, %132)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %135)
      AIE.rule(31, 1, %132)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %133)
      AIE.rule(31, 5, %134)
    }
  }
  %80 = AIE.lock(%78, 1)
  %81 = AIE.lock(%78, 0)
  %82 = AIE.buffer(%78) : memref<32x32xf32>
  %83 = AIE.buffer(%78) : memref<32x32xf32>
  %84 = AIE.buffer(%78) : memref<32x32xf32>
  %85 = AIE.buffer(%78) : memref<32x32xf32>
  %86 = AIE.core(%78) {
    AIE.useLock(%80, Acquire, 1)
    AIE.useLock(%91, Acquire, 0)
    AIE.useLock(%81, Acquire, 1)
    call @extern_kernel(%85, %82, %83, %84) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%81, Release, 0)
    AIE.useLock(%91, Release, 1)
    AIE.useLock(%80, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %87 = AIE.mem(%78) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%84 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%80, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%83 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%80, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %88 = AIE.tile(12, 3) {polyaie.leaf}
  %89 = AIE.switchbox(%88) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.amsel<0> (2)
    %135 = AIE.amsel<0> (3)
    %136 = AIE.masterset(DMA : 0, %132)
    %137 = AIE.masterset(DMA : 1, %135)
    %138 = AIE.masterset(West : 0, %133)
    %139 = AIE.masterset(West : 1, %134)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %134)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %133)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %135)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %132)
    }
  }
  %90 = AIE.lock(%88, 3)
  %91 = AIE.lock(%88, 2)
  %92 = AIE.lock(%88, 1)
  %93 = AIE.lock(%88, 0)
  %94 = AIE.buffer(%88) : memref<32x32xf32>
  %95 = AIE.buffer(%88) : memref<32x32xf32>
  %96 = AIE.buffer(%88) : memref<32x32xf32>
  %97 = AIE.core(%88) {
    AIE.useLock(%90, Acquire, 1)
    AIE.useLock(%91, Acquire, 1)
    AIE.useLock(%92, Acquire, 0)
    AIE.useLock(%93, Acquire, 1)
    call @extern_kernel(%82, %94, %95, %96) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%93, Release, 0)
    AIE.useLock(%92, Release, 1)
    AIE.useLock(%91, Release, 0)
    AIE.useLock(%90, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %98 = AIE.mem(%88) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%93, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%96 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%93, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%90, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%95 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%90, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%92, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%94 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%92, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %99 = AIE.tile(13, 2)
  %100 = AIE.switchbox(%99) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.amsel<0> (2)
    %135 = AIE.amsel<0> (3)
    %136 = AIE.masterset(DMA : 0, %133)
    %137 = AIE.masterset(DMA : 1, %135)
    %138 = AIE.masterset(North : 0, %134)
    %139 = AIE.masterset(North : 1, %132)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %133)
      AIE.rule(31, 5, %132)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %135)
      AIE.rule(31, 1, %134)
    }
  }
  %101 = AIE.lock(%99, 1)
  %102 = AIE.lock(%99, 0)
  %103 = AIE.buffer(%99) : memref<32x32xf32>
  %104 = AIE.buffer(%99) : memref<32x32xf32>
  %105 = AIE.buffer(%99) : memref<32x32xf32>
  %106 = AIE.buffer(%99) : memref<32x32xf32>
  %107 = AIE.core(%99) {
    AIE.useLock(%102, Acquire, 1)
    AIE.useLock(%101, Acquire, 1)
    AIE.useLock(%113, Acquire, 0)
    call @extern_kernel(%106, %103, %104, %105) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%113, Release, 1)
    AIE.useLock(%101, Release, 0)
    AIE.useLock(%102, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %108 = AIE.mem(%99) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%101, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%105 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%101, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%102, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%104 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%102, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %109 = AIE.tile(13, 3) {polyaie.leaf}
  %110 = AIE.switchbox(%109) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.amsel<0> (2)
    %135 = AIE.masterset(DMA : 0, %133)
    %136 = AIE.masterset(DMA : 1, %134)
    %137 = AIE.masterset(West : 0, %132)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %132)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %133)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %134)
    }
  }
  %111 = AIE.lock(%109, 3)
  %112 = AIE.lock(%109, 2)
  %113 = AIE.lock(%109, 1)
  %114 = AIE.lock(%109, 0)
  %115 = AIE.buffer(%109) : memref<32x32xf32>
  %116 = AIE.buffer(%109) : memref<32x32xf32>
  %117 = AIE.buffer(%109) : memref<32x32xf32>
  %118 = AIE.core(%109) {
    AIE.useLock(%111, Acquire, 1)
    AIE.useLock(%112, Acquire, 1)
    AIE.useLock(%113, Acquire, 1)
    AIE.useLock(%114, Acquire, 0)
    call @extern_kernel(%103, %115, %116, %117) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%114, Release, 1)
    AIE.useLock(%113, Release, 0)
    AIE.useLock(%112, Release, 0)
    AIE.useLock(%111, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %119 = AIE.mem(%109) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%112, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%117 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%112, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%111, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%116 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%111, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%114, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%115 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%114, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %120 = AIE.tile(12, 0)
  %121 = AIE.switchbox(%120) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.amsel<0> (2)
    %135 = AIE.masterset(North : 0, %133)
    %136 = AIE.masterset(North : 1, %132)
    %137 = AIE.masterset(East : 0, %132)
    %138 = AIE.masterset(East : 1, %134)
    AIE.packetrules(West : 2) {
      AIE.rule(30, 4, %134)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 0, %132)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 4, %133)
    }
  }
  %122 = AIE.tile(13, 0)
  %123 = AIE.switchbox(%122) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.masterset(North : 0, %133)
    %135 = AIE.masterset(North : 1, %132)
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %132)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %133)
    }
  }
  %124 = AIE.tile(12, 1)
  %125 = AIE.switchbox(%124) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.masterset(North : 0, %132)
    %135 = AIE.masterset(North : 1, %133)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %133)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %132)
    }
  }
  %126 = AIE.tile(11, 1)
  %127 = AIE.switchbox(%126) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<1> (0)
    %134 = AIE.amsel<0> (1)
    %135 = AIE.amsel<1> (1)
    %136 = AIE.amsel<0> (2)
    %137 = AIE.amsel<0> (3)
    %138 = AIE.masterset(South : 0, %137)
    %139 = AIE.masterset(South : 1, %135)
    %140 = AIE.masterset(South : 2, %136)
    %141 = AIE.masterset(South : 3, %133)
    %142 = AIE.masterset(North : 0, %132)
    %143 = AIE.masterset(North : 1, %134)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %133)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %136)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %135)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %137)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %134)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %132)
    }
  }
  %128 = AIE.tile(13, 1)
  %129 = AIE.switchbox(%128) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.masterset(North : 0, %133)
    %135 = AIE.masterset(North : 1, %132)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %132)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %133)
    }
  }
  %130 = AIE.tile(10, 1)
  %131 = AIE.switchbox(%130) {
    %132 = AIE.amsel<0> (0)
    %133 = AIE.amsel<0> (1)
    %134 = AIE.masterset(North : 0, %133)
    %135 = AIE.masterset(North : 1, %132)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %132)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %133)
    }
  }
}


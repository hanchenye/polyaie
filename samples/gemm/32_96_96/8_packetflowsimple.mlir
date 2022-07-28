module @gemm {
  AIE.token(0) {sym_name = "token20"}
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
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<32x96xf32>
  %1 = memref.alloc() : memref<32x96xf32>
  %2 = memref.alloc() : memref<96x96xf32>
  %3 = AIE.tile(10, 0)
  %4 = AIE.shimmux(%3) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %5 = AIE.switchbox(%3) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.masterset(North : 0, %145)
    %147 = AIE.masterset(North : 1, %144)
    %148 = AIE.masterset(East : 0, %144)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %144)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %145)
    }
  }
  %6 = AIE.lock(%3, 5)
  %7 = AIE.lock(%3, 4)
  %8 = AIE.lock(%3, 3)
  %9 = AIE.lock(%3, 2)
  %10 = AIE.lock(%3, 1)
  %11 = AIE.lock(%3, 0)
  %12 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %13 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %14 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %15 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %16 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %17 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %18 = AIE.core(%3) {
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%11, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%10, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%10, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%11, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.end
  }
  %19 = AIE.shimDMA(%3) {
    %144 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %145 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%10, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  %20 = AIE.tile(11, 0)
  %21 = AIE.shimmux(%20) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %22 = AIE.switchbox(%20) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.amsel<0> (3)
    %148 = AIE.masterset(South : 2, %144)
    %149 = AIE.masterset(North : 0, %145)
    %150 = AIE.masterset(North : 1, %147)
    %151 = AIE.masterset(East : 0, %145)
    %152 = AIE.masterset(East : 1, %146)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %144)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %144)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %144)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %147)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %146)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %145)
    }
  }
  %23 = AIE.lock(%20, 5)
  %24 = AIE.lock(%20, 4)
  %25 = AIE.lock(%20, 3)
  %26 = AIE.lock(%20, 2)
  %27 = AIE.lock(%20, 1)
  %28 = AIE.lock(%20, 0)
  %29 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %30 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %31 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %32 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%32, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %33 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %34 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %35 = AIE.external_buffer 65536 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %35) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %36 = AIE.external_buffer 73728 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %36) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %37 = AIE.external_buffer 81920 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %37) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %38 = AIE.core(%20) {
    AIE.useLock(%24, Acquire, 0)
    AIE.useLock(%27, Acquire, 0)
    AIE.useLock(%25, Acquire, 0)
    AIE.useLock(%23, Acquire, 0)
    AIE.useLock(%28, Acquire, 0)
    AIE.useLock(%26, Acquire, 0)
    AIE.useLock(%26, Release, 1)
    AIE.useLock(%28, Release, 1)
    AIE.useLock(%23, Release, 1)
    AIE.useLock(%25, Release, 1)
    AIE.useLock(%27, Release, 1)
    AIE.useLock(%24, Release, 1)
    AIE.end
  }
  %39 = AIE.shimDMA(%20) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%35 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%36 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%37 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %145 = AIE.dmaStart(MM2S0, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%26, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%26, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%24, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%27, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%32 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    %146 = AIE.dmaStart(MM2S1, ^bb9, ^bb12)
  ^bb9:  // 2 preds: ^bb8, ^bb11
    AIE.useLock(%25, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%31 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%25, Release, 0)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%23, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%30 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 0)
    br ^bb11
  ^bb11:  // pred: ^bb10
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%29 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 0)
    br ^bb9
  ^bb12:  // pred: ^bb8
    AIE.end
  }
  %40 = AIE.tile(0, 0)
  %41 = AIE.switchbox(%40) {
  }
  %42 = AIE.core(%40) {
    AIE.end
  }
  %43 = AIE.tile(10, 2)
  %44 = AIE.switchbox(%43) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.amsel<0> (3)
    %148 = AIE.masterset(DMA : 0, %146)
    %149 = AIE.masterset(DMA : 1, %144)
    %150 = AIE.masterset(North : 0, %147)
    %151 = AIE.masterset(North : 1, %145)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %144)
      AIE.rule(28, 0, %145)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %146)
      AIE.rule(28, 4, %147)
    }
  }
  %45 = AIE.lock(%43, 1)
  %46 = AIE.lock(%43, 0)
  %47 = AIE.buffer(%43) : memref<32x32xf32>
  %48 = AIE.buffer(%43) : memref<32x32xf32>
  %49 = AIE.buffer(%43) : memref<32x32xf32>
  %50 = AIE.buffer(%43) : memref<32x32xf32>
  %51 = AIE.core(%43) {
    AIE.useLock(%46, Acquire, 1)
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%55, Acquire, 0)
    call @extern_kernel(%50, %47, %48, %49) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%55, Release, 1)
    AIE.useLock(%45, Release, 0)
    AIE.useLock(%46, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %52 = AIE.mem(%43) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%49 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %53 = AIE.tile(10, 3)
  %54 = AIE.switchbox(%53) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.amsel<0> (3)
    %148 = AIE.masterset(DMA : 0, %144)
    %149 = AIE.masterset(DMA : 1, %146)
    %150 = AIE.masterset(North : 0, %147)
    %151 = AIE.masterset(North : 1, %145)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %144)
      AIE.rule(31, 2, %145)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %146)
      AIE.rule(31, 6, %147)
    }
  }
  %55 = AIE.lock(%53, 2)
  %56 = AIE.lock(%53, 1)
  %57 = AIE.lock(%53, 0)
  %58 = AIE.buffer(%53) : memref<32x32xf32>
  %59 = AIE.buffer(%53) : memref<32x32xf32>
  %60 = AIE.buffer(%53) : memref<32x32xf32>
  %61 = AIE.core(%53) {
    AIE.useLock(%57, Acquire, 1)
    AIE.useLock(%65, Acquire, 0)
    AIE.useLock(%55, Acquire, 1)
    AIE.useLock(%56, Acquire, 1)
    call @extern_kernel(%47, %58, %59, %60) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%56, Release, 0)
    AIE.useLock(%55, Release, 0)
    AIE.useLock(%65, Release, 1)
    AIE.useLock(%57, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %62 = AIE.mem(%53) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%56, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%56, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%57, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%60 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %63 = AIE.tile(10, 4) {polyaie.leaf}
  %64 = AIE.switchbox(%63) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.masterset(DMA : 0, %146)
    %148 = AIE.masterset(DMA : 1, %144)
    %149 = AIE.masterset(East : 0, %145)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %145)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %144)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %146)
    }
  }
  %65 = AIE.lock(%63, 3)
  %66 = AIE.lock(%63, 2)
  %67 = AIE.lock(%63, 1)
  %68 = AIE.lock(%63, 0)
  %69 = AIE.buffer(%63) : memref<32x32xf32>
  %70 = AIE.buffer(%63) : memref<32x32xf32>
  %71 = AIE.buffer(%63) : memref<32x32xf32>
  %72 = AIE.core(%63) {
    AIE.useLock(%65, Acquire, 1)
    AIE.useLock(%66, Acquire, 1)
    AIE.useLock(%67, Acquire, 1)
    AIE.useLock(%68, Acquire, 0)
    call @extern_kernel(%58, %69, %70, %71) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%68, Release, 1)
    AIE.useLock(%67, Release, 0)
    AIE.useLock(%66, Release, 0)
    AIE.useLock(%65, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %73 = AIE.mem(%63) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%67, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%71 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%67, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%66, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%70 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%66, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %146 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%68, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%69 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%68, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %74 = AIE.tile(11, 2)
  %75 = AIE.switchbox(%74) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<1> (0)
    %146 = AIE.amsel<0> (1)
    %147 = AIE.amsel<1> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.amsel<1> (2)
    %150 = AIE.amsel<0> (3)
    %151 = AIE.masterset(DMA : 0, %146)
    %152 = AIE.masterset(DMA : 1, %148)
    %153 = AIE.masterset(South : 0, %149)
    %154 = AIE.masterset(South : 1, %145)
    %155 = AIE.masterset(South : 2, %147)
    %156 = AIE.masterset(North : 0, %144)
    %157 = AIE.masterset(North : 1, %150)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %147)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %145)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %149)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %146)
      AIE.rule(28, 4, %150)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %148)
      AIE.rule(28, 0, %144)
    }
  }
  %76 = AIE.lock(%74, 1)
  %77 = AIE.lock(%74, 0)
  %78 = AIE.buffer(%74) : memref<32x32xf32>
  %79 = AIE.buffer(%74) : memref<32x32xf32>
  %80 = AIE.buffer(%74) : memref<32x32xf32>
  %81 = AIE.buffer(%74) : memref<32x32xf32>
  %82 = AIE.core(%74) {
    AIE.useLock(%76, Acquire, 1)
    AIE.useLock(%87, Acquire, 0)
    AIE.useLock(%77, Acquire, 1)
    call @extern_kernel(%81, %78, %79, %80) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%77, Release, 0)
    AIE.useLock(%87, Release, 1)
    AIE.useLock(%76, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %83 = AIE.mem(%74) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%77, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%80 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%77, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%76, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%79 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%76, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %84 = AIE.tile(11, 3)
  %85 = AIE.switchbox(%84) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<1> (0)
    %146 = AIE.amsel<0> (1)
    %147 = AIE.amsel<1> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.amsel<1> (2)
    %150 = AIE.amsel<0> (3)
    %151 = AIE.masterset(DMA : 0, %147)
    %152 = AIE.masterset(DMA : 1, %149)
    %153 = AIE.masterset(South : 0, %145)
    %154 = AIE.masterset(South : 1, %146)
    %155 = AIE.masterset(South : 2, %144)
    %156 = AIE.masterset(North : 0, %150)
    %157 = AIE.masterset(North : 1, %148)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %144)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %146)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %145)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %149)
      AIE.rule(31, 6, %148)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %147)
      AIE.rule(31, 2, %150)
    }
  }
  %86 = AIE.lock(%84, 2)
  %87 = AIE.lock(%84, 1)
  %88 = AIE.lock(%84, 0)
  %89 = AIE.buffer(%84) : memref<32x32xf32>
  %90 = AIE.buffer(%84) : memref<32x32xf32>
  %91 = AIE.buffer(%84) : memref<32x32xf32>
  %92 = AIE.core(%84) {
    AIE.useLock(%87, Acquire, 1)
    AIE.useLock(%86, Acquire, 1)
    AIE.useLock(%96, Acquire, 0)
    AIE.useLock(%88, Acquire, 1)
    call @extern_kernel(%78, %89, %90, %91) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%88, Release, 0)
    AIE.useLock(%96, Release, 1)
    AIE.useLock(%86, Release, 0)
    AIE.useLock(%87, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %93 = AIE.mem(%84) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%88, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%90 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%86, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%91 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%86, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %94 = AIE.tile(11, 4) {polyaie.leaf}
  %95 = AIE.switchbox(%94) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<1> (0)
    %146 = AIE.amsel<0> (1)
    %147 = AIE.amsel<0> (2)
    %148 = AIE.amsel<0> (3)
    %149 = AIE.masterset(DMA : 0, %144)
    %150 = AIE.masterset(DMA : 1, %147)
    %151 = AIE.masterset(South : 0, %145)
    %152 = AIE.masterset(South : 1, %148)
    %153 = AIE.masterset(South : 2, %146)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %146)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %148)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %145)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %144)
    }
  }
  %96 = AIE.lock(%94, 3)
  %97 = AIE.lock(%94, 2)
  %98 = AIE.lock(%94, 1)
  %99 = AIE.lock(%94, 0)
  %100 = AIE.buffer(%94) : memref<32x32xf32>
  %101 = AIE.buffer(%94) : memref<32x32xf32>
  %102 = AIE.buffer(%94) : memref<32x32xf32>
  %103 = AIE.core(%94) {
    AIE.useLock(%98, Acquire, 1)
    AIE.useLock(%96, Acquire, 1)
    AIE.useLock(%97, Acquire, 1)
    AIE.useLock(%99, Acquire, 0)
    call @extern_kernel(%89, %100, %101, %102) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%99, Release, 1)
    AIE.useLock(%97, Release, 0)
    AIE.useLock(%96, Release, 0)
    AIE.useLock(%98, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %104 = AIE.mem(%94) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%97, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%101 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%97, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%98, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%98, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %146 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%99, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%100 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %105 = AIE.tile(12, 2)
  %106 = AIE.switchbox(%105) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.amsel<0> (3)
    %148 = AIE.masterset(DMA : 0, %146)
    %149 = AIE.masterset(DMA : 1, %145)
    %150 = AIE.masterset(North : 0, %144)
    %151 = AIE.masterset(North : 1, %147)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %146)
      AIE.rule(28, 4, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %145)
      AIE.rule(28, 0, %144)
    }
  }
  %107 = AIE.lock(%105, 1)
  %108 = AIE.lock(%105, 0)
  %109 = AIE.buffer(%105) : memref<32x32xf32>
  %110 = AIE.buffer(%105) : memref<32x32xf32>
  %111 = AIE.buffer(%105) : memref<32x32xf32>
  %112 = AIE.buffer(%105) : memref<32x32xf32>
  %113 = AIE.core(%105) {
    AIE.useLock(%107, Acquire, 1)
    AIE.useLock(%108, Acquire, 1)
    AIE.useLock(%119, Acquire, 0)
    call @extern_kernel(%112, %109, %110, %111) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%119, Release, 1)
    AIE.useLock(%108, Release, 0)
    AIE.useLock(%107, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %114 = AIE.mem(%105) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%108, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%107, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%110 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%107, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %115 = AIE.tile(12, 3)
  %116 = AIE.switchbox(%115) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.amsel<0> (3)
    %148 = AIE.masterset(DMA : 0, %146)
    %149 = AIE.masterset(DMA : 1, %145)
    %150 = AIE.masterset(North : 0, %144)
    %151 = AIE.masterset(North : 1, %147)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %145)
      AIE.rule(31, 6, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %146)
      AIE.rule(31, 2, %144)
    }
  }
  %117 = AIE.lock(%115, 2)
  %118 = AIE.lock(%115, 1)
  %119 = AIE.lock(%115, 0)
  %120 = AIE.buffer(%115) : memref<32x32xf32>
  %121 = AIE.buffer(%115) : memref<32x32xf32>
  %122 = AIE.buffer(%115) : memref<32x32xf32>
  %123 = AIE.core(%115) {
    AIE.useLock(%127, Acquire, 0)
    AIE.useLock(%117, Acquire, 1)
    AIE.useLock(%118, Acquire, 1)
    AIE.useLock(%119, Acquire, 1)
    call @extern_kernel(%109, %120, %121, %122) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%119, Release, 0)
    AIE.useLock(%118, Release, 0)
    AIE.useLock(%117, Release, 0)
    AIE.useLock(%127, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %124 = AIE.mem(%115) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%118, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%121 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%118, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%117, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%122 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %125 = AIE.tile(12, 4) {polyaie.leaf}
  %126 = AIE.switchbox(%125) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.masterset(DMA : 0, %145)
    %148 = AIE.masterset(DMA : 1, %144)
    %149 = AIE.masterset(West : 0, %146)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %146)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %145)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %144)
    }
  }
  %127 = AIE.lock(%125, 3)
  %128 = AIE.lock(%125, 2)
  %129 = AIE.lock(%125, 1)
  %130 = AIE.lock(%125, 0)
  %131 = AIE.buffer(%125) : memref<32x32xf32>
  %132 = AIE.buffer(%125) : memref<32x32xf32>
  %133 = AIE.buffer(%125) : memref<32x32xf32>
  %134 = AIE.core(%125) {
    AIE.useLock(%127, Acquire, 1)
    AIE.useLock(%128, Acquire, 1)
    AIE.useLock(%130, Acquire, 1)
    AIE.useLock(%129, Acquire, 0)
    call @extern_kernel(%120, %131, %132, %133) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%129, Release, 1)
    AIE.useLock(%130, Release, 0)
    AIE.useLock(%128, Release, 0)
    AIE.useLock(%127, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %135 = AIE.mem(%125) {
    %144 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%130, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%133 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%130, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %145 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%128, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%132 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%128, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %146 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%129, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%129, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %136 = AIE.tile(12, 0)
  %137 = AIE.switchbox(%136) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.masterset(North : 0, %144)
    %147 = AIE.masterset(North : 1, %145)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %145)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %144)
    }
  }
  %138 = AIE.tile(12, 1)
  %139 = AIE.switchbox(%138) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.masterset(North : 0, %145)
    %147 = AIE.masterset(North : 1, %144)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %144)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %145)
    }
  }
  %140 = AIE.tile(11, 1)
  %141 = AIE.switchbox(%140) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<1> (0)
    %146 = AIE.amsel<0> (1)
    %147 = AIE.amsel<0> (2)
    %148 = AIE.amsel<0> (3)
    %149 = AIE.masterset(South : 0, %146)
    %150 = AIE.masterset(South : 1, %148)
    %151 = AIE.masterset(South : 2, %145)
    %152 = AIE.masterset(North : 0, %144)
    %153 = AIE.masterset(North : 1, %147)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %145)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %148)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %146)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %144)
    }
  }
  %142 = AIE.tile(10, 1)
  %143 = AIE.switchbox(%142) {
    %144 = AIE.amsel<0> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.masterset(North : 0, %144)
    %147 = AIE.masterset(North : 1, %145)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %145)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %144)
    }
  }
}


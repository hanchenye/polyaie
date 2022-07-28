module @gemm {
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
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.masterset(North : 0, %136)
    %138 = AIE.masterset(North : 1, %135)
    %139 = AIE.masterset(East : 0, %136)
    %140 = AIE.masterset(East : 1, %135)
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %135)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %136)
    }
  }
  %6 = AIE.lock(%3, 3)
  %7 = AIE.lock(%3, 2)
  %8 = AIE.lock(%3, 1)
  %9 = AIE.lock(%3, 0)
  %10 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %11 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %12 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %13 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xf32>
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
    %135 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
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
    %136 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
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
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<1> (0)
    %137 = AIE.amsel<0> (1)
    %138 = AIE.amsel<0> (2)
    %139 = AIE.amsel<0> (3)
    %140 = AIE.masterset(South : 2, %137)
    %141 = AIE.masterset(North : 0, %135)
    %142 = AIE.masterset(North : 1, %139)
    %143 = AIE.masterset(East : 0, %138)
    %144 = AIE.masterset(East : 1, %136)
    %145 = AIE.masterset(East : 2, %139)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %137)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %137)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %137)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %137)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %139)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 0, %136)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %138)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %135)
    }
  }
  %19 = AIE.lock(%16, 3)
  %20 = AIE.lock(%16, 2)
  %21 = AIE.lock(%16, 1)
  %22 = AIE.lock(%16, 0)
  %23 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %24 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %25 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %26 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %27 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %27) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %28 = AIE.external_buffer 57344 {sym_name = "buf9"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %28) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %29 = AIE.external_buffer 65536 {sym_name = "buf10"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %29) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<1025xf32>) -> ()
  %30 = AIE.external_buffer 73728 {sym_name = "buf11"} : memref<1025xf32>
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
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
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
    %136 = AIE.dmaStart(MM2S0, ^bb6, ^bb8)
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
    %137 = AIE.dmaStart(MM2S1, ^bb9, ^bb11)
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
  %34 = AIE.core(%33) {
    AIE.end
  }
  %35 = AIE.tile(10, 2)
  %36 = AIE.switchbox(%35) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.amsel<0> (2)
    %138 = AIE.amsel<0> (3)
    %139 = AIE.masterset(DMA : 0, %136)
    %140 = AIE.masterset(DMA : 1, %135)
    %141 = AIE.masterset(North : 0, %138)
    %142 = AIE.masterset(North : 1, %137)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %136)
      AIE.rule(31, 5, %137)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %135)
      AIE.rule(31, 1, %138)
    }
  }
  %37 = AIE.lock(%35, 1)
  %38 = AIE.lock(%35, 0)
  %39 = AIE.buffer(%35) {sym_name = "buf12"} : memref<32x32xf32>
  %40 = AIE.buffer(%35) {sym_name = "buf13"} : memref<32x32xf32>
  %41 = AIE.buffer(%35) {sym_name = "buf14"} : memref<32x32xf32>
  %42 = AIE.buffer(%35) {sym_name = "buf15"} : memref<32x32xf32>
  %43 = AIE.core(%35) {
    AIE.useLock(%49, Acquire, 0)
    AIE.useLock(%38, Acquire, 1)
    AIE.useLock(%37, Acquire, 1)
    call @extern_kernel(%42, %39, %40, %41) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%37, Release, 0)
    AIE.useLock(%38, Release, 0)
    AIE.useLock(%49, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %44 = AIE.mem(%35) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%38, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%38, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %45 = AIE.tile(10, 3) {polyaie.leaf}
  %46 = AIE.lock(%45, 15)
  %47 = AIE.switchbox(%45) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.amsel<0> (2)
    %138 = AIE.masterset(DMA : 0, %137)
    %139 = AIE.masterset(DMA : 1, %135)
    %140 = AIE.masterset(East : 0, %136)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %136)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %137)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %135)
    }
  }
  %48 = AIE.lock(%45, 3)
  %49 = AIE.lock(%45, 2)
  %50 = AIE.lock(%45, 1)
  %51 = AIE.lock(%45, 0)
  %52 = AIE.buffer(%45) {sym_name = "buf16"} : memref<32x32xf32>
  %53 = AIE.buffer(%45) {sym_name = "buf17"} : memref<32x32xf32>
  %54 = AIE.buffer(%45) {sym_name = "buf18"} : memref<32x32xf32>
  %55 = AIE.core(%45) {
    AIE.useLock(%48, Acquire, 1)
    AIE.useLock(%51, Acquire, 0)
    AIE.useLock(%49, Acquire, 1)
    AIE.useLock(%50, Acquire, 1)
    call @extern_kernel(%39, %52, %53, %54) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%50, Release, 0)
    AIE.useLock(%49, Release, 0)
    AIE.useLock(%51, Release, 1)
    AIE.useLock(%48, Release, 0)
    AIE.useLock(%46, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %56 = AIE.mem(%45) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%50, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%48, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %137 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<1> (0)
    %137 = AIE.amsel<0> (1)
    %138 = AIE.amsel<1> (1)
    %139 = AIE.amsel<0> (2)
    %140 = AIE.amsel<1> (2)
    %141 = AIE.amsel<0> (3)
    %142 = AIE.amsel<1> (3)
    %143 = AIE.masterset(DMA : 0, %141)
    %144 = AIE.masterset(DMA : 1, %137)
    %145 = AIE.masterset(South : 0, %139)
    %146 = AIE.masterset(South : 1, %135)
    %147 = AIE.masterset(South : 2, %142)
    %148 = AIE.masterset(South : 3, %138)
    %149 = AIE.masterset(North : 0, %140)
    %150 = AIE.masterset(North : 1, %136)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %138)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %142)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %135)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %139)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %137)
      AIE.rule(31, 5, %136)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %141)
      AIE.rule(31, 1, %140)
    }
  }
  %59 = AIE.lock(%57, 1)
  %60 = AIE.lock(%57, 0)
  %61 = AIE.buffer(%57) {sym_name = "buf19"} : memref<32x32xf32>
  %62 = AIE.buffer(%57) {sym_name = "buf20"} : memref<32x32xf32>
  %63 = AIE.buffer(%57) {sym_name = "buf21"} : memref<32x32xf32>
  %64 = AIE.buffer(%57) {sym_name = "buf22"} : memref<32x32xf32>
  %65 = AIE.core(%57) {
    AIE.useLock(%59, Acquire, 1)
    AIE.useLock(%60, Acquire, 1)
    AIE.useLock(%73, Acquire, 0)
    call @extern_kernel(%64, %61, %62, %63) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%73, Release, 1)
    AIE.useLock(%60, Release, 0)
    AIE.useLock(%59, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %66 = AIE.mem(%57) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
  %68 = AIE.lock(%67, 15)
  %69 = AIE.switchbox(%67) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<1> (0)
    %137 = AIE.amsel<0> (1)
    %138 = AIE.amsel<1> (1)
    %139 = AIE.amsel<0> (2)
    %140 = AIE.amsel<0> (3)
    %141 = AIE.masterset(DMA : 0, %140)
    %142 = AIE.masterset(DMA : 1, %137)
    %143 = AIE.masterset(South : 0, %135)
    %144 = AIE.masterset(South : 1, %139)
    %145 = AIE.masterset(South : 2, %136)
    %146 = AIE.masterset(South : 3, %138)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %138)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %136)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %139)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %135)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %140)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %137)
    }
  }
  %70 = AIE.lock(%67, 3)
  %71 = AIE.lock(%67, 2)
  %72 = AIE.lock(%67, 1)
  %73 = AIE.lock(%67, 0)
  %74 = AIE.buffer(%67) {sym_name = "buf23"} : memref<32x32xf32>
  %75 = AIE.buffer(%67) {sym_name = "buf24"} : memref<32x32xf32>
  %76 = AIE.buffer(%67) {sym_name = "buf25"} : memref<32x32xf32>
  %77 = AIE.core(%67) {
    AIE.useLock(%70, Acquire, 1)
    AIE.useLock(%71, Acquire, 1)
    AIE.useLock(%73, Acquire, 1)
    AIE.useLock(%72, Acquire, 0)
    call @extern_kernel(%61, %74, %75, %76) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%72, Release, 1)
    AIE.useLock(%73, Release, 0)
    AIE.useLock(%71, Release, 0)
    AIE.useLock(%70, Release, 0)
    AIE.useLock(%68, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %78 = AIE.mem(%67) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%71, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%76 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%71, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%70, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%75 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%70, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %137 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%72, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%72, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %79 = AIE.tile(12, 2)
  %80 = AIE.switchbox(%79) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.amsel<0> (2)
    %138 = AIE.amsel<0> (3)
    %139 = AIE.masterset(DMA : 0, %136)
    %140 = AIE.masterset(DMA : 1, %138)
    %141 = AIE.masterset(North : 0, %137)
    %142 = AIE.masterset(North : 1, %135)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %138)
      AIE.rule(31, 1, %135)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %136)
      AIE.rule(31, 5, %137)
    }
  }
  %81 = AIE.lock(%79, 1)
  %82 = AIE.lock(%79, 0)
  %83 = AIE.buffer(%79) {sym_name = "buf26"} : memref<32x32xf32>
  %84 = AIE.buffer(%79) {sym_name = "buf27"} : memref<32x32xf32>
  %85 = AIE.buffer(%79) {sym_name = "buf28"} : memref<32x32xf32>
  %86 = AIE.buffer(%79) {sym_name = "buf29"} : memref<32x32xf32>
  %87 = AIE.core(%79) {
    AIE.useLock(%81, Acquire, 1)
    AIE.useLock(%93, Acquire, 0)
    AIE.useLock(%82, Acquire, 1)
    call @extern_kernel(%86, %83, %84, %85) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%82, Release, 0)
    AIE.useLock(%93, Release, 1)
    AIE.useLock(%81, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %88 = AIE.mem(%79) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%82, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%85 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%82, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%84 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %89 = AIE.tile(12, 3) {polyaie.leaf}
  %90 = AIE.lock(%89, 15)
  %91 = AIE.switchbox(%89) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.amsel<0> (2)
    %138 = AIE.amsel<0> (3)
    %139 = AIE.masterset(DMA : 0, %135)
    %140 = AIE.masterset(DMA : 1, %138)
    %141 = AIE.masterset(West : 0, %136)
    %142 = AIE.masterset(West : 1, %137)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %137)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %136)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %138)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %135)
    }
  }
  %92 = AIE.lock(%89, 3)
  %93 = AIE.lock(%89, 2)
  %94 = AIE.lock(%89, 1)
  %95 = AIE.lock(%89, 0)
  %96 = AIE.buffer(%89) {sym_name = "buf30"} : memref<32x32xf32>
  %97 = AIE.buffer(%89) {sym_name = "buf31"} : memref<32x32xf32>
  %98 = AIE.buffer(%89) {sym_name = "buf32"} : memref<32x32xf32>
  %99 = AIE.core(%89) {
    AIE.useLock(%92, Acquire, 1)
    AIE.useLock(%93, Acquire, 1)
    AIE.useLock(%94, Acquire, 0)
    AIE.useLock(%95, Acquire, 1)
    call @extern_kernel(%83, %96, %97, %98) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%95, Release, 0)
    AIE.useLock(%94, Release, 1)
    AIE.useLock(%93, Release, 0)
    AIE.useLock(%92, Release, 0)
    AIE.useLock(%90, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %100 = AIE.mem(%89) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%95, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%98 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%95, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%92, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%97 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%92, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %137 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%94, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%96 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%94, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %101 = AIE.tile(13, 2)
  %102 = AIE.switchbox(%101) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.amsel<0> (2)
    %138 = AIE.amsel<0> (3)
    %139 = AIE.masterset(DMA : 0, %136)
    %140 = AIE.masterset(DMA : 1, %138)
    %141 = AIE.masterset(North : 0, %137)
    %142 = AIE.masterset(North : 1, %135)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %136)
      AIE.rule(31, 5, %135)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %138)
      AIE.rule(31, 1, %137)
    }
  }
  %103 = AIE.lock(%101, 1)
  %104 = AIE.lock(%101, 0)
  %105 = AIE.buffer(%101) {sym_name = "buf33"} : memref<32x32xf32>
  %106 = AIE.buffer(%101) {sym_name = "buf34"} : memref<32x32xf32>
  %107 = AIE.buffer(%101) {sym_name = "buf35"} : memref<32x32xf32>
  %108 = AIE.buffer(%101) {sym_name = "buf36"} : memref<32x32xf32>
  %109 = AIE.core(%101) {
    AIE.useLock(%104, Acquire, 1)
    AIE.useLock(%103, Acquire, 1)
    AIE.useLock(%116, Acquire, 0)
    call @extern_kernel(%108, %105, %106, %107) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%116, Release, 1)
    AIE.useLock(%103, Release, 0)
    AIE.useLock(%104, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %110 = AIE.mem(%101) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%103, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%107 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%103, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%104, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%106 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%104, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %111 = AIE.tile(13, 3) {polyaie.leaf}
  %112 = AIE.lock(%111, 15)
  %113 = AIE.switchbox(%111) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.amsel<0> (2)
    %138 = AIE.masterset(DMA : 0, %136)
    %139 = AIE.masterset(DMA : 1, %137)
    %140 = AIE.masterset(West : 0, %135)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %135)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %136)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %137)
    }
  }
  %114 = AIE.lock(%111, 3)
  %115 = AIE.lock(%111, 2)
  %116 = AIE.lock(%111, 1)
  %117 = AIE.lock(%111, 0)
  %118 = AIE.buffer(%111) {sym_name = "buf37"} : memref<32x32xf32>
  %119 = AIE.buffer(%111) {sym_name = "buf38"} : memref<32x32xf32>
  %120 = AIE.buffer(%111) {sym_name = "buf39"} : memref<32x32xf32>
  %121 = AIE.core(%111) {
    AIE.useLock(%114, Acquire, 1)
    AIE.useLock(%115, Acquire, 1)
    AIE.useLock(%116, Acquire, 1)
    AIE.useLock(%117, Acquire, 0)
    call @extern_kernel(%105, %118, %119, %120) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%117, Release, 1)
    AIE.useLock(%116, Release, 0)
    AIE.useLock(%115, Release, 0)
    AIE.useLock(%114, Release, 0)
    AIE.useLock(%112, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %122 = AIE.mem(%111) {
    %135 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%115, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%120 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%115, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %136 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%114, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%119 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%114, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %137 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%117, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%118 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %123 = AIE.tile(12, 0)
  %124 = AIE.switchbox(%123) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.amsel<0> (2)
    %138 = AIE.masterset(North : 0, %136)
    %139 = AIE.masterset(North : 1, %135)
    %140 = AIE.masterset(East : 0, %135)
    %141 = AIE.masterset(East : 1, %137)
    AIE.packetrules(West : 2) {
      AIE.rule(30, 4, %137)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 0, %135)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 4, %136)
    }
  }
  %125 = AIE.tile(13, 0)
  %126 = AIE.switchbox(%125) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.masterset(North : 0, %136)
    %138 = AIE.masterset(North : 1, %135)
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %135)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %136)
    }
  }
  %127 = AIE.tile(12, 1)
  %128 = AIE.switchbox(%127) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.masterset(North : 0, %135)
    %138 = AIE.masterset(North : 1, %136)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %136)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %135)
    }
  }
  %129 = AIE.tile(11, 1)
  %130 = AIE.switchbox(%129) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<1> (0)
    %137 = AIE.amsel<0> (1)
    %138 = AIE.amsel<1> (1)
    %139 = AIE.amsel<0> (2)
    %140 = AIE.amsel<0> (3)
    %141 = AIE.masterset(South : 0, %140)
    %142 = AIE.masterset(South : 1, %138)
    %143 = AIE.masterset(South : 2, %139)
    %144 = AIE.masterset(South : 3, %136)
    %145 = AIE.masterset(North : 0, %135)
    %146 = AIE.masterset(North : 1, %137)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %136)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %139)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %138)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %140)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %137)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %135)
    }
  }
  %131 = AIE.tile(13, 1)
  %132 = AIE.switchbox(%131) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.masterset(North : 0, %136)
    %138 = AIE.masterset(North : 1, %135)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %135)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %136)
    }
  }
  %133 = AIE.tile(10, 1)
  %134 = AIE.switchbox(%133) {
    %135 = AIE.amsel<0> (0)
    %136 = AIE.amsel<0> (1)
    %137 = AIE.masterset(North : 0, %136)
    %138 = AIE.masterset(North : 1, %135)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %135)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %136)
    }
  }
}


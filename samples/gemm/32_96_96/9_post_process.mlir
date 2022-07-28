module @gemm {
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
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.masterset(North : 0, %147)
    %149 = AIE.masterset(North : 1, %146)
    %150 = AIE.masterset(East : 0, %146)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %146)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %147)
    }
  }
  %6 = AIE.lock(%3, 5)
  %7 = AIE.lock(%3, 4)
  %8 = AIE.lock(%3, 3)
  %9 = AIE.lock(%3, 2)
  %10 = AIE.lock(%3, 1)
  %11 = AIE.lock(%3, 0)
  %12 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %13 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %14 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %15 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %16 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %17 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xf32>
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
    %146 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
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
    %147 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
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
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.amsel<0> (3)
    %150 = AIE.masterset(South : 2, %146)
    %151 = AIE.masterset(North : 0, %147)
    %152 = AIE.masterset(North : 1, %149)
    %153 = AIE.masterset(East : 0, %147)
    %154 = AIE.masterset(East : 1, %148)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %146)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %146)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %146)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %149)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %148)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %147)
    }
  }
  %23 = AIE.lock(%20, 5)
  %24 = AIE.lock(%20, 4)
  %25 = AIE.lock(%20, 3)
  %26 = AIE.lock(%20, 2)
  %27 = AIE.lock(%20, 1)
  %28 = AIE.lock(%20, 0)
  %29 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %30 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %31 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %32 = AIE.external_buffer 53248 {sym_name = "buf9"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%32, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %33 = AIE.external_buffer 57344 {sym_name = "buf10"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %34 = AIE.external_buffer 61440 {sym_name = "buf11"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %35 = AIE.external_buffer 65536 {sym_name = "buf12"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %35) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %36 = AIE.external_buffer 73728 {sym_name = "buf13"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %36) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %37 = AIE.external_buffer 81920 {sym_name = "buf14"} : memref<1025xf32>
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
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb4)
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
    %147 = AIE.dmaStart(MM2S0, ^bb5, ^bb8)
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
    %148 = AIE.dmaStart(MM2S1, ^bb9, ^bb12)
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
  %41 = AIE.core(%40) {
    AIE.end
  }
  %42 = AIE.tile(10, 2)
  %43 = AIE.switchbox(%42) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.amsel<0> (3)
    %150 = AIE.masterset(DMA : 0, %148)
    %151 = AIE.masterset(DMA : 1, %146)
    %152 = AIE.masterset(North : 0, %149)
    %153 = AIE.masterset(North : 1, %147)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %146)
      AIE.rule(28, 0, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %148)
      AIE.rule(28, 4, %149)
    }
  }
  %44 = AIE.lock(%42, 1)
  %45 = AIE.lock(%42, 0)
  %46 = AIE.buffer(%42) {sym_name = "buf15"} : memref<32x32xf32>
  %47 = AIE.buffer(%42) {sym_name = "buf16"} : memref<32x32xf32>
  %48 = AIE.buffer(%42) {sym_name = "buf17"} : memref<32x32xf32>
  %49 = AIE.buffer(%42) {sym_name = "buf18"} : memref<32x32xf32>
  %50 = AIE.core(%42) {
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%44, Acquire, 1)
    AIE.useLock(%54, Acquire, 0)
    call @extern_kernel(%49, %46, %47, %48) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%54, Release, 1)
    AIE.useLock(%44, Release, 0)
    AIE.useLock(%45, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %51 = AIE.mem(%42) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%44, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%47 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %52 = AIE.tile(10, 3)
  %53 = AIE.switchbox(%52) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.amsel<0> (3)
    %150 = AIE.masterset(DMA : 0, %146)
    %151 = AIE.masterset(DMA : 1, %148)
    %152 = AIE.masterset(North : 0, %149)
    %153 = AIE.masterset(North : 1, %147)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %146)
      AIE.rule(31, 2, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %148)
      AIE.rule(31, 6, %149)
    }
  }
  %54 = AIE.lock(%52, 2)
  %55 = AIE.lock(%52, 1)
  %56 = AIE.lock(%52, 0)
  %57 = AIE.buffer(%52) {sym_name = "buf19"} : memref<32x32xf32>
  %58 = AIE.buffer(%52) {sym_name = "buf20"} : memref<32x32xf32>
  %59 = AIE.buffer(%52) {sym_name = "buf21"} : memref<32x32xf32>
  %60 = AIE.core(%52) {
    AIE.useLock(%56, Acquire, 1)
    AIE.useLock(%65, Acquire, 0)
    AIE.useLock(%54, Acquire, 1)
    AIE.useLock(%55, Acquire, 1)
    call @extern_kernel(%46, %57, %58, %59) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%55, Release, 0)
    AIE.useLock(%54, Release, 0)
    AIE.useLock(%65, Release, 1)
    AIE.useLock(%56, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %61 = AIE.mem(%52) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%55, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%55, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%56, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%56, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %62 = AIE.tile(10, 4) {polyaie.leaf}
  %63 = AIE.lock(%62, 15)
  %64 = AIE.switchbox(%62) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.masterset(DMA : 0, %148)
    %150 = AIE.masterset(DMA : 1, %146)
    %151 = AIE.masterset(East : 0, %147)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %147)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %146)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %148)
    }
  }
  %65 = AIE.lock(%62, 3)
  %66 = AIE.lock(%62, 2)
  %67 = AIE.lock(%62, 1)
  %68 = AIE.lock(%62, 0)
  %69 = AIE.buffer(%62) {sym_name = "buf22"} : memref<32x32xf32>
  %70 = AIE.buffer(%62) {sym_name = "buf23"} : memref<32x32xf32>
  %71 = AIE.buffer(%62) {sym_name = "buf24"} : memref<32x32xf32>
  %72 = AIE.core(%62) {
    AIE.useLock(%65, Acquire, 1)
    AIE.useLock(%66, Acquire, 1)
    AIE.useLock(%67, Acquire, 1)
    AIE.useLock(%68, Acquire, 0)
    call @extern_kernel(%57, %69, %70, %71) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%68, Release, 1)
    AIE.useLock(%67, Release, 0)
    AIE.useLock(%66, Release, 0)
    AIE.useLock(%65, Release, 0)
    AIE.useLock(%63, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %73 = AIE.mem(%62) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%67, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%71 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%67, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%66, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%70 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%66, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %148 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<1> (0)
    %148 = AIE.amsel<0> (1)
    %149 = AIE.amsel<1> (1)
    %150 = AIE.amsel<0> (2)
    %151 = AIE.amsel<1> (2)
    %152 = AIE.amsel<0> (3)
    %153 = AIE.masterset(DMA : 0, %148)
    %154 = AIE.masterset(DMA : 1, %150)
    %155 = AIE.masterset(South : 0, %151)
    %156 = AIE.masterset(South : 1, %147)
    %157 = AIE.masterset(South : 2, %149)
    %158 = AIE.masterset(North : 0, %146)
    %159 = AIE.masterset(North : 1, %152)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %149)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %147)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %151)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %148)
      AIE.rule(28, 4, %152)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %150)
      AIE.rule(28, 0, %146)
    }
  }
  %76 = AIE.lock(%74, 1)
  %77 = AIE.lock(%74, 0)
  %78 = AIE.buffer(%74) {sym_name = "buf25"} : memref<32x32xf32>
  %79 = AIE.buffer(%74) {sym_name = "buf26"} : memref<32x32xf32>
  %80 = AIE.buffer(%74) {sym_name = "buf27"} : memref<32x32xf32>
  %81 = AIE.buffer(%74) {sym_name = "buf28"} : memref<32x32xf32>
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
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%77, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%80 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%77, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<1> (0)
    %148 = AIE.amsel<0> (1)
    %149 = AIE.amsel<1> (1)
    %150 = AIE.amsel<0> (2)
    %151 = AIE.amsel<1> (2)
    %152 = AIE.amsel<0> (3)
    %153 = AIE.masterset(DMA : 0, %149)
    %154 = AIE.masterset(DMA : 1, %151)
    %155 = AIE.masterset(South : 0, %147)
    %156 = AIE.masterset(South : 1, %148)
    %157 = AIE.masterset(South : 2, %146)
    %158 = AIE.masterset(North : 0, %152)
    %159 = AIE.masterset(North : 1, %150)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %146)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %148)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %147)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %151)
      AIE.rule(31, 6, %150)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %149)
      AIE.rule(31, 2, %152)
    }
  }
  %86 = AIE.lock(%84, 2)
  %87 = AIE.lock(%84, 1)
  %88 = AIE.lock(%84, 0)
  %89 = AIE.buffer(%84) {sym_name = "buf29"} : memref<32x32xf32>
  %90 = AIE.buffer(%84) {sym_name = "buf30"} : memref<32x32xf32>
  %91 = AIE.buffer(%84) {sym_name = "buf31"} : memref<32x32xf32>
  %92 = AIE.core(%84) {
    AIE.useLock(%87, Acquire, 1)
    AIE.useLock(%86, Acquire, 1)
    AIE.useLock(%97, Acquire, 0)
    AIE.useLock(%88, Acquire, 1)
    call @extern_kernel(%78, %89, %90, %91) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%88, Release, 0)
    AIE.useLock(%97, Release, 1)
    AIE.useLock(%86, Release, 0)
    AIE.useLock(%87, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %93 = AIE.mem(%84) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%88, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%90 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
  %95 = AIE.lock(%94, 15)
  %96 = AIE.switchbox(%94) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<1> (0)
    %148 = AIE.amsel<0> (1)
    %149 = AIE.amsel<0> (2)
    %150 = AIE.amsel<0> (3)
    %151 = AIE.masterset(DMA : 0, %146)
    %152 = AIE.masterset(DMA : 1, %149)
    %153 = AIE.masterset(South : 0, %147)
    %154 = AIE.masterset(South : 1, %150)
    %155 = AIE.masterset(South : 2, %148)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %148)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %150)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %147)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %149)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %146)
    }
  }
  %97 = AIE.lock(%94, 3)
  %98 = AIE.lock(%94, 2)
  %99 = AIE.lock(%94, 1)
  %100 = AIE.lock(%94, 0)
  %101 = AIE.buffer(%94) {sym_name = "buf32"} : memref<32x32xf32>
  %102 = AIE.buffer(%94) {sym_name = "buf33"} : memref<32x32xf32>
  %103 = AIE.buffer(%94) {sym_name = "buf34"} : memref<32x32xf32>
  %104 = AIE.core(%94) {
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%97, Acquire, 1)
    AIE.useLock(%98, Acquire, 1)
    AIE.useLock(%100, Acquire, 0)
    call @extern_kernel(%89, %101, %102, %103) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%100, Release, 1)
    AIE.useLock(%98, Release, 0)
    AIE.useLock(%97, Release, 0)
    AIE.useLock(%99, Release, 0)
    AIE.useLock(%95, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %105 = AIE.mem(%94) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%98, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%98, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%103 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %148 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%100, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%101 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%100, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %106 = AIE.tile(12, 2)
  %107 = AIE.switchbox(%106) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.amsel<0> (3)
    %150 = AIE.masterset(DMA : 0, %148)
    %151 = AIE.masterset(DMA : 1, %147)
    %152 = AIE.masterset(North : 0, %146)
    %153 = AIE.masterset(North : 1, %149)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %148)
      AIE.rule(28, 4, %149)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %147)
      AIE.rule(28, 0, %146)
    }
  }
  %108 = AIE.lock(%106, 1)
  %109 = AIE.lock(%106, 0)
  %110 = AIE.buffer(%106) {sym_name = "buf35"} : memref<32x32xf32>
  %111 = AIE.buffer(%106) {sym_name = "buf36"} : memref<32x32xf32>
  %112 = AIE.buffer(%106) {sym_name = "buf37"} : memref<32x32xf32>
  %113 = AIE.buffer(%106) {sym_name = "buf38"} : memref<32x32xf32>
  %114 = AIE.core(%106) {
    AIE.useLock(%108, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    AIE.useLock(%120, Acquire, 0)
    call @extern_kernel(%113, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%120, Release, 1)
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%108, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %115 = AIE.mem(%106) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%109, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%108, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %116 = AIE.tile(12, 3)
  %117 = AIE.switchbox(%116) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.amsel<0> (3)
    %150 = AIE.masterset(DMA : 0, %148)
    %151 = AIE.masterset(DMA : 1, %147)
    %152 = AIE.masterset(North : 0, %146)
    %153 = AIE.masterset(North : 1, %149)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %147)
      AIE.rule(31, 6, %149)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %148)
      AIE.rule(31, 2, %146)
    }
  }
  %118 = AIE.lock(%116, 2)
  %119 = AIE.lock(%116, 1)
  %120 = AIE.lock(%116, 0)
  %121 = AIE.buffer(%116) {sym_name = "buf39"} : memref<32x32xf32>
  %122 = AIE.buffer(%116) {sym_name = "buf40"} : memref<32x32xf32>
  %123 = AIE.buffer(%116) {sym_name = "buf41"} : memref<32x32xf32>
  %124 = AIE.core(%116) {
    AIE.useLock(%129, Acquire, 0)
    AIE.useLock(%118, Acquire, 1)
    AIE.useLock(%119, Acquire, 1)
    AIE.useLock(%120, Acquire, 1)
    call @extern_kernel(%110, %121, %122, %123) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%120, Release, 0)
    AIE.useLock(%119, Release, 0)
    AIE.useLock(%118, Release, 0)
    AIE.useLock(%129, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %125 = AIE.mem(%116) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%119, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%122 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%119, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%118, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%123 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%118, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %126 = AIE.tile(12, 4) {polyaie.leaf}
  %127 = AIE.lock(%126, 15)
  %128 = AIE.switchbox(%126) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.amsel<0> (2)
    %149 = AIE.masterset(DMA : 0, %147)
    %150 = AIE.masterset(DMA : 1, %146)
    %151 = AIE.masterset(West : 0, %148)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %148)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %146)
    }
  }
  %129 = AIE.lock(%126, 3)
  %130 = AIE.lock(%126, 2)
  %131 = AIE.lock(%126, 1)
  %132 = AIE.lock(%126, 0)
  %133 = AIE.buffer(%126) {sym_name = "buf42"} : memref<32x32xf32>
  %134 = AIE.buffer(%126) {sym_name = "buf43"} : memref<32x32xf32>
  %135 = AIE.buffer(%126) {sym_name = "buf44"} : memref<32x32xf32>
  %136 = AIE.core(%126) {
    AIE.useLock(%129, Acquire, 1)
    AIE.useLock(%130, Acquire, 1)
    AIE.useLock(%132, Acquire, 1)
    AIE.useLock(%131, Acquire, 0)
    call @extern_kernel(%121, %133, %134, %135) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%131, Release, 1)
    AIE.useLock(%132, Release, 0)
    AIE.useLock(%130, Release, 0)
    AIE.useLock(%129, Release, 0)
    AIE.useLock(%127, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %137 = AIE.mem(%126) {
    %146 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%132, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%135 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%132, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %147 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%130, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%134 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%130, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %148 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%131, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%133 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%131, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %138 = AIE.tile(12, 0)
  %139 = AIE.switchbox(%138) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.masterset(North : 0, %146)
    %149 = AIE.masterset(North : 1, %147)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %147)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %146)
    }
  }
  %140 = AIE.tile(12, 1)
  %141 = AIE.switchbox(%140) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.masterset(North : 0, %147)
    %149 = AIE.masterset(North : 1, %146)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %146)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %147)
    }
  }
  %142 = AIE.tile(11, 1)
  %143 = AIE.switchbox(%142) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<1> (0)
    %148 = AIE.amsel<0> (1)
    %149 = AIE.amsel<0> (2)
    %150 = AIE.amsel<0> (3)
    %151 = AIE.masterset(South : 0, %148)
    %152 = AIE.masterset(South : 1, %150)
    %153 = AIE.masterset(South : 2, %147)
    %154 = AIE.masterset(North : 0, %146)
    %155 = AIE.masterset(North : 1, %149)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %147)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %150)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %148)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %149)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %146)
    }
  }
  %144 = AIE.tile(10, 1)
  %145 = AIE.switchbox(%144) {
    %146 = AIE.amsel<0> (0)
    %147 = AIE.amsel<0> (1)
    %148 = AIE.masterset(North : 0, %146)
    %149 = AIE.masterset(North : 1, %147)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %146)
    }
  }
}


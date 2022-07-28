module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = memref.alloc() : memref<32x32xi32>
  %1 = memref.alloc() : memref<32x64xi32>
  %2 = memref.alloc() : memref<64x32xi32>
  %3 = AIE.tile(26, 0)
  %4 = AIE.shimmux(%3) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %5 = AIE.switchbox(%3) {
    %43 = AIE.amsel<0> (0)
    %44 = AIE.amsel<0> (1)
    %45 = AIE.amsel<0> (2)
    %46 = AIE.masterset(South : 2, %44)
    %47 = AIE.masterset(North : 0, %43)
    %48 = AIE.masterset(North : 1, %45)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %44)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %45)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %43)
    }
  }
  %6 = AIE.lock(%3, 3)
  %7 = AIE.lock(%3, 2)
  %8 = AIE.lock(%3, 1)
  %9 = AIE.lock(%3, 0)
  %10 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xi32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xi32>, memref<32x64xi32>) -> ()
  %11 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xi32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xi32>, memref<64x32xi32>) -> ()
  %12 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xi32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xi32>, memref<32x64xi32>) -> ()
  %13 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xi32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xi32>, memref<64x32xi32>) -> ()
  %14 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<1025xi32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xi32>, memref<1025xi32>) -> ()
  %15 = AIE.core(%3) {
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.end
  }
  %16 = AIE.shimDMA(%3) {
    %43 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%14 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %44 = AIE.dmaStart(MM2S0, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%12 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb3
  ^bb5:  // pred: ^bb2
    %45 = AIE.dmaStart(MM2S1, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%13 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%11 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb6
  ^bb8:  // pred: ^bb5
    AIE.end
  }
  %17 = AIE.tile(0, 0)
  %18 = AIE.core(%17) {
    AIE.end
  }
  %19 = AIE.tile(26, 2)
  %20 = AIE.switchbox(%19) {
    %43 = AIE.amsel<0> (0)
    %44 = AIE.amsel<1> (0)
    %45 = AIE.amsel<0> (1)
    %46 = AIE.amsel<0> (2)
    %47 = AIE.amsel<0> (3)
    %48 = AIE.masterset(DMA : 0, %46)
    %49 = AIE.masterset(DMA : 1, %45)
    %50 = AIE.masterset(South : 0, %43)
    %51 = AIE.masterset(North : 0, %44)
    %52 = AIE.masterset(North : 1, %47)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %43)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %46)
      AIE.rule(31, 5, %47)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %45)
      AIE.rule(31, 1, %44)
    }
  }
  %21 = AIE.lock(%19, 1)
  %22 = AIE.lock(%19, 0)
  %23 = AIE.buffer(%19) {sym_name = "buf5"} : memref<32x32xi32>
  %24 = AIE.buffer(%19) {sym_name = "buf6"} : memref<32x32xi32>
  %25 = AIE.buffer(%19) {sym_name = "buf7"} : memref<32x32xi32>
  %26 = AIE.buffer(%19) {sym_name = "buf8"} : memref<32x32xi32>
  %27 = AIE.core(%19) {
    AIE.useLock(%35, Acquire, 0)
    AIE.useLock(%21, Acquire, 1)
    AIE.useLock(%22, Acquire, 1)
    call @extern_kernel(%26, %23, %24, %25) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%22, Release, 0)
    AIE.useLock(%21, Release, 0)
    AIE.useLock(%35, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %28 = AIE.mem(%19) {
    %43 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%22, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%25 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %44 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%21, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%24 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %29 = AIE.tile(26, 3) {polyaie.leaf}
  %30 = AIE.lock(%29, 15)
  %31 = AIE.switchbox(%29) {
    %43 = AIE.amsel<0> (0)
    %44 = AIE.amsel<0> (1)
    %45 = AIE.amsel<0> (2)
    %46 = AIE.masterset(DMA : 0, %44)
    %47 = AIE.masterset(DMA : 1, %43)
    %48 = AIE.masterset(South : 0, %45)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %45)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %44)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %43)
    }
  }
  %32 = AIE.lock(%29, 3)
  %33 = AIE.lock(%29, 2)
  %34 = AIE.lock(%29, 1)
  %35 = AIE.lock(%29, 0)
  %36 = AIE.buffer(%29) {sym_name = "buf9"} : memref<32x32xi32>
  %37 = AIE.buffer(%29) {sym_name = "buf10"} : memref<32x32xi32>
  %38 = AIE.buffer(%29) {sym_name = "buf11"} : memref<32x32xi32>
  %39 = AIE.core(%29) {
    AIE.useLock(%35, Acquire, 1)
    AIE.useLock(%32, Acquire, 1)
    AIE.useLock(%34, Acquire, 1)
    AIE.useLock(%33, Acquire, 0)
    call @extern_kernel(%23, %36, %37, %38) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%33, Release, 1)
    AIE.useLock(%34, Release, 0)
    AIE.useLock(%32, Release, 0)
    AIE.useLock(%35, Release, 0)
    AIE.useLock(%30, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %40 = AIE.mem(%29) {
    %43 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%34, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%38 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %44 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%37 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %45 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%33, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%36 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %41 = AIE.tile(26, 1)
  %42 = AIE.switchbox(%41) {
    %43 = AIE.amsel<0> (0)
    %44 = AIE.amsel<0> (1)
    %45 = AIE.amsel<0> (2)
    %46 = AIE.masterset(South : 0, %44)
    %47 = AIE.masterset(North : 0, %45)
    %48 = AIE.masterset(North : 1, %43)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %44)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %43)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %45)
    }
  }
}


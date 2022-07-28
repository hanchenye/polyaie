module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(26, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %37 = AIE.amsel<0> (0)
    %38 = AIE.amsel<0> (1)
    %39 = AIE.amsel<0> (2)
    %40 = AIE.masterset(South : 2, %38)
    %41 = AIE.masterset(North : 0, %37)
    %42 = AIE.masterset(North : 1, %39)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %38)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %39)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %37)
    }
  }
  %3 = AIE.lock(%0, 3)
  %4 = AIE.lock(%0, 2)
  %5 = AIE.lock(%0, 1)
  %6 = AIE.lock(%0, 0)
  %7 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xi32>
  %8 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xi32>
  %9 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xi32>
  %10 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xi32>
  %11 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<1025xi32>
  %12 = AIE.shimDMA(%0) {
    %37 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%11 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %38 = AIE.dmaStart(MM2S0, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%7 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    cf.br ^bb3
  ^bb5:  // pred: ^bb2
    %39 = AIE.dmaStart(MM2S1, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%8 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    cf.br ^bb6
  ^bb8:  // pred: ^bb5
    AIE.end
  }
  %13 = AIE.tile(26, 2)
  %14 = AIE.switchbox(%13) {
    %37 = AIE.amsel<0> (0)
    %38 = AIE.amsel<1> (0)
    %39 = AIE.amsel<0> (1)
    %40 = AIE.amsel<0> (2)
    %41 = AIE.amsel<0> (3)
    %42 = AIE.masterset(DMA : 0, %40)
    %43 = AIE.masterset(DMA : 1, %39)
    %44 = AIE.masterset(South : 0, %37)
    %45 = AIE.masterset(North : 0, %38)
    %46 = AIE.masterset(North : 1, %41)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %37)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %40)
      AIE.rule(31, 5, %41)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %39)
      AIE.rule(31, 1, %38)
    }
  }
  %15 = AIE.lock(%13, 1)
  %16 = AIE.lock(%13, 0)
  %17 = AIE.buffer(%13) {address = 4096 : i32, sym_name = "buf5"} : memref<32x32xi32>
  %18 = AIE.buffer(%13) {address = 8192 : i32, sym_name = "buf6"} : memref<32x32xi32>
  %19 = AIE.buffer(%13) {address = 12288 : i32, sym_name = "buf7"} : memref<32x32xi32>
  %20 = AIE.buffer(%13) {address = 16384 : i32, sym_name = "buf8"} : memref<32x32xi32>
  %21 = AIE.core(%13) {
    AIE.useLock(%29, Acquire, 0)
    AIE.useLock(%15, Acquire, 1)
    AIE.useLock(%16, Acquire, 1)
    call @extern_kernel(%20, %17, %18, %19) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%16, Release, 0)
    AIE.useLock(%15, Release, 0)
    AIE.useLock(%29, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %22 = AIE.mem(%13) {
    %37 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%16, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%19 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%16, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %38 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%15, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%18 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%15, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %23 = AIE.tile(26, 3) {polyaie.leaf}
  %24 = AIE.lock(%23, 15)
  %25 = AIE.switchbox(%23) {
    %37 = AIE.amsel<0> (0)
    %38 = AIE.amsel<0> (1)
    %39 = AIE.amsel<0> (2)
    %40 = AIE.masterset(DMA : 0, %38)
    %41 = AIE.masterset(DMA : 1, %37)
    %42 = AIE.masterset(South : 0, %39)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %39)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %38)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %37)
    }
  }
  %26 = AIE.lock(%23, 3)
  %27 = AIE.lock(%23, 2)
  %28 = AIE.lock(%23, 1)
  %29 = AIE.lock(%23, 0)
  %30 = AIE.buffer(%23) {address = 4096 : i32, sym_name = "buf9"} : memref<32x32xi32>
  %31 = AIE.buffer(%23) {address = 8192 : i32, sym_name = "buf10"} : memref<32x32xi32>
  %32 = AIE.buffer(%23) {address = 12288 : i32, sym_name = "buf11"} : memref<32x32xi32>
  %33 = AIE.core(%23) {
    AIE.useLock(%29, Acquire, 1)
    AIE.useLock(%26, Acquire, 1)
    AIE.useLock(%28, Acquire, 1)
    AIE.useLock(%27, Acquire, 0)
    call @extern_kernel(%17, %30, %31, %32) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%27, Release, 1)
    AIE.useLock(%28, Release, 0)
    AIE.useLock(%26, Release, 0)
    AIE.useLock(%29, Release, 0)
    AIE.useLock(%24, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %34 = AIE.mem(%23) {
    %37 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%28, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%32 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %38 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%26, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%31 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%26, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %39 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%27, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%30 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %35 = AIE.tile(26, 1)
  %36 = AIE.switchbox(%35) {
    %37 = AIE.amsel<0> (0)
    %38 = AIE.amsel<0> (1)
    %39 = AIE.amsel<0> (2)
    %40 = AIE.masterset(South : 0, %38)
    %41 = AIE.masterset(North : 0, %39)
    %42 = AIE.masterset(North : 1, %37)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %38)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %37)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %39)
    }
  }
}


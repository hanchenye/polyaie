module @gemm {
  func private @extern_kernel(%acc: memref<32x32xi32>, %C: memref<32x32xi32>, %A: memref<32x32xi32>,%B: memref<32x32xi32>) -> ()
  %0 = AIE.tile(26, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %40 = AIE.amsel<0> (0)
    %41 = AIE.amsel<0> (1)
    %42 = AIE.masterset(South : 2, %41)
    %43 = AIE.masterset(North : 0, %40)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %41)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %40)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %40)
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
  %13 = AIE.shimDMA(%0) {
    %40 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%11 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %41 = AIE.dmaStart(MM2S0, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%7 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    cf.br ^bb3
  ^bb5:  // pred: ^bb2
    %42 = AIE.dmaStart(MM2S1, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%8 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    cf.br ^bb6
  ^bb8:  // pred: ^bb5
    AIE.end
  }
  %16 = AIE.tile(26, 2)
  %17 = AIE.switchbox(%16) {
    %40 = AIE.amsel<0> (0)
    %41 = AIE.amsel<0> (1)
    %42 = AIE.amsel<0> (2)
    %43 = AIE.amsel<0> (3)
    %44 = AIE.masterset(DMA : 0, %42)
    %45 = AIE.masterset(DMA : 1, %43)
    %46 = AIE.masterset(South : 0, %41)
    %47 = AIE.masterset(North : 0, %40)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %41)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %42)
      AIE.rule(27, 1, %40)
      AIE.rule(31, 0, %43)
    }
  }
  %18 = AIE.lock(%16, 1)
  %19 = AIE.lock(%16, 0)
  %20 = AIE.buffer(%16) {sym_name = "buf5"} : memref<32x32xi32>
  %21 = AIE.buffer(%16) {sym_name = "buf6"} : memref<32x32xi32>
  %22 = AIE.buffer(%16) {sym_name = "buf7"} : memref<32x32xi32>
  %23 = AIE.buffer(%16) {sym_name = "buf8"} : memref<32x32xi32>
  %24 = AIE.core(%16) {
    AIE.useLock(%18, Acquire, 1)
    AIE.useLock(%19, Acquire, 1)
    AIE.useLock(%30, Acquire, 0)
    call @extern_kernel(%23, %20, %21, %22) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%30, Release, 1)
    AIE.useLock(%19, Release, 0)
    AIE.useLock(%18, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %25 = AIE.mem(%16) {
    %40 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%19, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%22 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %41 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%18, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%21 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%18, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %26 = AIE.tile(26, 3) {polyaie.leaf}
  %27 = AIE.lock(%26, 15)
  %28 = AIE.switchbox(%26) {
    %40 = AIE.amsel<0> (0)
    %41 = AIE.amsel<0> (1)
    %42 = AIE.amsel<0> (2)
    %43 = AIE.masterset(DMA : 0, %42)
    %44 = AIE.masterset(DMA : 1, %40)
    %45 = AIE.masterset(South : 0, %41)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %41)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %42)
      AIE.rule(31, 1, %40)
    }
  }
  %29 = AIE.lock(%26, 3)
  %30 = AIE.lock(%26, 2)
  %31 = AIE.lock(%26, 1)
  %32 = AIE.lock(%26, 0)
  %33 = AIE.buffer(%26) {sym_name = "buf9"} : memref<32x32xi32>
  %34 = AIE.buffer(%26) {sym_name = "buf10"} : memref<32x32xi32>
  %35 = AIE.buffer(%26) {sym_name = "buf11"} : memref<32x32xi32>
  %36 = AIE.core(%26) {
    AIE.useLock(%31, Acquire, 1)
    AIE.useLock(%29, Acquire, 0)
    AIE.useLock(%32, Acquire, 1)
    AIE.useLock(%30, Acquire, 1)
    call @extern_kernel(%20, %33, %34, %35) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%30, Release, 0)
    AIE.useLock(%32, Release, 0)
    AIE.useLock(%29, Release, 1)
    AIE.useLock(%31, Release, 0)
    AIE.useLock(%27, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %37 = AIE.mem(%26) {
    %40 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%35 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %41 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%31, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%34 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %42 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%29, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%33 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %38 = AIE.tile(26, 1)
  %39 = AIE.switchbox(%38) {
    %40 = AIE.amsel<0> (0)
    %41 = AIE.amsel<0> (1)
    %42 = AIE.masterset(South : 0, %40)
    %43 = AIE.masterset(North : 0, %41)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %40)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(26, 0, %41)
    }
  }
}


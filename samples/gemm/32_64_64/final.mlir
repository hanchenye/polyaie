module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(27, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<0> (1)
    %76 = AIE.masterset(North : 0, %75)
    %77 = AIE.masterset(North : 1, %74)
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %74)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %75)
    }
  }
  %3 = AIE.lock(%0, 1)
  %4 = AIE.lock(%0, 0)
  %5 = AIE.external_buffer 0x020100000000  {sym_name = "buf0"} : memref<32x32xi32>
  %6 = AIE.external_buffer 0x020100001000  {sym_name = "buf1"} : memref<32x32xi32>
  %8 = AIE.shimDMA(%0) {
    %74 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%6 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%5 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb1
  ^bb3:  // pred: ^bb0
    AIE.end
  }
  %9 = AIE.tile(26, 0)
  %10 = AIE.shimmux(%9) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %11 = AIE.switchbox(%9) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<0> (1)
    %76 = AIE.amsel<0> (2)
    %77 = AIE.masterset(South : 2, %75)
    %78 = AIE.masterset(North : 0, %76)
    %79 = AIE.masterset(North : 1, %74)
    %80 = AIE.masterset(East : 0, %74)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %75)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %75)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %74)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %76)
    }
  }
  %12 = AIE.lock(%9, 3)
  %13 = AIE.lock(%9, 2)
  %14 = AIE.lock(%9, 1)
  %15 = AIE.lock(%9, 0)
  %16 = AIE.external_buffer 0x020100002000 {sym_name = "buf2"} : memref<32x32xi32>
  %17 = AIE.external_buffer 0x020100003000 {sym_name = "buf3"} : memref<32x32xi32>
  %18 = AIE.external_buffer 0x020100004000 {sym_name = "buf4"} : memref<32x32xi32>
  %19 = AIE.external_buffer 0x020100005000 {sym_name = "buf5"} : memref<32x32xi32>
  %20 = AIE.external_buffer 0x020100006000 {sym_name = "buf6"} : memref<1025xi32>
  %21 = AIE.external_buffer 0x020100008000 {sym_name = "buf7"} : memref<1025xi32>

  %23 = AIE.shimDMA(%9) {
    %74 = AIE.dmaStart(S2MM0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%20 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%21 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb1
  ^bb3:  // pred: ^bb0
    %75 = AIE.dmaStart(MM2S0, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%14, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%18 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%14, Release, 0)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%13, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%16 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%13, Release, 0)
    br ^bb4
  ^bb6:  // pred: ^bb3
    %76 = AIE.dmaStart(MM2S1, ^bb7, ^bb9)
  ^bb7:  // 2 preds: ^bb6, ^bb8
    AIE.useLock(%12, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%19 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%12, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%15, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%17 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%15, Release, 0)
    br ^bb7
  ^bb9:  // pred: ^bb6
    AIE.end
  }
  %26 = AIE.tile(26, 2)
  %27 = AIE.switchbox(%26) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<1> (0)
    %76 = AIE.amsel<0> (1)
    %77 = AIE.amsel<1> (1)
    %78 = AIE.amsel<0> (2)
    %79 = AIE.amsel<0> (3)
    %80 = AIE.masterset(DMA : 0, %75)
    %81 = AIE.masterset(DMA : 1, %74)
    %82 = AIE.masterset(South : 0, %78)
    %83 = AIE.masterset(South : 1, %77)
    %84 = AIE.masterset(North : 0, %79)
    %85 = AIE.masterset(North : 1, %76)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %77)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %78)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %74)
      AIE.rule(31, 1, %76)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %75)
      AIE.rule(31, 5, %79)
    }
  }
  %28 = AIE.lock(%26, 1)
  %29 = AIE.lock(%26, 0)
  %30 = AIE.buffer(%26) {sym_name = "buf8"} : memref<32x32xi32>
  %31 = AIE.buffer(%26) {sym_name = "buf9"} : memref<32x32xi32>
  %32 = AIE.buffer(%26) {sym_name = "buf10"} : memref<32x32xi32>
  %33 = AIE.buffer(%26) {sym_name = "buf11"} : memref<32x32xi32>
  %34 = AIE.core(%26) {
    AIE.useLock(%29, Acquire, 1)
    AIE.useLock(%28, Acquire, 1)
    AIE.useLock(%42, Acquire, 0)
    call @extern_kernel(%33, %30, %31, %32) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%42, Release, 1)
    AIE.useLock(%28, Release, 0)
    AIE.useLock(%29, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %35 = AIE.mem(%26) {
    %74 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%28, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%32 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %75 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%29, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%31 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %36 = AIE.tile(26, 3) {polyaie.leaf}
  %37 = AIE.lock(%36, 15)
  %38 = AIE.switchbox(%36) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<0> (1)
    %76 = AIE.amsel<0> (2)
    %77 = AIE.amsel<0> (3)
    %78 = AIE.masterset(DMA : 0, %75)
    %79 = AIE.masterset(DMA : 1, %76)
    %80 = AIE.masterset(South : 0, %77)
    %81 = AIE.masterset(South : 1, %74)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %74)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %77)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %75)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %76)
    }
  }
  %39 = AIE.lock(%36, 3)
  %40 = AIE.lock(%36, 2)
  %41 = AIE.lock(%36, 1)
  %42 = AIE.lock(%36, 0)
  %43 = AIE.buffer(%36) {sym_name = "buf12"} : memref<32x32xi32>
  %44 = AIE.buffer(%36) {sym_name = "buf13"} : memref<32x32xi32>
  %45 = AIE.buffer(%36) {sym_name = "buf14"} : memref<32x32xi32>
  %46 = AIE.core(%36) {
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%41, Acquire, 1)
    AIE.useLock(%39, Acquire, 1)
    AIE.useLock(%40, Acquire, 0)
    call @extern_kernel(%30, %43, %44, %45) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%40, Release, 1)
    AIE.useLock(%39, Release, 0)
    AIE.useLock(%41, Release, 0)
    AIE.useLock(%42, Release, 0)
    AIE.useLock(%37, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %47 = AIE.mem(%36) {
    %74 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%39, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%44 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%39, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %75 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%41, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%45 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%41, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %76 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%40, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%43 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%40, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %48 = AIE.tile(27, 2)
  %49 = AIE.switchbox(%48) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<0> (1)
    %76 = AIE.amsel<0> (2)
    %77 = AIE.amsel<0> (3)
    %78 = AIE.masterset(DMA : 0, %74)
    %79 = AIE.masterset(DMA : 1, %77)
    %80 = AIE.masterset(North : 0, %75)
    %81 = AIE.masterset(North : 1, %76)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %77)
      AIE.rule(31, 1, %76)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %74)
      AIE.rule(31, 5, %75)
    }
  }
  %50 = AIE.lock(%48, 1)
  %51 = AIE.lock(%48, 0)
  %52 = AIE.buffer(%48) {sym_name = "buf15"} : memref<32x32xi32>
  %53 = AIE.buffer(%48) {sym_name = "buf16"} : memref<32x32xi32>
  %54 = AIE.buffer(%48) {sym_name = "buf17"} : memref<32x32xi32>
  %55 = AIE.buffer(%48) {sym_name = "buf18"} : memref<32x32xi32>
  %56 = AIE.core(%48) {
    AIE.useLock(%62, Acquire, 0)
    AIE.useLock(%51, Acquire, 1)
    AIE.useLock(%50, Acquire, 1)
    call @extern_kernel(%55, %52, %53, %54) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%50, Release, 0)
    AIE.useLock(%51, Release, 0)
    AIE.useLock(%62, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %57 = AIE.mem(%48) {
    %74 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%50, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%54 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %75 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%51, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%53 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%51, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %58 = AIE.tile(27, 3) {polyaie.leaf}
  %59 = AIE.lock(%58, 15)
  %60 = AIE.switchbox(%58) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<0> (1)
    %76 = AIE.amsel<0> (2)
    %77 = AIE.masterset(DMA : 0, %75)
    %78 = AIE.masterset(DMA : 1, %76)
    %79 = AIE.masterset(West : 0, %74)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %74)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %76)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %75)
    }
  }
  %61 = AIE.lock(%58, 3)
  %62 = AIE.lock(%58, 2)
  %63 = AIE.lock(%58, 1)
  %64 = AIE.lock(%58, 0)
  %65 = AIE.buffer(%58) {sym_name = "buf19"} : memref<32x32xi32>
  %66 = AIE.buffer(%58) {sym_name = "buf20"} : memref<32x32xi32>
  %67 = AIE.buffer(%58) {sym_name = "buf21"} : memref<32x32xi32>
  %68 = AIE.core(%58) {
    AIE.useLock(%62, Acquire, 1)
    AIE.useLock(%61, Acquire, 1)
    AIE.useLock(%63, Acquire, 0)
    AIE.useLock(%64, Acquire, 1)
    call @extern_kernel(%52, %65, %66, %67) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%64, Release, 0)
    AIE.useLock(%63, Release, 1)
    AIE.useLock(%61, Release, 0)
    AIE.useLock(%62, Release, 0)
    AIE.useLock(%59, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %69 = AIE.mem(%58) {
    %74 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%64, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%67 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%64, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %75 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%61, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%66 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%61, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %76 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%63, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%65 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%63, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %70 = AIE.tile(27, 1)
  %71 = AIE.switchbox(%70) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<0> (1)
    %76 = AIE.masterset(North : 0, %75)
    %77 = AIE.masterset(North : 1, %74)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %74)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %75)
    }
  }
  %72 = AIE.tile(26, 1)
  %73 = AIE.switchbox(%72) {
    %74 = AIE.amsel<0> (0)
    %75 = AIE.amsel<0> (1)
    %76 = AIE.amsel<0> (2)
    %77 = AIE.amsel<0> (3)
    %78 = AIE.masterset(South : 0, %74)
    %79 = AIE.masterset(South : 1, %76)
    %80 = AIE.masterset(North : 0, %77)
    %81 = AIE.masterset(North : 1, %75)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %76)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %74)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %75)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %77)
    }
  }
}


module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
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
  %3 = AIE.lock(%0, 3)
  %4 = AIE.lock(%0, 2)
  %5 = AIE.lock(%0, 1)
  %6 = AIE.lock(%0, 0)
  %7 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xi32>
  %8 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xi32>
  %9 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xi32>
  %10 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xi32>

  %12 = AIE.shimDMA(%0) {
    %132 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%7 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    br ^bb1
  ^bb3:  // pred: ^bb0
    %133 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%8 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb4
  ^bb6:  // pred: ^bb3
    AIE.end
  }
  %13 = AIE.tile(11, 0)
  %14 = AIE.shimmux(%13) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %15 = AIE.switchbox(%13) {
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
  %16 = AIE.lock(%13, 3)
  %17 = AIE.lock(%13, 2)
  %18 = AIE.lock(%13, 1)
  %19 = AIE.lock(%13, 0)
  %20 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xi32>
  %21 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xi32>
  %22 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xi32>
  %23 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xi32>
  %24 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<1025xi32>
  %25 = AIE.external_buffer 57344 {sym_name = "buf9"} : memref<1025xi32>
  %26 = AIE.external_buffer 65536 {sym_name = "buf10"} : memref<1025xi32>
  %27 = AIE.external_buffer 73728 {sym_name = "buf11"} : memref<1025xi32>

  %29 = AIE.shimDMA(%13) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%24 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%25 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%26 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%27 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %133 = AIE.dmaStart(MM2S0, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%16, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%23 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%16, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%18, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%22 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%18, Release, 0)
    br ^bb6
  ^bb8:  // pred: ^bb5
    %134 = AIE.dmaStart(MM2S1, ^bb9, ^bb11)
  ^bb9:  // 2 preds: ^bb8, ^bb10
    AIE.useLock(%19, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%21 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 0)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%17, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%20 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%17, Release, 0)
    br ^bb9
  ^bb11:  // pred: ^bb8
    AIE.end
  }
  %32 = AIE.tile(10, 2)
  %33 = AIE.switchbox(%32) {
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
  %34 = AIE.lock(%32, 1)
  %35 = AIE.lock(%32, 0)
  %36 = AIE.buffer(%32) {sym_name = "buf12"} : memref<32x32xi32>
  %37 = AIE.buffer(%32) {sym_name = "buf13"} : memref<32x32xi32>
  %38 = AIE.buffer(%32) {sym_name = "buf14"} : memref<32x32xi32>
  %39 = AIE.buffer(%32) {sym_name = "buf15"} : memref<32x32xi32>
  %40 = AIE.core(%32) {
    AIE.useLock(%46, Acquire, 0)
    AIE.useLock(%35, Acquire, 1)
    AIE.useLock(%34, Acquire, 1)
    call @extern_kernel(%39, %36, %37, %38) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%34, Release, 0)
    AIE.useLock(%35, Release, 0)
    AIE.useLock(%46, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %41 = AIE.mem(%32) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%34, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%38 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%35, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%37 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %42 = AIE.tile(10, 3) {polyaie.leaf}
  %43 = AIE.lock(%42, 15)
  %44 = AIE.switchbox(%42) {
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
  %45 = AIE.lock(%42, 3)
  %46 = AIE.lock(%42, 2)
  %47 = AIE.lock(%42, 1)
  %48 = AIE.lock(%42, 0)
  %49 = AIE.buffer(%42) {sym_name = "buf16"} : memref<32x32xi32>
  %50 = AIE.buffer(%42) {sym_name = "buf17"} : memref<32x32xi32>
  %51 = AIE.buffer(%42) {sym_name = "buf18"} : memref<32x32xi32>
  %52 = AIE.core(%42) {
    AIE.useLock(%45, Acquire, 1)
    AIE.useLock(%48, Acquire, 0)
    AIE.useLock(%46, Acquire, 1)
    AIE.useLock(%47, Acquire, 1)
    call @extern_kernel(%36, %49, %50, %51) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%47, Release, 0)
    AIE.useLock(%46, Release, 0)
    AIE.useLock(%48, Release, 1)
    AIE.useLock(%45, Release, 0)
    AIE.useLock(%43, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %53 = AIE.mem(%42) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%47, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%51 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%45, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%50 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%48, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%49 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %54 = AIE.tile(11, 2)
  %55 = AIE.switchbox(%54) {
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
  %56 = AIE.lock(%54, 1)
  %57 = AIE.lock(%54, 0)
  %58 = AIE.buffer(%54) {sym_name = "buf19"} : memref<32x32xi32>
  %59 = AIE.buffer(%54) {sym_name = "buf20"} : memref<32x32xi32>
  %60 = AIE.buffer(%54) {sym_name = "buf21"} : memref<32x32xi32>
  %61 = AIE.buffer(%54) {sym_name = "buf22"} : memref<32x32xi32>
  %62 = AIE.core(%54) {
    AIE.useLock(%56, Acquire, 1)
    AIE.useLock(%57, Acquire, 1)
    AIE.useLock(%70, Acquire, 0)
    call @extern_kernel(%61, %58, %59, %60) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%70, Release, 1)
    AIE.useLock(%57, Release, 0)
    AIE.useLock(%56, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %63 = AIE.mem(%54) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%57, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%59 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%56, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%60 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%56, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %64 = AIE.tile(11, 3) {polyaie.leaf}
  %65 = AIE.lock(%64, 15)
  %66 = AIE.switchbox(%64) {
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
  %67 = AIE.lock(%64, 3)
  %68 = AIE.lock(%64, 2)
  %69 = AIE.lock(%64, 1)
  %70 = AIE.lock(%64, 0)
  %71 = AIE.buffer(%64) {sym_name = "buf23"} : memref<32x32xi32>
  %72 = AIE.buffer(%64) {sym_name = "buf24"} : memref<32x32xi32>
  %73 = AIE.buffer(%64) {sym_name = "buf25"} : memref<32x32xi32>
  %74 = AIE.core(%64) {
    AIE.useLock(%67, Acquire, 1)
    AIE.useLock(%68, Acquire, 1)
    AIE.useLock(%70, Acquire, 1)
    AIE.useLock(%69, Acquire, 0)
    call @extern_kernel(%58, %71, %72, %73) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%69, Release, 1)
    AIE.useLock(%70, Release, 0)
    AIE.useLock(%68, Release, 0)
    AIE.useLock(%67, Release, 0)
    AIE.useLock(%65, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %75 = AIE.mem(%64) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%68, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%73 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%68, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%67, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%72 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%67, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%69, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%71 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%69, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %76 = AIE.tile(12, 2)
  %77 = AIE.switchbox(%76) {
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
  %78 = AIE.lock(%76, 1)
  %79 = AIE.lock(%76, 0)
  %80 = AIE.buffer(%76) {sym_name = "buf26"} : memref<32x32xi32>
  %81 = AIE.buffer(%76) {sym_name = "buf27"} : memref<32x32xi32>
  %82 = AIE.buffer(%76) {sym_name = "buf28"} : memref<32x32xi32>
  %83 = AIE.buffer(%76) {sym_name = "buf29"} : memref<32x32xi32>
  %84 = AIE.core(%76) {
    AIE.useLock(%78, Acquire, 1)
    AIE.useLock(%90, Acquire, 0)
    AIE.useLock(%79, Acquire, 1)
    call @extern_kernel(%83, %80, %81, %82) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%79, Release, 0)
    AIE.useLock(%90, Release, 1)
    AIE.useLock(%78, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %85 = AIE.mem(%76) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%82 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%78, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%81 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%78, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %86 = AIE.tile(12, 3) {polyaie.leaf}
  %87 = AIE.lock(%86, 15)
  %88 = AIE.switchbox(%86) {
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
  %89 = AIE.lock(%86, 3)
  %90 = AIE.lock(%86, 2)
  %91 = AIE.lock(%86, 1)
  %92 = AIE.lock(%86, 0)
  %93 = AIE.buffer(%86) {sym_name = "buf30"} : memref<32x32xi32>
  %94 = AIE.buffer(%86) {sym_name = "buf31"} : memref<32x32xi32>
  %95 = AIE.buffer(%86) {sym_name = "bui32"} : memref<32x32xi32>
  %96 = AIE.core(%86) {
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%90, Acquire, 1)
    AIE.useLock(%91, Acquire, 0)
    AIE.useLock(%92, Acquire, 1)
    call @extern_kernel(%80, %93, %94, %95) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%92, Release, 0)
    AIE.useLock(%91, Release, 1)
    AIE.useLock(%90, Release, 0)
    AIE.useLock(%89, Release, 0)
    AIE.useLock(%87, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %97 = AIE.mem(%86) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%92, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%95 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%92, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%89, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%94 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%89, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%91, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%93 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%91, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %98 = AIE.tile(13, 2)
  %99 = AIE.switchbox(%98) {
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
  %100 = AIE.lock(%98, 1)
  %101 = AIE.lock(%98, 0)
  %102 = AIE.buffer(%98) {sym_name = "buf33"} : memref<32x32xi32>
  %103 = AIE.buffer(%98) {sym_name = "buf34"} : memref<32x32xi32>
  %104 = AIE.buffer(%98) {sym_name = "buf35"} : memref<32x32xi32>
  %105 = AIE.buffer(%98) {sym_name = "buf36"} : memref<32x32xi32>
  %106 = AIE.core(%98) {
    AIE.useLock(%101, Acquire, 1)
    AIE.useLock(%100, Acquire, 1)
    AIE.useLock(%113, Acquire, 0)
    call @extern_kernel(%105, %102, %103, %104) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%113, Release, 1)
    AIE.useLock(%100, Release, 0)
    AIE.useLock(%101, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %107 = AIE.mem(%98) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%100, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%104 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%100, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%101, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%103 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%101, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %108 = AIE.tile(13, 3) {polyaie.leaf}
  %109 = AIE.lock(%108, 15)
  %110 = AIE.switchbox(%108) {
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
  %111 = AIE.lock(%108, 3)
  %112 = AIE.lock(%108, 2)
  %113 = AIE.lock(%108, 1)
  %114 = AIE.lock(%108, 0)
  %115 = AIE.buffer(%108) {sym_name = "buf37"} : memref<32x32xi32>
  %116 = AIE.buffer(%108) {sym_name = "buf38"} : memref<32x32xi32>
  %117 = AIE.buffer(%108) {sym_name = "buf39"} : memref<32x32xi32>
  %118 = AIE.core(%108) {
    AIE.useLock(%111, Acquire, 1)
    AIE.useLock(%112, Acquire, 1)
    AIE.useLock(%113, Acquire, 1)
    AIE.useLock(%114, Acquire, 0)
    call @extern_kernel(%102, %115, %116, %117) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%114, Release, 1)
    AIE.useLock(%113, Release, 0)
    AIE.useLock(%112, Release, 0)
    AIE.useLock(%111, Release, 0)
    AIE.useLock(%109, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %119 = AIE.mem(%108) {
    %132 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%112, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%117 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%112, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %133 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%111, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%116 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%111, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %134 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%114, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%115 : memref<32x32xi32>, 0, 1024>, 0)
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


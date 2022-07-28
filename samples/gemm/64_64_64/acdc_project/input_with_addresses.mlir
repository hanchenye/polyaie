module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.masterset(North : 0, %129)
    %131 = AIE.masterset(North : 1, %128)
    %132 = AIE.masterset(East : 0, %129)
    %133 = AIE.masterset(East : 1, %128)
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %128)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %129)
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
  %11 = AIE.shimDMA(%0) {
    %128 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%7 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    cf.br ^bb1
  ^bb3:  // pred: ^bb0
    %129 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%8 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    cf.br ^bb4
  ^bb6:  // pred: ^bb3
    AIE.end
  }
  %12 = AIE.tile(11, 0)
  %13 = AIE.shimmux(%12) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %14 = AIE.switchbox(%12) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<1> (0)
    %130 = AIE.amsel<0> (1)
    %131 = AIE.amsel<0> (2)
    %132 = AIE.amsel<0> (3)
    %133 = AIE.masterset(South : 2, %130)
    %134 = AIE.masterset(North : 0, %128)
    %135 = AIE.masterset(North : 1, %132)
    %136 = AIE.masterset(East : 0, %131)
    %137 = AIE.masterset(East : 1, %129)
    %138 = AIE.masterset(East : 2, %132)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %130)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %130)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %130)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %130)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %132)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 0, %129)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %131)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %128)
    }
  }
  %15 = AIE.lock(%12, 3)
  %16 = AIE.lock(%12, 2)
  %17 = AIE.lock(%12, 1)
  %18 = AIE.lock(%12, 0)
  %19 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xi32>
  %20 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xi32>
  %21 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xi32>
  %22 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xi32>
  %23 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<1025xi32>
  %24 = AIE.external_buffer 57344 {sym_name = "buf9"} : memref<1025xi32>
  %25 = AIE.external_buffer 65536 {sym_name = "buf10"} : memref<1025xi32>
  %26 = AIE.external_buffer 73728 {sym_name = "buf11"} : memref<1025xi32>
  %27 = AIE.shimDMA(%12) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%23 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%24 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%25 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%26 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb5:  // pred: ^bb0
    %129 = AIE.dmaStart(MM2S0, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%15, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%22 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%15, Release, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%17, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%21 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%17, Release, 0)
    cf.br ^bb6
  ^bb8:  // pred: ^bb5
    %130 = AIE.dmaStart(MM2S1, ^bb9, ^bb11)
  ^bb9:  // 2 preds: ^bb8, ^bb10
    AIE.useLock(%18, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%20 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%18, Release, 0)
    cf.br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%16, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%19 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%16, Release, 0)
    cf.br ^bb9
  ^bb11:  // pred: ^bb8
    AIE.end
  }
  %28 = AIE.tile(10, 2)
  %29 = AIE.switchbox(%28) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.amsel<0> (2)
    %131 = AIE.amsel<0> (3)
    %132 = AIE.masterset(DMA : 0, %129)
    %133 = AIE.masterset(DMA : 1, %128)
    %134 = AIE.masterset(North : 0, %131)
    %135 = AIE.masterset(North : 1, %130)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %129)
      AIE.rule(31, 5, %130)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %128)
      AIE.rule(31, 1, %131)
    }
  }
  %30 = AIE.lock(%28, 1)
  %31 = AIE.lock(%28, 0)
  %32 = AIE.buffer(%28) {address = 4096 : i32, sym_name = "buf12"} : memref<32x32xi32>
  %33 = AIE.buffer(%28) {address = 8192 : i32, sym_name = "buf13"} : memref<32x32xi32>
  %34 = AIE.buffer(%28) {address = 12288 : i32, sym_name = "buf14"} : memref<32x32xi32>
  %35 = AIE.buffer(%28) {address = 16384 : i32, sym_name = "buf15"} : memref<32x32xi32>
  %36 = AIE.core(%28) {
    AIE.useLock(%42, Acquire, 0)
    AIE.useLock(%31, Acquire, 1)
    AIE.useLock(%30, Acquire, 1)
    call @extern_kernel(%35, %32, %33, %34) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%30, Release, 0)
    AIE.useLock(%31, Release, 0)
    AIE.useLock(%42, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %37 = AIE.mem(%28) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%30, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%34 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%31, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%33 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %38 = AIE.tile(10, 3) {polyaie.leaf}
  %39 = AIE.lock(%38, 15)
  %40 = AIE.switchbox(%38) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.amsel<0> (2)
    %131 = AIE.masterset(DMA : 0, %130)
    %132 = AIE.masterset(DMA : 1, %128)
    %133 = AIE.masterset(East : 0, %129)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %129)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %130)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %128)
    }
  }
  %41 = AIE.lock(%38, 3)
  %42 = AIE.lock(%38, 2)
  %43 = AIE.lock(%38, 1)
  %44 = AIE.lock(%38, 0)
  %45 = AIE.buffer(%38) {address = 4096 : i32, sym_name = "buf16"} : memref<32x32xi32>
  %46 = AIE.buffer(%38) {address = 8192 : i32, sym_name = "buf17"} : memref<32x32xi32>
  %47 = AIE.buffer(%38) {address = 12288 : i32, sym_name = "buf18"} : memref<32x32xi32>
  %48 = AIE.core(%38) {
    AIE.useLock(%41, Acquire, 1)
    AIE.useLock(%44, Acquire, 0)
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%43, Acquire, 1)
    call @extern_kernel(%32, %45, %46, %47) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%43, Release, 0)
    AIE.useLock(%42, Release, 0)
    AIE.useLock(%44, Release, 1)
    AIE.useLock(%41, Release, 0)
    AIE.useLock(%39, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %49 = AIE.mem(%38) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%43, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%47 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%41, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%46 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%41, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %130 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%44, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%45 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %50 = AIE.tile(11, 2)
  %51 = AIE.switchbox(%50) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<1> (0)
    %130 = AIE.amsel<0> (1)
    %131 = AIE.amsel<1> (1)
    %132 = AIE.amsel<0> (2)
    %133 = AIE.amsel<1> (2)
    %134 = AIE.amsel<0> (3)
    %135 = AIE.amsel<1> (3)
    %136 = AIE.masterset(DMA : 0, %134)
    %137 = AIE.masterset(DMA : 1, %130)
    %138 = AIE.masterset(South : 0, %132)
    %139 = AIE.masterset(South : 1, %128)
    %140 = AIE.masterset(South : 2, %135)
    %141 = AIE.masterset(South : 3, %131)
    %142 = AIE.masterset(North : 0, %133)
    %143 = AIE.masterset(North : 1, %129)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %131)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %135)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %128)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %132)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %130)
      AIE.rule(31, 5, %129)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %134)
      AIE.rule(31, 1, %133)
    }
  }
  %52 = AIE.lock(%50, 1)
  %53 = AIE.lock(%50, 0)
  %54 = AIE.buffer(%50) {address = 4096 : i32, sym_name = "buf19"} : memref<32x32xi32>
  %55 = AIE.buffer(%50) {address = 8192 : i32, sym_name = "buf20"} : memref<32x32xi32>
  %56 = AIE.buffer(%50) {address = 12288 : i32, sym_name = "buf21"} : memref<32x32xi32>
  %57 = AIE.buffer(%50) {address = 16384 : i32, sym_name = "buf22"} : memref<32x32xi32>
  %58 = AIE.core(%50) {
    AIE.useLock(%52, Acquire, 1)
    AIE.useLock(%53, Acquire, 1)
    AIE.useLock(%66, Acquire, 0)
    call @extern_kernel(%57, %54, %55, %56) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%66, Release, 1)
    AIE.useLock(%53, Release, 0)
    AIE.useLock(%52, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %59 = AIE.mem(%50) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%53, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%55 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%52, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%56 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %60 = AIE.tile(11, 3) {polyaie.leaf}
  %61 = AIE.lock(%60, 15)
  %62 = AIE.switchbox(%60) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<1> (0)
    %130 = AIE.amsel<0> (1)
    %131 = AIE.amsel<1> (1)
    %132 = AIE.amsel<0> (2)
    %133 = AIE.amsel<0> (3)
    %134 = AIE.masterset(DMA : 0, %133)
    %135 = AIE.masterset(DMA : 1, %130)
    %136 = AIE.masterset(South : 0, %128)
    %137 = AIE.masterset(South : 1, %132)
    %138 = AIE.masterset(South : 2, %129)
    %139 = AIE.masterset(South : 3, %131)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %131)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %129)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %132)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %128)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %133)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %130)
    }
  }
  %63 = AIE.lock(%60, 3)
  %64 = AIE.lock(%60, 2)
  %65 = AIE.lock(%60, 1)
  %66 = AIE.lock(%60, 0)
  %67 = AIE.buffer(%60) {address = 4096 : i32, sym_name = "buf23"} : memref<32x32xi32>
  %68 = AIE.buffer(%60) {address = 8192 : i32, sym_name = "buf24"} : memref<32x32xi32>
  %69 = AIE.buffer(%60) {address = 12288 : i32, sym_name = "buf25"} : memref<32x32xi32>
  %70 = AIE.core(%60) {
    AIE.useLock(%63, Acquire, 1)
    AIE.useLock(%64, Acquire, 1)
    AIE.useLock(%66, Acquire, 1)
    AIE.useLock(%65, Acquire, 0)
    call @extern_kernel(%54, %67, %68, %69) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%65, Release, 1)
    AIE.useLock(%66, Release, 0)
    AIE.useLock(%64, Release, 0)
    AIE.useLock(%63, Release, 0)
    AIE.useLock(%61, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %71 = AIE.mem(%60) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%64, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%69 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%64, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%63, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%68 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%63, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %130 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%65, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%67 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%65, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %72 = AIE.tile(12, 2)
  %73 = AIE.switchbox(%72) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.amsel<0> (2)
    %131 = AIE.amsel<0> (3)
    %132 = AIE.masterset(DMA : 0, %129)
    %133 = AIE.masterset(DMA : 1, %131)
    %134 = AIE.masterset(North : 0, %130)
    %135 = AIE.masterset(North : 1, %128)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %131)
      AIE.rule(31, 1, %128)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %129)
      AIE.rule(31, 5, %130)
    }
  }
  %74 = AIE.lock(%72, 1)
  %75 = AIE.lock(%72, 0)
  %76 = AIE.buffer(%72) {address = 4096 : i32, sym_name = "buf26"} : memref<32x32xi32>
  %77 = AIE.buffer(%72) {address = 8192 : i32, sym_name = "buf27"} : memref<32x32xi32>
  %78 = AIE.buffer(%72) {address = 12288 : i32, sym_name = "buf28"} : memref<32x32xi32>
  %79 = AIE.buffer(%72) {address = 16384 : i32, sym_name = "buf29"} : memref<32x32xi32>
  %80 = AIE.core(%72) {
    AIE.useLock(%74, Acquire, 1)
    AIE.useLock(%86, Acquire, 0)
    AIE.useLock(%75, Acquire, 1)
    call @extern_kernel(%79, %76, %77, %78) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%75, Release, 0)
    AIE.useLock(%86, Release, 1)
    AIE.useLock(%74, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %81 = AIE.mem(%72) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%75, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%78 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%75, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%74, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%77 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%74, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %82 = AIE.tile(12, 3) {polyaie.leaf}
  %83 = AIE.lock(%82, 15)
  %84 = AIE.switchbox(%82) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.amsel<0> (2)
    %131 = AIE.amsel<0> (3)
    %132 = AIE.masterset(DMA : 0, %128)
    %133 = AIE.masterset(DMA : 1, %131)
    %134 = AIE.masterset(West : 0, %129)
    %135 = AIE.masterset(West : 1, %130)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %130)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %129)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %131)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %128)
    }
  }
  %85 = AIE.lock(%82, 3)
  %86 = AIE.lock(%82, 2)
  %87 = AIE.lock(%82, 1)
  %88 = AIE.lock(%82, 0)
  %89 = AIE.buffer(%82) {address = 4096 : i32, sym_name = "buf30"} : memref<32x32xi32>
  %90 = AIE.buffer(%82) {address = 8192 : i32, sym_name = "buf31"} : memref<32x32xi32>
  %91 = AIE.buffer(%82) {address = 12288 : i32, sym_name = "bui32"} : memref<32x32xi32>
  %92 = AIE.core(%82) {
    AIE.useLock(%85, Acquire, 1)
    AIE.useLock(%86, Acquire, 1)
    AIE.useLock(%87, Acquire, 0)
    AIE.useLock(%88, Acquire, 1)
    call @extern_kernel(%76, %89, %90, %91) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%88, Release, 0)
    AIE.useLock(%87, Release, 1)
    AIE.useLock(%86, Release, 0)
    AIE.useLock(%85, Release, 0)
    AIE.useLock(%83, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %93 = AIE.mem(%82) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%88, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%91 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%85, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%90 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%85, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %130 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%87, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%89 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%87, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %94 = AIE.tile(13, 2)
  %95 = AIE.switchbox(%94) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.amsel<0> (2)
    %131 = AIE.amsel<0> (3)
    %132 = AIE.masterset(DMA : 0, %129)
    %133 = AIE.masterset(DMA : 1, %131)
    %134 = AIE.masterset(North : 0, %130)
    %135 = AIE.masterset(North : 1, %128)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %129)
      AIE.rule(31, 5, %128)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %131)
      AIE.rule(31, 1, %130)
    }
  }
  %96 = AIE.lock(%94, 1)
  %97 = AIE.lock(%94, 0)
  %98 = AIE.buffer(%94) {address = 4096 : i32, sym_name = "buf33"} : memref<32x32xi32>
  %99 = AIE.buffer(%94) {address = 8192 : i32, sym_name = "buf34"} : memref<32x32xi32>
  %100 = AIE.buffer(%94) {address = 12288 : i32, sym_name = "buf35"} : memref<32x32xi32>
  %101 = AIE.buffer(%94) {address = 16384 : i32, sym_name = "buf36"} : memref<32x32xi32>
  %102 = AIE.core(%94) {
    AIE.useLock(%97, Acquire, 1)
    AIE.useLock(%96, Acquire, 1)
    AIE.useLock(%109, Acquire, 0)
    call @extern_kernel(%101, %98, %99, %100) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%109, Release, 1)
    AIE.useLock(%96, Release, 0)
    AIE.useLock(%97, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %103 = AIE.mem(%94) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%96, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%100 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%96, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%97, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%99 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%97, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %104 = AIE.tile(13, 3) {polyaie.leaf}
  %105 = AIE.lock(%104, 15)
  %106 = AIE.switchbox(%104) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.amsel<0> (2)
    %131 = AIE.masterset(DMA : 0, %129)
    %132 = AIE.masterset(DMA : 1, %130)
    %133 = AIE.masterset(West : 0, %128)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %128)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %129)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %130)
    }
  }
  %107 = AIE.lock(%104, 3)
  %108 = AIE.lock(%104, 2)
  %109 = AIE.lock(%104, 1)
  %110 = AIE.lock(%104, 0)
  %111 = AIE.buffer(%104) {address = 4096 : i32, sym_name = "buf37"} : memref<32x32xi32>
  %112 = AIE.buffer(%104) {address = 8192 : i32, sym_name = "buf38"} : memref<32x32xi32>
  %113 = AIE.buffer(%104) {address = 12288 : i32, sym_name = "buf39"} : memref<32x32xi32>
  %114 = AIE.core(%104) {
    AIE.useLock(%107, Acquire, 1)
    AIE.useLock(%108, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    AIE.useLock(%110, Acquire, 0)
    call @extern_kernel(%98, %111, %112, %113) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%110, Release, 1)
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%108, Release, 0)
    AIE.useLock(%107, Release, 0)
    AIE.useLock(%105, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %115 = AIE.mem(%104) {
    %128 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%108, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%113 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %129 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%107, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%112 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%107, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %130 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%110, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%111 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%110, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %116 = AIE.tile(12, 0)
  %117 = AIE.switchbox(%116) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.amsel<0> (2)
    %131 = AIE.masterset(North : 0, %129)
    %132 = AIE.masterset(North : 1, %128)
    %133 = AIE.masterset(East : 0, %128)
    %134 = AIE.masterset(East : 1, %130)
    AIE.packetrules(West : 2) {
      AIE.rule(30, 4, %130)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 0, %128)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 4, %129)
    }
  }
  %118 = AIE.tile(13, 0)
  %119 = AIE.switchbox(%118) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.masterset(North : 0, %129)
    %131 = AIE.masterset(North : 1, %128)
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %128)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %129)
    }
  }
  %120 = AIE.tile(12, 1)
  %121 = AIE.switchbox(%120) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.masterset(North : 0, %128)
    %131 = AIE.masterset(North : 1, %129)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %129)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %128)
    }
  }
  %122 = AIE.tile(11, 1)
  %123 = AIE.switchbox(%122) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<1> (0)
    %130 = AIE.amsel<0> (1)
    %131 = AIE.amsel<1> (1)
    %132 = AIE.amsel<0> (2)
    %133 = AIE.amsel<0> (3)
    %134 = AIE.masterset(South : 0, %133)
    %135 = AIE.masterset(South : 1, %131)
    %136 = AIE.masterset(South : 2, %132)
    %137 = AIE.masterset(South : 3, %129)
    %138 = AIE.masterset(North : 0, %128)
    %139 = AIE.masterset(North : 1, %130)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %129)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %132)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %131)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %133)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %130)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %128)
    }
  }
  %124 = AIE.tile(13, 1)
  %125 = AIE.switchbox(%124) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.masterset(North : 0, %129)
    %131 = AIE.masterset(North : 1, %128)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %128)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %129)
    }
  }
  %126 = AIE.tile(10, 1)
  %127 = AIE.switchbox(%126) {
    %128 = AIE.amsel<0> (0)
    %129 = AIE.amsel<0> (1)
    %130 = AIE.masterset(North : 0, %129)
    %131 = AIE.masterset(North : 1, %128)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %128)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %129)
    }
  }
}


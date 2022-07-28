module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %2 = AIE.switchbox(%0) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.masterset(North : 0, %144)
    %146 = AIE.masterset(North : 1, %143)
    %147 = AIE.masterset(East : 0, %143)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %143)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %144)
    }
  }
  %3 = AIE.lock(%0, 5)
  %4 = AIE.lock(%0, 4)
  %5 = AIE.lock(%0, 3)
  %6 = AIE.lock(%0, 2)
  %7 = AIE.lock(%0, 1)
  %8 = AIE.lock(%0, 0)
  %9 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xi32>
  %10 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xi32>
  %11 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xi32>
  %12 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xi32>
  %13 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xi32>
  %14 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xi32>
  %16 = AIE.shimDMA(%0) {
    %143 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%13 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%11 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %144 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%14 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%12 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  %17 = AIE.tile(11, 0)
  %18 = AIE.shimmux(%17) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %19 = AIE.switchbox(%17) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.amsel<0> (2)
    %146 = AIE.amsel<0> (3)
    %147 = AIE.masterset(South : 2, %143)
    %148 = AIE.masterset(North : 0, %144)
    %149 = AIE.masterset(North : 1, %146)
    %150 = AIE.masterset(East : 0, %144)
    %151 = AIE.masterset(East : 1, %145)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %143)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %143)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %143)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %146)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %145)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %144)
    }
  }
  %20 = AIE.lock(%17, 5)
  %21 = AIE.lock(%17, 4)
  %22 = AIE.lock(%17, 3)
  %23 = AIE.lock(%17, 2)
  %24 = AIE.lock(%17, 1)
  %25 = AIE.lock(%17, 0)
  %26 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xi32>
  %27 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xi32>
  %28 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<32x32xi32>
  %29 = AIE.external_buffer 53248 {sym_name = "buf9"} : memref<32x32xi32>
  %30 = AIE.external_buffer 57344 {sym_name = "buf10"} : memref<32x32xi32>
  %31 = AIE.external_buffer 61440 {sym_name = "buf11"} : memref<32x32xi32>
  %32 = AIE.external_buffer 65536 {sym_name = "buf12"} : memref<1025xi32>
  %33 = AIE.external_buffer 73728 {sym_name = "buf13"} : memref<1025xi32>
  %34 = AIE.external_buffer 81920 {sym_name = "buf14"} : memref<1025xi32>
  %36 = AIE.shimDMA(%17) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%32 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%33 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%34 : memref<1025xi32>, 0, 1025>, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %144 = AIE.dmaStart(MM2S0, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%23, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%31 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%21, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%30 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%24, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%29 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    %145 = AIE.dmaStart(MM2S1, ^bb9, ^bb12)
  ^bb9:  // 2 preds: ^bb8, ^bb11
    AIE.useLock(%22, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%28 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 0)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%20, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%27 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 0)
    br ^bb11
  ^bb11:  // pred: ^bb10
    AIE.useLock(%25, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%26 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%25, Release, 0)
    br ^bb9
  ^bb12:  // pred: ^bb8
    AIE.end
  }
  %39 = AIE.tile(10, 2)
  %40 = AIE.switchbox(%39) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.amsel<0> (2)
    %146 = AIE.amsel<0> (3)
    %147 = AIE.masterset(DMA : 0, %145)
    %148 = AIE.masterset(DMA : 1, %143)
    %149 = AIE.masterset(North : 0, %146)
    %150 = AIE.masterset(North : 1, %144)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %143)
      AIE.rule(28, 0, %144)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %145)
      AIE.rule(28, 4, %146)
    }
  }
  %41 = AIE.lock(%39, 1)
  %42 = AIE.lock(%39, 0)
  %43 = AIE.buffer(%39) {sym_name = "buf15"} : memref<32x32xi32>
  %44 = AIE.buffer(%39) {sym_name = "buf16"} : memref<32x32xi32>
  %45 = AIE.buffer(%39) {sym_name = "buf17"} : memref<32x32xi32>
  %46 = AIE.buffer(%39) {sym_name = "buf18"} : memref<32x32xi32>
  %47 = AIE.core(%39) {
    AIE.useLock(%42, Acquire, 1)
    AIE.useLock(%41, Acquire, 1)
    AIE.useLock(%51, Acquire, 0)
    call @extern_kernel(%46, %43, %44, %45) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%51, Release, 1)
    AIE.useLock(%41, Release, 0)
    AIE.useLock(%42, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %48 = AIE.mem(%39) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%41, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%45 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%41, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%42, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%44 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%42, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %49 = AIE.tile(10, 3)
  %50 = AIE.switchbox(%49) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.amsel<0> (2)
    %146 = AIE.amsel<0> (3)
    %147 = AIE.masterset(DMA : 0, %143)
    %148 = AIE.masterset(DMA : 1, %145)
    %149 = AIE.masterset(North : 0, %146)
    %150 = AIE.masterset(North : 1, %144)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %143)
      AIE.rule(31, 2, %144)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %145)
      AIE.rule(31, 6, %146)
    }
  }
  %51 = AIE.lock(%49, 2)
  %52 = AIE.lock(%49, 1)
  %53 = AIE.lock(%49, 0)
  %54 = AIE.buffer(%49) {sym_name = "buf19"} : memref<32x32xi32>
  %55 = AIE.buffer(%49) {sym_name = "buf20"} : memref<32x32xi32>
  %56 = AIE.buffer(%49) {sym_name = "buf21"} : memref<32x32xi32>
  %57 = AIE.core(%49) {
    AIE.useLock(%53, Acquire, 1)
    AIE.useLock(%62, Acquire, 0)
    AIE.useLock(%51, Acquire, 1)
    AIE.useLock(%52, Acquire, 1)
    call @extern_kernel(%43, %54, %55, %56) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%52, Release, 0)
    AIE.useLock(%51, Release, 0)
    AIE.useLock(%62, Release, 1)
    AIE.useLock(%53, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %58 = AIE.mem(%49) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%52, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%55 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%53, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%56 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %59 = AIE.tile(10, 4) {polyaie.leaf}
  %60 = AIE.lock(%59, 15)
  %61 = AIE.switchbox(%59) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.amsel<0> (2)
    %146 = AIE.masterset(DMA : 0, %145)
    %147 = AIE.masterset(DMA : 1, %143)
    %148 = AIE.masterset(East : 0, %144)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %144)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %143)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %145)
    }
  }
  %62 = AIE.lock(%59, 3)
  %63 = AIE.lock(%59, 2)
  %64 = AIE.lock(%59, 1)
  %65 = AIE.lock(%59, 0)
  %66 = AIE.buffer(%59) {sym_name = "buf22"} : memref<32x32xi32>
  %67 = AIE.buffer(%59) {sym_name = "buf23"} : memref<32x32xi32>
  %68 = AIE.buffer(%59) {sym_name = "buf24"} : memref<32x32xi32>
  %69 = AIE.core(%59) {
    AIE.useLock(%62, Acquire, 1)
    AIE.useLock(%63, Acquire, 1)
    AIE.useLock(%64, Acquire, 1)
    AIE.useLock(%65, Acquire, 0)
    call @extern_kernel(%54, %66, %67, %68) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%65, Release, 1)
    AIE.useLock(%64, Release, 0)
    AIE.useLock(%63, Release, 0)
    AIE.useLock(%62, Release, 0)
    AIE.useLock(%60, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %70 = AIE.mem(%59) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%64, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%68 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%64, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%63, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%67 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%63, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %145 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%65, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%66 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%65, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %71 = AIE.tile(11, 2)
  %72 = AIE.switchbox(%71) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<1> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<1> (1)
    %147 = AIE.amsel<0> (2)
    %148 = AIE.amsel<1> (2)
    %149 = AIE.amsel<0> (3)
    %150 = AIE.masterset(DMA : 0, %145)
    %151 = AIE.masterset(DMA : 1, %147)
    %152 = AIE.masterset(South : 0, %148)
    %153 = AIE.masterset(South : 1, %144)
    %154 = AIE.masterset(South : 2, %146)
    %155 = AIE.masterset(North : 0, %143)
    %156 = AIE.masterset(North : 1, %149)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %146)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %144)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %148)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %145)
      AIE.rule(28, 4, %149)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %147)
      AIE.rule(28, 0, %143)
    }
  }
  %73 = AIE.lock(%71, 1)
  %74 = AIE.lock(%71, 0)
  %75 = AIE.buffer(%71) {sym_name = "buf25"} : memref<32x32xi32>
  %76 = AIE.buffer(%71) {sym_name = "buf26"} : memref<32x32xi32>
  %77 = AIE.buffer(%71) {sym_name = "buf27"} : memref<32x32xi32>
  %78 = AIE.buffer(%71) {sym_name = "buf28"} : memref<32x32xi32>
  %79 = AIE.core(%71) {
    AIE.useLock(%73, Acquire, 1)
    AIE.useLock(%84, Acquire, 0)
    AIE.useLock(%74, Acquire, 1)
    call @extern_kernel(%78, %75, %76, %77) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%74, Release, 0)
    AIE.useLock(%84, Release, 1)
    AIE.useLock(%73, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %80 = AIE.mem(%71) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%74, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%77 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%74, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%73, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%76 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%73, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %81 = AIE.tile(11, 3)
  %82 = AIE.switchbox(%81) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<1> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<1> (1)
    %147 = AIE.amsel<0> (2)
    %148 = AIE.amsel<1> (2)
    %149 = AIE.amsel<0> (3)
    %150 = AIE.masterset(DMA : 0, %146)
    %151 = AIE.masterset(DMA : 1, %148)
    %152 = AIE.masterset(South : 0, %144)
    %153 = AIE.masterset(South : 1, %145)
    %154 = AIE.masterset(South : 2, %143)
    %155 = AIE.masterset(North : 0, %149)
    %156 = AIE.masterset(North : 1, %147)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %143)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %145)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %144)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %148)
      AIE.rule(31, 6, %147)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %146)
      AIE.rule(31, 2, %149)
    }
  }
  %83 = AIE.lock(%81, 2)
  %84 = AIE.lock(%81, 1)
  %85 = AIE.lock(%81, 0)
  %86 = AIE.buffer(%81) {sym_name = "buf29"} : memref<32x32xi32>
  %87 = AIE.buffer(%81) {sym_name = "buf30"} : memref<32x32xi32>
  %88 = AIE.buffer(%81) {sym_name = "buf31"} : memref<32x32xi32>
  %89 = AIE.core(%81) {
    AIE.useLock(%84, Acquire, 1)
    AIE.useLock(%83, Acquire, 1)
    AIE.useLock(%94, Acquire, 0)
    AIE.useLock(%85, Acquire, 1)
    call @extern_kernel(%75, %86, %87, %88) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%85, Release, 0)
    AIE.useLock(%94, Release, 1)
    AIE.useLock(%83, Release, 0)
    AIE.useLock(%84, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %90 = AIE.mem(%81) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%85, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%87 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%85, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%83, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%88 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%83, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %91 = AIE.tile(11, 4) {polyaie.leaf}
  %92 = AIE.lock(%91, 15)
  %93 = AIE.switchbox(%91) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<1> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.amsel<0> (3)
    %148 = AIE.masterset(DMA : 0, %143)
    %149 = AIE.masterset(DMA : 1, %146)
    %150 = AIE.masterset(South : 0, %144)
    %151 = AIE.masterset(South : 1, %147)
    %152 = AIE.masterset(South : 2, %145)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %145)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %147)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %144)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %146)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %143)
    }
  }
  %94 = AIE.lock(%91, 3)
  %95 = AIE.lock(%91, 2)
  %96 = AIE.lock(%91, 1)
  %97 = AIE.lock(%91, 0)
  %98 = AIE.buffer(%91) {sym_name = "bui32"} : memref<32x32xi32>
  %99 = AIE.buffer(%91) {sym_name = "buf33"} : memref<32x32xi32>
  %100 = AIE.buffer(%91) {sym_name = "buf34"} : memref<32x32xi32>
  %101 = AIE.core(%91) {
    AIE.useLock(%96, Acquire, 1)
    AIE.useLock(%94, Acquire, 1)
    AIE.useLock(%95, Acquire, 1)
    AIE.useLock(%97, Acquire, 0)
    call @extern_kernel(%86, %98, %99, %100) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%97, Release, 1)
    AIE.useLock(%95, Release, 0)
    AIE.useLock(%94, Release, 0)
    AIE.useLock(%96, Release, 0)
    AIE.useLock(%92, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %102 = AIE.mem(%91) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%95, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%99 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%95, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%96, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%100 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%96, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %145 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%97, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%98 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%97, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %103 = AIE.tile(12, 2)
  %104 = AIE.switchbox(%103) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.amsel<0> (2)
    %146 = AIE.amsel<0> (3)
    %147 = AIE.masterset(DMA : 0, %145)
    %148 = AIE.masterset(DMA : 1, %144)
    %149 = AIE.masterset(North : 0, %143)
    %150 = AIE.masterset(North : 1, %146)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %145)
      AIE.rule(28, 4, %146)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %144)
      AIE.rule(28, 0, %143)
    }
  }
  %105 = AIE.lock(%103, 1)
  %106 = AIE.lock(%103, 0)
  %107 = AIE.buffer(%103) {sym_name = "buf35"} : memref<32x32xi32>
  %108 = AIE.buffer(%103) {sym_name = "buf36"} : memref<32x32xi32>
  %109 = AIE.buffer(%103) {sym_name = "buf37"} : memref<32x32xi32>
  %110 = AIE.buffer(%103) {sym_name = "buf38"} : memref<32x32xi32>
  %111 = AIE.core(%103) {
    AIE.useLock(%105, Acquire, 1)
    AIE.useLock(%106, Acquire, 1)
    AIE.useLock(%117, Acquire, 0)
    call @extern_kernel(%110, %107, %108, %109) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%117, Release, 1)
    AIE.useLock(%106, Release, 0)
    AIE.useLock(%105, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %112 = AIE.mem(%103) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%106, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%109 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%106, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%105, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%108 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%105, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %113 = AIE.tile(12, 3)
  %114 = AIE.switchbox(%113) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.amsel<0> (2)
    %146 = AIE.amsel<0> (3)
    %147 = AIE.masterset(DMA : 0, %145)
    %148 = AIE.masterset(DMA : 1, %144)
    %149 = AIE.masterset(North : 0, %143)
    %150 = AIE.masterset(North : 1, %146)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %144)
      AIE.rule(31, 6, %146)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %145)
      AIE.rule(31, 2, %143)
    }
  }
  %115 = AIE.lock(%113, 2)
  %116 = AIE.lock(%113, 1)
  %117 = AIE.lock(%113, 0)
  %118 = AIE.buffer(%113) {sym_name = "buf39"} : memref<32x32xi32>
  %119 = AIE.buffer(%113) {sym_name = "buf40"} : memref<32x32xi32>
  %120 = AIE.buffer(%113) {sym_name = "buf41"} : memref<32x32xi32>
  %121 = AIE.core(%113) {
    AIE.useLock(%126, Acquire, 0)
    AIE.useLock(%115, Acquire, 1)
    AIE.useLock(%116, Acquire, 1)
    AIE.useLock(%117, Acquire, 1)
    call @extern_kernel(%107, %118, %119, %120) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%117, Release, 0)
    AIE.useLock(%116, Release, 0)
    AIE.useLock(%115, Release, 0)
    AIE.useLock(%126, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %122 = AIE.mem(%113) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%116, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%119 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%116, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%115, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%120 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%115, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %123 = AIE.tile(12, 4) {polyaie.leaf}
  %124 = AIE.lock(%123, 15)
  %125 = AIE.switchbox(%123) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.amsel<0> (2)
    %146 = AIE.masterset(DMA : 0, %144)
    %147 = AIE.masterset(DMA : 1, %143)
    %148 = AIE.masterset(West : 0, %145)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %145)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %144)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %143)
    }
  }
  %126 = AIE.lock(%123, 3)
  %127 = AIE.lock(%123, 2)
  %128 = AIE.lock(%123, 1)
  %129 = AIE.lock(%123, 0)
  %130 = AIE.buffer(%123) {sym_name = "buf42"} : memref<32x32xi32>
  %131 = AIE.buffer(%123) {sym_name = "buf43"} : memref<32x32xi32>
  %132 = AIE.buffer(%123) {sym_name = "buf44"} : memref<32x32xi32>
  %133 = AIE.core(%123) {
    AIE.useLock(%126, Acquire, 1)
    AIE.useLock(%127, Acquire, 1)
    AIE.useLock(%129, Acquire, 1)
    AIE.useLock(%128, Acquire, 0)
    call @extern_kernel(%118, %130, %131, %132) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%128, Release, 1)
    AIE.useLock(%129, Release, 0)
    AIE.useLock(%127, Release, 0)
    AIE.useLock(%126, Release, 0)
    AIE.useLock(%124, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %134 = AIE.mem(%123) {
    %143 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%129, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%132 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%129, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %144 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%127, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%131 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%127, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %145 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%128, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%130 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%128, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %135 = AIE.tile(12, 0)
  %136 = AIE.switchbox(%135) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.masterset(North : 0, %143)
    %146 = AIE.masterset(North : 1, %144)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %144)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %143)
    }
  }
  %137 = AIE.tile(12, 1)
  %138 = AIE.switchbox(%137) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.masterset(North : 0, %144)
    %146 = AIE.masterset(North : 1, %143)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %143)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %144)
    }
  }
  %139 = AIE.tile(11, 1)
  %140 = AIE.switchbox(%139) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<1> (0)
    %145 = AIE.amsel<0> (1)
    %146 = AIE.amsel<0> (2)
    %147 = AIE.amsel<0> (3)
    %148 = AIE.masterset(South : 0, %145)
    %149 = AIE.masterset(South : 1, %147)
    %150 = AIE.masterset(South : 2, %144)
    %151 = AIE.masterset(North : 0, %143)
    %152 = AIE.masterset(North : 1, %146)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %144)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %147)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %145)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %146)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %143)
    }
  }
  %141 = AIE.tile(10, 1)
  %142 = AIE.switchbox(%141) {
    %143 = AIE.amsel<0> (0)
    %144 = AIE.amsel<0> (1)
    %145 = AIE.masterset(North : 0, %143)
    %146 = AIE.masterset(North : 1, %144)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %144)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %143)
    }
  }
}


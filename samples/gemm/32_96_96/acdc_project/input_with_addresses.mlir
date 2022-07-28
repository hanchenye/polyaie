module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %2 = AIE.switchbox(%0) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.masterset(North : 0, %140)
    %142 = AIE.masterset(North : 1, %139)
    %143 = AIE.masterset(East : 0, %139)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %139)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %140)
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
  %15 = AIE.shimDMA(%0) {
    %139 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%13 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%11 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    cf.br ^bb1
  ^bb4:  // pred: ^bb0
    %140 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%14 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    cf.br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%12 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    cf.br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  %16 = AIE.tile(11, 0)
  %17 = AIE.shimmux(%16) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %18 = AIE.switchbox(%16) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.amsel<0> (2)
    %142 = AIE.amsel<0> (3)
    %143 = AIE.masterset(South : 2, %139)
    %144 = AIE.masterset(North : 0, %140)
    %145 = AIE.masterset(North : 1, %142)
    %146 = AIE.masterset(East : 0, %140)
    %147 = AIE.masterset(East : 1, %141)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %139)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %139)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %139)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %142)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %141)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %140)
    }
  }
  %19 = AIE.lock(%16, 5)
  %20 = AIE.lock(%16, 4)
  %21 = AIE.lock(%16, 3)
  %22 = AIE.lock(%16, 2)
  %23 = AIE.lock(%16, 1)
  %24 = AIE.lock(%16, 0)
  %25 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xi32>
  %26 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xi32>
  %27 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<32x32xi32>
  %28 = AIE.external_buffer 53248 {sym_name = "buf9"} : memref<32x32xi32>
  %29 = AIE.external_buffer 57344 {sym_name = "buf10"} : memref<32x32xi32>
  %30 = AIE.external_buffer 61440 {sym_name = "buf11"} : memref<32x32xi32>
  %31 = AIE.external_buffer 65536 {sym_name = "buf12"} : memref<1025xi32>
  %32 = AIE.external_buffer 73728 {sym_name = "buf13"} : memref<1025xi32>
  %33 = AIE.external_buffer 81920 {sym_name = "buf14"} : memref<1025xi32>
  %34 = AIE.shimDMA(%16) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%31 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%32 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%33 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb4:  // pred: ^bb0
    %140 = AIE.dmaStart(MM2S0, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%22, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%30 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 0)
    cf.br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%20, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%29 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%23, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%28 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 0)
    cf.br ^bb5
  ^bb8:  // pred: ^bb4
    %141 = AIE.dmaStart(MM2S1, ^bb9, ^bb12)
  ^bb9:  // 2 preds: ^bb8, ^bb11
    AIE.useLock(%21, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%27 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 0)
    cf.br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%19, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%26 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 0)
    cf.br ^bb11
  ^bb11:  // pred: ^bb10
    AIE.useLock(%24, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%25 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 0)
    cf.br ^bb9
  ^bb12:  // pred: ^bb8
    AIE.end
  }
  %35 = AIE.tile(10, 2)
  %36 = AIE.switchbox(%35) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.amsel<0> (2)
    %142 = AIE.amsel<0> (3)
    %143 = AIE.masterset(DMA : 0, %141)
    %144 = AIE.masterset(DMA : 1, %139)
    %145 = AIE.masterset(North : 0, %142)
    %146 = AIE.masterset(North : 1, %140)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %139)
      AIE.rule(28, 0, %140)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %141)
      AIE.rule(28, 4, %142)
    }
  }
  %37 = AIE.lock(%35, 1)
  %38 = AIE.lock(%35, 0)
  %39 = AIE.buffer(%35) {address = 4096 : i32, sym_name = "buf15"} : memref<32x32xi32>
  %40 = AIE.buffer(%35) {address = 8192 : i32, sym_name = "buf16"} : memref<32x32xi32>
  %41 = AIE.buffer(%35) {address = 12288 : i32, sym_name = "buf17"} : memref<32x32xi32>
  %42 = AIE.buffer(%35) {address = 16384 : i32, sym_name = "buf18"} : memref<32x32xi32>
  %43 = AIE.core(%35) {
    AIE.useLock(%38, Acquire, 1)
    AIE.useLock(%37, Acquire, 1)
    AIE.useLock(%47, Acquire, 0)
    call @extern_kernel(%42, %39, %40, %41) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%47, Release, 1)
    AIE.useLock(%37, Release, 0)
    AIE.useLock(%38, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %44 = AIE.mem(%35) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%41 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%38, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%40 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%38, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %45 = AIE.tile(10, 3)
  %46 = AIE.switchbox(%45) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.amsel<0> (2)
    %142 = AIE.amsel<0> (3)
    %143 = AIE.masterset(DMA : 0, %139)
    %144 = AIE.masterset(DMA : 1, %141)
    %145 = AIE.masterset(North : 0, %142)
    %146 = AIE.masterset(North : 1, %140)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %139)
      AIE.rule(31, 2, %140)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %141)
      AIE.rule(31, 6, %142)
    }
  }
  %47 = AIE.lock(%45, 2)
  %48 = AIE.lock(%45, 1)
  %49 = AIE.lock(%45, 0)
  %50 = AIE.buffer(%45) {address = 4096 : i32, sym_name = "buf19"} : memref<32x32xi32>
  %51 = AIE.buffer(%45) {address = 8192 : i32, sym_name = "buf20"} : memref<32x32xi32>
  %52 = AIE.buffer(%45) {address = 12288 : i32, sym_name = "buf21"} : memref<32x32xi32>
  %53 = AIE.core(%45) {
    AIE.useLock(%49, Acquire, 1)
    AIE.useLock(%58, Acquire, 0)
    AIE.useLock(%47, Acquire, 1)
    AIE.useLock(%48, Acquire, 1)
    call @extern_kernel(%39, %50, %51, %52) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%48, Release, 0)
    AIE.useLock(%47, Release, 0)
    AIE.useLock(%58, Release, 1)
    AIE.useLock(%49, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %54 = AIE.mem(%45) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%48, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%51 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%49, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%52 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %55 = AIE.tile(10, 4) {polyaie.leaf}
  %56 = AIE.lock(%55, 15)
  %57 = AIE.switchbox(%55) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.amsel<0> (2)
    %142 = AIE.masterset(DMA : 0, %141)
    %143 = AIE.masterset(DMA : 1, %139)
    %144 = AIE.masterset(East : 0, %140)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %140)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %139)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %141)
    }
  }
  %58 = AIE.lock(%55, 3)
  %59 = AIE.lock(%55, 2)
  %60 = AIE.lock(%55, 1)
  %61 = AIE.lock(%55, 0)
  %62 = AIE.buffer(%55) {address = 4096 : i32, sym_name = "buf22"} : memref<32x32xi32>
  %63 = AIE.buffer(%55) {address = 8192 : i32, sym_name = "buf23"} : memref<32x32xi32>
  %64 = AIE.buffer(%55) {address = 12288 : i32, sym_name = "buf24"} : memref<32x32xi32>
  %65 = AIE.core(%55) {
    AIE.useLock(%58, Acquire, 1)
    AIE.useLock(%59, Acquire, 1)
    AIE.useLock(%60, Acquire, 1)
    AIE.useLock(%61, Acquire, 0)
    call @extern_kernel(%50, %62, %63, %64) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%61, Release, 1)
    AIE.useLock(%60, Release, 0)
    AIE.useLock(%59, Release, 0)
    AIE.useLock(%58, Release, 0)
    AIE.useLock(%56, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %66 = AIE.mem(%55) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%64 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%59, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%63 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%59, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %141 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%61, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%62 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%61, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %67 = AIE.tile(11, 2)
  %68 = AIE.switchbox(%67) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<1> (0)
    %141 = AIE.amsel<0> (1)
    %142 = AIE.amsel<1> (1)
    %143 = AIE.amsel<0> (2)
    %144 = AIE.amsel<1> (2)
    %145 = AIE.amsel<0> (3)
    %146 = AIE.masterset(DMA : 0, %141)
    %147 = AIE.masterset(DMA : 1, %143)
    %148 = AIE.masterset(South : 0, %144)
    %149 = AIE.masterset(South : 1, %140)
    %150 = AIE.masterset(South : 2, %142)
    %151 = AIE.masterset(North : 0, %139)
    %152 = AIE.masterset(North : 1, %145)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %142)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %140)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %144)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %141)
      AIE.rule(28, 4, %145)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %143)
      AIE.rule(28, 0, %139)
    }
  }
  %69 = AIE.lock(%67, 1)
  %70 = AIE.lock(%67, 0)
  %71 = AIE.buffer(%67) {address = 4096 : i32, sym_name = "buf25"} : memref<32x32xi32>
  %72 = AIE.buffer(%67) {address = 8192 : i32, sym_name = "buf26"} : memref<32x32xi32>
  %73 = AIE.buffer(%67) {address = 12288 : i32, sym_name = "buf27"} : memref<32x32xi32>
  %74 = AIE.buffer(%67) {address = 16384 : i32, sym_name = "buf28"} : memref<32x32xi32>
  %75 = AIE.core(%67) {
    AIE.useLock(%69, Acquire, 1)
    AIE.useLock(%80, Acquire, 0)
    AIE.useLock(%70, Acquire, 1)
    call @extern_kernel(%74, %71, %72, %73) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%70, Release, 0)
    AIE.useLock(%80, Release, 1)
    AIE.useLock(%69, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %76 = AIE.mem(%67) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%70, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%73 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%70, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%69, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%72 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%69, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %77 = AIE.tile(11, 3)
  %78 = AIE.switchbox(%77) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<1> (0)
    %141 = AIE.amsel<0> (1)
    %142 = AIE.amsel<1> (1)
    %143 = AIE.amsel<0> (2)
    %144 = AIE.amsel<1> (2)
    %145 = AIE.amsel<0> (3)
    %146 = AIE.masterset(DMA : 0, %142)
    %147 = AIE.masterset(DMA : 1, %144)
    %148 = AIE.masterset(South : 0, %140)
    %149 = AIE.masterset(South : 1, %141)
    %150 = AIE.masterset(South : 2, %139)
    %151 = AIE.masterset(North : 0, %145)
    %152 = AIE.masterset(North : 1, %143)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %139)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %141)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %140)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %144)
      AIE.rule(31, 6, %143)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %142)
      AIE.rule(31, 2, %145)
    }
  }
  %79 = AIE.lock(%77, 2)
  %80 = AIE.lock(%77, 1)
  %81 = AIE.lock(%77, 0)
  %82 = AIE.buffer(%77) {address = 4096 : i32, sym_name = "buf29"} : memref<32x32xi32>
  %83 = AIE.buffer(%77) {address = 8192 : i32, sym_name = "buf30"} : memref<32x32xi32>
  %84 = AIE.buffer(%77) {address = 12288 : i32, sym_name = "buf31"} : memref<32x32xi32>
  %85 = AIE.core(%77) {
    AIE.useLock(%80, Acquire, 1)
    AIE.useLock(%79, Acquire, 1)
    AIE.useLock(%90, Acquire, 0)
    AIE.useLock(%81, Acquire, 1)
    call @extern_kernel(%71, %82, %83, %84) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%81, Release, 0)
    AIE.useLock(%90, Release, 1)
    AIE.useLock(%79, Release, 0)
    AIE.useLock(%80, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %86 = AIE.mem(%77) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%83 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%84 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %87 = AIE.tile(11, 4) {polyaie.leaf}
  %88 = AIE.lock(%87, 15)
  %89 = AIE.switchbox(%87) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<1> (0)
    %141 = AIE.amsel<0> (1)
    %142 = AIE.amsel<0> (2)
    %143 = AIE.amsel<0> (3)
    %144 = AIE.masterset(DMA : 0, %139)
    %145 = AIE.masterset(DMA : 1, %142)
    %146 = AIE.masterset(South : 0, %140)
    %147 = AIE.masterset(South : 1, %143)
    %148 = AIE.masterset(South : 2, %141)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %141)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %143)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %140)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %142)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %139)
    }
  }
  %90 = AIE.lock(%87, 3)
  %91 = AIE.lock(%87, 2)
  %92 = AIE.lock(%87, 1)
  %93 = AIE.lock(%87, 0)
  %94 = AIE.buffer(%87) {address = 4096 : i32, sym_name = "bui32"} : memref<32x32xi32>
  %95 = AIE.buffer(%87) {address = 8192 : i32, sym_name = "buf33"} : memref<32x32xi32>
  %96 = AIE.buffer(%87) {address = 12288 : i32, sym_name = "buf34"} : memref<32x32xi32>
  %97 = AIE.core(%87) {
    AIE.useLock(%92, Acquire, 1)
    AIE.useLock(%90, Acquire, 1)
    AIE.useLock(%91, Acquire, 1)
    AIE.useLock(%93, Acquire, 0)
    call @extern_kernel(%82, %94, %95, %96) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%93, Release, 1)
    AIE.useLock(%91, Release, 0)
    AIE.useLock(%90, Release, 0)
    AIE.useLock(%92, Release, 0)
    AIE.useLock(%88, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %98 = AIE.mem(%87) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%91, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%95 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%91, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%92, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%96 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%92, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %141 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%93, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%94 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%93, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %99 = AIE.tile(12, 2)
  %100 = AIE.switchbox(%99) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.amsel<0> (2)
    %142 = AIE.amsel<0> (3)
    %143 = AIE.masterset(DMA : 0, %141)
    %144 = AIE.masterset(DMA : 1, %140)
    %145 = AIE.masterset(North : 0, %139)
    %146 = AIE.masterset(North : 1, %142)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %141)
      AIE.rule(28, 4, %142)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %140)
      AIE.rule(28, 0, %139)
    }
  }
  %101 = AIE.lock(%99, 1)
  %102 = AIE.lock(%99, 0)
  %103 = AIE.buffer(%99) {address = 4096 : i32, sym_name = "buf35"} : memref<32x32xi32>
  %104 = AIE.buffer(%99) {address = 8192 : i32, sym_name = "buf36"} : memref<32x32xi32>
  %105 = AIE.buffer(%99) {address = 12288 : i32, sym_name = "buf37"} : memref<32x32xi32>
  %106 = AIE.buffer(%99) {address = 16384 : i32, sym_name = "buf38"} : memref<32x32xi32>
  %107 = AIE.core(%99) {
    AIE.useLock(%101, Acquire, 1)
    AIE.useLock(%102, Acquire, 1)
    AIE.useLock(%113, Acquire, 0)
    call @extern_kernel(%106, %103, %104, %105) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%113, Release, 1)
    AIE.useLock(%102, Release, 0)
    AIE.useLock(%101, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %108 = AIE.mem(%99) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%102, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%105 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%102, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%101, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%104 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%101, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %109 = AIE.tile(12, 3)
  %110 = AIE.switchbox(%109) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.amsel<0> (2)
    %142 = AIE.amsel<0> (3)
    %143 = AIE.masterset(DMA : 0, %141)
    %144 = AIE.masterset(DMA : 1, %140)
    %145 = AIE.masterset(North : 0, %139)
    %146 = AIE.masterset(North : 1, %142)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %140)
      AIE.rule(31, 6, %142)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %141)
      AIE.rule(31, 2, %139)
    }
  }
  %111 = AIE.lock(%109, 2)
  %112 = AIE.lock(%109, 1)
  %113 = AIE.lock(%109, 0)
  %114 = AIE.buffer(%109) {address = 4096 : i32, sym_name = "buf39"} : memref<32x32xi32>
  %115 = AIE.buffer(%109) {address = 8192 : i32, sym_name = "buf40"} : memref<32x32xi32>
  %116 = AIE.buffer(%109) {address = 12288 : i32, sym_name = "buf41"} : memref<32x32xi32>
  %117 = AIE.core(%109) {
    AIE.useLock(%122, Acquire, 0)
    AIE.useLock(%111, Acquire, 1)
    AIE.useLock(%112, Acquire, 1)
    AIE.useLock(%113, Acquire, 1)
    call @extern_kernel(%103, %114, %115, %116) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%113, Release, 0)
    AIE.useLock(%112, Release, 0)
    AIE.useLock(%111, Release, 0)
    AIE.useLock(%122, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %118 = AIE.mem(%109) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%112, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%115 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%112, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%111, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%116 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%111, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %119 = AIE.tile(12, 4) {polyaie.leaf}
  %120 = AIE.lock(%119, 15)
  %121 = AIE.switchbox(%119) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.amsel<0> (2)
    %142 = AIE.masterset(DMA : 0, %140)
    %143 = AIE.masterset(DMA : 1, %139)
    %144 = AIE.masterset(West : 0, %141)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %141)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %140)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %139)
    }
  }
  %122 = AIE.lock(%119, 3)
  %123 = AIE.lock(%119, 2)
  %124 = AIE.lock(%119, 1)
  %125 = AIE.lock(%119, 0)
  %126 = AIE.buffer(%119) {address = 4096 : i32, sym_name = "buf42"} : memref<32x32xi32>
  %127 = AIE.buffer(%119) {address = 8192 : i32, sym_name = "buf43"} : memref<32x32xi32>
  %128 = AIE.buffer(%119) {address = 12288 : i32, sym_name = "buf44"} : memref<32x32xi32>
  %129 = AIE.core(%119) {
    AIE.useLock(%122, Acquire, 1)
    AIE.useLock(%123, Acquire, 1)
    AIE.useLock(%125, Acquire, 1)
    AIE.useLock(%124, Acquire, 0)
    call @extern_kernel(%114, %126, %127, %128) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%124, Release, 1)
    AIE.useLock(%125, Release, 0)
    AIE.useLock(%123, Release, 0)
    AIE.useLock(%122, Release, 0)
    AIE.useLock(%120, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %130 = AIE.mem(%119) {
    %139 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%125, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%128 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%125, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %140 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%123, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%127 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%123, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %141 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%124, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%126 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%124, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %131 = AIE.tile(12, 0)
  %132 = AIE.switchbox(%131) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.masterset(North : 0, %139)
    %142 = AIE.masterset(North : 1, %140)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %140)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %139)
    }
  }
  %133 = AIE.tile(12, 1)
  %134 = AIE.switchbox(%133) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.masterset(North : 0, %140)
    %142 = AIE.masterset(North : 1, %139)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %139)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %140)
    }
  }
  %135 = AIE.tile(11, 1)
  %136 = AIE.switchbox(%135) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<1> (0)
    %141 = AIE.amsel<0> (1)
    %142 = AIE.amsel<0> (2)
    %143 = AIE.amsel<0> (3)
    %144 = AIE.masterset(South : 0, %141)
    %145 = AIE.masterset(South : 1, %143)
    %146 = AIE.masterset(South : 2, %140)
    %147 = AIE.masterset(North : 0, %139)
    %148 = AIE.masterset(North : 1, %142)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %140)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %143)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %141)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %142)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %139)
    }
  }
  %137 = AIE.tile(10, 1)
  %138 = AIE.switchbox(%137) {
    %139 = AIE.amsel<0> (0)
    %140 = AIE.amsel<0> (1)
    %141 = AIE.masterset(North : 0, %139)
    %142 = AIE.masterset(North : 1, %140)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %140)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %139)
    }
  }
}


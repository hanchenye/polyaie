module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %2 = AIE.switchbox(%0) {
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.masterset(North : 0, %257)
    %259 = AIE.masterset(North : 1, %256)
    %260 = AIE.masterset(East : 0, %256)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %256)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %257)
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
    %256 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
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
    %257 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.amsel<0> (2)
    %259 = AIE.amsel<0> (3)
    %260 = AIE.masterset(South : 2, %256)
    %261 = AIE.masterset(North : 0, %257)
    %262 = AIE.masterset(North : 1, %259)
    %263 = AIE.masterset(East : 0, %257)
    %264 = AIE.masterset(East : 1, %258)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %256)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %256)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %256)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %259)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %258)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %257)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb4)
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
    %257 = AIE.dmaStart(MM2S0, ^bb5, ^bb8)
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
    %258 = AIE.dmaStart(MM2S1, ^bb9, ^bb12)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.amsel<0> (2)
    %259 = AIE.amsel<0> (3)
    %260 = AIE.masterset(DMA : 0, %258)
    %261 = AIE.masterset(DMA : 1, %256)
    %262 = AIE.masterset(North : 0, %259)
    %263 = AIE.masterset(North : 1, %257)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %256)
      AIE.rule(28, 0, %257)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %258)
      AIE.rule(28, 4, %259)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%41 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.amsel<0> (2)
    %259 = AIE.amsel<0> (3)
    %260 = AIE.masterset(DMA : 0, %256)
    %261 = AIE.masterset(DMA : 1, %258)
    %262 = AIE.masterset(North : 0, %259)
    %263 = AIE.masterset(North : 1, %257)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %256)
      AIE.rule(31, 2, %257)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %258)
      AIE.rule(31, 6, %259)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%48, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%51 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.amsel<0> (2)
    %259 = AIE.masterset(DMA : 0, %258)
    %260 = AIE.masterset(DMA : 1, %256)
    %261 = AIE.masterset(East : 0, %257)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %257)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %256)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %258)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%64 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%59, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%63 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%59, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %258 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<1> (0)
    %258 = AIE.amsel<0> (1)
    %259 = AIE.amsel<1> (1)
    %260 = AIE.amsel<0> (2)
    %261 = AIE.amsel<1> (2)
    %262 = AIE.amsel<0> (3)
    %263 = AIE.masterset(DMA : 0, %258)
    %264 = AIE.masterset(DMA : 1, %260)
    %265 = AIE.masterset(South : 0, %261)
    %266 = AIE.masterset(South : 1, %257)
    %267 = AIE.masterset(South : 2, %259)
    %268 = AIE.masterset(North : 0, %256)
    %269 = AIE.masterset(North : 1, %262)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %259)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %257)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %261)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %258)
      AIE.rule(28, 4, %262)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %260)
      AIE.rule(28, 0, %256)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%70, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%73 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%70, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<1> (0)
    %258 = AIE.amsel<0> (1)
    %259 = AIE.amsel<1> (1)
    %260 = AIE.amsel<0> (2)
    %261 = AIE.amsel<1> (2)
    %262 = AIE.amsel<0> (3)
    %263 = AIE.masterset(DMA : 0, %259)
    %264 = AIE.masterset(DMA : 1, %261)
    %265 = AIE.masterset(South : 0, %257)
    %266 = AIE.masterset(South : 1, %258)
    %267 = AIE.masterset(South : 2, %256)
    %268 = AIE.masterset(North : 0, %262)
    %269 = AIE.masterset(North : 1, %260)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %256)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %258)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %257)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %261)
      AIE.rule(31, 6, %260)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %259)
      AIE.rule(31, 2, %262)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%83 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<1> (0)
    %258 = AIE.amsel<0> (1)
    %259 = AIE.amsel<0> (2)
    %260 = AIE.amsel<0> (3)
    %261 = AIE.masterset(DMA : 0, %256)
    %262 = AIE.masterset(DMA : 1, %259)
    %263 = AIE.masterset(South : 0, %257)
    %264 = AIE.masterset(South : 1, %260)
    %265 = AIE.masterset(South : 2, %258)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %258)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %260)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %257)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %259)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %256)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%91, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%95 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%91, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%92, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%96 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%92, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %258 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.amsel<0> (2)
    %259 = AIE.amsel<0> (3)
    %260 = AIE.masterset(DMA : 0, %258)
    %261 = AIE.masterset(DMA : 1, %257)
    %262 = AIE.masterset(North : 0, %256)
    %263 = AIE.masterset(North : 1, %259)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %258)
      AIE.rule(28, 4, %259)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %257)
      AIE.rule(28, 0, %256)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%102, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%105 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%102, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.amsel<0> (2)
    %259 = AIE.amsel<0> (3)
    %260 = AIE.masterset(DMA : 0, %258)
    %261 = AIE.masterset(DMA : 1, %257)
    %262 = AIE.masterset(North : 0, %256)
    %263 = AIE.masterset(North : 1, %259)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %257)
      AIE.rule(31, 6, %259)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %258)
      AIE.rule(31, 2, %256)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%112, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%115 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%112, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.amsel<0> (2)
    %259 = AIE.masterset(DMA : 0, %257)
    %260 = AIE.masterset(DMA : 1, %256)
    %261 = AIE.masterset(West : 0, %258)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %258)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %257)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %256)
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
    %256 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%125, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%128 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%125, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %257 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%123, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%127 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%123, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %258 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.masterset(North : 0, %256)
    %259 = AIE.masterset(North : 1, %257)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %257)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %256)
    }
  }
  %133 = AIE.tile(12, 1)
  %134 = AIE.switchbox(%133) {
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.masterset(North : 0, %257)
    %259 = AIE.masterset(North : 1, %256)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %256)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %257)
    }
  }
  %135 = AIE.tile(11, 1)
  %136 = AIE.switchbox(%135) {
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<1> (0)
    %258 = AIE.amsel<0> (1)
    %259 = AIE.amsel<0> (2)
    %260 = AIE.amsel<0> (3)
    %261 = AIE.masterset(South : 0, %258)
    %262 = AIE.masterset(South : 1, %260)
    %263 = AIE.masterset(South : 2, %257)
    %264 = AIE.masterset(North : 0, %256)
    %265 = AIE.masterset(North : 1, %259)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %257)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %260)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %258)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %259)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %256)
    }
  }
  %137 = AIE.tile(10, 1)
  %138 = AIE.switchbox(%137) {
    %256 = AIE.amsel<0> (0)
    %257 = AIE.amsel<0> (1)
    %258 = AIE.masterset(North : 0, %256)
    %259 = AIE.masterset(North : 1, %257)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %257)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %256)
    }
  }
  %139 = AIE.tile(0, 0)
  %140 = AIE.tile(0, 1)
  %141 = AIE.tile(0, 2)
  %142 = AIE.tile(0, 3)
  %143 = AIE.tile(0, 4)
  %144 = AIE.tile(1, 0)
  %145 = AIE.tile(1, 1)
  %146 = AIE.tile(1, 2)
  %147 = AIE.tile(1, 3)
  %148 = AIE.tile(1, 4)
  %149 = AIE.tile(2, 0)
  %150 = AIE.tile(2, 1)
  %151 = AIE.tile(2, 2)
  %152 = AIE.tile(2, 3)
  %153 = AIE.tile(2, 4)
  %154 = AIE.tile(3, 0)
  %155 = AIE.tile(3, 1)
  %156 = AIE.tile(3, 2)
  %157 = AIE.tile(3, 3)
  %158 = AIE.tile(3, 4)
  %159 = AIE.tile(4, 0)
  %160 = AIE.tile(4, 1)
  %161 = AIE.tile(4, 2)
  %162 = AIE.tile(4, 3)
  %163 = AIE.tile(4, 4)
  %164 = AIE.tile(5, 0)
  %165 = AIE.tile(5, 1)
  %166 = AIE.tile(5, 2)
  %167 = AIE.tile(5, 3)
  %168 = AIE.tile(5, 4)
  %169 = AIE.tile(6, 0)
  %170 = AIE.tile(6, 1)
  %171 = AIE.tile(6, 2)
  %172 = AIE.tile(6, 3)
  %173 = AIE.tile(6, 4)
  %174 = AIE.tile(7, 0)
  %175 = AIE.tile(7, 1)
  %176 = AIE.tile(7, 2)
  %177 = AIE.tile(7, 3)
  %178 = AIE.tile(7, 4)
  %179 = AIE.tile(8, 0)
  %180 = AIE.tile(8, 1)
  %181 = AIE.tile(8, 2)
  %182 = AIE.tile(8, 3)
  %183 = AIE.tile(8, 4)
  %184 = AIE.tile(9, 0)
  %185 = AIE.tile(9, 1)
  %186 = AIE.tile(9, 2)
  %187 = AIE.tile(9, 3)
  %188 = AIE.tile(9, 4)
  %189 = AIE.switchbox(%139) {
  }
  %190 = AIE.switchbox(%140) {
  }
  %191 = AIE.switchbox(%141) {
  }
  %192 = AIE.switchbox(%142) {
  }
  %193 = AIE.switchbox(%143) {
  }
  %194 = AIE.switchbox(%144) {
  }
  %195 = AIE.switchbox(%145) {
  }
  %196 = AIE.switchbox(%146) {
  }
  %197 = AIE.switchbox(%147) {
  }
  %198 = AIE.switchbox(%148) {
  }
  %199 = AIE.switchbox(%149) {
  }
  %200 = AIE.switchbox(%150) {
  }
  %201 = AIE.switchbox(%151) {
  }
  %202 = AIE.switchbox(%152) {
  }
  %203 = AIE.switchbox(%153) {
  }
  %204 = AIE.switchbox(%154) {
  }
  %205 = AIE.switchbox(%155) {
  }
  %206 = AIE.switchbox(%156) {
  }
  %207 = AIE.switchbox(%157) {
  }
  %208 = AIE.switchbox(%158) {
  }
  %209 = AIE.switchbox(%159) {
  }
  %210 = AIE.switchbox(%160) {
  }
  %211 = AIE.switchbox(%161) {
  }
  %212 = AIE.switchbox(%162) {
  }
  %213 = AIE.switchbox(%163) {
  }
  %214 = AIE.switchbox(%164) {
  }
  %215 = AIE.switchbox(%165) {
  }
  %216 = AIE.switchbox(%166) {
  }
  %217 = AIE.switchbox(%167) {
  }
  %218 = AIE.switchbox(%168) {
  }
  %219 = AIE.switchbox(%169) {
  }
  %220 = AIE.switchbox(%170) {
  }
  %221 = AIE.switchbox(%171) {
  }
  %222 = AIE.switchbox(%172) {
  }
  %223 = AIE.switchbox(%173) {
  }
  %224 = AIE.switchbox(%174) {
  }
  %225 = AIE.switchbox(%175) {
  }
  %226 = AIE.switchbox(%176) {
  }
  %227 = AIE.switchbox(%177) {
  }
  %228 = AIE.switchbox(%178) {
  }
  %229 = AIE.switchbox(%179) {
  }
  %230 = AIE.switchbox(%180) {
  }
  %231 = AIE.switchbox(%181) {
  }
  %232 = AIE.switchbox(%182) {
  }
  %233 = AIE.switchbox(%183) {
  }
  %234 = AIE.switchbox(%184) {
  }
  %235 = AIE.switchbox(%185) {
  }
  %236 = AIE.switchbox(%186) {
  }
  %237 = AIE.switchbox(%187) {
  }
  %238 = AIE.switchbox(%188) {
  }
  %239 = AIE.plio(0)
  %240 = AIE.plio(1)
  %241 = AIE.plio(2)
  %242 = AIE.plio(3)
  %243 = AIE.plio(4)
  %244 = AIE.plio(5)
  %245 = AIE.plio(6)
  %246 = AIE.plio(7)
  %247 = AIE.plio(8)
  %248 = AIE.plio(9)
  %249 = AIE.plio(10)
  %250 = AIE.plio(11)
  %251 = AIE.plio(12)
  AIE.wire(%140 : Core, %190 : Core)
  AIE.wire(%140 : DMA, %190 : DMA)
  AIE.wire(%189 : North, %190 : South)
  AIE.wire(%141 : Core, %191 : Core)
  AIE.wire(%141 : DMA, %191 : DMA)
  AIE.wire(%190 : North, %191 : South)
  AIE.wire(%142 : Core, %192 : Core)
  AIE.wire(%142 : DMA, %192 : DMA)
  AIE.wire(%191 : North, %192 : South)
  AIE.wire(%143 : Core, %193 : Core)
  AIE.wire(%143 : DMA, %193 : DMA)
  AIE.wire(%192 : North, %193 : South)
  AIE.wire(%189 : East, %194 : West)
  AIE.wire(%240 : North, %194 : South)
  AIE.wire(%190 : East, %195 : West)
  AIE.wire(%145 : Core, %195 : Core)
  AIE.wire(%145 : DMA, %195 : DMA)
  AIE.wire(%194 : North, %195 : South)
  AIE.wire(%191 : East, %196 : West)
  AIE.wire(%146 : Core, %196 : Core)
  AIE.wire(%146 : DMA, %196 : DMA)
  AIE.wire(%195 : North, %196 : South)
  AIE.wire(%192 : East, %197 : West)
  AIE.wire(%147 : Core, %197 : Core)
  AIE.wire(%147 : DMA, %197 : DMA)
  AIE.wire(%196 : North, %197 : South)
  AIE.wire(%193 : East, %198 : West)
  AIE.wire(%148 : Core, %198 : Core)
  AIE.wire(%148 : DMA, %198 : DMA)
  AIE.wire(%197 : North, %198 : South)
  AIE.wire(%194 : East, %199 : West)
  %252 = AIE.shimmux(%149) {
  }
  AIE.wire(%252 : North, %199 : South)
  AIE.wire(%241 : North, %252 : South)
  AIE.wire(%149 : DMA, %252 : DMA)
  AIE.wire(%195 : East, %200 : West)
  AIE.wire(%150 : Core, %200 : Core)
  AIE.wire(%150 : DMA, %200 : DMA)
  AIE.wire(%199 : North, %200 : South)
  AIE.wire(%196 : East, %201 : West)
  AIE.wire(%151 : Core, %201 : Core)
  AIE.wire(%151 : DMA, %201 : DMA)
  AIE.wire(%200 : North, %201 : South)
  AIE.wire(%197 : East, %202 : West)
  AIE.wire(%152 : Core, %202 : Core)
  AIE.wire(%152 : DMA, %202 : DMA)
  AIE.wire(%201 : North, %202 : South)
  AIE.wire(%198 : East, %203 : West)
  AIE.wire(%153 : Core, %203 : Core)
  AIE.wire(%153 : DMA, %203 : DMA)
  AIE.wire(%202 : North, %203 : South)
  AIE.wire(%199 : East, %204 : West)
  %253 = AIE.shimmux(%154) {
  }
  AIE.wire(%253 : North, %204 : South)
  AIE.wire(%242 : North, %253 : South)
  AIE.wire(%154 : DMA, %253 : DMA)
  AIE.wire(%200 : East, %205 : West)
  AIE.wire(%155 : Core, %205 : Core)
  AIE.wire(%155 : DMA, %205 : DMA)
  AIE.wire(%204 : North, %205 : South)
  AIE.wire(%201 : East, %206 : West)
  AIE.wire(%156 : Core, %206 : Core)
  AIE.wire(%156 : DMA, %206 : DMA)
  AIE.wire(%205 : North, %206 : South)
  AIE.wire(%202 : East, %207 : West)
  AIE.wire(%157 : Core, %207 : Core)
  AIE.wire(%157 : DMA, %207 : DMA)
  AIE.wire(%206 : North, %207 : South)
  AIE.wire(%203 : East, %208 : West)
  AIE.wire(%158 : Core, %208 : Core)
  AIE.wire(%158 : DMA, %208 : DMA)
  AIE.wire(%207 : North, %208 : South)
  AIE.wire(%204 : East, %209 : West)
  AIE.wire(%243 : North, %209 : South)
  AIE.wire(%205 : East, %210 : West)
  AIE.wire(%160 : Core, %210 : Core)
  AIE.wire(%160 : DMA, %210 : DMA)
  AIE.wire(%209 : North, %210 : South)
  AIE.wire(%206 : East, %211 : West)
  AIE.wire(%161 : Core, %211 : Core)
  AIE.wire(%161 : DMA, %211 : DMA)
  AIE.wire(%210 : North, %211 : South)
  AIE.wire(%207 : East, %212 : West)
  AIE.wire(%162 : Core, %212 : Core)
  AIE.wire(%162 : DMA, %212 : DMA)
  AIE.wire(%211 : North, %212 : South)
  AIE.wire(%208 : East, %213 : West)
  AIE.wire(%163 : Core, %213 : Core)
  AIE.wire(%163 : DMA, %213 : DMA)
  AIE.wire(%212 : North, %213 : South)
  AIE.wire(%209 : East, %214 : West)
  AIE.wire(%244 : North, %214 : South)
  AIE.wire(%210 : East, %215 : West)
  AIE.wire(%165 : Core, %215 : Core)
  AIE.wire(%165 : DMA, %215 : DMA)
  AIE.wire(%214 : North, %215 : South)
  AIE.wire(%211 : East, %216 : West)
  AIE.wire(%166 : Core, %216 : Core)
  AIE.wire(%166 : DMA, %216 : DMA)
  AIE.wire(%215 : North, %216 : South)
  AIE.wire(%212 : East, %217 : West)
  AIE.wire(%167 : Core, %217 : Core)
  AIE.wire(%167 : DMA, %217 : DMA)
  AIE.wire(%216 : North, %217 : South)
  AIE.wire(%213 : East, %218 : West)
  AIE.wire(%168 : Core, %218 : Core)
  AIE.wire(%168 : DMA, %218 : DMA)
  AIE.wire(%217 : North, %218 : South)
  AIE.wire(%214 : East, %219 : West)
  %254 = AIE.shimmux(%169) {
  }
  AIE.wire(%254 : North, %219 : South)
  AIE.wire(%245 : North, %254 : South)
  AIE.wire(%169 : DMA, %254 : DMA)
  AIE.wire(%215 : East, %220 : West)
  AIE.wire(%170 : Core, %220 : Core)
  AIE.wire(%170 : DMA, %220 : DMA)
  AIE.wire(%219 : North, %220 : South)
  AIE.wire(%216 : East, %221 : West)
  AIE.wire(%171 : Core, %221 : Core)
  AIE.wire(%171 : DMA, %221 : DMA)
  AIE.wire(%220 : North, %221 : South)
  AIE.wire(%217 : East, %222 : West)
  AIE.wire(%172 : Core, %222 : Core)
  AIE.wire(%172 : DMA, %222 : DMA)
  AIE.wire(%221 : North, %222 : South)
  AIE.wire(%218 : East, %223 : West)
  AIE.wire(%173 : Core, %223 : Core)
  AIE.wire(%173 : DMA, %223 : DMA)
  AIE.wire(%222 : North, %223 : South)
  AIE.wire(%219 : East, %224 : West)
  %255 = AIE.shimmux(%174) {
  }
  AIE.wire(%255 : North, %224 : South)
  AIE.wire(%246 : North, %255 : South)
  AIE.wire(%174 : DMA, %255 : DMA)
  AIE.wire(%220 : East, %225 : West)
  AIE.wire(%175 : Core, %225 : Core)
  AIE.wire(%175 : DMA, %225 : DMA)
  AIE.wire(%224 : North, %225 : South)
  AIE.wire(%221 : East, %226 : West)
  AIE.wire(%176 : Core, %226 : Core)
  AIE.wire(%176 : DMA, %226 : DMA)
  AIE.wire(%225 : North, %226 : South)
  AIE.wire(%222 : East, %227 : West)
  AIE.wire(%177 : Core, %227 : Core)
  AIE.wire(%177 : DMA, %227 : DMA)
  AIE.wire(%226 : North, %227 : South)
  AIE.wire(%223 : East, %228 : West)
  AIE.wire(%178 : Core, %228 : Core)
  AIE.wire(%178 : DMA, %228 : DMA)
  AIE.wire(%227 : North, %228 : South)
  AIE.wire(%224 : East, %229 : West)
  AIE.wire(%247 : North, %229 : South)
  AIE.wire(%225 : East, %230 : West)
  AIE.wire(%180 : Core, %230 : Core)
  AIE.wire(%180 : DMA, %230 : DMA)
  AIE.wire(%229 : North, %230 : South)
  AIE.wire(%226 : East, %231 : West)
  AIE.wire(%181 : Core, %231 : Core)
  AIE.wire(%181 : DMA, %231 : DMA)
  AIE.wire(%230 : North, %231 : South)
  AIE.wire(%227 : East, %232 : West)
  AIE.wire(%182 : Core, %232 : Core)
  AIE.wire(%182 : DMA, %232 : DMA)
  AIE.wire(%231 : North, %232 : South)
  AIE.wire(%228 : East, %233 : West)
  AIE.wire(%183 : Core, %233 : Core)
  AIE.wire(%183 : DMA, %233 : DMA)
  AIE.wire(%232 : North, %233 : South)
  AIE.wire(%229 : East, %234 : West)
  AIE.wire(%248 : North, %234 : South)
  AIE.wire(%230 : East, %235 : West)
  AIE.wire(%185 : Core, %235 : Core)
  AIE.wire(%185 : DMA, %235 : DMA)
  AIE.wire(%234 : North, %235 : South)
  AIE.wire(%231 : East, %236 : West)
  AIE.wire(%186 : Core, %236 : Core)
  AIE.wire(%186 : DMA, %236 : DMA)
  AIE.wire(%235 : North, %236 : South)
  AIE.wire(%232 : East, %237 : West)
  AIE.wire(%187 : Core, %237 : Core)
  AIE.wire(%187 : DMA, %237 : DMA)
  AIE.wire(%236 : North, %237 : South)
  AIE.wire(%233 : East, %238 : West)
  AIE.wire(%188 : Core, %238 : Core)
  AIE.wire(%188 : DMA, %238 : DMA)
  AIE.wire(%237 : North, %238 : South)
  AIE.wire(%234 : East, %2 : West)
  AIE.wire(%1 : North, %2 : South)
  AIE.wire(%249 : North, %1 : South)
  AIE.wire(%0 : DMA, %1 : DMA)
  AIE.wire(%235 : East, %138 : West)
  AIE.wire(%137 : Core, %138 : Core)
  AIE.wire(%137 : DMA, %138 : DMA)
  AIE.wire(%2 : North, %138 : South)
  AIE.wire(%236 : East, %36 : West)
  AIE.wire(%35 : Core, %36 : Core)
  AIE.wire(%35 : DMA, %36 : DMA)
  AIE.wire(%138 : North, %36 : South)
  AIE.wire(%237 : East, %46 : West)
  AIE.wire(%45 : Core, %46 : Core)
  AIE.wire(%45 : DMA, %46 : DMA)
  AIE.wire(%36 : North, %46 : South)
  AIE.wire(%238 : East, %57 : West)
  AIE.wire(%55 : Core, %57 : Core)
  AIE.wire(%55 : DMA, %57 : DMA)
  AIE.wire(%46 : North, %57 : South)
  AIE.wire(%2 : East, %18 : West)
  AIE.wire(%17 : North, %18 : South)
  AIE.wire(%250 : North, %17 : South)
  AIE.wire(%16 : DMA, %17 : DMA)
  AIE.wire(%138 : East, %136 : West)
  AIE.wire(%135 : Core, %136 : Core)
  AIE.wire(%135 : DMA, %136 : DMA)
  AIE.wire(%18 : North, %136 : South)
  AIE.wire(%36 : East, %68 : West)
  AIE.wire(%67 : Core, %68 : Core)
  AIE.wire(%67 : DMA, %68 : DMA)
  AIE.wire(%136 : North, %68 : South)
  AIE.wire(%46 : East, %78 : West)
  AIE.wire(%77 : Core, %78 : Core)
  AIE.wire(%77 : DMA, %78 : DMA)
  AIE.wire(%68 : North, %78 : South)
  AIE.wire(%57 : East, %89 : West)
  AIE.wire(%87 : Core, %89 : Core)
  AIE.wire(%87 : DMA, %89 : DMA)
  AIE.wire(%78 : North, %89 : South)
  AIE.wire(%18 : East, %132 : West)
  AIE.wire(%251 : North, %132 : South)
  AIE.wire(%136 : East, %134 : West)
  AIE.wire(%133 : Core, %134 : Core)
  AIE.wire(%133 : DMA, %134 : DMA)
  AIE.wire(%132 : North, %134 : South)
  AIE.wire(%68 : East, %100 : West)
  AIE.wire(%99 : Core, %100 : Core)
  AIE.wire(%99 : DMA, %100 : DMA)
  AIE.wire(%134 : North, %100 : South)
  AIE.wire(%78 : East, %110 : West)
  AIE.wire(%109 : Core, %110 : Core)
  AIE.wire(%109 : DMA, %110 : DMA)
  AIE.wire(%100 : North, %110 : South)
  AIE.wire(%89 : East, %121 : West)
  AIE.wire(%119 : Core, %121 : Core)
  AIE.wire(%119 : DMA, %121 : DMA)
  AIE.wire(%110 : North, %121 : South)
}


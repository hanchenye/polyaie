module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(27, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<0> (1)
    %316 = AIE.masterset(North : 0, %315)
    %317 = AIE.masterset(North : 1, %314)
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %314)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %315)
    }
  }
  %3 = AIE.lock(%0, 1)
  %4 = AIE.lock(%0, 0)
  %5 = AIE.external_buffer 2203318222848 {sym_name = "buf0"} : memref<32x32xi32>
  %6 = AIE.external_buffer 2203318226944 {sym_name = "buf1"} : memref<32x32xi32>
  %7 = AIE.shimDMA(%0) {
    %314 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%6 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%5 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    cf.br ^bb1
  ^bb3:  // pred: ^bb0
    AIE.end
  }
  %8 = AIE.tile(26, 0)
  %9 = AIE.shimmux(%8) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %10 = AIE.switchbox(%8) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<0> (1)
    %316 = AIE.amsel<0> (2)
    %317 = AIE.masterset(South : 2, %315)
    %318 = AIE.masterset(North : 0, %316)
    %319 = AIE.masterset(North : 1, %314)
    %320 = AIE.masterset(East : 0, %314)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %315)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %315)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %314)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %316)
    }
  }
  %11 = AIE.lock(%8, 3)
  %12 = AIE.lock(%8, 2)
  %13 = AIE.lock(%8, 1)
  %14 = AIE.lock(%8, 0)
  %15 = AIE.external_buffer 2203318231040 {sym_name = "buf2"} : memref<32x32xi32>
  %16 = AIE.external_buffer 2203318235136 {sym_name = "buf3"} : memref<32x32xi32>
  %17 = AIE.external_buffer 2203318239232 {sym_name = "buf4"} : memref<32x32xi32>
  %18 = AIE.external_buffer 2203318243328 {sym_name = "buf5"} : memref<32x32xi32>
  %19 = AIE.external_buffer 2203318247424 {sym_name = "buf6"} : memref<1025xi32>
  %20 = AIE.external_buffer 2203318255616 {sym_name = "buf7"} : memref<1025xi32>
  %21 = AIE.shimDMA(%8) {
    %314 = AIE.dmaStart(S2MM0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%19 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%20 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb3:  // pred: ^bb0
    %315 = AIE.dmaStart(MM2S0, ^bb4, ^bb6)
  ^bb4:  // 2 preds: ^bb3, ^bb5
    AIE.useLock(%13, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%17 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%13, Release, 0)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%12, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%15 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%12, Release, 0)
    cf.br ^bb4
  ^bb6:  // pred: ^bb3
    %316 = AIE.dmaStart(MM2S1, ^bb7, ^bb9)
  ^bb7:  // 2 preds: ^bb6, ^bb8
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%18 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 0)
    cf.br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%14, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%16 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%14, Release, 0)
    cf.br ^bb7
  ^bb9:  // pred: ^bb6
    AIE.end
  }
  %22 = AIE.tile(26, 2)
  %23 = AIE.switchbox(%22) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<1> (0)
    %316 = AIE.amsel<0> (1)
    %317 = AIE.amsel<1> (1)
    %318 = AIE.amsel<0> (2)
    %319 = AIE.amsel<0> (3)
    %320 = AIE.masterset(DMA : 0, %315)
    %321 = AIE.masterset(DMA : 1, %314)
    %322 = AIE.masterset(South : 0, %318)
    %323 = AIE.masterset(South : 1, %317)
    %324 = AIE.masterset(North : 0, %319)
    %325 = AIE.masterset(North : 1, %316)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %317)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %318)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %314)
      AIE.rule(31, 1, %316)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %315)
      AIE.rule(31, 5, %319)
    }
  }
  %24 = AIE.lock(%22, 1)
  %25 = AIE.lock(%22, 0)
  %26 = AIE.buffer(%22) {address = 4096 : i32, sym_name = "buf8"} : memref<32x32xi32>
  %27 = AIE.buffer(%22) {address = 8192 : i32, sym_name = "buf9"} : memref<32x32xi32>
  %28 = AIE.buffer(%22) {address = 12288 : i32, sym_name = "buf10"} : memref<32x32xi32>
  %29 = AIE.buffer(%22) {address = 16384 : i32, sym_name = "buf11"} : memref<32x32xi32>
  %30 = AIE.core(%22) {
    AIE.useLock(%25, Acquire, 1)
    AIE.useLock(%24, Acquire, 1)
    AIE.useLock(%38, Acquire, 0)
    call @extern_kernel(%29, %26, %27, %28) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%38, Release, 1)
    AIE.useLock(%24, Release, 0)
    AIE.useLock(%25, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %31 = AIE.mem(%22) {
    %314 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%24, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%28 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %315 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%25, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%27 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%25, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %32 = AIE.tile(26, 3) {polyaie.leaf}
  %33 = AIE.lock(%32, 15)
  %34 = AIE.switchbox(%32) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<0> (1)
    %316 = AIE.amsel<0> (2)
    %317 = AIE.amsel<0> (3)
    %318 = AIE.masterset(DMA : 0, %315)
    %319 = AIE.masterset(DMA : 1, %316)
    %320 = AIE.masterset(South : 0, %317)
    %321 = AIE.masterset(South : 1, %314)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %314)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %317)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %315)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %316)
    }
  }
  %35 = AIE.lock(%32, 3)
  %36 = AIE.lock(%32, 2)
  %37 = AIE.lock(%32, 1)
  %38 = AIE.lock(%32, 0)
  %39 = AIE.buffer(%32) {address = 4096 : i32, sym_name = "buf12"} : memref<32x32xi32>
  %40 = AIE.buffer(%32) {address = 8192 : i32, sym_name = "buf13"} : memref<32x32xi32>
  %41 = AIE.buffer(%32) {address = 12288 : i32, sym_name = "buf14"} : memref<32x32xi32>
  %42 = AIE.core(%32) {
    AIE.useLock(%38, Acquire, 1)
    AIE.useLock(%37, Acquire, 1)
    AIE.useLock(%35, Acquire, 1)
    AIE.useLock(%36, Acquire, 0)
    call @extern_kernel(%26, %39, %40, %41) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%36, Release, 1)
    AIE.useLock(%35, Release, 0)
    AIE.useLock(%37, Release, 0)
    AIE.useLock(%38, Release, 0)
    AIE.useLock(%33, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %43 = AIE.mem(%32) {
    %314 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%35, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%40 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %315 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%41 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %316 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%36, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%39 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %44 = AIE.tile(27, 2)
  %45 = AIE.switchbox(%44) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<0> (1)
    %316 = AIE.amsel<0> (2)
    %317 = AIE.amsel<0> (3)
    %318 = AIE.masterset(DMA : 0, %314)
    %319 = AIE.masterset(DMA : 1, %317)
    %320 = AIE.masterset(North : 0, %315)
    %321 = AIE.masterset(North : 1, %316)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %317)
      AIE.rule(31, 1, %316)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %314)
      AIE.rule(31, 5, %315)
    }
  }
  %46 = AIE.lock(%44, 1)
  %47 = AIE.lock(%44, 0)
  %48 = AIE.buffer(%44) {address = 4096 : i32, sym_name = "buf15"} : memref<32x32xi32>
  %49 = AIE.buffer(%44) {address = 8192 : i32, sym_name = "buf16"} : memref<32x32xi32>
  %50 = AIE.buffer(%44) {address = 12288 : i32, sym_name = "buf17"} : memref<32x32xi32>
  %51 = AIE.buffer(%44) {address = 16384 : i32, sym_name = "buf18"} : memref<32x32xi32>
  %52 = AIE.core(%44) {
    AIE.useLock(%58, Acquire, 0)
    AIE.useLock(%47, Acquire, 1)
    AIE.useLock(%46, Acquire, 1)
    call @extern_kernel(%51, %48, %49, %50) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%46, Release, 0)
    AIE.useLock(%47, Release, 0)
    AIE.useLock(%58, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %53 = AIE.mem(%44) {
    %314 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%50 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %315 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%47, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%49 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %54 = AIE.tile(27, 3) {polyaie.leaf}
  %55 = AIE.lock(%54, 15)
  %56 = AIE.switchbox(%54) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<0> (1)
    %316 = AIE.amsel<0> (2)
    %317 = AIE.masterset(DMA : 0, %315)
    %318 = AIE.masterset(DMA : 1, %316)
    %319 = AIE.masterset(West : 0, %314)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %314)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %316)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %315)
    }
  }
  %57 = AIE.lock(%54, 3)
  %58 = AIE.lock(%54, 2)
  %59 = AIE.lock(%54, 1)
  %60 = AIE.lock(%54, 0)
  %61 = AIE.buffer(%54) {address = 4096 : i32, sym_name = "buf19"} : memref<32x32xi32>
  %62 = AIE.buffer(%54) {address = 8192 : i32, sym_name = "buf20"} : memref<32x32xi32>
  %63 = AIE.buffer(%54) {address = 12288 : i32, sym_name = "buf21"} : memref<32x32xi32>
  %64 = AIE.core(%54) {
    AIE.useLock(%58, Acquire, 1)
    AIE.useLock(%57, Acquire, 1)
    AIE.useLock(%59, Acquire, 0)
    AIE.useLock(%60, Acquire, 1)
    call @extern_kernel(%48, %61, %62, %63) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%60, Release, 0)
    AIE.useLock(%59, Release, 1)
    AIE.useLock(%57, Release, 0)
    AIE.useLock(%58, Release, 0)
    AIE.useLock(%55, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %65 = AIE.mem(%54) {
    %314 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%63 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %315 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%57, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%62 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %316 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%59, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%61 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%59, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %66 = AIE.tile(27, 1)
  %67 = AIE.switchbox(%66) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<0> (1)
    %316 = AIE.masterset(North : 0, %315)
    %317 = AIE.masterset(North : 1, %314)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %314)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %315)
    }
  }
  %68 = AIE.tile(26, 1)
  %69 = AIE.switchbox(%68) {
    %314 = AIE.amsel<0> (0)
    %315 = AIE.amsel<0> (1)
    %316 = AIE.amsel<0> (2)
    %317 = AIE.amsel<0> (3)
    %318 = AIE.masterset(South : 0, %314)
    %319 = AIE.masterset(South : 1, %316)
    %320 = AIE.masterset(North : 0, %317)
    %321 = AIE.masterset(North : 1, %315)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %316)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %314)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %315)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %317)
    }
  }
  %70 = AIE.tile(0, 0)
  %71 = AIE.tile(0, 1)
  %72 = AIE.tile(0, 2)
  %73 = AIE.tile(0, 3)
  %74 = AIE.tile(1, 0)
  %75 = AIE.tile(1, 1)
  %76 = AIE.tile(1, 2)
  %77 = AIE.tile(1, 3)
  %78 = AIE.tile(2, 0)
  %79 = AIE.tile(2, 1)
  %80 = AIE.tile(2, 2)
  %81 = AIE.tile(2, 3)
  %82 = AIE.tile(3, 0)
  %83 = AIE.tile(3, 1)
  %84 = AIE.tile(3, 2)
  %85 = AIE.tile(3, 3)
  %86 = AIE.tile(4, 0)
  %87 = AIE.tile(4, 1)
  %88 = AIE.tile(4, 2)
  %89 = AIE.tile(4, 3)
  %90 = AIE.tile(5, 0)
  %91 = AIE.tile(5, 1)
  %92 = AIE.tile(5, 2)
  %93 = AIE.tile(5, 3)
  %94 = AIE.tile(6, 0)
  %95 = AIE.tile(6, 1)
  %96 = AIE.tile(6, 2)
  %97 = AIE.tile(6, 3)
  %98 = AIE.tile(7, 0)
  %99 = AIE.tile(7, 1)
  %100 = AIE.tile(7, 2)
  %101 = AIE.tile(7, 3)
  %102 = AIE.tile(8, 0)
  %103 = AIE.tile(8, 1)
  %104 = AIE.tile(8, 2)
  %105 = AIE.tile(8, 3)
  %106 = AIE.tile(9, 0)
  %107 = AIE.tile(9, 1)
  %108 = AIE.tile(9, 2)
  %109 = AIE.tile(9, 3)
  %110 = AIE.tile(10, 0)
  %111 = AIE.tile(10, 1)
  %112 = AIE.tile(10, 2)
  %113 = AIE.tile(10, 3)
  %114 = AIE.tile(11, 0)
  %115 = AIE.tile(11, 1)
  %116 = AIE.tile(11, 2)
  %117 = AIE.tile(11, 3)
  %118 = AIE.tile(12, 0)
  %119 = AIE.tile(12, 1)
  %120 = AIE.tile(12, 2)
  %121 = AIE.tile(12, 3)
  %122 = AIE.tile(13, 0)
  %123 = AIE.tile(13, 1)
  %124 = AIE.tile(13, 2)
  %125 = AIE.tile(13, 3)
  %126 = AIE.tile(14, 0)
  %127 = AIE.tile(14, 1)
  %128 = AIE.tile(14, 2)
  %129 = AIE.tile(14, 3)
  %130 = AIE.tile(15, 0)
  %131 = AIE.tile(15, 1)
  %132 = AIE.tile(15, 2)
  %133 = AIE.tile(15, 3)
  %134 = AIE.tile(16, 0)
  %135 = AIE.tile(16, 1)
  %136 = AIE.tile(16, 2)
  %137 = AIE.tile(16, 3)
  %138 = AIE.tile(17, 0)
  %139 = AIE.tile(17, 1)
  %140 = AIE.tile(17, 2)
  %141 = AIE.tile(17, 3)
  %142 = AIE.tile(18, 0)
  %143 = AIE.tile(18, 1)
  %144 = AIE.tile(18, 2)
  %145 = AIE.tile(18, 3)
  %146 = AIE.tile(19, 0)
  %147 = AIE.tile(19, 1)
  %148 = AIE.tile(19, 2)
  %149 = AIE.tile(19, 3)
  %150 = AIE.tile(20, 0)
  %151 = AIE.tile(20, 1)
  %152 = AIE.tile(20, 2)
  %153 = AIE.tile(20, 3)
  %154 = AIE.tile(21, 0)
  %155 = AIE.tile(21, 1)
  %156 = AIE.tile(21, 2)
  %157 = AIE.tile(21, 3)
  %158 = AIE.tile(22, 0)
  %159 = AIE.tile(22, 1)
  %160 = AIE.tile(22, 2)
  %161 = AIE.tile(22, 3)
  %162 = AIE.tile(23, 0)
  %163 = AIE.tile(23, 1)
  %164 = AIE.tile(23, 2)
  %165 = AIE.tile(23, 3)
  %166 = AIE.tile(24, 0)
  %167 = AIE.tile(24, 1)
  %168 = AIE.tile(24, 2)
  %169 = AIE.tile(24, 3)
  %170 = AIE.tile(25, 0)
  %171 = AIE.tile(25, 1)
  %172 = AIE.tile(25, 2)
  %173 = AIE.tile(25, 3)
  %174 = AIE.switchbox(%70) {
  }
  %175 = AIE.switchbox(%71) {
  }
  %176 = AIE.switchbox(%72) {
  }
  %177 = AIE.switchbox(%73) {
  }
  %178 = AIE.switchbox(%74) {
  }
  %179 = AIE.switchbox(%75) {
  }
  %180 = AIE.switchbox(%76) {
  }
  %181 = AIE.switchbox(%77) {
  }
  %182 = AIE.switchbox(%78) {
  }
  %183 = AIE.switchbox(%79) {
  }
  %184 = AIE.switchbox(%80) {
  }
  %185 = AIE.switchbox(%81) {
  }
  %186 = AIE.switchbox(%82) {
  }
  %187 = AIE.switchbox(%83) {
  }
  %188 = AIE.switchbox(%84) {
  }
  %189 = AIE.switchbox(%85) {
  }
  %190 = AIE.switchbox(%86) {
  }
  %191 = AIE.switchbox(%87) {
  }
  %192 = AIE.switchbox(%88) {
  }
  %193 = AIE.switchbox(%89) {
  }
  %194 = AIE.switchbox(%90) {
  }
  %195 = AIE.switchbox(%91) {
  }
  %196 = AIE.switchbox(%92) {
  }
  %197 = AIE.switchbox(%93) {
  }
  %198 = AIE.switchbox(%94) {
  }
  %199 = AIE.switchbox(%95) {
  }
  %200 = AIE.switchbox(%96) {
  }
  %201 = AIE.switchbox(%97) {
  }
  %202 = AIE.switchbox(%98) {
  }
  %203 = AIE.switchbox(%99) {
  }
  %204 = AIE.switchbox(%100) {
  }
  %205 = AIE.switchbox(%101) {
  }
  %206 = AIE.switchbox(%102) {
  }
  %207 = AIE.switchbox(%103) {
  }
  %208 = AIE.switchbox(%104) {
  }
  %209 = AIE.switchbox(%105) {
  }
  %210 = AIE.switchbox(%106) {
  }
  %211 = AIE.switchbox(%107) {
  }
  %212 = AIE.switchbox(%108) {
  }
  %213 = AIE.switchbox(%109) {
  }
  %214 = AIE.switchbox(%110) {
  }
  %215 = AIE.switchbox(%111) {
  }
  %216 = AIE.switchbox(%112) {
  }
  %217 = AIE.switchbox(%113) {
  }
  %218 = AIE.switchbox(%114) {
  }
  %219 = AIE.switchbox(%115) {
  }
  %220 = AIE.switchbox(%116) {
  }
  %221 = AIE.switchbox(%117) {
  }
  %222 = AIE.switchbox(%118) {
  }
  %223 = AIE.switchbox(%119) {
  }
  %224 = AIE.switchbox(%120) {
  }
  %225 = AIE.switchbox(%121) {
  }
  %226 = AIE.switchbox(%122) {
  }
  %227 = AIE.switchbox(%123) {
  }
  %228 = AIE.switchbox(%124) {
  }
  %229 = AIE.switchbox(%125) {
  }
  %230 = AIE.switchbox(%126) {
  }
  %231 = AIE.switchbox(%127) {
  }
  %232 = AIE.switchbox(%128) {
  }
  %233 = AIE.switchbox(%129) {
  }
  %234 = AIE.switchbox(%130) {
  }
  %235 = AIE.switchbox(%131) {
  }
  %236 = AIE.switchbox(%132) {
  }
  %237 = AIE.switchbox(%133) {
  }
  %238 = AIE.switchbox(%134) {
  }
  %239 = AIE.switchbox(%135) {
  }
  %240 = AIE.switchbox(%136) {
  }
  %241 = AIE.switchbox(%137) {
  }
  %242 = AIE.switchbox(%138) {
  }
  %243 = AIE.switchbox(%139) {
  }
  %244 = AIE.switchbox(%140) {
  }
  %245 = AIE.switchbox(%141) {
  }
  %246 = AIE.switchbox(%142) {
  }
  %247 = AIE.switchbox(%143) {
  }
  %248 = AIE.switchbox(%144) {
  }
  %249 = AIE.switchbox(%145) {
  }
  %250 = AIE.switchbox(%146) {
  }
  %251 = AIE.switchbox(%147) {
  }
  %252 = AIE.switchbox(%148) {
  }
  %253 = AIE.switchbox(%149) {
  }
  %254 = AIE.switchbox(%150) {
  }
  %255 = AIE.switchbox(%151) {
  }
  %256 = AIE.switchbox(%152) {
  }
  %257 = AIE.switchbox(%153) {
  }
  %258 = AIE.switchbox(%154) {
  }
  %259 = AIE.switchbox(%155) {
  }
  %260 = AIE.switchbox(%156) {
  }
  %261 = AIE.switchbox(%157) {
  }
  %262 = AIE.switchbox(%158) {
  }
  %263 = AIE.switchbox(%159) {
  }
  %264 = AIE.switchbox(%160) {
  }
  %265 = AIE.switchbox(%161) {
  }
  %266 = AIE.switchbox(%162) {
  }
  %267 = AIE.switchbox(%163) {
  }
  %268 = AIE.switchbox(%164) {
  }
  %269 = AIE.switchbox(%165) {
  }
  %270 = AIE.switchbox(%166) {
  }
  %271 = AIE.switchbox(%167) {
  }
  %272 = AIE.switchbox(%168) {
  }
  %273 = AIE.switchbox(%169) {
  }
  %274 = AIE.switchbox(%170) {
  }
  %275 = AIE.switchbox(%171) {
  }
  %276 = AIE.switchbox(%172) {
  }
  %277 = AIE.switchbox(%173) {
  }
  %278 = AIE.plio(0)
  %279 = AIE.plio(1)
  %280 = AIE.plio(2)
  %281 = AIE.plio(3)
  %282 = AIE.plio(4)
  %283 = AIE.plio(5)
  %284 = AIE.plio(6)
  %285 = AIE.plio(7)
  %286 = AIE.plio(8)
  %287 = AIE.plio(9)
  %288 = AIE.plio(10)
  %289 = AIE.plio(11)
  %290 = AIE.plio(12)
  %291 = AIE.plio(13)
  %292 = AIE.plio(14)
  %293 = AIE.plio(15)
  %294 = AIE.plio(16)
  %295 = AIE.plio(17)
  %296 = AIE.plio(18)
  %297 = AIE.plio(19)
  %298 = AIE.plio(20)
  %299 = AIE.plio(21)
  %300 = AIE.plio(22)
  %301 = AIE.plio(23)
  %302 = AIE.plio(24)
  %303 = AIE.plio(25)
  %304 = AIE.plio(26)
  %305 = AIE.plio(27)
  AIE.wire(%71 : Core, %175 : Core)
  AIE.wire(%71 : DMA, %175 : DMA)
  AIE.wire(%174 : North, %175 : South)
  AIE.wire(%72 : Core, %176 : Core)
  AIE.wire(%72 : DMA, %176 : DMA)
  AIE.wire(%175 : North, %176 : South)
  AIE.wire(%73 : Core, %177 : Core)
  AIE.wire(%73 : DMA, %177 : DMA)
  AIE.wire(%176 : North, %177 : South)
  AIE.wire(%174 : East, %178 : West)
  AIE.wire(%279 : North, %178 : South)
  AIE.wire(%175 : East, %179 : West)
  AIE.wire(%75 : Core, %179 : Core)
  AIE.wire(%75 : DMA, %179 : DMA)
  AIE.wire(%178 : North, %179 : South)
  AIE.wire(%176 : East, %180 : West)
  AIE.wire(%76 : Core, %180 : Core)
  AIE.wire(%76 : DMA, %180 : DMA)
  AIE.wire(%179 : North, %180 : South)
  AIE.wire(%177 : East, %181 : West)
  AIE.wire(%77 : Core, %181 : Core)
  AIE.wire(%77 : DMA, %181 : DMA)
  AIE.wire(%180 : North, %181 : South)
  AIE.wire(%178 : East, %182 : West)
  %306 = AIE.shimmux(%78) {
  }
  AIE.wire(%306 : North, %182 : South)
  AIE.wire(%280 : North, %306 : South)
  AIE.wire(%78 : DMA, %306 : DMA)
  AIE.wire(%179 : East, %183 : West)
  AIE.wire(%79 : Core, %183 : Core)
  AIE.wire(%79 : DMA, %183 : DMA)
  AIE.wire(%182 : North, %183 : South)
  AIE.wire(%180 : East, %184 : West)
  AIE.wire(%80 : Core, %184 : Core)
  AIE.wire(%80 : DMA, %184 : DMA)
  AIE.wire(%183 : North, %184 : South)
  AIE.wire(%181 : East, %185 : West)
  AIE.wire(%81 : Core, %185 : Core)
  AIE.wire(%81 : DMA, %185 : DMA)
  AIE.wire(%184 : North, %185 : South)
  AIE.wire(%182 : East, %186 : West)
  %307 = AIE.shimmux(%82) {
  }
  AIE.wire(%307 : North, %186 : South)
  AIE.wire(%281 : North, %307 : South)
  AIE.wire(%82 : DMA, %307 : DMA)
  AIE.wire(%183 : East, %187 : West)
  AIE.wire(%83 : Core, %187 : Core)
  AIE.wire(%83 : DMA, %187 : DMA)
  AIE.wire(%186 : North, %187 : South)
  AIE.wire(%184 : East, %188 : West)
  AIE.wire(%84 : Core, %188 : Core)
  AIE.wire(%84 : DMA, %188 : DMA)
  AIE.wire(%187 : North, %188 : South)
  AIE.wire(%185 : East, %189 : West)
  AIE.wire(%85 : Core, %189 : Core)
  AIE.wire(%85 : DMA, %189 : DMA)
  AIE.wire(%188 : North, %189 : South)
  AIE.wire(%186 : East, %190 : West)
  AIE.wire(%282 : North, %190 : South)
  AIE.wire(%187 : East, %191 : West)
  AIE.wire(%87 : Core, %191 : Core)
  AIE.wire(%87 : DMA, %191 : DMA)
  AIE.wire(%190 : North, %191 : South)
  AIE.wire(%188 : East, %192 : West)
  AIE.wire(%88 : Core, %192 : Core)
  AIE.wire(%88 : DMA, %192 : DMA)
  AIE.wire(%191 : North, %192 : South)
  AIE.wire(%189 : East, %193 : West)
  AIE.wire(%89 : Core, %193 : Core)
  AIE.wire(%89 : DMA, %193 : DMA)
  AIE.wire(%192 : North, %193 : South)
  AIE.wire(%190 : East, %194 : West)
  AIE.wire(%283 : North, %194 : South)
  AIE.wire(%191 : East, %195 : West)
  AIE.wire(%91 : Core, %195 : Core)
  AIE.wire(%91 : DMA, %195 : DMA)
  AIE.wire(%194 : North, %195 : South)
  AIE.wire(%192 : East, %196 : West)
  AIE.wire(%92 : Core, %196 : Core)
  AIE.wire(%92 : DMA, %196 : DMA)
  AIE.wire(%195 : North, %196 : South)
  AIE.wire(%193 : East, %197 : West)
  AIE.wire(%93 : Core, %197 : Core)
  AIE.wire(%93 : DMA, %197 : DMA)
  AIE.wire(%196 : North, %197 : South)
  AIE.wire(%194 : East, %198 : West)
  %308 = AIE.shimmux(%94) {
  }
  AIE.wire(%308 : North, %198 : South)
  AIE.wire(%284 : North, %308 : South)
  AIE.wire(%94 : DMA, %308 : DMA)
  AIE.wire(%195 : East, %199 : West)
  AIE.wire(%95 : Core, %199 : Core)
  AIE.wire(%95 : DMA, %199 : DMA)
  AIE.wire(%198 : North, %199 : South)
  AIE.wire(%196 : East, %200 : West)
  AIE.wire(%96 : Core, %200 : Core)
  AIE.wire(%96 : DMA, %200 : DMA)
  AIE.wire(%199 : North, %200 : South)
  AIE.wire(%197 : East, %201 : West)
  AIE.wire(%97 : Core, %201 : Core)
  AIE.wire(%97 : DMA, %201 : DMA)
  AIE.wire(%200 : North, %201 : South)
  AIE.wire(%198 : East, %202 : West)
  %309 = AIE.shimmux(%98) {
  }
  AIE.wire(%309 : North, %202 : South)
  AIE.wire(%285 : North, %309 : South)
  AIE.wire(%98 : DMA, %309 : DMA)
  AIE.wire(%199 : East, %203 : West)
  AIE.wire(%99 : Core, %203 : Core)
  AIE.wire(%99 : DMA, %203 : DMA)
  AIE.wire(%202 : North, %203 : South)
  AIE.wire(%200 : East, %204 : West)
  AIE.wire(%100 : Core, %204 : Core)
  AIE.wire(%100 : DMA, %204 : DMA)
  AIE.wire(%203 : North, %204 : South)
  AIE.wire(%201 : East, %205 : West)
  AIE.wire(%101 : Core, %205 : Core)
  AIE.wire(%101 : DMA, %205 : DMA)
  AIE.wire(%204 : North, %205 : South)
  AIE.wire(%202 : East, %206 : West)
  AIE.wire(%286 : North, %206 : South)
  AIE.wire(%203 : East, %207 : West)
  AIE.wire(%103 : Core, %207 : Core)
  AIE.wire(%103 : DMA, %207 : DMA)
  AIE.wire(%206 : North, %207 : South)
  AIE.wire(%204 : East, %208 : West)
  AIE.wire(%104 : Core, %208 : Core)
  AIE.wire(%104 : DMA, %208 : DMA)
  AIE.wire(%207 : North, %208 : South)
  AIE.wire(%205 : East, %209 : West)
  AIE.wire(%105 : Core, %209 : Core)
  AIE.wire(%105 : DMA, %209 : DMA)
  AIE.wire(%208 : North, %209 : South)
  AIE.wire(%206 : East, %210 : West)
  AIE.wire(%287 : North, %210 : South)
  AIE.wire(%207 : East, %211 : West)
  AIE.wire(%107 : Core, %211 : Core)
  AIE.wire(%107 : DMA, %211 : DMA)
  AIE.wire(%210 : North, %211 : South)
  AIE.wire(%208 : East, %212 : West)
  AIE.wire(%108 : Core, %212 : Core)
  AIE.wire(%108 : DMA, %212 : DMA)
  AIE.wire(%211 : North, %212 : South)
  AIE.wire(%209 : East, %213 : West)
  AIE.wire(%109 : Core, %213 : Core)
  AIE.wire(%109 : DMA, %213 : DMA)
  AIE.wire(%212 : North, %213 : South)
  AIE.wire(%210 : East, %214 : West)
  %310 = AIE.shimmux(%110) {
  }
  AIE.wire(%310 : North, %214 : South)
  AIE.wire(%288 : North, %310 : South)
  AIE.wire(%110 : DMA, %310 : DMA)
  AIE.wire(%211 : East, %215 : West)
  AIE.wire(%111 : Core, %215 : Core)
  AIE.wire(%111 : DMA, %215 : DMA)
  AIE.wire(%214 : North, %215 : South)
  AIE.wire(%212 : East, %216 : West)
  AIE.wire(%112 : Core, %216 : Core)
  AIE.wire(%112 : DMA, %216 : DMA)
  AIE.wire(%215 : North, %216 : South)
  AIE.wire(%213 : East, %217 : West)
  AIE.wire(%113 : Core, %217 : Core)
  AIE.wire(%113 : DMA, %217 : DMA)
  AIE.wire(%216 : North, %217 : South)
  AIE.wire(%214 : East, %218 : West)
  %311 = AIE.shimmux(%114) {
  }
  AIE.wire(%311 : North, %218 : South)
  AIE.wire(%289 : North, %311 : South)
  AIE.wire(%114 : DMA, %311 : DMA)
  AIE.wire(%215 : East, %219 : West)
  AIE.wire(%115 : Core, %219 : Core)
  AIE.wire(%115 : DMA, %219 : DMA)
  AIE.wire(%218 : North, %219 : South)
  AIE.wire(%216 : East, %220 : West)
  AIE.wire(%116 : Core, %220 : Core)
  AIE.wire(%116 : DMA, %220 : DMA)
  AIE.wire(%219 : North, %220 : South)
  AIE.wire(%217 : East, %221 : West)
  AIE.wire(%117 : Core, %221 : Core)
  AIE.wire(%117 : DMA, %221 : DMA)
  AIE.wire(%220 : North, %221 : South)
  AIE.wire(%218 : East, %222 : West)
  AIE.wire(%290 : North, %222 : South)
  AIE.wire(%219 : East, %223 : West)
  AIE.wire(%119 : Core, %223 : Core)
  AIE.wire(%119 : DMA, %223 : DMA)
  AIE.wire(%222 : North, %223 : South)
  AIE.wire(%220 : East, %224 : West)
  AIE.wire(%120 : Core, %224 : Core)
  AIE.wire(%120 : DMA, %224 : DMA)
  AIE.wire(%223 : North, %224 : South)
  AIE.wire(%221 : East, %225 : West)
  AIE.wire(%121 : Core, %225 : Core)
  AIE.wire(%121 : DMA, %225 : DMA)
  AIE.wire(%224 : North, %225 : South)
  AIE.wire(%222 : East, %226 : West)
  AIE.wire(%291 : North, %226 : South)
  AIE.wire(%223 : East, %227 : West)
  AIE.wire(%123 : Core, %227 : Core)
  AIE.wire(%123 : DMA, %227 : DMA)
  AIE.wire(%226 : North, %227 : South)
  AIE.wire(%224 : East, %228 : West)
  AIE.wire(%124 : Core, %228 : Core)
  AIE.wire(%124 : DMA, %228 : DMA)
  AIE.wire(%227 : North, %228 : South)
  AIE.wire(%225 : East, %229 : West)
  AIE.wire(%125 : Core, %229 : Core)
  AIE.wire(%125 : DMA, %229 : DMA)
  AIE.wire(%228 : North, %229 : South)
  AIE.wire(%226 : East, %230 : West)
  AIE.wire(%292 : North, %230 : South)
  AIE.wire(%227 : East, %231 : West)
  AIE.wire(%127 : Core, %231 : Core)
  AIE.wire(%127 : DMA, %231 : DMA)
  AIE.wire(%230 : North, %231 : South)
  AIE.wire(%228 : East, %232 : West)
  AIE.wire(%128 : Core, %232 : Core)
  AIE.wire(%128 : DMA, %232 : DMA)
  AIE.wire(%231 : North, %232 : South)
  AIE.wire(%229 : East, %233 : West)
  AIE.wire(%129 : Core, %233 : Core)
  AIE.wire(%129 : DMA, %233 : DMA)
  AIE.wire(%232 : North, %233 : South)
  AIE.wire(%230 : East, %234 : West)
  AIE.wire(%293 : North, %234 : South)
  AIE.wire(%231 : East, %235 : West)
  AIE.wire(%131 : Core, %235 : Core)
  AIE.wire(%131 : DMA, %235 : DMA)
  AIE.wire(%234 : North, %235 : South)
  AIE.wire(%232 : East, %236 : West)
  AIE.wire(%132 : Core, %236 : Core)
  AIE.wire(%132 : DMA, %236 : DMA)
  AIE.wire(%235 : North, %236 : South)
  AIE.wire(%233 : East, %237 : West)
  AIE.wire(%133 : Core, %237 : Core)
  AIE.wire(%133 : DMA, %237 : DMA)
  AIE.wire(%236 : North, %237 : South)
  AIE.wire(%234 : East, %238 : West)
  AIE.wire(%294 : North, %238 : South)
  AIE.wire(%235 : East, %239 : West)
  AIE.wire(%135 : Core, %239 : Core)
  AIE.wire(%135 : DMA, %239 : DMA)
  AIE.wire(%238 : North, %239 : South)
  AIE.wire(%236 : East, %240 : West)
  AIE.wire(%136 : Core, %240 : Core)
  AIE.wire(%136 : DMA, %240 : DMA)
  AIE.wire(%239 : North, %240 : South)
  AIE.wire(%237 : East, %241 : West)
  AIE.wire(%137 : Core, %241 : Core)
  AIE.wire(%137 : DMA, %241 : DMA)
  AIE.wire(%240 : North, %241 : South)
  AIE.wire(%238 : East, %242 : West)
  AIE.wire(%295 : North, %242 : South)
  AIE.wire(%239 : East, %243 : West)
  AIE.wire(%139 : Core, %243 : Core)
  AIE.wire(%139 : DMA, %243 : DMA)
  AIE.wire(%242 : North, %243 : South)
  AIE.wire(%240 : East, %244 : West)
  AIE.wire(%140 : Core, %244 : Core)
  AIE.wire(%140 : DMA, %244 : DMA)
  AIE.wire(%243 : North, %244 : South)
  AIE.wire(%241 : East, %245 : West)
  AIE.wire(%141 : Core, %245 : Core)
  AIE.wire(%141 : DMA, %245 : DMA)
  AIE.wire(%244 : North, %245 : South)
  AIE.wire(%242 : East, %246 : West)
  %312 = AIE.shimmux(%142) {
  }
  AIE.wire(%312 : North, %246 : South)
  AIE.wire(%296 : North, %312 : South)
  AIE.wire(%142 : DMA, %312 : DMA)
  AIE.wire(%243 : East, %247 : West)
  AIE.wire(%143 : Core, %247 : Core)
  AIE.wire(%143 : DMA, %247 : DMA)
  AIE.wire(%246 : North, %247 : South)
  AIE.wire(%244 : East, %248 : West)
  AIE.wire(%144 : Core, %248 : Core)
  AIE.wire(%144 : DMA, %248 : DMA)
  AIE.wire(%247 : North, %248 : South)
  AIE.wire(%245 : East, %249 : West)
  AIE.wire(%145 : Core, %249 : Core)
  AIE.wire(%145 : DMA, %249 : DMA)
  AIE.wire(%248 : North, %249 : South)
  AIE.wire(%246 : East, %250 : West)
  %313 = AIE.shimmux(%146) {
  }
  AIE.wire(%313 : North, %250 : South)
  AIE.wire(%297 : North, %313 : South)
  AIE.wire(%146 : DMA, %313 : DMA)
  AIE.wire(%247 : East, %251 : West)
  AIE.wire(%147 : Core, %251 : Core)
  AIE.wire(%147 : DMA, %251 : DMA)
  AIE.wire(%250 : North, %251 : South)
  AIE.wire(%248 : East, %252 : West)
  AIE.wire(%148 : Core, %252 : Core)
  AIE.wire(%148 : DMA, %252 : DMA)
  AIE.wire(%251 : North, %252 : South)
  AIE.wire(%249 : East, %253 : West)
  AIE.wire(%149 : Core, %253 : Core)
  AIE.wire(%149 : DMA, %253 : DMA)
  AIE.wire(%252 : North, %253 : South)
  AIE.wire(%250 : East, %254 : West)
  AIE.wire(%298 : North, %254 : South)
  AIE.wire(%251 : East, %255 : West)
  AIE.wire(%151 : Core, %255 : Core)
  AIE.wire(%151 : DMA, %255 : DMA)
  AIE.wire(%254 : North, %255 : South)
  AIE.wire(%252 : East, %256 : West)
  AIE.wire(%152 : Core, %256 : Core)
  AIE.wire(%152 : DMA, %256 : DMA)
  AIE.wire(%255 : North, %256 : South)
  AIE.wire(%253 : East, %257 : West)
  AIE.wire(%153 : Core, %257 : Core)
  AIE.wire(%153 : DMA, %257 : DMA)
  AIE.wire(%256 : North, %257 : South)
  AIE.wire(%254 : East, %258 : West)
  AIE.wire(%299 : North, %258 : South)
  AIE.wire(%255 : East, %259 : West)
  AIE.wire(%155 : Core, %259 : Core)
  AIE.wire(%155 : DMA, %259 : DMA)
  AIE.wire(%258 : North, %259 : South)
  AIE.wire(%256 : East, %260 : West)
  AIE.wire(%156 : Core, %260 : Core)
  AIE.wire(%156 : DMA, %260 : DMA)
  AIE.wire(%259 : North, %260 : South)
  AIE.wire(%257 : East, %261 : West)
  AIE.wire(%157 : Core, %261 : Core)
  AIE.wire(%157 : DMA, %261 : DMA)
  AIE.wire(%260 : North, %261 : South)
  AIE.wire(%258 : East, %262 : West)
  AIE.wire(%300 : North, %262 : South)
  AIE.wire(%259 : East, %263 : West)
  AIE.wire(%159 : Core, %263 : Core)
  AIE.wire(%159 : DMA, %263 : DMA)
  AIE.wire(%262 : North, %263 : South)
  AIE.wire(%260 : East, %264 : West)
  AIE.wire(%160 : Core, %264 : Core)
  AIE.wire(%160 : DMA, %264 : DMA)
  AIE.wire(%263 : North, %264 : South)
  AIE.wire(%261 : East, %265 : West)
  AIE.wire(%161 : Core, %265 : Core)
  AIE.wire(%161 : DMA, %265 : DMA)
  AIE.wire(%264 : North, %265 : South)
  AIE.wire(%262 : East, %266 : West)
  AIE.wire(%301 : North, %266 : South)
  AIE.wire(%263 : East, %267 : West)
  AIE.wire(%163 : Core, %267 : Core)
  AIE.wire(%163 : DMA, %267 : DMA)
  AIE.wire(%266 : North, %267 : South)
  AIE.wire(%264 : East, %268 : West)
  AIE.wire(%164 : Core, %268 : Core)
  AIE.wire(%164 : DMA, %268 : DMA)
  AIE.wire(%267 : North, %268 : South)
  AIE.wire(%265 : East, %269 : West)
  AIE.wire(%165 : Core, %269 : Core)
  AIE.wire(%165 : DMA, %269 : DMA)
  AIE.wire(%268 : North, %269 : South)
  AIE.wire(%266 : East, %270 : West)
  AIE.wire(%302 : North, %270 : South)
  AIE.wire(%267 : East, %271 : West)
  AIE.wire(%167 : Core, %271 : Core)
  AIE.wire(%167 : DMA, %271 : DMA)
  AIE.wire(%270 : North, %271 : South)
  AIE.wire(%268 : East, %272 : West)
  AIE.wire(%168 : Core, %272 : Core)
  AIE.wire(%168 : DMA, %272 : DMA)
  AIE.wire(%271 : North, %272 : South)
  AIE.wire(%269 : East, %273 : West)
  AIE.wire(%169 : Core, %273 : Core)
  AIE.wire(%169 : DMA, %273 : DMA)
  AIE.wire(%272 : North, %273 : South)
  AIE.wire(%270 : East, %274 : West)
  AIE.wire(%303 : North, %274 : South)
  AIE.wire(%271 : East, %275 : West)
  AIE.wire(%171 : Core, %275 : Core)
  AIE.wire(%171 : DMA, %275 : DMA)
  AIE.wire(%274 : North, %275 : South)
  AIE.wire(%272 : East, %276 : West)
  AIE.wire(%172 : Core, %276 : Core)
  AIE.wire(%172 : DMA, %276 : DMA)
  AIE.wire(%275 : North, %276 : South)
  AIE.wire(%273 : East, %277 : West)
  AIE.wire(%173 : Core, %277 : Core)
  AIE.wire(%173 : DMA, %277 : DMA)
  AIE.wire(%276 : North, %277 : South)
  AIE.wire(%274 : East, %10 : West)
  AIE.wire(%9 : North, %10 : South)
  AIE.wire(%304 : North, %9 : South)
  AIE.wire(%8 : DMA, %9 : DMA)
  AIE.wire(%275 : East, %69 : West)
  AIE.wire(%68 : Core, %69 : Core)
  AIE.wire(%68 : DMA, %69 : DMA)
  AIE.wire(%10 : North, %69 : South)
  AIE.wire(%276 : East, %23 : West)
  AIE.wire(%22 : Core, %23 : Core)
  AIE.wire(%22 : DMA, %23 : DMA)
  AIE.wire(%69 : North, %23 : South)
  AIE.wire(%277 : East, %34 : West)
  AIE.wire(%32 : Core, %34 : Core)
  AIE.wire(%32 : DMA, %34 : DMA)
  AIE.wire(%23 : North, %34 : South)
  AIE.wire(%10 : East, %2 : West)
  AIE.wire(%1 : North, %2 : South)
  AIE.wire(%305 : North, %1 : South)
  AIE.wire(%0 : DMA, %1 : DMA)
  AIE.wire(%69 : East, %67 : West)
  AIE.wire(%66 : Core, %67 : Core)
  AIE.wire(%66 : DMA, %67 : DMA)
  AIE.wire(%2 : North, %67 : South)
  AIE.wire(%23 : East, %45 : West)
  AIE.wire(%44 : Core, %45 : Core)
  AIE.wire(%44 : DMA, %45 : DMA)
  AIE.wire(%67 : North, %45 : South)
  AIE.wire(%34 : East, %56 : West)
  AIE.wire(%54 : Core, %56 : Core)
  AIE.wire(%54 : DMA, %56 : DMA)
  AIE.wire(%45 : North, %56 : South)
}


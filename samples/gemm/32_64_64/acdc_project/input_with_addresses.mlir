module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(27, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<0> (1)
    %72 = AIE.masterset(North : 0, %71)
    %73 = AIE.masterset(North : 1, %70)
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %70)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %71)
    }
  }
  %3 = AIE.lock(%0, 1)
  %4 = AIE.lock(%0, 0)
  %5 = AIE.external_buffer 2203318222848 {sym_name = "buf0"} : memref<32x32xi32>
  %6 = AIE.external_buffer 2203318226944 {sym_name = "buf1"} : memref<32x32xi32>
  %7 = AIE.shimDMA(%0) {
    %70 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
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
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<0> (1)
    %72 = AIE.amsel<0> (2)
    %73 = AIE.masterset(South : 2, %71)
    %74 = AIE.masterset(North : 0, %72)
    %75 = AIE.masterset(North : 1, %70)
    %76 = AIE.masterset(East : 0, %70)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %71)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %71)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %70)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %72)
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
    %70 = AIE.dmaStart(S2MM0, ^bb1, ^bb3)
  ^bb1:  // 2 preds: ^bb0, ^bb2
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%19 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%20 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb3:  // pred: ^bb0
    %71 = AIE.dmaStart(MM2S0, ^bb4, ^bb6)
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
    %72 = AIE.dmaStart(MM2S1, ^bb7, ^bb9)
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
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<1> (0)
    %72 = AIE.amsel<0> (1)
    %73 = AIE.amsel<1> (1)
    %74 = AIE.amsel<0> (2)
    %75 = AIE.amsel<0> (3)
    %76 = AIE.masterset(DMA : 0, %71)
    %77 = AIE.masterset(DMA : 1, %70)
    %78 = AIE.masterset(South : 0, %74)
    %79 = AIE.masterset(South : 1, %73)
    %80 = AIE.masterset(North : 0, %75)
    %81 = AIE.masterset(North : 1, %72)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %73)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %74)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %70)
      AIE.rule(31, 1, %72)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %71)
      AIE.rule(31, 5, %75)
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
    %70 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%24, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%28 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %71 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<0> (1)
    %72 = AIE.amsel<0> (2)
    %73 = AIE.amsel<0> (3)
    %74 = AIE.masterset(DMA : 0, %71)
    %75 = AIE.masterset(DMA : 1, %72)
    %76 = AIE.masterset(South : 0, %73)
    %77 = AIE.masterset(South : 1, %70)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %70)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %73)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %71)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %72)
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
    %70 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%35, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%40 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %71 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%37, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%41 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %72 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<0> (1)
    %72 = AIE.amsel<0> (2)
    %73 = AIE.amsel<0> (3)
    %74 = AIE.masterset(DMA : 0, %70)
    %75 = AIE.masterset(DMA : 1, %73)
    %76 = AIE.masterset(North : 0, %71)
    %77 = AIE.masterset(North : 1, %72)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %73)
      AIE.rule(31, 1, %72)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %70)
      AIE.rule(31, 5, %71)
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
    %70 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%46, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%50 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %71 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<0> (1)
    %72 = AIE.amsel<0> (2)
    %73 = AIE.masterset(DMA : 0, %71)
    %74 = AIE.masterset(DMA : 1, %72)
    %75 = AIE.masterset(West : 0, %70)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %70)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %72)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %71)
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
    %70 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%63 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %71 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%57, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%62 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %72 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<0> (1)
    %72 = AIE.masterset(North : 0, %71)
    %73 = AIE.masterset(North : 1, %70)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %70)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %71)
    }
  }
  %68 = AIE.tile(26, 1)
  %69 = AIE.switchbox(%68) {
    %70 = AIE.amsel<0> (0)
    %71 = AIE.amsel<0> (1)
    %72 = AIE.amsel<0> (2)
    %73 = AIE.amsel<0> (3)
    %74 = AIE.masterset(South : 0, %70)
    %75 = AIE.masterset(South : 1, %72)
    %76 = AIE.masterset(North : 0, %73)
    %77 = AIE.masterset(North : 1, %71)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %72)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %70)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %71)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %73)
    }
  }
}


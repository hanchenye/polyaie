module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.masterset(North : 0, %227)
    %229 = AIE.masterset(North : 1, %226)
    %230 = AIE.masterset(East : 0, %227)
    %231 = AIE.masterset(East : 1, %226)
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %226)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %227)
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
    %226 = AIE.dmaStart(MM2S0, ^bb1, ^bb3)
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
    %227 = AIE.dmaStart(MM2S1, ^bb4, ^bb6)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<1> (0)
    %228 = AIE.amsel<0> (1)
    %229 = AIE.amsel<0> (2)
    %230 = AIE.amsel<0> (3)
    %231 = AIE.masterset(South : 2, %228)
    %232 = AIE.masterset(North : 0, %226)
    %233 = AIE.masterset(North : 1, %230)
    %234 = AIE.masterset(East : 0, %229)
    %235 = AIE.masterset(East : 1, %227)
    %236 = AIE.masterset(East : 2, %230)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %228)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %228)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %228)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %228)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 4, %230)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 0, %227)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %229)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %226)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
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
    %227 = AIE.dmaStart(MM2S0, ^bb6, ^bb8)
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
    %228 = AIE.dmaStart(MM2S1, ^bb9, ^bb11)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.amsel<0> (2)
    %229 = AIE.amsel<0> (3)
    %230 = AIE.masterset(DMA : 0, %227)
    %231 = AIE.masterset(DMA : 1, %226)
    %232 = AIE.masterset(North : 0, %229)
    %233 = AIE.masterset(North : 1, %228)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %227)
      AIE.rule(31, 5, %228)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %226)
      AIE.rule(31, 1, %229)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%30, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%34 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.amsel<0> (2)
    %229 = AIE.masterset(DMA : 0, %228)
    %230 = AIE.masterset(DMA : 1, %226)
    %231 = AIE.masterset(East : 0, %227)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %227)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %228)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %226)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%43, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%47 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%41, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%46 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%41, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %228 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<1> (0)
    %228 = AIE.amsel<0> (1)
    %229 = AIE.amsel<1> (1)
    %230 = AIE.amsel<0> (2)
    %231 = AIE.amsel<1> (2)
    %232 = AIE.amsel<0> (3)
    %233 = AIE.amsel<1> (3)
    %234 = AIE.masterset(DMA : 0, %232)
    %235 = AIE.masterset(DMA : 1, %228)
    %236 = AIE.masterset(South : 0, %230)
    %237 = AIE.masterset(South : 1, %226)
    %238 = AIE.masterset(South : 2, %233)
    %239 = AIE.masterset(South : 3, %229)
    %240 = AIE.masterset(North : 0, %231)
    %241 = AIE.masterset(North : 1, %227)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %229)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %233)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %226)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %230)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %228)
      AIE.rule(31, 5, %227)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %232)
      AIE.rule(31, 1, %231)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%53, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%55 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<1> (0)
    %228 = AIE.amsel<0> (1)
    %229 = AIE.amsel<1> (1)
    %230 = AIE.amsel<0> (2)
    %231 = AIE.amsel<0> (3)
    %232 = AIE.masterset(DMA : 0, %231)
    %233 = AIE.masterset(DMA : 1, %228)
    %234 = AIE.masterset(South : 0, %226)
    %235 = AIE.masterset(South : 1, %230)
    %236 = AIE.masterset(South : 2, %227)
    %237 = AIE.masterset(South : 3, %229)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %229)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %227)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %230)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %226)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %231)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %228)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%64, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%69 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%64, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%63, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%68 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%63, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %228 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.amsel<0> (2)
    %229 = AIE.amsel<0> (3)
    %230 = AIE.masterset(DMA : 0, %227)
    %231 = AIE.masterset(DMA : 1, %229)
    %232 = AIE.masterset(North : 0, %228)
    %233 = AIE.masterset(North : 1, %226)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %229)
      AIE.rule(31, 1, %226)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %227)
      AIE.rule(31, 5, %228)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%75, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%78 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%75, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.amsel<0> (2)
    %229 = AIE.amsel<0> (3)
    %230 = AIE.masterset(DMA : 0, %226)
    %231 = AIE.masterset(DMA : 1, %229)
    %232 = AIE.masterset(West : 0, %227)
    %233 = AIE.masterset(West : 1, %228)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %228)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %227)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %229)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %226)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%88, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%91 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%85, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%90 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%85, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %228 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.amsel<0> (2)
    %229 = AIE.amsel<0> (3)
    %230 = AIE.masterset(DMA : 0, %227)
    %231 = AIE.masterset(DMA : 1, %229)
    %232 = AIE.masterset(North : 0, %228)
    %233 = AIE.masterset(North : 1, %226)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %227)
      AIE.rule(31, 5, %226)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %229)
      AIE.rule(31, 1, %228)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%96, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%100 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%96, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.amsel<0> (2)
    %229 = AIE.masterset(DMA : 0, %227)
    %230 = AIE.masterset(DMA : 1, %228)
    %231 = AIE.masterset(West : 0, %226)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %226)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %227)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %228)
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
    %226 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%108, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%113 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %227 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%107, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%112 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%107, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %228 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.amsel<0> (2)
    %229 = AIE.masterset(North : 0, %227)
    %230 = AIE.masterset(North : 1, %226)
    %231 = AIE.masterset(East : 0, %226)
    %232 = AIE.masterset(East : 1, %228)
    AIE.packetrules(West : 2) {
      AIE.rule(30, 4, %228)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(30, 0, %226)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 4, %227)
    }
  }
  %118 = AIE.tile(13, 0)
  %119 = AIE.switchbox(%118) {
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.masterset(North : 0, %227)
    %229 = AIE.masterset(North : 1, %226)
    AIE.packetrules(West : 1) {
      AIE.rule(30, 4, %226)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(30, 0, %227)
    }
  }
  %120 = AIE.tile(12, 1)
  %121 = AIE.switchbox(%120) {
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.masterset(North : 0, %226)
    %229 = AIE.masterset(North : 1, %227)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 0, %227)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 4, %226)
    }
  }
  %122 = AIE.tile(11, 1)
  %123 = AIE.switchbox(%122) {
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<1> (0)
    %228 = AIE.amsel<0> (1)
    %229 = AIE.amsel<1> (1)
    %230 = AIE.amsel<0> (2)
    %231 = AIE.amsel<0> (3)
    %232 = AIE.masterset(South : 0, %231)
    %233 = AIE.masterset(South : 1, %229)
    %234 = AIE.masterset(South : 2, %230)
    %235 = AIE.masterset(South : 3, %227)
    %236 = AIE.masterset(North : 0, %226)
    %237 = AIE.masterset(North : 1, %228)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %227)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %230)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %229)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %231)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %228)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %226)
    }
  }
  %124 = AIE.tile(13, 1)
  %125 = AIE.switchbox(%124) {
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.masterset(North : 0, %227)
    %229 = AIE.masterset(North : 1, %226)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %226)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %227)
    }
  }
  %126 = AIE.tile(10, 1)
  %127 = AIE.switchbox(%126) {
    %226 = AIE.amsel<0> (0)
    %227 = AIE.amsel<0> (1)
    %228 = AIE.masterset(North : 0, %227)
    %229 = AIE.masterset(North : 1, %226)
    AIE.packetrules(South : 1) {
      AIE.rule(30, 4, %226)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(30, 0, %227)
    }
  }
  %128 = AIE.tile(0, 0)
  %129 = AIE.tile(0, 1)
  %130 = AIE.tile(0, 2)
  %131 = AIE.tile(0, 3)
  %132 = AIE.tile(1, 0)
  %133 = AIE.tile(1, 1)
  %134 = AIE.tile(1, 2)
  %135 = AIE.tile(1, 3)
  %136 = AIE.tile(2, 0)
  %137 = AIE.tile(2, 1)
  %138 = AIE.tile(2, 2)
  %139 = AIE.tile(2, 3)
  %140 = AIE.tile(3, 0)
  %141 = AIE.tile(3, 1)
  %142 = AIE.tile(3, 2)
  %143 = AIE.tile(3, 3)
  %144 = AIE.tile(4, 0)
  %145 = AIE.tile(4, 1)
  %146 = AIE.tile(4, 2)
  %147 = AIE.tile(4, 3)
  %148 = AIE.tile(5, 0)
  %149 = AIE.tile(5, 1)
  %150 = AIE.tile(5, 2)
  %151 = AIE.tile(5, 3)
  %152 = AIE.tile(6, 0)
  %153 = AIE.tile(6, 1)
  %154 = AIE.tile(6, 2)
  %155 = AIE.tile(6, 3)
  %156 = AIE.tile(7, 0)
  %157 = AIE.tile(7, 1)
  %158 = AIE.tile(7, 2)
  %159 = AIE.tile(7, 3)
  %160 = AIE.tile(8, 0)
  %161 = AIE.tile(8, 1)
  %162 = AIE.tile(8, 2)
  %163 = AIE.tile(8, 3)
  %164 = AIE.tile(9, 0)
  %165 = AIE.tile(9, 1)
  %166 = AIE.tile(9, 2)
  %167 = AIE.tile(9, 3)
  %168 = AIE.switchbox(%128) {
  }
  %169 = AIE.switchbox(%129) {
  }
  %170 = AIE.switchbox(%130) {
  }
  %171 = AIE.switchbox(%131) {
  }
  %172 = AIE.switchbox(%132) {
  }
  %173 = AIE.switchbox(%133) {
  }
  %174 = AIE.switchbox(%134) {
  }
  %175 = AIE.switchbox(%135) {
  }
  %176 = AIE.switchbox(%136) {
  }
  %177 = AIE.switchbox(%137) {
  }
  %178 = AIE.switchbox(%138) {
  }
  %179 = AIE.switchbox(%139) {
  }
  %180 = AIE.switchbox(%140) {
  }
  %181 = AIE.switchbox(%141) {
  }
  %182 = AIE.switchbox(%142) {
  }
  %183 = AIE.switchbox(%143) {
  }
  %184 = AIE.switchbox(%144) {
  }
  %185 = AIE.switchbox(%145) {
  }
  %186 = AIE.switchbox(%146) {
  }
  %187 = AIE.switchbox(%147) {
  }
  %188 = AIE.switchbox(%148) {
  }
  %189 = AIE.switchbox(%149) {
  }
  %190 = AIE.switchbox(%150) {
  }
  %191 = AIE.switchbox(%151) {
  }
  %192 = AIE.switchbox(%152) {
  }
  %193 = AIE.switchbox(%153) {
  }
  %194 = AIE.switchbox(%154) {
  }
  %195 = AIE.switchbox(%155) {
  }
  %196 = AIE.switchbox(%156) {
  }
  %197 = AIE.switchbox(%157) {
  }
  %198 = AIE.switchbox(%158) {
  }
  %199 = AIE.switchbox(%159) {
  }
  %200 = AIE.switchbox(%160) {
  }
  %201 = AIE.switchbox(%161) {
  }
  %202 = AIE.switchbox(%162) {
  }
  %203 = AIE.switchbox(%163) {
  }
  %204 = AIE.switchbox(%164) {
  }
  %205 = AIE.switchbox(%165) {
  }
  %206 = AIE.switchbox(%166) {
  }
  %207 = AIE.switchbox(%167) {
  }
  %208 = AIE.plio(0)
  %209 = AIE.plio(1)
  %210 = AIE.plio(2)
  %211 = AIE.plio(3)
  %212 = AIE.plio(4)
  %213 = AIE.plio(5)
  %214 = AIE.plio(6)
  %215 = AIE.plio(7)
  %216 = AIE.plio(8)
  %217 = AIE.plio(9)
  %218 = AIE.plio(10)
  %219 = AIE.plio(11)
  %220 = AIE.plio(12)
  %221 = AIE.plio(13)
  AIE.wire(%129 : Core, %169 : Core)
  AIE.wire(%129 : DMA, %169 : DMA)
  AIE.wire(%168 : North, %169 : South)
  AIE.wire(%130 : Core, %170 : Core)
  AIE.wire(%130 : DMA, %170 : DMA)
  AIE.wire(%169 : North, %170 : South)
  AIE.wire(%131 : Core, %171 : Core)
  AIE.wire(%131 : DMA, %171 : DMA)
  AIE.wire(%170 : North, %171 : South)
  AIE.wire(%168 : East, %172 : West)
  AIE.wire(%209 : North, %172 : South)
  AIE.wire(%169 : East, %173 : West)
  AIE.wire(%133 : Core, %173 : Core)
  AIE.wire(%133 : DMA, %173 : DMA)
  AIE.wire(%172 : North, %173 : South)
  AIE.wire(%170 : East, %174 : West)
  AIE.wire(%134 : Core, %174 : Core)
  AIE.wire(%134 : DMA, %174 : DMA)
  AIE.wire(%173 : North, %174 : South)
  AIE.wire(%171 : East, %175 : West)
  AIE.wire(%135 : Core, %175 : Core)
  AIE.wire(%135 : DMA, %175 : DMA)
  AIE.wire(%174 : North, %175 : South)
  AIE.wire(%172 : East, %176 : West)
  %222 = AIE.shimmux(%136) {
  }
  AIE.wire(%222 : North, %176 : South)
  AIE.wire(%210 : North, %222 : South)
  AIE.wire(%136 : DMA, %222 : DMA)
  AIE.wire(%173 : East, %177 : West)
  AIE.wire(%137 : Core, %177 : Core)
  AIE.wire(%137 : DMA, %177 : DMA)
  AIE.wire(%176 : North, %177 : South)
  AIE.wire(%174 : East, %178 : West)
  AIE.wire(%138 : Core, %178 : Core)
  AIE.wire(%138 : DMA, %178 : DMA)
  AIE.wire(%177 : North, %178 : South)
  AIE.wire(%175 : East, %179 : West)
  AIE.wire(%139 : Core, %179 : Core)
  AIE.wire(%139 : DMA, %179 : DMA)
  AIE.wire(%178 : North, %179 : South)
  AIE.wire(%176 : East, %180 : West)
  %223 = AIE.shimmux(%140) {
  }
  AIE.wire(%223 : North, %180 : South)
  AIE.wire(%211 : North, %223 : South)
  AIE.wire(%140 : DMA, %223 : DMA)
  AIE.wire(%177 : East, %181 : West)
  AIE.wire(%141 : Core, %181 : Core)
  AIE.wire(%141 : DMA, %181 : DMA)
  AIE.wire(%180 : North, %181 : South)
  AIE.wire(%178 : East, %182 : West)
  AIE.wire(%142 : Core, %182 : Core)
  AIE.wire(%142 : DMA, %182 : DMA)
  AIE.wire(%181 : North, %182 : South)
  AIE.wire(%179 : East, %183 : West)
  AIE.wire(%143 : Core, %183 : Core)
  AIE.wire(%143 : DMA, %183 : DMA)
  AIE.wire(%182 : North, %183 : South)
  AIE.wire(%180 : East, %184 : West)
  AIE.wire(%212 : North, %184 : South)
  AIE.wire(%181 : East, %185 : West)
  AIE.wire(%145 : Core, %185 : Core)
  AIE.wire(%145 : DMA, %185 : DMA)
  AIE.wire(%184 : North, %185 : South)
  AIE.wire(%182 : East, %186 : West)
  AIE.wire(%146 : Core, %186 : Core)
  AIE.wire(%146 : DMA, %186 : DMA)
  AIE.wire(%185 : North, %186 : South)
  AIE.wire(%183 : East, %187 : West)
  AIE.wire(%147 : Core, %187 : Core)
  AIE.wire(%147 : DMA, %187 : DMA)
  AIE.wire(%186 : North, %187 : South)
  AIE.wire(%184 : East, %188 : West)
  AIE.wire(%213 : North, %188 : South)
  AIE.wire(%185 : East, %189 : West)
  AIE.wire(%149 : Core, %189 : Core)
  AIE.wire(%149 : DMA, %189 : DMA)
  AIE.wire(%188 : North, %189 : South)
  AIE.wire(%186 : East, %190 : West)
  AIE.wire(%150 : Core, %190 : Core)
  AIE.wire(%150 : DMA, %190 : DMA)
  AIE.wire(%189 : North, %190 : South)
  AIE.wire(%187 : East, %191 : West)
  AIE.wire(%151 : Core, %191 : Core)
  AIE.wire(%151 : DMA, %191 : DMA)
  AIE.wire(%190 : North, %191 : South)
  AIE.wire(%188 : East, %192 : West)
  %224 = AIE.shimmux(%152) {
  }
  AIE.wire(%224 : North, %192 : South)
  AIE.wire(%214 : North, %224 : South)
  AIE.wire(%152 : DMA, %224 : DMA)
  AIE.wire(%189 : East, %193 : West)
  AIE.wire(%153 : Core, %193 : Core)
  AIE.wire(%153 : DMA, %193 : DMA)
  AIE.wire(%192 : North, %193 : South)
  AIE.wire(%190 : East, %194 : West)
  AIE.wire(%154 : Core, %194 : Core)
  AIE.wire(%154 : DMA, %194 : DMA)
  AIE.wire(%193 : North, %194 : South)
  AIE.wire(%191 : East, %195 : West)
  AIE.wire(%155 : Core, %195 : Core)
  AIE.wire(%155 : DMA, %195 : DMA)
  AIE.wire(%194 : North, %195 : South)
  AIE.wire(%192 : East, %196 : West)
  %225 = AIE.shimmux(%156) {
  }
  AIE.wire(%225 : North, %196 : South)
  AIE.wire(%215 : North, %225 : South)
  AIE.wire(%156 : DMA, %225 : DMA)
  AIE.wire(%193 : East, %197 : West)
  AIE.wire(%157 : Core, %197 : Core)
  AIE.wire(%157 : DMA, %197 : DMA)
  AIE.wire(%196 : North, %197 : South)
  AIE.wire(%194 : East, %198 : West)
  AIE.wire(%158 : Core, %198 : Core)
  AIE.wire(%158 : DMA, %198 : DMA)
  AIE.wire(%197 : North, %198 : South)
  AIE.wire(%195 : East, %199 : West)
  AIE.wire(%159 : Core, %199 : Core)
  AIE.wire(%159 : DMA, %199 : DMA)
  AIE.wire(%198 : North, %199 : South)
  AIE.wire(%196 : East, %200 : West)
  AIE.wire(%216 : North, %200 : South)
  AIE.wire(%197 : East, %201 : West)
  AIE.wire(%161 : Core, %201 : Core)
  AIE.wire(%161 : DMA, %201 : DMA)
  AIE.wire(%200 : North, %201 : South)
  AIE.wire(%198 : East, %202 : West)
  AIE.wire(%162 : Core, %202 : Core)
  AIE.wire(%162 : DMA, %202 : DMA)
  AIE.wire(%201 : North, %202 : South)
  AIE.wire(%199 : East, %203 : West)
  AIE.wire(%163 : Core, %203 : Core)
  AIE.wire(%163 : DMA, %203 : DMA)
  AIE.wire(%202 : North, %203 : South)
  AIE.wire(%200 : East, %204 : West)
  AIE.wire(%217 : North, %204 : South)
  AIE.wire(%201 : East, %205 : West)
  AIE.wire(%165 : Core, %205 : Core)
  AIE.wire(%165 : DMA, %205 : DMA)
  AIE.wire(%204 : North, %205 : South)
  AIE.wire(%202 : East, %206 : West)
  AIE.wire(%166 : Core, %206 : Core)
  AIE.wire(%166 : DMA, %206 : DMA)
  AIE.wire(%205 : North, %206 : South)
  AIE.wire(%203 : East, %207 : West)
  AIE.wire(%167 : Core, %207 : Core)
  AIE.wire(%167 : DMA, %207 : DMA)
  AIE.wire(%206 : North, %207 : South)
  AIE.wire(%204 : East, %2 : West)
  AIE.wire(%1 : North, %2 : South)
  AIE.wire(%218 : North, %1 : South)
  AIE.wire(%0 : DMA, %1 : DMA)
  AIE.wire(%205 : East, %127 : West)
  AIE.wire(%126 : Core, %127 : Core)
  AIE.wire(%126 : DMA, %127 : DMA)
  AIE.wire(%2 : North, %127 : South)
  AIE.wire(%206 : East, %29 : West)
  AIE.wire(%28 : Core, %29 : Core)
  AIE.wire(%28 : DMA, %29 : DMA)
  AIE.wire(%127 : North, %29 : South)
  AIE.wire(%207 : East, %40 : West)
  AIE.wire(%38 : Core, %40 : Core)
  AIE.wire(%38 : DMA, %40 : DMA)
  AIE.wire(%29 : North, %40 : South)
  AIE.wire(%2 : East, %14 : West)
  AIE.wire(%13 : North, %14 : South)
  AIE.wire(%219 : North, %13 : South)
  AIE.wire(%12 : DMA, %13 : DMA)
  AIE.wire(%127 : East, %123 : West)
  AIE.wire(%122 : Core, %123 : Core)
  AIE.wire(%122 : DMA, %123 : DMA)
  AIE.wire(%14 : North, %123 : South)
  AIE.wire(%29 : East, %51 : West)
  AIE.wire(%50 : Core, %51 : Core)
  AIE.wire(%50 : DMA, %51 : DMA)
  AIE.wire(%123 : North, %51 : South)
  AIE.wire(%40 : East, %62 : West)
  AIE.wire(%60 : Core, %62 : Core)
  AIE.wire(%60 : DMA, %62 : DMA)
  AIE.wire(%51 : North, %62 : South)
  AIE.wire(%14 : East, %117 : West)
  AIE.wire(%220 : North, %117 : South)
  AIE.wire(%123 : East, %121 : West)
  AIE.wire(%120 : Core, %121 : Core)
  AIE.wire(%120 : DMA, %121 : DMA)
  AIE.wire(%117 : North, %121 : South)
  AIE.wire(%51 : East, %73 : West)
  AIE.wire(%72 : Core, %73 : Core)
  AIE.wire(%72 : DMA, %73 : DMA)
  AIE.wire(%121 : North, %73 : South)
  AIE.wire(%62 : East, %84 : West)
  AIE.wire(%82 : Core, %84 : Core)
  AIE.wire(%82 : DMA, %84 : DMA)
  AIE.wire(%73 : North, %84 : South)
  AIE.wire(%117 : East, %119 : West)
  AIE.wire(%221 : North, %119 : South)
  AIE.wire(%121 : East, %125 : West)
  AIE.wire(%124 : Core, %125 : Core)
  AIE.wire(%124 : DMA, %125 : DMA)
  AIE.wire(%119 : North, %125 : South)
  AIE.wire(%73 : East, %95 : West)
  AIE.wire(%94 : Core, %95 : Core)
  AIE.wire(%94 : DMA, %95 : DMA)
  AIE.wire(%125 : North, %95 : South)
  AIE.wire(%84 : East, %106 : West)
  AIE.wire(%104 : Core, %106 : Core)
  AIE.wire(%104 : DMA, %106 : DMA)
  AIE.wire(%95 : North, %106 : South)
}


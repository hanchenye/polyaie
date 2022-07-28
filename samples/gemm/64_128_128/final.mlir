module @gemm {
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(North : 0, %437)
    %442 = AIE.masterset(North : 1, %439)
    %443 = AIE.masterset(East : 0, %437)
    %444 = AIE.masterset(East : 1, %439)
    %445 = AIE.masterset(East : 2, %440)
    %446 = AIE.masterset(East : 3, %438)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %437)
    }
  }
  %3 = AIE.lock(%0, 7)
  %4 = AIE.lock(%0, 6)
  %5 = AIE.lock(%0, 5)
  %6 = AIE.lock(%0, 4)
  %7 = AIE.lock(%0, 3)
  %8 = AIE.lock(%0, 2)
  %9 = AIE.lock(%0, 1)
  %10 = AIE.lock(%0, 0)
  %11 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xf32>
  %12 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xf32>
  %13 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xf32>
  %14 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xf32>
  %15 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xf32>
  %16 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xf32>
  %17 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xf32>
  %18 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xf32>
  %19 = AIE.core(%0) {
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%10, Acquire, 0)
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%3, Acquire, 0)
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%5, Release, 1)
    AIE.useLock(%3, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%4, Release, 1)
    AIE.useLock(%10, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.end
  }
  %20 = AIE.shimDMA(%0) {
    %437 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%10, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %438 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  %21 = AIE.tile(18, 0)
  %22 = AIE.shimmux(%21) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %23 = AIE.switchbox(%21) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.masterset(West : 0, %437)
    %440 = AIE.masterset(West : 1, %438)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 0, %437)
    }
  }
  %24 = AIE.lock(%21, 7)
  %25 = AIE.lock(%21, 6)
  %26 = AIE.lock(%21, 5)
  %27 = AIE.lock(%21, 4)
  %28 = AIE.lock(%21, 3)
  %29 = AIE.lock(%21, 2)
  %30 = AIE.lock(%21, 1)
  %31 = AIE.lock(%21, 0)
  %32 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<32x32xf32>
  %33 = AIE.external_buffer 53248 {sym_name = "buf9"} : memref<32x32xf32>
  %34 = AIE.external_buffer 57344 {sym_name = "buf10"} : memref<32x32xf32>
  %35 = AIE.external_buffer 61440 {sym_name = "buf11"} : memref<32x32xf32>
  %36 = AIE.external_buffer 65536 {sym_name = "buf12"} : memref<32x32xf32>
  %37 = AIE.external_buffer 69632 {sym_name = "buf13"} : memref<32x32xf32>
  %38 = AIE.external_buffer 73728 {sym_name = "buf14"} : memref<32x32xf32>
  %39 = AIE.external_buffer 77824 {sym_name = "buf15"} : memref<32x32xf32>
  %40 = AIE.core(%21) {
    AIE.useLock(%24, Acquire, 0)
    AIE.useLock(%26, Acquire, 0)
    AIE.useLock(%27, Acquire, 0)
    AIE.useLock(%25, Acquire, 0)
    AIE.useLock(%31, Acquire, 0)
    AIE.useLock(%29, Acquire, 0)
    AIE.useLock(%30, Acquire, 0)
    AIE.useLock(%28, Acquire, 0)
    AIE.useLock(%28, Release, 1)
    AIE.useLock(%30, Release, 1)
    AIE.useLock(%29, Release, 1)
    AIE.useLock(%31, Release, 1)
    AIE.useLock(%25, Release, 1)
    AIE.useLock(%27, Release, 1)
    AIE.useLock(%26, Release, 1)
    AIE.useLock(%24, Release, 1)
    AIE.end
  }
  %41 = AIE.shimDMA(%21) {
    %437 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%29, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%25, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%38 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%25, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%26, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%37 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%26, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %438 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%30, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%24, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%27, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%32 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  %42 = AIE.tile(11, 0)
  %43 = AIE.shimmux(%42) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<North : 3, DMA : 1>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %44 = AIE.switchbox(%42) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.masterset(South : 2, %439)
    %444 = AIE.masterset(South : 3, %438)
    %445 = AIE.masterset(North : 0, %441)
    %446 = AIE.masterset(North : 1, %437)
    %447 = AIE.masterset(East : 0, %441)
    %448 = AIE.masterset(East : 1, %440)
    %449 = AIE.masterset(East : 2, %442)
    %450 = AIE.masterset(East : 3, %437)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %438)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(West : 3) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(31, 0, %438)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %439)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %439)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %439)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %439)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %441)
    }
  }
  %45 = AIE.lock(%42, 7)
  %46 = AIE.lock(%42, 6)
  %47 = AIE.lock(%42, 5)
  %48 = AIE.lock(%42, 4)
  %49 = AIE.lock(%42, 3)
  %50 = AIE.lock(%42, 2)
  %51 = AIE.lock(%42, 1)
  %52 = AIE.lock(%42, 0)
  %53 = AIE.external_buffer 81920 {sym_name = "buf16"} : memref<32x32xf32>
  %54 = AIE.external_buffer 86016 {sym_name = "buf17"} : memref<32x32xf32>
  %55 = AIE.external_buffer 90112 {sym_name = "buf18"} : memref<32x32xf32>
  %56 = AIE.external_buffer 94208 {sym_name = "buf19"} : memref<32x32xf32>
  %57 = AIE.external_buffer 98304 {sym_name = "buf20"} : memref<32x32xf32>
  %58 = AIE.external_buffer 102400 {sym_name = "buf21"} : memref<32x32xf32>
  %59 = AIE.external_buffer 106496 {sym_name = "buf22"} : memref<32x32xf32>
  %60 = AIE.external_buffer 110592 {sym_name = "buf23"} : memref<32x32xf32>
  %61 = AIE.external_buffer 114688 {sym_name = "buf24"} : memref<1025xf32>
  %62 = AIE.external_buffer 118788 {sym_name = "buf25"} : memref<1025xf32>
  %63 = AIE.external_buffer 122888 {sym_name = "buf26"} : memref<1025xf32>
  %64 = AIE.external_buffer 126988 {sym_name = "buf27"} : memref<1025xf32>
  %65 = AIE.external_buffer 131088 {sym_name = "buf28"} : memref<1025xf32>
  %66 = AIE.external_buffer 135188 {sym_name = "buf29"} : memref<1025xf32>
  %67 = AIE.external_buffer 139288 {sym_name = "buf30"} : memref<1025xf32>
  %68 = AIE.external_buffer 143388 {sym_name = "buf31"} : memref<1025xf32>
  %69 = AIE.core(%42) {
    AIE.useLock(%52, Acquire, 0)
    AIE.useLock(%51, Acquire, 0)
    AIE.useLock(%46, Acquire, 0)
    AIE.useLock(%49, Acquire, 0)
    AIE.useLock(%47, Acquire, 0)
    AIE.useLock(%48, Acquire, 0)
    AIE.useLock(%45, Acquire, 0)
    AIE.useLock(%50, Acquire, 0)
    AIE.useLock(%50, Release, 1)
    AIE.useLock(%45, Release, 1)
    AIE.useLock(%48, Release, 1)
    AIE.useLock(%47, Release, 1)
    AIE.useLock(%49, Release, 1)
    AIE.useLock(%46, Release, 1)
    AIE.useLock(%51, Release, 1)
    AIE.useLock(%52, Release, 1)
    AIE.end
  }
  %70 = AIE.shimDMA(%42) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%61 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%62 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%63 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%64 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%65 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%66 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%67 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%68 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %439 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useLock(%52, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%60 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 0)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%49, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 0)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%46, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 0)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useLock(%50, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 0)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %440 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useLock(%51, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%51, Release, 0)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%45, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 0)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useLock(%47, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 0)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useLock(%48, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 0)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  %71 = AIE.tile(0, 0)
  %72 = AIE.core(%71) {
    AIE.end
  }
  %73 = AIE.tile(10, 2)
  %74 = AIE.switchbox(%73) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.amsel<1> (3)
    %445 = AIE.masterset(DMA : 0, %443)
    %446 = AIE.masterset(DMA : 1, %437)
    %447 = AIE.masterset(South : 0, %438)
    %448 = AIE.masterset(South : 1, %441)
    %449 = AIE.masterset(North : 0, %440)
    %450 = AIE.masterset(North : 1, %439)
    %451 = AIE.masterset(East : 0, %444)
    %452 = AIE.masterset(East : 1, %442)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %444)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %443)
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %437)
      AIE.rule(28, 0, %440)
    }
  }
  %75 = AIE.lock(%73, 1)
  %76 = AIE.lock(%73, 0)
  %77 = AIE.buffer(%73) {sym_name = "buf32"} : memref<32x32xf32>
  %78 = AIE.buffer(%73) {sym_name = "buf33"} : memref<32x32xf32>
  %79 = AIE.buffer(%73) {sym_name = "buf34"} : memref<32x32xf32>
  %80 = AIE.buffer(%73) {sym_name = "buf35"} : memref<32x32xf32>
  %81 = AIE.core(%73) {
    AIE.useLock(%76, Acquire, 1)
    AIE.useLock(%85, Acquire, 0)
    AIE.useLock(%75, Acquire, 1)
    call @extern_kernel(%80, %77, %78, %79) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%75, Release, 0)
    AIE.useLock(%85, Release, 1)
    AIE.useLock(%76, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %82 = AIE.mem(%73) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%75, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%79 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%75, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%76, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%78 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%76, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %83 = AIE.tile(10, 3)
  %84 = AIE.switchbox(%83) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.amsel<1> (3)
    %445 = AIE.masterset(DMA : 0, %441)
    %446 = AIE.masterset(DMA : 1, %444)
    %447 = AIE.masterset(South : 0, %440)
    %448 = AIE.masterset(South : 1, %442)
    %449 = AIE.masterset(North : 0, %437)
    %450 = AIE.masterset(North : 1, %439)
    %451 = AIE.masterset(East : 0, %443)
    %452 = AIE.masterset(East : 1, %438)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %438)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %443)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %441)
      AIE.rule(30, 6, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %444)
      AIE.rule(30, 2, %437)
    }
  }
  %85 = AIE.lock(%83, 2)
  %86 = AIE.lock(%83, 1)
  %87 = AIE.lock(%83, 0)
  %88 = AIE.buffer(%83) {sym_name = "buf36"} : memref<32x32xf32>
  %89 = AIE.buffer(%83) {sym_name = "buf37"} : memref<32x32xf32>
  %90 = AIE.buffer(%83) {sym_name = "buf38"} : memref<32x32xf32>
  %91 = AIE.core(%83) {
    AIE.useLock(%97, Acquire, 0)
    AIE.useLock(%85, Acquire, 1)
    AIE.useLock(%86, Acquire, 1)
    AIE.useLock(%87, Acquire, 1)
    call @extern_kernel(%77, %88, %89, %90) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%87, Release, 0)
    AIE.useLock(%86, Release, 0)
    AIE.useLock(%85, Release, 0)
    AIE.useLock(%97, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %92 = AIE.mem(%83) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%87, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%90 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%87, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%86, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%89 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%86, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %93 = AIE.tile(10, 4)
  %94 = AIE.switchbox(%93) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.amsel<1> (3)
    %445 = AIE.masterset(DMA : 0, %437)
    %446 = AIE.masterset(DMA : 1, %442)
    %447 = AIE.masterset(South : 0, %443)
    %448 = AIE.masterset(South : 1, %441)
    %449 = AIE.masterset(North : 0, %438)
    %450 = AIE.masterset(North : 1, %444)
    %451 = AIE.masterset(East : 0, %439)
    %452 = AIE.masterset(East : 1, %440)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %443)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %439)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %442)
      AIE.rule(31, 7, %444)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %437)
      AIE.rule(31, 3, %438)
    }
  }
  %95 = AIE.lock(%93, 2)
  %96 = AIE.lock(%93, 1)
  %97 = AIE.lock(%93, 0)
  %98 = AIE.buffer(%93) {sym_name = "buf39"} : memref<32x32xf32>
  %99 = AIE.buffer(%93) {sym_name = "buf40"} : memref<32x32xf32>
  %100 = AIE.buffer(%93) {sym_name = "buf41"} : memref<32x32xf32>
  %101 = AIE.core(%93) {
    AIE.useLock(%96, Acquire, 1)
    AIE.useLock(%97, Acquire, 1)
    AIE.useLock(%95, Acquire, 1)
    AIE.useLock(%106, Acquire, 0)
    call @extern_kernel(%88, %98, %99, %100) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%106, Release, 1)
    AIE.useLock(%95, Release, 0)
    AIE.useLock(%97, Release, 0)
    AIE.useLock(%96, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %102 = AIE.mem(%93) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%95, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%99 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%95, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%96, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%100 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%96, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %103 = AIE.tile(10, 5) {polyaie.leaf}
  %104 = AIE.lock(%103, 15)
  %105 = AIE.switchbox(%103) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<0> (2)
    %441 = AIE.amsel<0> (3)
    %442 = AIE.masterset(DMA : 0, %441)
    %443 = AIE.masterset(DMA : 1, %439)
    %444 = AIE.masterset(South : 0, %438)
    %445 = AIE.masterset(South : 1, %437)
    %446 = AIE.masterset(East : 0, %440)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %437)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %438)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %441)
    }
  }
  %106 = AIE.lock(%103, 3)
  %107 = AIE.lock(%103, 2)
  %108 = AIE.lock(%103, 1)
  %109 = AIE.lock(%103, 0)
  %110 = AIE.buffer(%103) {sym_name = "buf42"} : memref<32x32xf32>
  %111 = AIE.buffer(%103) {sym_name = "buf43"} : memref<32x32xf32>
  %112 = AIE.buffer(%103) {sym_name = "buf44"} : memref<32x32xf32>
  %113 = AIE.core(%103) {
    AIE.useLock(%109, Acquire, 0)
    AIE.useLock(%107, Acquire, 1)
    AIE.useLock(%108, Acquire, 1)
    AIE.useLock(%106, Acquire, 1)
    call @extern_kernel(%98, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%106, Release, 0)
    AIE.useLock(%108, Release, 0)
    AIE.useLock(%107, Release, 0)
    AIE.useLock(%109, Release, 1)
    AIE.useLock(%104, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %114 = AIE.mem(%103) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%108, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%107, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%107, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%109, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%110 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %115 = AIE.tile(11, 2)
  %116 = AIE.switchbox(%115) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<2> (0)
    %440 = AIE.amsel<0> (1)
    %441 = AIE.amsel<1> (1)
    %442 = AIE.amsel<2> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<1> (2)
    %445 = AIE.amsel<2> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.amsel<2> (3)
    %449 = AIE.masterset(DMA : 0, %448)
    %450 = AIE.masterset(DMA : 1, %447)
    %451 = AIE.masterset(South : 0, %437)
    %452 = AIE.masterset(South : 1, %445)
    %453 = AIE.masterset(South : 2, %438)
    %454 = AIE.masterset(South : 3, %441)
    %455 = AIE.masterset(West : 0, %444)
    %456 = AIE.masterset(West : 1, %439)
    %457 = AIE.masterset(North : 0, %443)
    %458 = AIE.masterset(North : 1, %446)
    %459 = AIE.masterset(East : 0, %440)
    %460 = AIE.masterset(East : 1, %442)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %439)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %444)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %437)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %448)
      AIE.rule(28, 4, %446)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %447)
      AIE.rule(28, 0, %443)
    }
  }
  %117 = AIE.lock(%115, 1)
  %118 = AIE.lock(%115, 0)
  %119 = AIE.buffer(%115) {sym_name = "buf45"} : memref<32x32xf32>
  %120 = AIE.buffer(%115) {sym_name = "buf46"} : memref<32x32xf32>
  %121 = AIE.buffer(%115) {sym_name = "buf47"} : memref<32x32xf32>
  %122 = AIE.buffer(%115) {sym_name = "buf48"} : memref<32x32xf32>
  %123 = AIE.core(%115) {
    AIE.useLock(%117, Acquire, 1)
    AIE.useLock(%118, Acquire, 1)
    AIE.useLock(%129, Acquire, 0)
    call @extern_kernel(%122, %119, %120, %121) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%129, Release, 1)
    AIE.useLock(%118, Release, 0)
    AIE.useLock(%117, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %124 = AIE.mem(%115) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%118, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%121 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%118, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%117, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%120 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %125 = AIE.tile(11, 3)
  %126 = AIE.switchbox(%125) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<2> (0)
    %440 = AIE.amsel<0> (1)
    %441 = AIE.amsel<1> (1)
    %442 = AIE.amsel<2> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<1> (2)
    %445 = AIE.amsel<2> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.amsel<2> (3)
    %449 = AIE.masterset(DMA : 0, %442)
    %450 = AIE.masterset(DMA : 1, %447)
    %451 = AIE.masterset(South : 0, %439)
    %452 = AIE.masterset(South : 1, %440)
    %453 = AIE.masterset(South : 2, %448)
    %454 = AIE.masterset(South : 3, %446)
    %455 = AIE.masterset(West : 0, %443)
    %456 = AIE.masterset(West : 1, %444)
    %457 = AIE.masterset(North : 0, %437)
    %458 = AIE.masterset(North : 1, %438)
    %459 = AIE.masterset(East : 0, %441)
    %460 = AIE.masterset(East : 1, %445)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %445)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %444)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %446)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %448)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %439)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %447)
      AIE.rule(30, 6, %438)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %442)
      AIE.rule(30, 2, %437)
    }
  }
  %127 = AIE.lock(%125, 2)
  %128 = AIE.lock(%125, 1)
  %129 = AIE.lock(%125, 0)
  %130 = AIE.buffer(%125) {sym_name = "buf49"} : memref<32x32xf32>
  %131 = AIE.buffer(%125) {sym_name = "buf50"} : memref<32x32xf32>
  %132 = AIE.buffer(%125) {sym_name = "buf51"} : memref<32x32xf32>
  %133 = AIE.core(%125) {
    AIE.useLock(%129, Acquire, 1)
    AIE.useLock(%128, Acquire, 1)
    AIE.useLock(%127, Acquire, 1)
    AIE.useLock(%137, Acquire, 0)
    call @extern_kernel(%119, %130, %131, %132) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%137, Release, 1)
    AIE.useLock(%127, Release, 0)
    AIE.useLock(%128, Release, 0)
    AIE.useLock(%129, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %134 = AIE.mem(%125) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%127, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%127, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%128, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%132 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%128, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %135 = AIE.tile(11, 4)
  %136 = AIE.switchbox(%135) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<2> (0)
    %440 = AIE.amsel<0> (1)
    %441 = AIE.amsel<1> (1)
    %442 = AIE.amsel<2> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<1> (2)
    %445 = AIE.amsel<2> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.amsel<2> (3)
    %449 = AIE.masterset(DMA : 0, %439)
    %450 = AIE.masterset(DMA : 1, %443)
    %451 = AIE.masterset(South : 0, %441)
    %452 = AIE.masterset(South : 1, %444)
    %453 = AIE.masterset(South : 2, %442)
    %454 = AIE.masterset(South : 3, %447)
    %455 = AIE.masterset(West : 0, %438)
    %456 = AIE.masterset(West : 1, %445)
    %457 = AIE.masterset(North : 0, %437)
    %458 = AIE.masterset(North : 1, %448)
    %459 = AIE.masterset(East : 0, %446)
    %460 = AIE.masterset(East : 1, %440)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %445)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %446)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %447)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %442)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %444)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %441)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %443)
      AIE.rule(31, 7, %448)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %439)
      AIE.rule(31, 3, %437)
    }
  }
  %137 = AIE.lock(%135, 2)
  %138 = AIE.lock(%135, 1)
  %139 = AIE.lock(%135, 0)
  %140 = AIE.buffer(%135) {sym_name = "buf52"} : memref<32x32xf32>
  %141 = AIE.buffer(%135) {sym_name = "buf53"} : memref<32x32xf32>
  %142 = AIE.buffer(%135) {sym_name = "buf54"} : memref<32x32xf32>
  %143 = AIE.core(%135) {
    AIE.useLock(%138, Acquire, 1)
    AIE.useLock(%151, Acquire, 0)
    AIE.useLock(%137, Acquire, 1)
    AIE.useLock(%139, Acquire, 1)
    call @extern_kernel(%130, %140, %141, %142) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%139, Release, 0)
    AIE.useLock(%137, Release, 0)
    AIE.useLock(%151, Release, 1)
    AIE.useLock(%138, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %144 = AIE.mem(%135) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%139, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%141 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%139, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%138, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%142 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%138, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %145 = AIE.tile(11, 5) {polyaie.leaf}
  %146 = AIE.lock(%145, 15)
  %147 = AIE.switchbox(%145) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.amsel<1> (3)
    %445 = AIE.masterset(DMA : 0, %442)
    %446 = AIE.masterset(DMA : 1, %439)
    %447 = AIE.masterset(South : 0, %443)
    %448 = AIE.masterset(South : 1, %441)
    %449 = AIE.masterset(South : 2, %438)
    %450 = AIE.masterset(South : 3, %437)
    %451 = AIE.masterset(West : 0, %444)
    %452 = AIE.masterset(West : 1, %440)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %444)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %441)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %439)
    }
  }
  %148 = AIE.lock(%145, 3)
  %149 = AIE.lock(%145, 2)
  %150 = AIE.lock(%145, 1)
  %151 = AIE.lock(%145, 0)
  %152 = AIE.buffer(%145) {sym_name = "buf55"} : memref<32x32xf32>
  %153 = AIE.buffer(%145) {sym_name = "buf56"} : memref<32x32xf32>
  %154 = AIE.buffer(%145) {sym_name = "buf57"} : memref<32x32xf32>
  %155 = AIE.core(%145) {
    AIE.useLock(%148, Acquire, 1)
    AIE.useLock(%150, Acquire, 0)
    AIE.useLock(%151, Acquire, 1)
    AIE.useLock(%149, Acquire, 1)
    call @extern_kernel(%140, %152, %153, %154) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%149, Release, 0)
    AIE.useLock(%151, Release, 0)
    AIE.useLock(%150, Release, 1)
    AIE.useLock(%148, Release, 0)
    AIE.useLock(%146, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %156 = AIE.mem(%145) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%149, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%154 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%149, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%148, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%153 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%148, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%150, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%152 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%150, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %157 = AIE.tile(12, 2)
  %158 = AIE.switchbox(%157) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.amsel<1> (3)
    %445 = AIE.masterset(DMA : 0, %438)
    %446 = AIE.masterset(DMA : 1, %443)
    %447 = AIE.masterset(South : 0, %441)
    %448 = AIE.masterset(South : 1, %442)
    %449 = AIE.masterset(West : 0, %444)
    %450 = AIE.masterset(West : 1, %437)
    %451 = AIE.masterset(North : 0, %439)
    %452 = AIE.masterset(North : 1, %440)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %444)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %441)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %438)
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %443)
      AIE.rule(28, 0, %439)
    }
  }
  %159 = AIE.lock(%157, 1)
  %160 = AIE.lock(%157, 0)
  %161 = AIE.buffer(%157) {sym_name = "buf58"} : memref<32x32xf32>
  %162 = AIE.buffer(%157) {sym_name = "buf59"} : memref<32x32xf32>
  %163 = AIE.buffer(%157) {sym_name = "buf60"} : memref<32x32xf32>
  %164 = AIE.buffer(%157) {sym_name = "buf61"} : memref<32x32xf32>
  %165 = AIE.core(%157) {
    AIE.useLock(%159, Acquire, 1)
    AIE.useLock(%160, Acquire, 1)
    AIE.useLock(%171, Acquire, 0)
    call @extern_kernel(%164, %161, %162, %163) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%171, Release, 1)
    AIE.useLock(%160, Release, 0)
    AIE.useLock(%159, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %166 = AIE.mem(%157) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%160, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%163 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%160, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%159, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%162 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%159, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %167 = AIE.tile(12, 3)
  %168 = AIE.switchbox(%167) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.amsel<1> (3)
    %445 = AIE.masterset(DMA : 0, %437)
    %446 = AIE.masterset(DMA : 1, %440)
    %447 = AIE.masterset(South : 0, %442)
    %448 = AIE.masterset(South : 1, %444)
    %449 = AIE.masterset(West : 0, %439)
    %450 = AIE.masterset(West : 1, %438)
    %451 = AIE.masterset(North : 0, %443)
    %452 = AIE.masterset(North : 1, %441)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %444)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %442)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %439)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %437)
      AIE.rule(30, 6, %441)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %440)
      AIE.rule(30, 2, %443)
    }
  }
  %169 = AIE.lock(%167, 2)
  %170 = AIE.lock(%167, 1)
  %171 = AIE.lock(%167, 0)
  %172 = AIE.buffer(%167) {sym_name = "buf62"} : memref<32x32xf32>
  %173 = AIE.buffer(%167) {sym_name = "buf63"} : memref<32x32xf32>
  %174 = AIE.buffer(%167) {sym_name = "buf64"} : memref<32x32xf32>
  %175 = AIE.core(%167) {
    AIE.useLock(%181, Acquire, 0)
    AIE.useLock(%170, Acquire, 1)
    AIE.useLock(%169, Acquire, 1)
    AIE.useLock(%171, Acquire, 1)
    call @extern_kernel(%161, %172, %173, %174) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%171, Release, 0)
    AIE.useLock(%169, Release, 0)
    AIE.useLock(%170, Release, 0)
    AIE.useLock(%181, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %176 = AIE.mem(%167) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%169, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%174 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%169, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%170, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%173 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%170, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %177 = AIE.tile(12, 4)
  %178 = AIE.switchbox(%177) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.amsel<1> (3)
    %445 = AIE.masterset(DMA : 0, %443)
    %446 = AIE.masterset(DMA : 1, %437)
    %447 = AIE.masterset(South : 0, %444)
    %448 = AIE.masterset(South : 1, %440)
    %449 = AIE.masterset(West : 0, %442)
    %450 = AIE.masterset(West : 1, %438)
    %451 = AIE.masterset(North : 0, %441)
    %452 = AIE.masterset(North : 1, %439)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %438)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %442)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %444)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %443)
      AIE.rule(31, 7, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %437)
      AIE.rule(31, 3, %441)
    }
  }
  %179 = AIE.lock(%177, 2)
  %180 = AIE.lock(%177, 1)
  %181 = AIE.lock(%177, 0)
  %182 = AIE.buffer(%177) {sym_name = "buf65"} : memref<32x32xf32>
  %183 = AIE.buffer(%177) {sym_name = "buf66"} : memref<32x32xf32>
  %184 = AIE.buffer(%177) {sym_name = "buf67"} : memref<32x32xf32>
  %185 = AIE.core(%177) {
    AIE.useLock(%181, Acquire, 1)
    AIE.useLock(%191, Acquire, 0)
    AIE.useLock(%179, Acquire, 1)
    AIE.useLock(%180, Acquire, 1)
    call @extern_kernel(%172, %182, %183, %184) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%180, Release, 0)
    AIE.useLock(%179, Release, 0)
    AIE.useLock(%191, Release, 1)
    AIE.useLock(%181, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %186 = AIE.mem(%177) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%180, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%184 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%180, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%179, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%183 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%179, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %187 = AIE.tile(12, 5) {polyaie.leaf}
  %188 = AIE.lock(%187, 15)
  %189 = AIE.switchbox(%187) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %443)
    %445 = AIE.masterset(DMA : 1, %442)
    %446 = AIE.masterset(South : 0, %441)
    %447 = AIE.masterset(West : 0, %440)
    %448 = AIE.masterset(West : 1, %438)
    %449 = AIE.masterset(West : 2, %437)
    %450 = AIE.masterset(West : 3, %439)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 1, %439)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %437)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %438)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %443)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %442)
    }
  }
  %190 = AIE.lock(%187, 3)
  %191 = AIE.lock(%187, 2)
  %192 = AIE.lock(%187, 1)
  %193 = AIE.lock(%187, 0)
  %194 = AIE.buffer(%187) {sym_name = "buf68"} : memref<32x32xf32>
  %195 = AIE.buffer(%187) {sym_name = "buf69"} : memref<32x32xf32>
  %196 = AIE.buffer(%187) {sym_name = "buf70"} : memref<32x32xf32>
  %197 = AIE.core(%187) {
    AIE.useLock(%192, Acquire, 0)
    AIE.useLock(%191, Acquire, 1)
    AIE.useLock(%193, Acquire, 1)
    AIE.useLock(%190, Acquire, 1)
    call @extern_kernel(%182, %194, %195, %196) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%190, Release, 0)
    AIE.useLock(%193, Release, 0)
    AIE.useLock(%191, Release, 0)
    AIE.useLock(%192, Release, 1)
    AIE.useLock(%188, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %198 = AIE.mem(%187) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%190, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%196 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%190, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%193, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%195 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%193, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%192, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%194 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%192, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %199 = AIE.tile(13, 2)
  %200 = AIE.switchbox(%199) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %438)
    %442 = AIE.masterset(DMA : 1, %440)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %439)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %438)
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %440)
      AIE.rule(28, 0, %437)
    }
  }
  %201 = AIE.lock(%199, 1)
  %202 = AIE.lock(%199, 0)
  %203 = AIE.buffer(%199) {sym_name = "buf71"} : memref<32x32xf32>
  %204 = AIE.buffer(%199) {sym_name = "buf72"} : memref<32x32xf32>
  %205 = AIE.buffer(%199) {sym_name = "buf73"} : memref<32x32xf32>
  %206 = AIE.buffer(%199) {sym_name = "buf74"} : memref<32x32xf32>
  %207 = AIE.core(%199) {
    AIE.useLock(%201, Acquire, 1)
    AIE.useLock(%202, Acquire, 1)
    AIE.useLock(%213, Acquire, 0)
    call @extern_kernel(%206, %203, %204, %205) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%213, Release, 1)
    AIE.useLock(%202, Release, 0)
    AIE.useLock(%201, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %208 = AIE.mem(%199) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%202, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%205 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%202, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%201, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%204 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%201, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %209 = AIE.tile(13, 3)
  %210 = AIE.switchbox(%209) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %439)
    %442 = AIE.masterset(DMA : 1, %438)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %438)
      AIE.rule(30, 6, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %439)
      AIE.rule(30, 2, %437)
    }
  }
  %211 = AIE.lock(%209, 2)
  %212 = AIE.lock(%209, 1)
  %213 = AIE.lock(%209, 0)
  %214 = AIE.buffer(%209) {sym_name = "buf75"} : memref<32x32xf32>
  %215 = AIE.buffer(%209) {sym_name = "buf76"} : memref<32x32xf32>
  %216 = AIE.buffer(%209) {sym_name = "buf77"} : memref<32x32xf32>
  %217 = AIE.core(%209) {
    AIE.useLock(%211, Acquire, 1)
    AIE.useLock(%212, Acquire, 1)
    AIE.useLock(%213, Acquire, 1)
    AIE.useLock(%223, Acquire, 0)
    call @extern_kernel(%203, %214, %215, %216) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%223, Release, 1)
    AIE.useLock(%213, Release, 0)
    AIE.useLock(%212, Release, 0)
    AIE.useLock(%211, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %218 = AIE.mem(%209) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%212, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%215 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%212, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%211, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%216 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%211, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %219 = AIE.tile(13, 4)
  %220 = AIE.switchbox(%219) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<0> (2)
    %441 = AIE.amsel<0> (3)
    %442 = AIE.masterset(DMA : 0, %439)
    %443 = AIE.masterset(DMA : 1, %437)
    %444 = AIE.masterset(West : 0, %438)
    %445 = AIE.masterset(North : 0, %441)
    %446 = AIE.masterset(North : 1, %440)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 3, %438)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %437)
      AIE.rule(31, 7, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %439)
      AIE.rule(31, 3, %441)
    }
  }
  %221 = AIE.lock(%219, 2)
  %222 = AIE.lock(%219, 1)
  %223 = AIE.lock(%219, 0)
  %224 = AIE.buffer(%219) {sym_name = "buf78"} : memref<32x32xf32>
  %225 = AIE.buffer(%219) {sym_name = "buf79"} : memref<32x32xf32>
  %226 = AIE.buffer(%219) {sym_name = "buf80"} : memref<32x32xf32>
  %227 = AIE.core(%219) {
    AIE.useLock(%232, Acquire, 0)
    AIE.useLock(%222, Acquire, 1)
    AIE.useLock(%221, Acquire, 1)
    AIE.useLock(%223, Acquire, 1)
    call @extern_kernel(%214, %224, %225, %226) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%223, Release, 0)
    AIE.useLock(%221, Release, 0)
    AIE.useLock(%222, Release, 0)
    AIE.useLock(%232, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %228 = AIE.mem(%219) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%221, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%225 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%221, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%222, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%226 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%222, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %229 = AIE.tile(13, 5) {polyaie.leaf}
  %230 = AIE.lock(%229, 15)
  %231 = AIE.switchbox(%229) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<1> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %440)
    %445 = AIE.masterset(DMA : 1, %441)
    %446 = AIE.masterset(South : 0, %442)
    %447 = AIE.masterset(West : 0, %439)
    %448 = AIE.masterset(West : 1, %437)
    %449 = AIE.masterset(West : 2, %443)
    %450 = AIE.masterset(West : 3, %438)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 3, %442)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %443)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %437)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %439)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %441)
    }
  }
  %232 = AIE.lock(%229, 3)
  %233 = AIE.lock(%229, 2)
  %234 = AIE.lock(%229, 1)
  %235 = AIE.lock(%229, 0)
  %236 = AIE.buffer(%229) {sym_name = "buf81"} : memref<32x32xf32>
  %237 = AIE.buffer(%229) {sym_name = "buf82"} : memref<32x32xf32>
  %238 = AIE.buffer(%229) {sym_name = "buf83"} : memref<32x32xf32>
  %239 = AIE.core(%229) {
    AIE.useLock(%232, Acquire, 1)
    AIE.useLock(%235, Acquire, 1)
    AIE.useLock(%234, Acquire, 0)
    AIE.useLock(%233, Acquire, 1)
    call @extern_kernel(%224, %236, %237, %238) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%233, Release, 0)
    AIE.useLock(%234, Release, 1)
    AIE.useLock(%235, Release, 0)
    AIE.useLock(%232, Release, 0)
    AIE.useLock(%230, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %240 = AIE.mem(%229) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%233, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%238 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%233, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%235, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%237 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%235, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%234, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%236 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%234, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %241 = AIE.tile(14, 2)
  %242 = AIE.switchbox(%241) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %439)
    %442 = AIE.masterset(DMA : 1, %440)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %438)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %440)
      AIE.rule(28, 0, %438)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %439)
      AIE.rule(28, 4, %437)
    }
  }
  %243 = AIE.lock(%241, 1)
  %244 = AIE.lock(%241, 0)
  %245 = AIE.buffer(%241) {sym_name = "buf84"} : memref<32x32xf32>
  %246 = AIE.buffer(%241) {sym_name = "buf85"} : memref<32x32xf32>
  %247 = AIE.buffer(%241) {sym_name = "buf86"} : memref<32x32xf32>
  %248 = AIE.buffer(%241) {sym_name = "buf87"} : memref<32x32xf32>
  %249 = AIE.core(%241) {
    AIE.useLock(%254, Acquire, 0)
    AIE.useLock(%244, Acquire, 1)
    AIE.useLock(%243, Acquire, 1)
    call @extern_kernel(%248, %245, %246, %247) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%243, Release, 0)
    AIE.useLock(%244, Release, 0)
    AIE.useLock(%254, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %250 = AIE.mem(%241) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%243, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%247 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%243, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%244, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%246 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%244, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %251 = AIE.tile(14, 3)
  %252 = AIE.switchbox(%251) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %438)
    %442 = AIE.masterset(DMA : 1, %440)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %439)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %438)
      AIE.rule(30, 2, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %440)
      AIE.rule(30, 6, %437)
    }
  }
  %253 = AIE.lock(%251, 2)
  %254 = AIE.lock(%251, 1)
  %255 = AIE.lock(%251, 0)
  %256 = AIE.buffer(%251) {sym_name = "buf88"} : memref<32x32xf32>
  %257 = AIE.buffer(%251) {sym_name = "buf89"} : memref<32x32xf32>
  %258 = AIE.buffer(%251) {sym_name = "buf90"} : memref<32x32xf32>
  %259 = AIE.core(%251) {
    AIE.useLock(%254, Acquire, 1)
    AIE.useLock(%265, Acquire, 0)
    AIE.useLock(%253, Acquire, 1)
    AIE.useLock(%255, Acquire, 1)
    call @extern_kernel(%245, %256, %257, %258) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%255, Release, 0)
    AIE.useLock(%253, Release, 0)
    AIE.useLock(%265, Release, 1)
    AIE.useLock(%254, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %260 = AIE.mem(%251) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%255, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%257 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%255, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%253, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%258 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%253, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %261 = AIE.tile(14, 4)
  %262 = AIE.switchbox(%261) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %439)
    %442 = AIE.masterset(DMA : 1, %437)
    %443 = AIE.masterset(North : 0, %438)
    %444 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %439)
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %437)
      AIE.rule(31, 7, %438)
    }
  }
  %263 = AIE.lock(%261, 2)
  %264 = AIE.lock(%261, 1)
  %265 = AIE.lock(%261, 0)
  %266 = AIE.buffer(%261) {sym_name = "buf91"} : memref<32x32xf32>
  %267 = AIE.buffer(%261) {sym_name = "buf92"} : memref<32x32xf32>
  %268 = AIE.buffer(%261) {sym_name = "buf93"} : memref<32x32xf32>
  %269 = AIE.core(%261) {
    AIE.useLock(%264, Acquire, 1)
    AIE.useLock(%263, Acquire, 1)
    AIE.useLock(%265, Acquire, 1)
    AIE.useLock(%274, Acquire, 0)
    call @extern_kernel(%256, %266, %267, %268) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%274, Release, 1)
    AIE.useLock(%265, Release, 0)
    AIE.useLock(%263, Release, 0)
    AIE.useLock(%264, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %270 = AIE.mem(%261) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%263, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%267 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%263, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%264, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%268 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%264, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %271 = AIE.tile(14, 5) {polyaie.leaf}
  %272 = AIE.lock(%271, 15)
  %273 = AIE.switchbox(%271) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.masterset(DMA : 0, %439)
    %444 = AIE.masterset(DMA : 1, %437)
    %445 = AIE.masterset(West : 0, %438)
    %446 = AIE.masterset(West : 1, %441)
    %447 = AIE.masterset(West : 2, %442)
    %448 = AIE.masterset(West : 3, %440)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %442)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %441)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %438)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 7, %439)
    }
  }
  %274 = AIE.lock(%271, 3)
  %275 = AIE.lock(%271, 2)
  %276 = AIE.lock(%271, 1)
  %277 = AIE.lock(%271, 0)
  %278 = AIE.buffer(%271) {sym_name = "buf94"} : memref<32x32xf32>
  %279 = AIE.buffer(%271) {sym_name = "buf95"} : memref<32x32xf32>
  %280 = AIE.buffer(%271) {sym_name = "buf96"} : memref<32x32xf32>
  %281 = AIE.core(%271) {
    AIE.useLock(%276, Acquire, 1)
    AIE.useLock(%275, Acquire, 0)
    AIE.useLock(%277, Acquire, 1)
    AIE.useLock(%274, Acquire, 1)
    call @extern_kernel(%266, %278, %279, %280) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%274, Release, 0)
    AIE.useLock(%277, Release, 0)
    AIE.useLock(%275, Release, 1)
    AIE.useLock(%276, Release, 0)
    AIE.useLock(%272, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %282 = AIE.mem(%271) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%277, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%280 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%277, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%276, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%279 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%276, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%275, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%278 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %283 = AIE.tile(15, 2)
  %284 = AIE.switchbox(%283) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %440)
    %442 = AIE.masterset(DMA : 1, %438)
    %443 = AIE.masterset(North : 0, %439)
    %444 = AIE.masterset(North : 1, %437)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %440)
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %438)
      AIE.rule(28, 0, %439)
    }
  }
  %285 = AIE.lock(%283, 1)
  %286 = AIE.lock(%283, 0)
  %287 = AIE.buffer(%283) {sym_name = "buf97"} : memref<32x32xf32>
  %288 = AIE.buffer(%283) {sym_name = "buf98"} : memref<32x32xf32>
  %289 = AIE.buffer(%283) {sym_name = "buf99"} : memref<32x32xf32>
  %290 = AIE.buffer(%283) {sym_name = "buf100"} : memref<32x32xf32>
  %291 = AIE.core(%283) {
    AIE.useLock(%285, Acquire, 1)
    AIE.useLock(%286, Acquire, 1)
    AIE.useLock(%295, Acquire, 0)
    call @extern_kernel(%290, %287, %288, %289) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%295, Release, 1)
    AIE.useLock(%286, Release, 0)
    AIE.useLock(%285, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %292 = AIE.mem(%283) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%286, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%289 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%286, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%285, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%288 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%285, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %293 = AIE.tile(15, 3)
  %294 = AIE.switchbox(%293) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %439)
    %442 = AIE.masterset(DMA : 1, %440)
    %443 = AIE.masterset(North : 0, %438)
    %444 = AIE.masterset(North : 1, %437)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %440)
      AIE.rule(30, 6, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %439)
      AIE.rule(30, 2, %438)
    }
  }
  %295 = AIE.lock(%293, 2)
  %296 = AIE.lock(%293, 1)
  %297 = AIE.lock(%293, 0)
  %298 = AIE.buffer(%293) {sym_name = "buf101"} : memref<32x32xf32>
  %299 = AIE.buffer(%293) {sym_name = "buf102"} : memref<32x32xf32>
  %300 = AIE.buffer(%293) {sym_name = "buf103"} : memref<32x32xf32>
  %301 = AIE.core(%293) {
    AIE.useLock(%307, Acquire, 0)
    AIE.useLock(%295, Acquire, 1)
    AIE.useLock(%296, Acquire, 1)
    AIE.useLock(%297, Acquire, 1)
    call @extern_kernel(%287, %298, %299, %300) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%297, Release, 0)
    AIE.useLock(%296, Release, 0)
    AIE.useLock(%295, Release, 0)
    AIE.useLock(%307, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %302 = AIE.mem(%293) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%297, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%299 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%297, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%296, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%300 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%296, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %303 = AIE.tile(15, 4)
  %304 = AIE.switchbox(%303) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %438)
    %442 = AIE.masterset(DMA : 1, %440)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %439)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %438)
      AIE.rule(31, 7, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %440)
      AIE.rule(31, 3, %437)
    }
  }
  %305 = AIE.lock(%303, 2)
  %306 = AIE.lock(%303, 1)
  %307 = AIE.lock(%303, 0)
  %308 = AIE.buffer(%303) {sym_name = "buf104"} : memref<32x32xf32>
  %309 = AIE.buffer(%303) {sym_name = "buf105"} : memref<32x32xf32>
  %310 = AIE.buffer(%303) {sym_name = "buf106"} : memref<32x32xf32>
  %311 = AIE.core(%303) {
    AIE.useLock(%306, Acquire, 1)
    AIE.useLock(%307, Acquire, 1)
    AIE.useLock(%305, Acquire, 1)
    AIE.useLock(%318, Acquire, 0)
    call @extern_kernel(%298, %308, %309, %310) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%318, Release, 1)
    AIE.useLock(%305, Release, 0)
    AIE.useLock(%307, Release, 0)
    AIE.useLock(%306, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %312 = AIE.mem(%303) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%305, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%310 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%305, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%306, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%309 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%306, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %313 = AIE.tile(15, 5) {polyaie.leaf}
  %314 = AIE.lock(%313, 15)
  %315 = AIE.switchbox(%313) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<0> (2)
    %441 = AIE.amsel<0> (3)
    %442 = AIE.masterset(DMA : 0, %438)
    %443 = AIE.masterset(DMA : 1, %441)
    %444 = AIE.masterset(West : 0, %439)
    %445 = AIE.masterset(West : 1, %437)
    %446 = AIE.masterset(West : 2, %440)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %437)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %439)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %438)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %441)
    }
  }
  %316 = AIE.lock(%313, 3)
  %317 = AIE.lock(%313, 2)
  %318 = AIE.lock(%313, 1)
  %319 = AIE.lock(%313, 0)
  %320 = AIE.buffer(%313) {sym_name = "buf107"} : memref<32x32xf32>
  %321 = AIE.buffer(%313) {sym_name = "buf108"} : memref<32x32xf32>
  %322 = AIE.buffer(%313) {sym_name = "buf109"} : memref<32x32xf32>
  %323 = AIE.core(%313) {
    AIE.useLock(%319, Acquire, 0)
    AIE.useLock(%316, Acquire, 1)
    AIE.useLock(%317, Acquire, 1)
    AIE.useLock(%318, Acquire, 1)
    call @extern_kernel(%308, %320, %321, %322) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%318, Release, 0)
    AIE.useLock(%317, Release, 0)
    AIE.useLock(%316, Release, 0)
    AIE.useLock(%319, Release, 1)
    AIE.useLock(%314, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %324 = AIE.mem(%313) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%317, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%322 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%317, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%316, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%321 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%316, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%319, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%320 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%319, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %325 = AIE.tile(16, 2)
  %326 = AIE.switchbox(%325) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %440)
    %442 = AIE.masterset(DMA : 1, %438)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %439)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %440)
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %438)
      AIE.rule(28, 0, %437)
    }
  }
  %327 = AIE.lock(%325, 1)
  %328 = AIE.lock(%325, 0)
  %329 = AIE.buffer(%325) {sym_name = "buf110"} : memref<32x32xf32>
  %330 = AIE.buffer(%325) {sym_name = "buf111"} : memref<32x32xf32>
  %331 = AIE.buffer(%325) {sym_name = "buf112"} : memref<32x32xf32>
  %332 = AIE.buffer(%325) {sym_name = "buf113"} : memref<32x32xf32>
  %333 = AIE.core(%325) {
    AIE.useLock(%338, Acquire, 0)
    AIE.useLock(%328, Acquire, 1)
    AIE.useLock(%327, Acquire, 1)
    call @extern_kernel(%332, %329, %330, %331) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%327, Release, 0)
    AIE.useLock(%328, Release, 0)
    AIE.useLock(%338, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %334 = AIE.mem(%325) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%327, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%331 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%327, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%328, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%330 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%328, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %335 = AIE.tile(16, 3)
  %336 = AIE.switchbox(%335) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %438)
    %442 = AIE.masterset(DMA : 1, %440)
    %443 = AIE.masterset(North : 0, %439)
    %444 = AIE.masterset(North : 1, %437)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %440)
      AIE.rule(30, 6, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %438)
      AIE.rule(30, 2, %439)
    }
  }
  %337 = AIE.lock(%335, 2)
  %338 = AIE.lock(%335, 1)
  %339 = AIE.lock(%335, 0)
  %340 = AIE.buffer(%335) {sym_name = "buf114"} : memref<32x32xf32>
  %341 = AIE.buffer(%335) {sym_name = "buf115"} : memref<32x32xf32>
  %342 = AIE.buffer(%335) {sym_name = "buf116"} : memref<32x32xf32>
  %343 = AIE.core(%335) {
    AIE.useLock(%338, Acquire, 1)
    AIE.useLock(%349, Acquire, 0)
    AIE.useLock(%337, Acquire, 1)
    AIE.useLock(%339, Acquire, 1)
    call @extern_kernel(%329, %340, %341, %342) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%339, Release, 0)
    AIE.useLock(%337, Release, 0)
    AIE.useLock(%349, Release, 1)
    AIE.useLock(%338, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %344 = AIE.mem(%335) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%339, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%341 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%339, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%337, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%342 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%337, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %345 = AIE.tile(16, 4)
  %346 = AIE.switchbox(%345) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %437)
    %442 = AIE.masterset(DMA : 1, %438)
    %443 = AIE.masterset(North : 0, %440)
    %444 = AIE.masterset(North : 1, %439)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %437)
      AIE.rule(31, 7, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %438)
      AIE.rule(31, 3, %440)
    }
  }
  %347 = AIE.lock(%345, 2)
  %348 = AIE.lock(%345, 1)
  %349 = AIE.lock(%345, 0)
  %350 = AIE.buffer(%345) {sym_name = "buf117"} : memref<32x32xf32>
  %351 = AIE.buffer(%345) {sym_name = "buf118"} : memref<32x32xf32>
  %352 = AIE.buffer(%345) {sym_name = "buf119"} : memref<32x32xf32>
  %353 = AIE.core(%345) {
    AIE.useLock(%347, Acquire, 1)
    AIE.useLock(%349, Acquire, 1)
    AIE.useLock(%360, Acquire, 0)
    AIE.useLock(%348, Acquire, 1)
    call @extern_kernel(%340, %350, %351, %352) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%348, Release, 0)
    AIE.useLock(%360, Release, 1)
    AIE.useLock(%349, Release, 0)
    AIE.useLock(%347, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %354 = AIE.mem(%345) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%348, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%352 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%348, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%347, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%351 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%347, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %355 = AIE.tile(16, 5) {polyaie.leaf}
  %356 = AIE.lock(%355, 15)
  %357 = AIE.switchbox(%355) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %440)
    %442 = AIE.masterset(DMA : 1, %439)
    %443 = AIE.masterset(West : 0, %438)
    %444 = AIE.masterset(West : 1, %437)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %439)
    }
  }
  %358 = AIE.lock(%355, 3)
  %359 = AIE.lock(%355, 2)
  %360 = AIE.lock(%355, 1)
  %361 = AIE.lock(%355, 0)
  %362 = AIE.buffer(%355) {sym_name = "buf120"} : memref<32x32xf32>
  %363 = AIE.buffer(%355) {sym_name = "buf121"} : memref<32x32xf32>
  %364 = AIE.buffer(%355) {sym_name = "buf122"} : memref<32x32xf32>
  %365 = AIE.core(%355) {
    AIE.useLock(%359, Acquire, 1)
    AIE.useLock(%361, Acquire, 0)
    AIE.useLock(%360, Acquire, 1)
    AIE.useLock(%358, Acquire, 1)
    call @extern_kernel(%350, %362, %363, %364) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%358, Release, 0)
    AIE.useLock(%360, Release, 0)
    AIE.useLock(%361, Release, 1)
    AIE.useLock(%359, Release, 0)
    AIE.useLock(%356, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %366 = AIE.mem(%355) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%358, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%364 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%358, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%359, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%363 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%359, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%361, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%362 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%361, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %367 = AIE.tile(17, 2)
  %368 = AIE.switchbox(%367) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %440)
    %442 = AIE.masterset(DMA : 1, %437)
    %443 = AIE.masterset(North : 0, %438)
    %444 = AIE.masterset(North : 1, %439)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %440)
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %437)
      AIE.rule(28, 0, %438)
    }
  }
  %369 = AIE.lock(%367, 1)
  %370 = AIE.lock(%367, 0)
  %371 = AIE.buffer(%367) {sym_name = "buf123"} : memref<32x32xf32>
  %372 = AIE.buffer(%367) {sym_name = "buf124"} : memref<32x32xf32>
  %373 = AIE.buffer(%367) {sym_name = "buf125"} : memref<32x32xf32>
  %374 = AIE.buffer(%367) {sym_name = "buf126"} : memref<32x32xf32>
  %375 = AIE.core(%367) {
    AIE.useLock(%380, Acquire, 0)
    AIE.useLock(%370, Acquire, 1)
    AIE.useLock(%369, Acquire, 1)
    call @extern_kernel(%374, %371, %372, %373) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%369, Release, 0)
    AIE.useLock(%370, Release, 0)
    AIE.useLock(%380, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %376 = AIE.mem(%367) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%369, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%373 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%369, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%370, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%372 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%370, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %377 = AIE.tile(17, 3)
  %378 = AIE.switchbox(%377) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %440)
    %442 = AIE.masterset(DMA : 1, %439)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %438)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %439)
      AIE.rule(30, 6, %438)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %440)
      AIE.rule(30, 2, %437)
    }
  }
  %379 = AIE.lock(%377, 2)
  %380 = AIE.lock(%377, 1)
  %381 = AIE.lock(%377, 0)
  %382 = AIE.buffer(%377) {sym_name = "buf127"} : memref<32x32xf32>
  %383 = AIE.buffer(%377) {sym_name = "buf128"} : memref<32x32xf32>
  %384 = AIE.buffer(%377) {sym_name = "buf129"} : memref<32x32xf32>
  %385 = AIE.core(%377) {
    AIE.useLock(%380, Acquire, 1)
    AIE.useLock(%379, Acquire, 1)
    AIE.useLock(%391, Acquire, 0)
    AIE.useLock(%381, Acquire, 1)
    call @extern_kernel(%371, %382, %383, %384) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%381, Release, 0)
    AIE.useLock(%391, Release, 1)
    AIE.useLock(%379, Release, 0)
    AIE.useLock(%380, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %386 = AIE.mem(%377) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%381, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%383 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%381, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%379, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%384 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%379, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %387 = AIE.tile(17, 4)
  %388 = AIE.switchbox(%387) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(DMA : 0, %440)
    %442 = AIE.masterset(DMA : 1, %438)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %439)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %440)
      AIE.rule(31, 7, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %438)
      AIE.rule(31, 3, %437)
    }
  }
  %389 = AIE.lock(%387, 2)
  %390 = AIE.lock(%387, 1)
  %391 = AIE.lock(%387, 0)
  %392 = AIE.buffer(%387) {sym_name = "buf130"} : memref<32x32xf32>
  %393 = AIE.buffer(%387) {sym_name = "buf131"} : memref<32x32xf32>
  %394 = AIE.buffer(%387) {sym_name = "buf132"} : memref<32x32xf32>
  %395 = AIE.core(%387) {
    AIE.useLock(%389, Acquire, 1)
    AIE.useLock(%390, Acquire, 1)
    AIE.useLock(%391, Acquire, 1)
    AIE.useLock(%403, Acquire, 0)
    call @extern_kernel(%382, %392, %393, %394) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%403, Release, 1)
    AIE.useLock(%391, Release, 0)
    AIE.useLock(%390, Release, 0)
    AIE.useLock(%389, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %396 = AIE.mem(%387) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%390, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%394 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%390, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%389, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%393 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%389, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %397 = AIE.tile(17, 5) {polyaie.leaf}
  %398 = AIE.lock(%397, 15)
  %399 = AIE.switchbox(%397) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.masterset(DMA : 0, %439)
    %441 = AIE.masterset(DMA : 1, %437)
    %442 = AIE.masterset(West : 0, %438)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %438)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %437)
    }
  }
  %400 = AIE.lock(%397, 3)
  %401 = AIE.lock(%397, 2)
  %402 = AIE.lock(%397, 1)
  %403 = AIE.lock(%397, 0)
  %404 = AIE.buffer(%397) {sym_name = "buf133"} : memref<32x32xf32>
  %405 = AIE.buffer(%397) {sym_name = "buf134"} : memref<32x32xf32>
  %406 = AIE.buffer(%397) {sym_name = "buf135"} : memref<32x32xf32>
  %407 = AIE.core(%397) {
    AIE.useLock(%401, Acquire, 1)
    AIE.useLock(%400, Acquire, 0)
    AIE.useLock(%403, Acquire, 1)
    AIE.useLock(%402, Acquire, 1)
    call @extern_kernel(%392, %404, %405, %406) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%402, Release, 0)
    AIE.useLock(%403, Release, 0)
    AIE.useLock(%400, Release, 1)
    AIE.useLock(%401, Release, 0)
    AIE.useLock(%398, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %408 = AIE.mem(%397) {
    %437 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%402, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%406 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%402, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %438 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%401, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%405 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%401, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %439 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%400, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%404 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%400, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %409 = AIE.tile(12, 0)
  %410 = AIE.switchbox(%409) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.masterset(West : 0, %437)
    %444 = AIE.masterset(West : 1, %440)
    %445 = AIE.masterset(North : 0, %441)
    %446 = AIE.masterset(North : 1, %439)
    %447 = AIE.masterset(East : 0, %441)
    %448 = AIE.masterset(East : 1, %438)
    %449 = AIE.masterset(East : 2, %439)
    %450 = AIE.masterset(East : 3, %442)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %437)
    }
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %441)
    }
  }
  %411 = AIE.tile(13, 0)
  %412 = AIE.switchbox(%411) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<0> (2)
    %441 = AIE.amsel<0> (3)
    %442 = AIE.masterset(North : 0, %437)
    %443 = AIE.masterset(North : 1, %439)
    %444 = AIE.masterset(East : 0, %438)
    %445 = AIE.masterset(East : 1, %440)
    %446 = AIE.masterset(East : 2, %441)
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %437)
    }
  }
  %413 = AIE.tile(16, 0)
  %414 = AIE.switchbox(%413) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.masterset(West : 0, %439)
    %441 = AIE.masterset(West : 1, %437)
    %442 = AIE.masterset(North : 0, %439)
    %443 = AIE.masterset(North : 1, %438)
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %439)
    }
  }
  %415 = AIE.tile(16, 1)
  %416 = AIE.switchbox(%415) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.masterset(North : 0, %438)
    %440 = AIE.masterset(North : 1, %437)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %438)
    }
  }
  %417 = AIE.tile(15, 1)
  %418 = AIE.switchbox(%417) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.masterset(North : 0, %438)
    %440 = AIE.masterset(North : 1, %437)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %438)
    }
  }
  %419 = AIE.tile(17, 1)
  %420 = AIE.switchbox(%419) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.masterset(North : 0, %437)
    %440 = AIE.masterset(North : 1, %438)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %437)
    }
  }
  %421 = AIE.tile(17, 0)
  %422 = AIE.switchbox(%421) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.masterset(West : 0, %437)
    %440 = AIE.masterset(West : 1, %438)
    %441 = AIE.masterset(North : 0, %437)
    %442 = AIE.masterset(North : 1, %438)
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %437)
    }
  }
  %423 = AIE.tile(14, 0)
  %424 = AIE.switchbox(%423) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<0> (2)
    %441 = AIE.amsel<0> (3)
    %442 = AIE.masterset(West : 0, %437)
    %443 = AIE.masterset(North : 0, %441)
    %444 = AIE.masterset(North : 1, %439)
    %445 = AIE.masterset(East : 0, %440)
    %446 = AIE.masterset(East : 1, %438)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %439)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %441)
    }
  }
  %425 = AIE.tile(12, 1)
  %426 = AIE.switchbox(%425) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.masterset(South : 0, %438)
    %444 = AIE.masterset(South : 1, %441)
    %445 = AIE.masterset(West : 0, %440)
    %446 = AIE.masterset(West : 1, %442)
    %447 = AIE.masterset(North : 0, %437)
    %448 = AIE.masterset(North : 1, %439)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %437)
    }
  }
  %427 = AIE.tile(15, 0)
  %428 = AIE.switchbox(%427) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<0> (3)
    %441 = AIE.masterset(West : 0, %437)
    %442 = AIE.masterset(West : 1, %438)
    %443 = AIE.masterset(North : 0, %437)
    %444 = AIE.masterset(North : 1, %440)
    %445 = AIE.masterset(East : 0, %439)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %439)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %437)
    }
  }
  %429 = AIE.tile(11, 1)
  %430 = AIE.switchbox(%429) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<2> (0)
    %440 = AIE.amsel<0> (1)
    %441 = AIE.amsel<1> (1)
    %442 = AIE.amsel<2> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<1> (2)
    %445 = AIE.amsel<0> (3)
    %446 = AIE.amsel<1> (3)
    %447 = AIE.masterset(South : 0, %443)
    %448 = AIE.masterset(South : 1, %446)
    %449 = AIE.masterset(South : 2, %444)
    %450 = AIE.masterset(South : 3, %441)
    %451 = AIE.masterset(West : 0, %438)
    %452 = AIE.masterset(West : 1, %442)
    %453 = AIE.masterset(North : 0, %440)
    %454 = AIE.masterset(North : 1, %437)
    %455 = AIE.masterset(East : 0, %445)
    %456 = AIE.masterset(East : 1, %439)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %439)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %445)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %438)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %444)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %446)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %440)
    }
  }
  %431 = AIE.tile(14, 1)
  %432 = AIE.switchbox(%431) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.masterset(North : 0, %438)
    %440 = AIE.masterset(North : 1, %437)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %438)
    }
  }
  %433 = AIE.tile(13, 1)
  %434 = AIE.switchbox(%433) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<0> (1)
    %439 = AIE.masterset(North : 0, %438)
    %440 = AIE.masterset(North : 1, %437)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %438)
    }
  }
  %435 = AIE.tile(10, 1)
  %436 = AIE.switchbox(%435) {
    %437 = AIE.amsel<0> (0)
    %438 = AIE.amsel<1> (0)
    %439 = AIE.amsel<0> (1)
    %440 = AIE.amsel<1> (1)
    %441 = AIE.amsel<0> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.masterset(South : 0, %440)
    %444 = AIE.masterset(South : 1, %442)
    %445 = AIE.masterset(North : 0, %439)
    %446 = AIE.masterset(North : 1, %437)
    %447 = AIE.masterset(East : 0, %438)
    %448 = AIE.masterset(East : 1, %441)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %439)
    }
  }
}


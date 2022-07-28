module @gemm {
  AIE.token(0) {sym_name = "token44"}
  AIE.token(0) {sym_name = "token43"}
  AIE.token(0) {sym_name = "token42"}
  AIE.token(0) {sym_name = "token41"}
  AIE.token(0) {sym_name = "token40"}
  AIE.token(0) {sym_name = "token39"}
  AIE.token(0) {sym_name = "token38"}
  AIE.token(0) {sym_name = "token37"}
  AIE.token(0) {sym_name = "token36"}
  AIE.token(0) {sym_name = "token35"}
  AIE.token(0) {sym_name = "token34"}
  AIE.token(0) {sym_name = "token33"}
  AIE.token(0) {sym_name = "token32"}
  AIE.token(0) {sym_name = "token31"}
  AIE.token(0) {sym_name = "token30"}
  AIE.token(0) {sym_name = "token29"}
  AIE.token(0) {sym_name = "token28"}
  AIE.token(0) {sym_name = "token27"}
  AIE.token(0) {sym_name = "token26"}
  AIE.token(0) {sym_name = "token25"}
  AIE.token(0) {sym_name = "token24"}
  AIE.token(0) {sym_name = "token23"}
  AIE.token(0) {sym_name = "token22"}
  AIE.token(0) {sym_name = "token21"}
  AIE.token(0) {sym_name = "token20"}
  AIE.token(0) {sym_name = "token19"}
  AIE.token(0) {sym_name = "token18"}
  AIE.token(0) {sym_name = "token17"}
  AIE.token(0) {sym_name = "token16"}
  AIE.token(0) {sym_name = "token15"}
  AIE.token(0) {sym_name = "token14"}
  AIE.token(0) {sym_name = "token13"}
  AIE.token(0) {sym_name = "token12"}
  AIE.token(0) {sym_name = "token11"}
  AIE.token(0) {sym_name = "token10"}
  AIE.token(0) {sym_name = "token9"}
  AIE.token(0) {sym_name = "token8"}
  AIE.token(0) {sym_name = "token7"}
  AIE.token(0) {sym_name = "token6"}
  AIE.token(0) {sym_name = "token5"}
  AIE.token(0) {sym_name = "token4"}
  AIE.token(0) {sym_name = "token3"}
  AIE.token(0) {sym_name = "token2"}
  AIE.token(0) {sym_name = "token1"}
  AIE.token(0) {sym_name = "token0"}
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<96x96xf32>
  %1 = memref.alloc() : memref<96x96xf32>
  %2 = memref.alloc() : memref<96x96xf32>
  %3 = AIE.tile(10, 0)
  %4 = AIE.shimmux(%3) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<North : 3, DMA : 1>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %5 = AIE.switchbox(%3) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(South : 2, %387)
    %390 = AIE.masterset(South : 3, %388)
    %391 = AIE.masterset(North : 0, %385)
    %392 = AIE.masterset(North : 1, %386)
    %393 = AIE.masterset(East : 0, %385)
    %394 = AIE.masterset(East : 1, %386)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %388)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %387)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %385)
    }
  }
  %6 = AIE.lock(%3, 5)
  %7 = AIE.lock(%3, 4)
  %8 = AIE.lock(%3, 3)
  %9 = AIE.lock(%3, 2)
  %10 = AIE.lock(%3, 1)
  %11 = AIE.lock(%3, 0)
  %12 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %13 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %14 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %15 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %16 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %17 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %18 = AIE.external_buffer 90112 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %18) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %19 = AIE.external_buffer 98304 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %19) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %20 = AIE.external_buffer 106496 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %20) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %21 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %21) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %22 = AIE.external_buffer 122880 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %22) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %23 = AIE.external_buffer 131072 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %23) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %24 = AIE.external_buffer 139264 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %24) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %25 = AIE.external_buffer 147456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %25) {kind = 2 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %26 = AIE.core(%3) {
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%10, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%11, Acquire, 0)
    AIE.useLock(%11, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%10, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.end
  }
  %27 = AIE.shimDMA(%3) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBd(<%18 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBd(<%19 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBd(<%20 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBd(<%21 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBd(<%22 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBd(<%23 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBd(<%24 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBd(<%25 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %387 = AIE.dmaStart(MM2S0, ^bb11, ^bb14)
  ^bb11:  // 2 preds: ^bb10, ^bb13
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%10, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 0)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 0)
    br ^bb11
  ^bb14:  // pred: ^bb10
    %388 = AIE.dmaStart(MM2S1, ^bb15, ^bb18)
  ^bb15:  // 2 preds: ^bb14, ^bb17
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb16
  ^bb16:  // pred: ^bb15
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb15
  ^bb18:  // pred: ^bb14
    AIE.end
  }
  %28 = AIE.tile(18, 0)
  %29 = AIE.shimmux(%28) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %30 = AIE.switchbox(%28) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.masterset(West : 0, %387)
    %389 = AIE.masterset(West : 1, %386)
    %390 = AIE.masterset(North : 0, %386)
    %391 = AIE.masterset(North : 1, %385)
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %387)
    }
  }
  %31 = AIE.lock(%28, 5)
  %32 = AIE.lock(%28, 4)
  %33 = AIE.lock(%28, 3)
  %34 = AIE.lock(%28, 2)
  %35 = AIE.lock(%28, 1)
  %36 = AIE.lock(%28, 0)
  %37 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %38 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %39 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %40 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%40, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %41 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%41, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %42 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%42, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %43 = AIE.core(%28) {
    AIE.useLock(%33, Acquire, 0)
    AIE.useLock(%35, Acquire, 0)
    AIE.useLock(%34, Acquire, 0)
    AIE.useLock(%36, Acquire, 0)
    AIE.useLock(%32, Acquire, 0)
    AIE.useLock(%31, Acquire, 0)
    AIE.useLock(%31, Release, 1)
    AIE.useLock(%32, Release, 1)
    AIE.useLock(%36, Release, 1)
    AIE.useLock(%34, Release, 1)
    AIE.useLock(%35, Release, 1)
    AIE.useLock(%33, Release, 1)
    AIE.end
  }
  %44 = AIE.shimDMA(%28) {
    %385 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%36, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%32, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%35, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %386 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%33, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%38 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%34, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%37 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  %45 = AIE.tile(11, 0)
  %46 = AIE.shimmux(%45) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %47 = AIE.switchbox(%45) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<0> (3)
    %391 = AIE.masterset(South : 2, %388)
    %392 = AIE.masterset(West : 0, %387)
    %393 = AIE.masterset(North : 0, %385)
    %394 = AIE.masterset(North : 1, %386)
    %395 = AIE.masterset(East : 0, %389)
    %396 = AIE.masterset(East : 1, %385)
    %397 = AIE.masterset(East : 2, %386)
    %398 = AIE.masterset(East : 3, %390)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %387)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %390)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %385)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %389)
    }
  }
  %48 = AIE.lock(%45, 5)
  %49 = AIE.lock(%45, 4)
  %50 = AIE.lock(%45, 3)
  %51 = AIE.lock(%45, 2)
  %52 = AIE.lock(%45, 1)
  %53 = AIE.lock(%45, 0)
  %54 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%54, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %55 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%55, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %56 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %57 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %58 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%58, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %59 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%59, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %60 = AIE.external_buffer 155648 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %60) {kind = 2 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %61 = AIE.core(%45) {
    AIE.useLock(%50, Acquire, 0)
    AIE.useLock(%48, Acquire, 0)
    AIE.useLock(%51, Acquire, 0)
    AIE.useLock(%49, Acquire, 0)
    AIE.useLock(%53, Acquire, 0)
    AIE.useLock(%52, Acquire, 0)
    AIE.useLock(%52, Release, 1)
    AIE.useLock(%53, Release, 1)
    AIE.useLock(%49, Release, 1)
    AIE.useLock(%51, Release, 1)
    AIE.useLock(%48, Release, 1)
    AIE.useLock(%50, Release, 1)
    AIE.end
  }
  %62 = AIE.shimDMA(%45) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBd(<%60 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(MM2S0, ^bb3, ^bb6)
  ^bb3:  // 2 preds: ^bb2, ^bb5
    AIE.useLock(%48, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%51, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%51, Release, 0)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%50, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 0)
    br ^bb3
  ^bb6:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S1, ^bb7, ^bb10)
  ^bb7:  // 2 preds: ^bb6, ^bb9
    AIE.useLock(%52, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%53, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%49, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 0)
    br ^bb7
  ^bb10:  // pred: ^bb6
    AIE.end
  }
  %63 = AIE.tile(0, 0)
  %64 = AIE.switchbox(%63) {
  }
  %65 = AIE.core(%63) {
    AIE.end
  }
  %66 = AIE.tile(10, 2)
  %67 = AIE.switchbox(%66) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<2> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<2> (1)
    %391 = AIE.amsel<0> (2)
    %392 = AIE.amsel<1> (2)
    %393 = AIE.amsel<2> (2)
    %394 = AIE.amsel<0> (3)
    %395 = AIE.amsel<1> (3)
    %396 = AIE.amsel<2> (3)
    %397 = AIE.masterset(DMA : 0, %391)
    %398 = AIE.masterset(DMA : 1, %385)
    %399 = AIE.masterset(South : 0, %392)
    %400 = AIE.masterset(South : 1, %396)
    %401 = AIE.masterset(South : 2, %387)
    %402 = AIE.masterset(South : 3, %393)
    %403 = AIE.masterset(West : 0, %390)
    %404 = AIE.masterset(North : 0, %395)
    %405 = AIE.masterset(North : 1, %394)
    %406 = AIE.masterset(East : 0, %386)
    %407 = AIE.masterset(East : 1, %388)
    %408 = AIE.masterset(East : 2, %389)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %390)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %393)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %396)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %392)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %385)
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %391)
      AIE.rule(28, 4, %395)
    }
  }
  %68 = AIE.lock(%66, 1)
  %69 = AIE.lock(%66, 0)
  %70 = AIE.buffer(%66) : memref<32x32xf32>
  %71 = AIE.buffer(%66) : memref<32x32xf32>
  %72 = AIE.buffer(%66) : memref<32x32xf32>
  %73 = AIE.buffer(%66) : memref<32x32xf32>
  %74 = AIE.core(%66) {
    AIE.useLock(%68, Acquire, 1)
    AIE.useLock(%78, Acquire, 0)
    AIE.useLock(%69, Acquire, 1)
    call @extern_kernel(%73, %70, %71, %72) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%69, Release, 0)
    AIE.useLock(%78, Release, 1)
    AIE.useLock(%68, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %75 = AIE.mem(%66) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%69, Acquire, 0)
    AIE.dmaBd(<%72 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%69, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%68, Acquire, 0)
    AIE.dmaBd(<%71 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%68, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %76 = AIE.tile(10, 3)
  %77 = AIE.switchbox(%76) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<2> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<2> (1)
    %391 = AIE.amsel<0> (2)
    %392 = AIE.amsel<1> (2)
    %393 = AIE.amsel<2> (2)
    %394 = AIE.amsel<0> (3)
    %395 = AIE.amsel<1> (3)
    %396 = AIE.amsel<2> (3)
    %397 = AIE.masterset(DMA : 0, %385)
    %398 = AIE.masterset(DMA : 1, %396)
    %399 = AIE.masterset(South : 0, %395)
    %400 = AIE.masterset(South : 1, %393)
    %401 = AIE.masterset(South : 2, %390)
    %402 = AIE.masterset(South : 3, %392)
    %403 = AIE.masterset(West : 0, %387)
    %404 = AIE.masterset(West : 1, %389)
    %405 = AIE.masterset(West : 2, %391)
    %406 = AIE.masterset(North : 0, %388)
    %407 = AIE.masterset(North : 1, %386)
    %408 = AIE.masterset(East : 0, %394)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %391)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %394)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %392)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %390)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %393)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %395)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %396)
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %385)
      AIE.rule(31, 6, %388)
    }
  }
  %78 = AIE.lock(%76, 2)
  %79 = AIE.lock(%76, 1)
  %80 = AIE.lock(%76, 0)
  %81 = AIE.buffer(%76) : memref<32x32xf32>
  %82 = AIE.buffer(%76) : memref<32x32xf32>
  %83 = AIE.buffer(%76) : memref<32x32xf32>
  %84 = AIE.core(%76) {
    AIE.useLock(%89, Acquire, 0)
    AIE.useLock(%80, Acquire, 1)
    AIE.useLock(%78, Acquire, 1)
    AIE.useLock(%79, Acquire, 1)
    call @extern_kernel(%70, %81, %82, %83) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%79, Release, 0)
    AIE.useLock(%78, Release, 0)
    AIE.useLock(%80, Release, 0)
    AIE.useLock(%89, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %85 = AIE.mem(%76) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBd(<%83 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%80, Acquire, 0)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%80, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %86 = AIE.tile(10, 4) {polyaie.leaf}
  %87 = AIE.switchbox(%86) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<1> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %389)
    %393 = AIE.masterset(DMA : 1, %390)
    %394 = AIE.masterset(South : 0, %385)
    %395 = AIE.masterset(South : 1, %388)
    %396 = AIE.masterset(South : 2, %391)
    %397 = AIE.masterset(South : 3, %386)
    %398 = AIE.masterset(West : 0, %387)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %387)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %391)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %388)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %385)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %390)
    }
  }
  %88 = AIE.lock(%86, 3)
  %89 = AIE.lock(%86, 2)
  %90 = AIE.lock(%86, 1)
  %91 = AIE.lock(%86, 0)
  %92 = AIE.buffer(%86) : memref<32x32xf32>
  %93 = AIE.buffer(%86) : memref<32x32xf32>
  %94 = AIE.buffer(%86) : memref<32x32xf32>
  %95 = AIE.core(%86) {
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%88, Acquire, 1)
    AIE.useLock(%90, Acquire, 0)
    AIE.useLock(%91, Acquire, 1)
    call @extern_kernel(%81, %92, %93, %94) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%91, Release, 0)
    AIE.useLock(%90, Release, 1)
    AIE.useLock(%88, Release, 0)
    AIE.useLock(%89, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %96 = AIE.mem(%86) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%91, Acquire, 0)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%91, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%88, Acquire, 0)
    AIE.dmaBd(<%94 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%90, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%90, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %97 = AIE.tile(11, 2)
  %98 = AIE.switchbox(%97) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<2> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.amsel<1> (3)
    %394 = AIE.masterset(DMA : 0, %393)
    %395 = AIE.masterset(DMA : 1, %389)
    %396 = AIE.masterset(South : 0, %391)
    %397 = AIE.masterset(South : 1, %390)
    %398 = AIE.masterset(South : 2, %386)
    %399 = AIE.masterset(South : 3, %385)
    %400 = AIE.masterset(West : 0, %388)
    %401 = AIE.masterset(North : 0, %392)
    %402 = AIE.masterset(North : 1, %387)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %385)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %390)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %391)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %389)
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %393)
      AIE.rule(28, 0, %392)
    }
  }
  %99 = AIE.lock(%97, 1)
  %100 = AIE.lock(%97, 0)
  %101 = AIE.buffer(%97) : memref<32x32xf32>
  %102 = AIE.buffer(%97) : memref<32x32xf32>
  %103 = AIE.buffer(%97) : memref<32x32xf32>
  %104 = AIE.buffer(%97) : memref<32x32xf32>
  %105 = AIE.core(%97) {
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%100, Acquire, 1)
    AIE.useLock(%111, Acquire, 0)
    call @extern_kernel(%104, %101, %102, %103) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%111, Release, 1)
    AIE.useLock(%100, Release, 0)
    AIE.useLock(%99, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %106 = AIE.mem(%97) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%100, Acquire, 0)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%100, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBd(<%103 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %107 = AIE.tile(11, 3)
  %108 = AIE.switchbox(%107) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<2> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.amsel<1> (3)
    %394 = AIE.masterset(DMA : 0, %392)
    %395 = AIE.masterset(DMA : 1, %387)
    %396 = AIE.masterset(South : 0, %393)
    %397 = AIE.masterset(South : 1, %391)
    %398 = AIE.masterset(West : 0, %389)
    %399 = AIE.masterset(West : 1, %385)
    %400 = AIE.masterset(West : 2, %386)
    %401 = AIE.masterset(North : 0, %388)
    %402 = AIE.masterset(North : 1, %390)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %391)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %385)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %389)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %392)
      AIE.rule(31, 6, %390)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %387)
      AIE.rule(31, 2, %388)
    }
  }
  %109 = AIE.lock(%107, 2)
  %110 = AIE.lock(%107, 1)
  %111 = AIE.lock(%107, 0)
  %112 = AIE.buffer(%107) : memref<32x32xf32>
  %113 = AIE.buffer(%107) : memref<32x32xf32>
  %114 = AIE.buffer(%107) : memref<32x32xf32>
  %115 = AIE.core(%107) {
    AIE.useLock(%119, Acquire, 0)
    AIE.useLock(%110, Acquire, 1)
    AIE.useLock(%111, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    call @extern_kernel(%101, %112, %113, %114) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%111, Release, 0)
    AIE.useLock(%110, Release, 0)
    AIE.useLock(%119, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %116 = AIE.mem(%107) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%109, Acquire, 0)
    AIE.dmaBd(<%114 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%110, Acquire, 0)
    AIE.dmaBd(<%113 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%110, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %117 = AIE.tile(11, 4) {polyaie.leaf}
  %118 = AIE.switchbox(%117) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<1> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %387)
    %393 = AIE.masterset(DMA : 1, %390)
    %394 = AIE.masterset(South : 0, %391)
    %395 = AIE.masterset(West : 0, %386)
    %396 = AIE.masterset(West : 1, %388)
    %397 = AIE.masterset(West : 2, %389)
    %398 = AIE.masterset(West : 3, %385)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 1, %391)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %385)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %386)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %390)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %387)
    }
  }
  %119 = AIE.lock(%117, 3)
  %120 = AIE.lock(%117, 2)
  %121 = AIE.lock(%117, 1)
  %122 = AIE.lock(%117, 0)
  %123 = AIE.buffer(%117) : memref<32x32xf32>
  %124 = AIE.buffer(%117) : memref<32x32xf32>
  %125 = AIE.buffer(%117) : memref<32x32xf32>
  %126 = AIE.core(%117) {
    AIE.useLock(%120, Acquire, 1)
    AIE.useLock(%119, Acquire, 1)
    AIE.useLock(%121, Acquire, 0)
    AIE.useLock(%122, Acquire, 1)
    call @extern_kernel(%112, %123, %124, %125) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%122, Release, 0)
    AIE.useLock(%121, Release, 1)
    AIE.useLock(%119, Release, 0)
    AIE.useLock(%120, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %127 = AIE.mem(%117) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%122, Acquire, 0)
    AIE.dmaBd(<%124 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%122, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%120, Acquire, 0)
    AIE.dmaBd(<%125 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%120, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%121, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%123 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%121, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %128 = AIE.tile(12, 2)
  %129 = AIE.switchbox(%128) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %388)
    %390 = AIE.masterset(DMA : 1, %385)
    %391 = AIE.masterset(North : 0, %387)
    %392 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %388)
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %385)
      AIE.rule(28, 0, %387)
    }
  }
  %130 = AIE.lock(%128, 1)
  %131 = AIE.lock(%128, 0)
  %132 = AIE.buffer(%128) : memref<32x32xf32>
  %133 = AIE.buffer(%128) : memref<32x32xf32>
  %134 = AIE.buffer(%128) : memref<32x32xf32>
  %135 = AIE.buffer(%128) : memref<32x32xf32>
  %136 = AIE.core(%128) {
    AIE.useLock(%130, Acquire, 1)
    AIE.useLock(%140, Acquire, 0)
    AIE.useLock(%131, Acquire, 1)
    call @extern_kernel(%135, %132, %133, %134) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%131, Release, 0)
    AIE.useLock(%140, Release, 1)
    AIE.useLock(%130, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %137 = AIE.mem(%128) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%131, Acquire, 0)
    AIE.dmaBd(<%134 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%131, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%130, Acquire, 0)
    AIE.dmaBd(<%133 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%130, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %138 = AIE.tile(12, 3)
  %139 = AIE.switchbox(%138) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<1> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %391)
    %393 = AIE.masterset(DMA : 1, %385)
    %394 = AIE.masterset(West : 0, %386)
    %395 = AIE.masterset(West : 1, %387)
    %396 = AIE.masterset(West : 2, %390)
    %397 = AIE.masterset(North : 0, %389)
    %398 = AIE.masterset(North : 1, %388)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %390)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %391)
      AIE.rule(31, 6, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %385)
      AIE.rule(31, 2, %389)
    }
  }
  %140 = AIE.lock(%138, 2)
  %141 = AIE.lock(%138, 1)
  %142 = AIE.lock(%138, 0)
  %143 = AIE.buffer(%138) : memref<32x32xf32>
  %144 = AIE.buffer(%138) : memref<32x32xf32>
  %145 = AIE.buffer(%138) : memref<32x32xf32>
  %146 = AIE.core(%138) {
    AIE.useLock(%142, Acquire, 1)
    AIE.useLock(%140, Acquire, 1)
    AIE.useLock(%141, Acquire, 1)
    AIE.useLock(%152, Acquire, 0)
    call @extern_kernel(%132, %143, %144, %145) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%152, Release, 1)
    AIE.useLock(%141, Release, 0)
    AIE.useLock(%140, Release, 0)
    AIE.useLock(%142, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %147 = AIE.mem(%138) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%141, Acquire, 0)
    AIE.dmaBd(<%145 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%141, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%142, Acquire, 0)
    AIE.dmaBd(<%144 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%142, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %148 = AIE.tile(12, 4) {polyaie.leaf}
  %149 = AIE.switchbox(%148) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<1> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %389)
    %393 = AIE.masterset(DMA : 1, %387)
    %394 = AIE.masterset(South : 0, %386)
    %395 = AIE.masterset(West : 0, %390)
    %396 = AIE.masterset(West : 1, %388)
    %397 = AIE.masterset(West : 2, %385)
    %398 = AIE.masterset(West : 3, %391)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 1, %391)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %385)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %390)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %389)
    }
  }
  %150 = AIE.lock(%148, 3)
  %151 = AIE.lock(%148, 2)
  %152 = AIE.lock(%148, 1)
  %153 = AIE.lock(%148, 0)
  %154 = AIE.buffer(%148) : memref<32x32xf32>
  %155 = AIE.buffer(%148) : memref<32x32xf32>
  %156 = AIE.buffer(%148) : memref<32x32xf32>
  %157 = AIE.core(%148) {
    AIE.useLock(%150, Acquire, 1)
    AIE.useLock(%152, Acquire, 1)
    AIE.useLock(%151, Acquire, 0)
    AIE.useLock(%153, Acquire, 1)
    call @extern_kernel(%143, %154, %155, %156) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%153, Release, 0)
    AIE.useLock(%151, Release, 1)
    AIE.useLock(%152, Release, 0)
    AIE.useLock(%150, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %158 = AIE.mem(%148) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%153, Acquire, 0)
    AIE.dmaBd(<%155 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%153, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%150, Acquire, 0)
    AIE.dmaBd(<%156 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%150, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%151, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%154 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%151, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %159 = AIE.tile(13, 2)
  %160 = AIE.switchbox(%159) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %387)
    %390 = AIE.masterset(DMA : 1, %388)
    %391 = AIE.masterset(North : 0, %385)
    %392 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %388)
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %387)
      AIE.rule(28, 4, %385)
    }
  }
  %161 = AIE.lock(%159, 1)
  %162 = AIE.lock(%159, 0)
  %163 = AIE.buffer(%159) : memref<32x32xf32>
  %164 = AIE.buffer(%159) : memref<32x32xf32>
  %165 = AIE.buffer(%159) : memref<32x32xf32>
  %166 = AIE.buffer(%159) : memref<32x32xf32>
  %167 = AIE.core(%159) {
    AIE.useLock(%172, Acquire, 0)
    AIE.useLock(%162, Acquire, 1)
    AIE.useLock(%161, Acquire, 1)
    call @extern_kernel(%166, %163, %164, %165) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%161, Release, 0)
    AIE.useLock(%162, Release, 0)
    AIE.useLock(%172, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %168 = AIE.mem(%159) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%161, Acquire, 0)
    AIE.dmaBd(<%165 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%161, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%162, Acquire, 0)
    AIE.dmaBd(<%164 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%162, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %169 = AIE.tile(13, 3)
  %170 = AIE.switchbox(%169) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<0> (3)
    %391 = AIE.masterset(DMA : 0, %385)
    %392 = AIE.masterset(DMA : 1, %390)
    %393 = AIE.masterset(West : 0, %389)
    %394 = AIE.masterset(West : 1, %388)
    %395 = AIE.masterset(North : 0, %386)
    %396 = AIE.masterset(North : 1, %387)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %390)
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %385)
      AIE.rule(31, 6, %386)
    }
  }
  %171 = AIE.lock(%169, 2)
  %172 = AIE.lock(%169, 1)
  %173 = AIE.lock(%169, 0)
  %174 = AIE.buffer(%169) : memref<32x32xf32>
  %175 = AIE.buffer(%169) : memref<32x32xf32>
  %176 = AIE.buffer(%169) : memref<32x32xf32>
  %177 = AIE.core(%169) {
    AIE.useLock(%181, Acquire, 0)
    AIE.useLock(%172, Acquire, 1)
    AIE.useLock(%171, Acquire, 1)
    AIE.useLock(%173, Acquire, 1)
    call @extern_kernel(%163, %174, %175, %176) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%173, Release, 0)
    AIE.useLock(%171, Release, 0)
    AIE.useLock(%172, Release, 0)
    AIE.useLock(%181, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %178 = AIE.mem(%169) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%173, Acquire, 0)
    AIE.dmaBd(<%176 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%173, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%171, Acquire, 0)
    AIE.dmaBd(<%175 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%171, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %179 = AIE.tile(13, 4) {polyaie.leaf}
  %180 = AIE.switchbox(%179) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<1> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %391)
    %393 = AIE.masterset(DMA : 1, %386)
    %394 = AIE.masterset(South : 0, %388)
    %395 = AIE.masterset(West : 0, %390)
    %396 = AIE.masterset(West : 1, %389)
    %397 = AIE.masterset(West : 2, %385)
    %398 = AIE.masterset(West : 3, %387)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %385)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %390)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %391)
    }
  }
  %181 = AIE.lock(%179, 3)
  %182 = AIE.lock(%179, 2)
  %183 = AIE.lock(%179, 1)
  %184 = AIE.lock(%179, 0)
  %185 = AIE.buffer(%179) : memref<32x32xf32>
  %186 = AIE.buffer(%179) : memref<32x32xf32>
  %187 = AIE.buffer(%179) : memref<32x32xf32>
  %188 = AIE.core(%179) {
    AIE.useLock(%184, Acquire, 1)
    AIE.useLock(%181, Acquire, 1)
    AIE.useLock(%182, Acquire, 1)
    AIE.useLock(%183, Acquire, 0)
    call @extern_kernel(%174, %185, %186, %187) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%183, Release, 1)
    AIE.useLock(%182, Release, 0)
    AIE.useLock(%181, Release, 0)
    AIE.useLock(%184, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %189 = AIE.mem(%179) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%182, Acquire, 0)
    AIE.dmaBd(<%187 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%182, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%184, Acquire, 0)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%184, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%183, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%185 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%183, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %190 = AIE.tile(14, 2)
  %191 = AIE.switchbox(%190) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %386)
    %390 = AIE.masterset(DMA : 1, %387)
    %391 = AIE.masterset(North : 0, %388)
    %392 = AIE.masterset(North : 1, %385)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %387)
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %386)
      AIE.rule(28, 0, %388)
    }
  }
  %192 = AIE.lock(%190, 1)
  %193 = AIE.lock(%190, 0)
  %194 = AIE.buffer(%190) : memref<32x32xf32>
  %195 = AIE.buffer(%190) : memref<32x32xf32>
  %196 = AIE.buffer(%190) : memref<32x32xf32>
  %197 = AIE.buffer(%190) : memref<32x32xf32>
  %198 = AIE.core(%190) {
    AIE.useLock(%192, Acquire, 1)
    AIE.useLock(%202, Acquire, 0)
    AIE.useLock(%193, Acquire, 1)
    call @extern_kernel(%197, %194, %195, %196) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%193, Release, 0)
    AIE.useLock(%202, Release, 1)
    AIE.useLock(%192, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %199 = AIE.mem(%190) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%193, Acquire, 0)
    AIE.dmaBd(<%195 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%193, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%192, Acquire, 0)
    AIE.dmaBd(<%196 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%192, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %200 = AIE.tile(14, 3)
  %201 = AIE.switchbox(%200) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %388)
    %391 = AIE.masterset(DMA : 1, %389)
    %392 = AIE.masterset(West : 0, %386)
    %393 = AIE.masterset(North : 0, %387)
    %394 = AIE.masterset(North : 1, %385)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %386)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %388)
      AIE.rule(31, 6, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %389)
      AIE.rule(31, 2, %387)
    }
  }
  %202 = AIE.lock(%200, 2)
  %203 = AIE.lock(%200, 1)
  %204 = AIE.lock(%200, 0)
  %205 = AIE.buffer(%200) : memref<32x32xf32>
  %206 = AIE.buffer(%200) : memref<32x32xf32>
  %207 = AIE.buffer(%200) : memref<32x32xf32>
  %208 = AIE.core(%200) {
    AIE.useLock(%212, Acquire, 0)
    AIE.useLock(%202, Acquire, 1)
    AIE.useLock(%203, Acquire, 1)
    AIE.useLock(%204, Acquire, 1)
    call @extern_kernel(%194, %205, %206, %207) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%204, Release, 0)
    AIE.useLock(%203, Release, 0)
    AIE.useLock(%202, Release, 0)
    AIE.useLock(%212, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %209 = AIE.mem(%200) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%204, Acquire, 0)
    AIE.dmaBd(<%207 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%204, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%203, Acquire, 0)
    AIE.dmaBd(<%206 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%203, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %210 = AIE.tile(14, 4) {polyaie.leaf}
  %211 = AIE.switchbox(%210) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<1> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %391)
    %393 = AIE.masterset(DMA : 1, %388)
    %394 = AIE.masterset(South : 0, %385)
    %395 = AIE.masterset(West : 0, %387)
    %396 = AIE.masterset(West : 1, %386)
    %397 = AIE.masterset(West : 2, %390)
    %398 = AIE.masterset(West : 3, %389)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %385)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %390)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %386)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %387)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %391)
    }
  }
  %212 = AIE.lock(%210, 3)
  %213 = AIE.lock(%210, 2)
  %214 = AIE.lock(%210, 1)
  %215 = AIE.lock(%210, 0)
  %216 = AIE.buffer(%210) : memref<32x32xf32>
  %217 = AIE.buffer(%210) : memref<32x32xf32>
  %218 = AIE.buffer(%210) : memref<32x32xf32>
  %219 = AIE.core(%210) {
    AIE.useLock(%214, Acquire, 1)
    AIE.useLock(%215, Acquire, 1)
    AIE.useLock(%213, Acquire, 0)
    AIE.useLock(%212, Acquire, 1)
    call @extern_kernel(%205, %216, %217, %218) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%212, Release, 0)
    AIE.useLock(%213, Release, 1)
    AIE.useLock(%215, Release, 0)
    AIE.useLock(%214, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %220 = AIE.mem(%210) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%215, Acquire, 0)
    AIE.dmaBd(<%217 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%215, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%214, Acquire, 0)
    AIE.dmaBd(<%218 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%214, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%213, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%216 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%213, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %221 = AIE.tile(15, 2)
  %222 = AIE.switchbox(%221) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %386)
    %390 = AIE.masterset(DMA : 1, %388)
    %391 = AIE.masterset(North : 0, %387)
    %392 = AIE.masterset(North : 1, %385)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %386)
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %388)
      AIE.rule(28, 0, %387)
    }
  }
  %223 = AIE.lock(%221, 1)
  %224 = AIE.lock(%221, 0)
  %225 = AIE.buffer(%221) : memref<32x32xf32>
  %226 = AIE.buffer(%221) : memref<32x32xf32>
  %227 = AIE.buffer(%221) : memref<32x32xf32>
  %228 = AIE.buffer(%221) : memref<32x32xf32>
  %229 = AIE.core(%221) {
    AIE.useLock(%233, Acquire, 0)
    AIE.useLock(%224, Acquire, 1)
    AIE.useLock(%223, Acquire, 1)
    call @extern_kernel(%228, %225, %226, %227) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%223, Release, 0)
    AIE.useLock(%224, Release, 0)
    AIE.useLock(%233, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %230 = AIE.mem(%221) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%223, Acquire, 0)
    AIE.dmaBd(<%227 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%223, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%224, Acquire, 0)
    AIE.dmaBd(<%226 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%224, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %231 = AIE.tile(15, 3)
  %232 = AIE.switchbox(%231) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %388)
    %390 = AIE.masterset(DMA : 1, %387)
    %391 = AIE.masterset(North : 0, %385)
    %392 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %388)
      AIE.rule(31, 6, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %387)
      AIE.rule(31, 2, %385)
    }
  }
  %233 = AIE.lock(%231, 2)
  %234 = AIE.lock(%231, 1)
  %235 = AIE.lock(%231, 0)
  %236 = AIE.buffer(%231) : memref<32x32xf32>
  %237 = AIE.buffer(%231) : memref<32x32xf32>
  %238 = AIE.buffer(%231) : memref<32x32xf32>
  %239 = AIE.core(%231) {
    AIE.useLock(%233, Acquire, 1)
    AIE.useLock(%234, Acquire, 1)
    AIE.useLock(%235, Acquire, 1)
    AIE.useLock(%245, Acquire, 0)
    call @extern_kernel(%225, %236, %237, %238) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%245, Release, 1)
    AIE.useLock(%235, Release, 0)
    AIE.useLock(%234, Release, 0)
    AIE.useLock(%233, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %240 = AIE.mem(%231) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%235, Acquire, 0)
    AIE.dmaBd(<%238 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%235, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%234, Acquire, 0)
    AIE.dmaBd(<%237 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%234, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %241 = AIE.tile(15, 4) {polyaie.leaf}
  %242 = AIE.switchbox(%241) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<0> (3)
    %391 = AIE.masterset(DMA : 0, %390)
    %392 = AIE.masterset(DMA : 1, %388)
    %393 = AIE.masterset(West : 0, %389)
    %394 = AIE.masterset(West : 1, %385)
    %395 = AIE.masterset(West : 2, %386)
    %396 = AIE.masterset(West : 3, %387)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %387)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %385)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %389)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %390)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %388)
    }
  }
  %243 = AIE.lock(%241, 3)
  %244 = AIE.lock(%241, 2)
  %245 = AIE.lock(%241, 1)
  %246 = AIE.lock(%241, 0)
  %247 = AIE.buffer(%241) : memref<32x32xf32>
  %248 = AIE.buffer(%241) : memref<32x32xf32>
  %249 = AIE.buffer(%241) : memref<32x32xf32>
  %250 = AIE.core(%241) {
    AIE.useLock(%246, Acquire, 1)
    AIE.useLock(%243, Acquire, 1)
    AIE.useLock(%244, Acquire, 0)
    AIE.useLock(%245, Acquire, 1)
    call @extern_kernel(%236, %247, %248, %249) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%245, Release, 0)
    AIE.useLock(%244, Release, 1)
    AIE.useLock(%243, Release, 0)
    AIE.useLock(%246, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %251 = AIE.mem(%241) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%243, Acquire, 0)
    AIE.dmaBd(<%249 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%243, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%246, Acquire, 0)
    AIE.dmaBd(<%248 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%246, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%244, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%247 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%244, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %252 = AIE.tile(16, 2)
  %253 = AIE.switchbox(%252) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %388)
    %390 = AIE.masterset(DMA : 1, %386)
    %391 = AIE.masterset(North : 0, %385)
    %392 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %386)
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %388)
      AIE.rule(28, 4, %385)
    }
  }
  %254 = AIE.lock(%252, 1)
  %255 = AIE.lock(%252, 0)
  %256 = AIE.buffer(%252) : memref<32x32xf32>
  %257 = AIE.buffer(%252) : memref<32x32xf32>
  %258 = AIE.buffer(%252) : memref<32x32xf32>
  %259 = AIE.buffer(%252) : memref<32x32xf32>
  %260 = AIE.core(%252) {
    AIE.useLock(%255, Acquire, 1)
    AIE.useLock(%265, Acquire, 0)
    AIE.useLock(%254, Acquire, 1)
    call @extern_kernel(%259, %256, %257, %258) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%254, Release, 0)
    AIE.useLock(%265, Release, 1)
    AIE.useLock(%255, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %261 = AIE.mem(%252) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%254, Acquire, 0)
    AIE.dmaBd(<%258 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%254, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%255, Acquire, 0)
    AIE.dmaBd(<%257 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%255, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %262 = AIE.tile(16, 3)
  %263 = AIE.switchbox(%262) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %388)
    %390 = AIE.masterset(DMA : 1, %386)
    %391 = AIE.masterset(North : 0, %385)
    %392 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %388)
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %385)
    }
  }
  %264 = AIE.lock(%262, 2)
  %265 = AIE.lock(%262, 1)
  %266 = AIE.lock(%262, 0)
  %267 = AIE.buffer(%262) : memref<32x32xf32>
  %268 = AIE.buffer(%262) : memref<32x32xf32>
  %269 = AIE.buffer(%262) : memref<32x32xf32>
  %270 = AIE.core(%262) {
    AIE.useLock(%265, Acquire, 1)
    AIE.useLock(%277, Acquire, 0)
    AIE.useLock(%266, Acquire, 1)
    AIE.useLock(%264, Acquire, 1)
    call @extern_kernel(%256, %267, %268, %269) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%264, Release, 0)
    AIE.useLock(%266, Release, 0)
    AIE.useLock(%277, Release, 1)
    AIE.useLock(%265, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %271 = AIE.mem(%262) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%264, Acquire, 0)
    AIE.dmaBd(<%268 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%264, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%266, Acquire, 0)
    AIE.dmaBd(<%269 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%266, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %272 = AIE.tile(16, 4) {polyaie.leaf}
  %273 = AIE.switchbox(%272) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %387)
    %391 = AIE.masterset(DMA : 1, %386)
    %392 = AIE.masterset(West : 0, %388)
    %393 = AIE.masterset(West : 1, %385)
    %394 = AIE.masterset(West : 2, %389)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %385)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %386)
    }
  }
  %274 = AIE.lock(%272, 3)
  %275 = AIE.lock(%272, 2)
  %276 = AIE.lock(%272, 1)
  %277 = AIE.lock(%272, 0)
  %278 = AIE.buffer(%272) : memref<32x32xf32>
  %279 = AIE.buffer(%272) : memref<32x32xf32>
  %280 = AIE.buffer(%272) : memref<32x32xf32>
  %281 = AIE.core(%272) {
    AIE.useLock(%275, Acquire, 1)
    AIE.useLock(%276, Acquire, 1)
    AIE.useLock(%277, Acquire, 1)
    AIE.useLock(%274, Acquire, 0)
    call @extern_kernel(%267, %278, %279, %280) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%274, Release, 1)
    AIE.useLock(%277, Release, 0)
    AIE.useLock(%276, Release, 0)
    AIE.useLock(%275, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %282 = AIE.mem(%272) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%276, Acquire, 0)
    AIE.dmaBd(<%279 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%276, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%275, Acquire, 0)
    AIE.dmaBd(<%280 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%274, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%278 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%274, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %283 = AIE.tile(17, 2)
  %284 = AIE.switchbox(%283) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %385)
    %390 = AIE.masterset(DMA : 1, %388)
    %391 = AIE.masterset(North : 0, %387)
    %392 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %388)
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %385)
      AIE.rule(28, 0, %387)
    }
  }
  %285 = AIE.lock(%283, 1)
  %286 = AIE.lock(%283, 0)
  %287 = AIE.buffer(%283) : memref<32x32xf32>
  %288 = AIE.buffer(%283) : memref<32x32xf32>
  %289 = AIE.buffer(%283) : memref<32x32xf32>
  %290 = AIE.buffer(%283) : memref<32x32xf32>
  %291 = AIE.core(%283) {
    AIE.useLock(%285, Acquire, 1)
    AIE.useLock(%286, Acquire, 1)
    AIE.useLock(%297, Acquire, 0)
    call @extern_kernel(%290, %287, %288, %289) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%297, Release, 1)
    AIE.useLock(%286, Release, 0)
    AIE.useLock(%285, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %292 = AIE.mem(%283) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%286, Acquire, 0)
    AIE.dmaBd(<%288 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%286, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%285, Acquire, 0)
    AIE.dmaBd(<%289 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%285, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %293 = AIE.tile(17, 3)
  %294 = AIE.switchbox(%293) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %386)
    %390 = AIE.masterset(DMA : 1, %385)
    %391 = AIE.masterset(North : 0, %388)
    %392 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %385)
      AIE.rule(31, 6, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %386)
      AIE.rule(31, 2, %388)
    }
  }
  %295 = AIE.lock(%293, 2)
  %296 = AIE.lock(%293, 1)
  %297 = AIE.lock(%293, 0)
  %298 = AIE.buffer(%293) : memref<32x32xf32>
  %299 = AIE.buffer(%293) : memref<32x32xf32>
  %300 = AIE.buffer(%293) : memref<32x32xf32>
  %301 = AIE.core(%293) {
    AIE.useLock(%297, Acquire, 1)
    AIE.useLock(%296, Acquire, 1)
    AIE.useLock(%307, Acquire, 0)
    AIE.useLock(%295, Acquire, 1)
    call @extern_kernel(%287, %298, %299, %300) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%295, Release, 0)
    AIE.useLock(%307, Release, 1)
    AIE.useLock(%296, Release, 0)
    AIE.useLock(%297, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %302 = AIE.mem(%293) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%295, Acquire, 0)
    AIE.dmaBd(<%299 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%295, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%296, Acquire, 0)
    AIE.dmaBd(<%300 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%296, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %303 = AIE.tile(17, 4) {polyaie.leaf}
  %304 = AIE.switchbox(%303) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %387)
    %390 = AIE.masterset(DMA : 1, %385)
    %391 = AIE.masterset(West : 0, %386)
    %392 = AIE.masterset(West : 1, %388)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %387)
    }
  }
  %305 = AIE.lock(%303, 3)
  %306 = AIE.lock(%303, 2)
  %307 = AIE.lock(%303, 1)
  %308 = AIE.lock(%303, 0)
  %309 = AIE.buffer(%303) : memref<32x32xf32>
  %310 = AIE.buffer(%303) : memref<32x32xf32>
  %311 = AIE.buffer(%303) : memref<32x32xf32>
  %312 = AIE.core(%303) {
    AIE.useLock(%306, Acquire, 1)
    AIE.useLock(%308, Acquire, 1)
    AIE.useLock(%305, Acquire, 0)
    AIE.useLock(%307, Acquire, 1)
    call @extern_kernel(%298, %309, %310, %311) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%307, Release, 0)
    AIE.useLock(%305, Release, 1)
    AIE.useLock(%308, Release, 0)
    AIE.useLock(%306, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %313 = AIE.mem(%303) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%308, Acquire, 0)
    AIE.dmaBd(<%310 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%308, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%306, Acquire, 0)
    AIE.dmaBd(<%311 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%306, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%305, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%309 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%305, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %314 = AIE.tile(18, 2)
  %315 = AIE.switchbox(%314) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %385)
    %390 = AIE.masterset(DMA : 1, %388)
    %391 = AIE.masterset(North : 0, %386)
    %392 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %385)
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %388)
      AIE.rule(28, 0, %386)
    }
  }
  %316 = AIE.lock(%314, 1)
  %317 = AIE.lock(%314, 0)
  %318 = AIE.buffer(%314) : memref<32x32xf32>
  %319 = AIE.buffer(%314) : memref<32x32xf32>
  %320 = AIE.buffer(%314) : memref<32x32xf32>
  %321 = AIE.buffer(%314) : memref<32x32xf32>
  %322 = AIE.core(%314) {
    AIE.useLock(%317, Acquire, 1)
    AIE.useLock(%327, Acquire, 0)
    AIE.useLock(%316, Acquire, 1)
    call @extern_kernel(%321, %318, %319, %320) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%316, Release, 0)
    AIE.useLock(%327, Release, 1)
    AIE.useLock(%317, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %323 = AIE.mem(%314) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%316, Acquire, 0)
    AIE.dmaBd(<%320 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%316, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%317, Acquire, 0)
    AIE.dmaBd(<%319 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%317, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %324 = AIE.tile(18, 3)
  %325 = AIE.switchbox(%324) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(DMA : 0, %385)
    %390 = AIE.masterset(DMA : 1, %388)
    %391 = AIE.masterset(North : 0, %387)
    %392 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %388)
      AIE.rule(31, 6, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %385)
      AIE.rule(31, 2, %387)
    }
  }
  %326 = AIE.lock(%324, 2)
  %327 = AIE.lock(%324, 1)
  %328 = AIE.lock(%324, 0)
  %329 = AIE.buffer(%324) : memref<32x32xf32>
  %330 = AIE.buffer(%324) : memref<32x32xf32>
  %331 = AIE.buffer(%324) : memref<32x32xf32>
  %332 = AIE.core(%324) {
    AIE.useLock(%327, Acquire, 1)
    AIE.useLock(%338, Acquire, 0)
    AIE.useLock(%328, Acquire, 1)
    AIE.useLock(%326, Acquire, 1)
    call @extern_kernel(%318, %329, %330, %331) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%326, Release, 0)
    AIE.useLock(%328, Release, 0)
    AIE.useLock(%338, Release, 1)
    AIE.useLock(%327, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %333 = AIE.mem(%324) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%326, Acquire, 0)
    AIE.dmaBd(<%330 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%326, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%328, Acquire, 0)
    AIE.dmaBd(<%331 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%328, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %334 = AIE.tile(18, 4) {polyaie.leaf}
  %335 = AIE.switchbox(%334) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.masterset(DMA : 0, %387)
    %389 = AIE.masterset(DMA : 1, %386)
    %390 = AIE.masterset(West : 0, %385)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %385)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %386)
    }
  }
  %336 = AIE.lock(%334, 3)
  %337 = AIE.lock(%334, 2)
  %338 = AIE.lock(%334, 1)
  %339 = AIE.lock(%334, 0)
  %340 = AIE.buffer(%334) : memref<32x32xf32>
  %341 = AIE.buffer(%334) : memref<32x32xf32>
  %342 = AIE.buffer(%334) : memref<32x32xf32>
  %343 = AIE.core(%334) {
    AIE.useLock(%339, Acquire, 1)
    AIE.useLock(%338, Acquire, 1)
    AIE.useLock(%337, Acquire, 1)
    AIE.useLock(%336, Acquire, 0)
    call @extern_kernel(%329, %340, %341, %342) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%336, Release, 1)
    AIE.useLock(%337, Release, 0)
    AIE.useLock(%338, Release, 0)
    AIE.useLock(%339, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %344 = AIE.mem(%334) {
    %385 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%337, Acquire, 0)
    AIE.dmaBd(<%342 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%337, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %386 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%339, Acquire, 0)
    AIE.dmaBd(<%341 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%339, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %387 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%336, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%340 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%336, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %345 = AIE.tile(12, 0)
  %346 = AIE.switchbox(%345) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(North : 0, %387)
    %390 = AIE.masterset(North : 1, %385)
    %391 = AIE.masterset(East : 0, %388)
    %392 = AIE.masterset(East : 1, %386)
    %393 = AIE.masterset(East : 2, %385)
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %388)
    }
  }
  %347 = AIE.tile(13, 0)
  %348 = AIE.switchbox(%347) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(North : 0, %388)
    %390 = AIE.masterset(North : 1, %387)
    %391 = AIE.masterset(East : 0, %388)
    %392 = AIE.masterset(East : 1, %385)
    %393 = AIE.masterset(East : 2, %386)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %388)
    }
  }
  %349 = AIE.tile(16, 0)
  %350 = AIE.switchbox(%349) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(West : 0, %385)
    %391 = AIE.masterset(North : 0, %388)
    %392 = AIE.masterset(North : 1, %387)
    %393 = AIE.masterset(East : 0, %386)
    %394 = AIE.masterset(East : 1, %389)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %389)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %385)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %388)
    }
  }
  %351 = AIE.tile(9, 2)
  %352 = AIE.switchbox(%351) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(South : 0, %385)
    %390 = AIE.masterset(East : 0, %386)
    %391 = AIE.masterset(East : 1, %387)
    %392 = AIE.masterset(East : 2, %388)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %385)
    }
  }
  %353 = AIE.tile(9, 4)
  %354 = AIE.switchbox(%353) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.masterset(South : 0, %385)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %385)
    }
  }
  %355 = AIE.tile(16, 1)
  %356 = AIE.switchbox(%355) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.masterset(North : 0, %385)
    %388 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %385)
    }
  }
  %357 = AIE.tile(15, 1)
  %358 = AIE.switchbox(%357) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.masterset(North : 0, %386)
    %388 = AIE.masterset(North : 1, %385)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %386)
    }
  }
  %359 = AIE.tile(9, 1)
  %360 = AIE.switchbox(%359) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(South : 0, %387)
    %390 = AIE.masterset(South : 1, %388)
    %391 = AIE.masterset(South : 2, %386)
    %392 = AIE.masterset(East : 0, %385)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %385)
    }
  }
  %361 = AIE.tile(17, 1)
  %362 = AIE.switchbox(%361) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.masterset(North : 0, %386)
    %388 = AIE.masterset(North : 1, %385)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %386)
    }
  }
  %363 = AIE.tile(17, 0)
  %364 = AIE.switchbox(%363) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(West : 0, %385)
    %390 = AIE.masterset(West : 1, %386)
    %391 = AIE.masterset(North : 0, %386)
    %392 = AIE.masterset(North : 1, %388)
    %393 = AIE.masterset(East : 0, %387)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %388)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %385)
    }
  }
  %365 = AIE.tile(9, 0)
  %366 = AIE.switchbox(%365) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.masterset(East : 0, %387)
    %389 = AIE.masterset(East : 1, %385)
    %390 = AIE.masterset(East : 2, %386)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %385)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %387)
    }
  }
  %367 = AIE.tile(14, 0)
  %368 = AIE.switchbox(%367) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(West : 0, %388)
    %390 = AIE.masterset(North : 0, %388)
    %391 = AIE.masterset(North : 1, %385)
    %392 = AIE.masterset(East : 0, %387)
    %393 = AIE.masterset(East : 1, %385)
    %394 = AIE.masterset(East : 2, %386)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %388)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %387)
    }
  }
  %369 = AIE.tile(12, 1)
  %370 = AIE.switchbox(%369) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.masterset(North : 0, %386)
    %388 = AIE.masterset(North : 1, %385)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %386)
    }
  }
  %371 = AIE.tile(15, 0)
  %372 = AIE.switchbox(%371) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(West : 0, %386)
    %390 = AIE.masterset(North : 0, %386)
    %391 = AIE.masterset(North : 1, %385)
    %392 = AIE.masterset(East : 0, %387)
    %393 = AIE.masterset(East : 1, %388)
    %394 = AIE.masterset(East : 2, %385)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %388)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %387)
    }
  }
  %373 = AIE.tile(11, 1)
  %374 = AIE.switchbox(%373) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<1> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<1> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(South : 0, %390)
    %393 = AIE.masterset(South : 1, %388)
    %394 = AIE.masterset(West : 0, %389)
    %395 = AIE.masterset(West : 1, %386)
    %396 = AIE.masterset(West : 2, %391)
    %397 = AIE.masterset(North : 0, %387)
    %398 = AIE.masterset(North : 1, %385)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %391)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %389)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %390)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %385)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %387)
    }
  }
  %375 = AIE.tile(14, 1)
  %376 = AIE.switchbox(%375) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.masterset(North : 0, %385)
    %388 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %385)
    }
  }
  %377 = AIE.tile(13, 1)
  %378 = AIE.switchbox(%377) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.masterset(North : 0, %385)
    %388 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %385)
    }
  }
  %379 = AIE.tile(18, 1)
  %380 = AIE.switchbox(%379) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.masterset(North : 0, %385)
    %388 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %385)
    }
  }
  %381 = AIE.tile(9, 3)
  %382 = AIE.switchbox(%381) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<0> (1)
    %387 = AIE.amsel<0> (2)
    %388 = AIE.amsel<0> (3)
    %389 = AIE.masterset(South : 0, %386)
    %390 = AIE.masterset(South : 1, %388)
    %391 = AIE.masterset(South : 2, %387)
    %392 = AIE.masterset(East : 0, %385)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %386)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %385)
    }
  }
  %383 = AIE.tile(10, 1)
  %384 = AIE.switchbox(%383) {
    %385 = AIE.amsel<0> (0)
    %386 = AIE.amsel<1> (0)
    %387 = AIE.amsel<2> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<2> (1)
    %391 = AIE.amsel<0> (2)
    %392 = AIE.amsel<1> (2)
    %393 = AIE.amsel<0> (3)
    %394 = AIE.amsel<1> (3)
    %395 = AIE.masterset(South : 0, %390)
    %396 = AIE.masterset(South : 1, %385)
    %397 = AIE.masterset(South : 2, %386)
    %398 = AIE.masterset(South : 3, %388)
    %399 = AIE.masterset(West : 0, %389)
    %400 = AIE.masterset(West : 1, %387)
    %401 = AIE.masterset(West : 2, %394)
    %402 = AIE.masterset(North : 0, %391)
    %403 = AIE.masterset(North : 1, %393)
    %404 = AIE.masterset(East : 0, %392)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %389)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %392)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %385)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %390)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %391)
    }
  }
}


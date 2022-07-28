module @gemm {
  AIE.token(0) {sym_name = "token55"}
  AIE.token(0) {sym_name = "token54"}
  AIE.token(0) {sym_name = "token53"}
  AIE.token(0) {sym_name = "token52"}
  AIE.token(0) {sym_name = "token51"}
  AIE.token(0) {sym_name = "token50"}
  AIE.token(0) {sym_name = "token49"}
  AIE.token(0) {sym_name = "token48"}
  AIE.token(0) {sym_name = "token47"}
  AIE.token(0) {sym_name = "token46"}
  AIE.token(0) {sym_name = "token45"}
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
  %0 = memref.alloc() : memref<64x128xf32>
  %1 = memref.alloc() : memref<64x128xf32>
  %2 = memref.alloc() : memref<128x128xf32>
  %3 = AIE.tile(10, 0)
  %4 = AIE.shimmux(%3) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %5 = AIE.switchbox(%3) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(North : 0, %433)
    %438 = AIE.masterset(North : 1, %435)
    %439 = AIE.masterset(East : 0, %433)
    %440 = AIE.masterset(East : 1, %435)
    %441 = AIE.masterset(East : 2, %436)
    %442 = AIE.masterset(East : 3, %434)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %434)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %436)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %433)
    }
  }
  %6 = AIE.lock(%3, 7)
  %7 = AIE.lock(%3, 6)
  %8 = AIE.lock(%3, 5)
  %9 = AIE.lock(%3, 4)
  %10 = AIE.lock(%3, 3)
  %11 = AIE.lock(%3, 2)
  %12 = AIE.lock(%3, 1)
  %13 = AIE.lock(%3, 0)
  %14 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %15 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %16 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %17 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %18 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %19 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %20 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %21 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %22 = AIE.core(%3) {
    AIE.useLock(%12, Acquire, 0)
    AIE.useLock(%10, Acquire, 0)
    AIE.useLock(%11, Acquire, 0)
    AIE.useLock(%13, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%13, Release, 1)
    AIE.useLock(%11, Release, 1)
    AIE.useLock(%10, Release, 1)
    AIE.useLock(%12, Release, 1)
    AIE.end
  }
  %23 = AIE.shimDMA(%3) {
    %433 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%10, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%20 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%13, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%13, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %434 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%19 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%12, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%12, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  %24 = AIE.tile(18, 0)
  %25 = AIE.shimmux(%24) {
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %26 = AIE.switchbox(%24) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.masterset(West : 0, %433)
    %436 = AIE.masterset(West : 1, %434)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 0, %433)
    }
  }
  %27 = AIE.lock(%24, 7)
  %28 = AIE.lock(%24, 6)
  %29 = AIE.lock(%24, 5)
  %30 = AIE.lock(%24, 4)
  %31 = AIE.lock(%24, 3)
  %32 = AIE.lock(%24, 2)
  %33 = AIE.lock(%24, 1)
  %34 = AIE.lock(%24, 0)
  %35 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %36 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %37 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %38 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %39 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %40 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%40, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %41 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%41, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %42 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%42, %2) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %43 = AIE.core(%24) {
    AIE.useLock(%27, Acquire, 0)
    AIE.useLock(%29, Acquire, 0)
    AIE.useLock(%30, Acquire, 0)
    AIE.useLock(%28, Acquire, 0)
    AIE.useLock(%34, Acquire, 0)
    AIE.useLock(%32, Acquire, 0)
    AIE.useLock(%33, Acquire, 0)
    AIE.useLock(%31, Acquire, 0)
    AIE.useLock(%31, Release, 1)
    AIE.useLock(%33, Release, 1)
    AIE.useLock(%32, Release, 1)
    AIE.useLock(%34, Release, 1)
    AIE.useLock(%28, Release, 1)
    AIE.useLock(%30, Release, 1)
    AIE.useLock(%29, Release, 1)
    AIE.useLock(%27, Release, 1)
    AIE.end
  }
  %44 = AIE.shimDMA(%24) {
    %433 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%32, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%29, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %434 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%34, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%38 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%33, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%37 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%27, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%30, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  %45 = AIE.tile(11, 0)
  %46 = AIE.shimmux(%45) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<North : 3, DMA : 1>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %47 = AIE.switchbox(%45) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<0> (3)
    %439 = AIE.masterset(South : 2, %435)
    %440 = AIE.masterset(South : 3, %434)
    %441 = AIE.masterset(North : 0, %437)
    %442 = AIE.masterset(North : 1, %433)
    %443 = AIE.masterset(East : 0, %437)
    %444 = AIE.masterset(East : 1, %436)
    %445 = AIE.masterset(East : 2, %438)
    %446 = AIE.masterset(East : 3, %433)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %434)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(West : 3) {
      AIE.rule(31, 1, %434)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(31, 0, %434)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %435)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %435)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %435)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %435)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %436)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %437)
    }
  }
  %48 = AIE.lock(%45, 7)
  %49 = AIE.lock(%45, 6)
  %50 = AIE.lock(%45, 5)
  %51 = AIE.lock(%45, 4)
  %52 = AIE.lock(%45, 3)
  %53 = AIE.lock(%45, 2)
  %54 = AIE.lock(%45, 1)
  %55 = AIE.lock(%45, 0)
  %56 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %57 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %58 = AIE.external_buffer 90112 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%58, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %59 = AIE.external_buffer 94208 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%59, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %60 = AIE.external_buffer 98304 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%60, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %61 = AIE.external_buffer 102400 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%61, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %62 = AIE.external_buffer 106496 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%62, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %63 = AIE.external_buffer 110592 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%63, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %64 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %64) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %65 = AIE.external_buffer 118788 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %65) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %66 = AIE.external_buffer 122888 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %66) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %67 = AIE.external_buffer 126988 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %67) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %68 = AIE.external_buffer 131088 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %68) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %69 = AIE.external_buffer 135188 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %69) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %70 = AIE.external_buffer 139288 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %70) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %71 = AIE.external_buffer 143388 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %71) {kind = 2 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %72 = AIE.core(%45) {
    AIE.useLock(%55, Acquire, 0)
    AIE.useLock(%54, Acquire, 0)
    AIE.useLock(%49, Acquire, 0)
    AIE.useLock(%52, Acquire, 0)
    AIE.useLock(%50, Acquire, 0)
    AIE.useLock(%51, Acquire, 0)
    AIE.useLock(%48, Acquire, 0)
    AIE.useLock(%53, Acquire, 0)
    AIE.useLock(%53, Release, 1)
    AIE.useLock(%48, Release, 1)
    AIE.useLock(%51, Release, 1)
    AIE.useLock(%50, Release, 1)
    AIE.useLock(%52, Release, 1)
    AIE.useLock(%49, Release, 1)
    AIE.useLock(%54, Release, 1)
    AIE.useLock(%55, Release, 1)
    AIE.end
  }
  %73 = AIE.shimDMA(%45) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%64 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%65 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%66 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%67 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%68 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%69 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%70 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%71 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %435 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useLock(%55, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%55, Release, 0)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%52, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 0)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%49, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%61 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 0)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useLock(%53, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%60 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 0)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %436 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useLock(%54, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%54, Release, 0)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%48, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 0)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useLock(%50, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 0)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useLock(%51, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%51, Release, 0)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  %74 = AIE.tile(0, 0)
  %75 = AIE.switchbox(%74) {
  }
  %76 = AIE.core(%74) {
    AIE.end
  }
  %77 = AIE.tile(10, 2)
  %78 = AIE.switchbox(%77) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.amsel<1> (3)
    %441 = AIE.masterset(DMA : 0, %439)
    %442 = AIE.masterset(DMA : 1, %433)
    %443 = AIE.masterset(South : 0, %434)
    %444 = AIE.masterset(South : 1, %437)
    %445 = AIE.masterset(North : 0, %436)
    %446 = AIE.masterset(North : 1, %435)
    %447 = AIE.masterset(East : 0, %440)
    %448 = AIE.masterset(East : 1, %438)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %439)
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %433)
      AIE.rule(28, 0, %436)
    }
  }
  %79 = AIE.lock(%77, 1)
  %80 = AIE.lock(%77, 0)
  %81 = AIE.buffer(%77) : memref<32x32xf32>
  %82 = AIE.buffer(%77) : memref<32x32xf32>
  %83 = AIE.buffer(%77) : memref<32x32xf32>
  %84 = AIE.buffer(%77) : memref<32x32xf32>
  %85 = AIE.core(%77) {
    AIE.useLock(%80, Acquire, 1)
    AIE.useLock(%89, Acquire, 0)
    AIE.useLock(%79, Acquire, 1)
    call @extern_kernel(%84, %81, %82, %83) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%79, Release, 0)
    AIE.useLock(%89, Release, 1)
    AIE.useLock(%80, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %86 = AIE.mem(%77) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%83 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%80, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%80, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %87 = AIE.tile(10, 3)
  %88 = AIE.switchbox(%87) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.amsel<1> (3)
    %441 = AIE.masterset(DMA : 0, %437)
    %442 = AIE.masterset(DMA : 1, %440)
    %443 = AIE.masterset(South : 0, %436)
    %444 = AIE.masterset(South : 1, %438)
    %445 = AIE.masterset(North : 0, %433)
    %446 = AIE.masterset(North : 1, %435)
    %447 = AIE.masterset(East : 0, %439)
    %448 = AIE.masterset(East : 1, %434)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %434)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %439)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %436)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %437)
      AIE.rule(30, 6, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %440)
      AIE.rule(30, 2, %433)
    }
  }
  %89 = AIE.lock(%87, 2)
  %90 = AIE.lock(%87, 1)
  %91 = AIE.lock(%87, 0)
  %92 = AIE.buffer(%87) : memref<32x32xf32>
  %93 = AIE.buffer(%87) : memref<32x32xf32>
  %94 = AIE.buffer(%87) : memref<32x32xf32>
  %95 = AIE.core(%87) {
    AIE.useLock(%101, Acquire, 0)
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%90, Acquire, 1)
    AIE.useLock(%91, Acquire, 1)
    call @extern_kernel(%81, %92, %93, %94) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%91, Release, 0)
    AIE.useLock(%90, Release, 0)
    AIE.useLock(%89, Release, 0)
    AIE.useLock(%101, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %96 = AIE.mem(%87) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%91, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%94 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%91, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%90, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%90, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %97 = AIE.tile(10, 4)
  %98 = AIE.switchbox(%97) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.amsel<1> (3)
    %441 = AIE.masterset(DMA : 0, %433)
    %442 = AIE.masterset(DMA : 1, %438)
    %443 = AIE.masterset(South : 0, %439)
    %444 = AIE.masterset(South : 1, %437)
    %445 = AIE.masterset(North : 0, %434)
    %446 = AIE.masterset(North : 1, %440)
    %447 = AIE.masterset(East : 0, %435)
    %448 = AIE.masterset(East : 1, %436)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %439)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %436)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %435)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %438)
      AIE.rule(31, 7, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %433)
      AIE.rule(31, 3, %434)
    }
  }
  %99 = AIE.lock(%97, 2)
  %100 = AIE.lock(%97, 1)
  %101 = AIE.lock(%97, 0)
  %102 = AIE.buffer(%97) : memref<32x32xf32>
  %103 = AIE.buffer(%97) : memref<32x32xf32>
  %104 = AIE.buffer(%97) : memref<32x32xf32>
  %105 = AIE.core(%97) {
    AIE.useLock(%100, Acquire, 1)
    AIE.useLock(%101, Acquire, 1)
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%109, Acquire, 0)
    call @extern_kernel(%92, %102, %103, %104) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%109, Release, 1)
    AIE.useLock(%99, Release, 0)
    AIE.useLock(%101, Release, 0)
    AIE.useLock(%100, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %106 = AIE.mem(%97) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%103 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%100, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%104 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%100, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %107 = AIE.tile(10, 5) {polyaie.leaf}
  %108 = AIE.switchbox(%107) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<0> (2)
    %437 = AIE.amsel<0> (3)
    %438 = AIE.masterset(DMA : 0, %437)
    %439 = AIE.masterset(DMA : 1, %435)
    %440 = AIE.masterset(South : 0, %434)
    %441 = AIE.masterset(South : 1, %433)
    %442 = AIE.masterset(East : 0, %436)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %433)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %434)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %436)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %437)
    }
  }
  %109 = AIE.lock(%107, 3)
  %110 = AIE.lock(%107, 2)
  %111 = AIE.lock(%107, 1)
  %112 = AIE.lock(%107, 0)
  %113 = AIE.buffer(%107) : memref<32x32xf32>
  %114 = AIE.buffer(%107) : memref<32x32xf32>
  %115 = AIE.buffer(%107) : memref<32x32xf32>
  %116 = AIE.core(%107) {
    AIE.useLock(%112, Acquire, 0)
    AIE.useLock(%110, Acquire, 1)
    AIE.useLock(%111, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    call @extern_kernel(%102, %113, %114, %115) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%111, Release, 0)
    AIE.useLock(%110, Release, 0)
    AIE.useLock(%112, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %117 = AIE.mem(%107) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%111, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%114 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%111, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%110, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%115 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%110, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%112, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%113 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%112, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %118 = AIE.tile(11, 2)
  %119 = AIE.switchbox(%118) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<2> (0)
    %436 = AIE.amsel<0> (1)
    %437 = AIE.amsel<1> (1)
    %438 = AIE.amsel<2> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<1> (2)
    %441 = AIE.amsel<2> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.amsel<1> (3)
    %444 = AIE.amsel<2> (3)
    %445 = AIE.masterset(DMA : 0, %444)
    %446 = AIE.masterset(DMA : 1, %443)
    %447 = AIE.masterset(South : 0, %433)
    %448 = AIE.masterset(South : 1, %441)
    %449 = AIE.masterset(South : 2, %434)
    %450 = AIE.masterset(South : 3, %437)
    %451 = AIE.masterset(West : 0, %440)
    %452 = AIE.masterset(West : 1, %435)
    %453 = AIE.masterset(North : 0, %439)
    %454 = AIE.masterset(North : 1, %442)
    %455 = AIE.masterset(East : 0, %436)
    %456 = AIE.masterset(East : 1, %438)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %435)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %440)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %436)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %441)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %433)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %444)
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %443)
      AIE.rule(28, 0, %439)
    }
  }
  %120 = AIE.lock(%118, 1)
  %121 = AIE.lock(%118, 0)
  %122 = AIE.buffer(%118) : memref<32x32xf32>
  %123 = AIE.buffer(%118) : memref<32x32xf32>
  %124 = AIE.buffer(%118) : memref<32x32xf32>
  %125 = AIE.buffer(%118) : memref<32x32xf32>
  %126 = AIE.core(%118) {
    AIE.useLock(%120, Acquire, 1)
    AIE.useLock(%121, Acquire, 1)
    AIE.useLock(%132, Acquire, 0)
    call @extern_kernel(%125, %122, %123, %124) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%132, Release, 1)
    AIE.useLock(%121, Release, 0)
    AIE.useLock(%120, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %127 = AIE.mem(%118) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%121, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%124 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%121, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%120, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%123 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%120, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %128 = AIE.tile(11, 3)
  %129 = AIE.switchbox(%128) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<2> (0)
    %436 = AIE.amsel<0> (1)
    %437 = AIE.amsel<1> (1)
    %438 = AIE.amsel<2> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<1> (2)
    %441 = AIE.amsel<2> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.amsel<1> (3)
    %444 = AIE.amsel<2> (3)
    %445 = AIE.masterset(DMA : 0, %438)
    %446 = AIE.masterset(DMA : 1, %443)
    %447 = AIE.masterset(South : 0, %435)
    %448 = AIE.masterset(South : 1, %436)
    %449 = AIE.masterset(South : 2, %444)
    %450 = AIE.masterset(South : 3, %442)
    %451 = AIE.masterset(West : 0, %439)
    %452 = AIE.masterset(West : 1, %440)
    %453 = AIE.masterset(North : 0, %433)
    %454 = AIE.masterset(North : 1, %434)
    %455 = AIE.masterset(East : 0, %437)
    %456 = AIE.masterset(East : 1, %441)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %437)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %439)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %442)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %444)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %436)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %435)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %443)
      AIE.rule(30, 6, %434)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %438)
      AIE.rule(30, 2, %433)
    }
  }
  %130 = AIE.lock(%128, 2)
  %131 = AIE.lock(%128, 1)
  %132 = AIE.lock(%128, 0)
  %133 = AIE.buffer(%128) : memref<32x32xf32>
  %134 = AIE.buffer(%128) : memref<32x32xf32>
  %135 = AIE.buffer(%128) : memref<32x32xf32>
  %136 = AIE.core(%128) {
    AIE.useLock(%132, Acquire, 1)
    AIE.useLock(%131, Acquire, 1)
    AIE.useLock(%130, Acquire, 1)
    AIE.useLock(%140, Acquire, 0)
    call @extern_kernel(%122, %133, %134, %135) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%140, Release, 1)
    AIE.useLock(%130, Release, 0)
    AIE.useLock(%131, Release, 0)
    AIE.useLock(%132, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %137 = AIE.mem(%128) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%130, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%134 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%130, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%131, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%135 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%131, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %138 = AIE.tile(11, 4)
  %139 = AIE.switchbox(%138) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<2> (0)
    %436 = AIE.amsel<0> (1)
    %437 = AIE.amsel<1> (1)
    %438 = AIE.amsel<2> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<1> (2)
    %441 = AIE.amsel<2> (2)
    %442 = AIE.amsel<0> (3)
    %443 = AIE.amsel<1> (3)
    %444 = AIE.amsel<2> (3)
    %445 = AIE.masterset(DMA : 0, %435)
    %446 = AIE.masterset(DMA : 1, %439)
    %447 = AIE.masterset(South : 0, %437)
    %448 = AIE.masterset(South : 1, %440)
    %449 = AIE.masterset(South : 2, %438)
    %450 = AIE.masterset(South : 3, %443)
    %451 = AIE.masterset(West : 0, %434)
    %452 = AIE.masterset(West : 1, %441)
    %453 = AIE.masterset(North : 0, %433)
    %454 = AIE.masterset(North : 1, %444)
    %455 = AIE.masterset(East : 0, %442)
    %456 = AIE.masterset(East : 1, %436)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %436)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %442)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %443)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %437)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %439)
      AIE.rule(31, 7, %444)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %435)
      AIE.rule(31, 3, %433)
    }
  }
  %140 = AIE.lock(%138, 2)
  %141 = AIE.lock(%138, 1)
  %142 = AIE.lock(%138, 0)
  %143 = AIE.buffer(%138) : memref<32x32xf32>
  %144 = AIE.buffer(%138) : memref<32x32xf32>
  %145 = AIE.buffer(%138) : memref<32x32xf32>
  %146 = AIE.core(%138) {
    AIE.useLock(%141, Acquire, 1)
    AIE.useLock(%153, Acquire, 0)
    AIE.useLock(%140, Acquire, 1)
    AIE.useLock(%142, Acquire, 1)
    call @extern_kernel(%133, %143, %144, %145) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%142, Release, 0)
    AIE.useLock(%140, Release, 0)
    AIE.useLock(%153, Release, 1)
    AIE.useLock(%141, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %147 = AIE.mem(%138) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%142, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%144 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%142, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%141, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%145 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%141, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %148 = AIE.tile(11, 5) {polyaie.leaf}
  %149 = AIE.switchbox(%148) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.amsel<1> (3)
    %441 = AIE.masterset(DMA : 0, %438)
    %442 = AIE.masterset(DMA : 1, %435)
    %443 = AIE.masterset(South : 0, %439)
    %444 = AIE.masterset(South : 1, %437)
    %445 = AIE.masterset(South : 2, %434)
    %446 = AIE.masterset(South : 3, %433)
    %447 = AIE.masterset(West : 0, %440)
    %448 = AIE.masterset(West : 1, %436)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 1, %436)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %433)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %437)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %439)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %438)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %435)
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
    AIE.useLock(%152, Acquire, 0)
    AIE.useLock(%153, Acquire, 1)
    AIE.useLock(%151, Acquire, 1)
    call @extern_kernel(%143, %154, %155, %156) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%151, Release, 0)
    AIE.useLock(%153, Release, 0)
    AIE.useLock(%152, Release, 1)
    AIE.useLock(%150, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %158 = AIE.mem(%148) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%151, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%156 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%151, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%150, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%155 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%150, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%152, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%154 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%152, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %159 = AIE.tile(12, 2)
  %160 = AIE.switchbox(%159) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.amsel<1> (3)
    %441 = AIE.masterset(DMA : 0, %434)
    %442 = AIE.masterset(DMA : 1, %439)
    %443 = AIE.masterset(South : 0, %437)
    %444 = AIE.masterset(South : 1, %438)
    %445 = AIE.masterset(West : 0, %440)
    %446 = AIE.masterset(West : 1, %433)
    %447 = AIE.masterset(North : 0, %435)
    %448 = AIE.masterset(North : 1, %436)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %433)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %440)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %437)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %434)
      AIE.rule(28, 4, %436)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %439)
      AIE.rule(28, 0, %435)
    }
  }
  %161 = AIE.lock(%159, 1)
  %162 = AIE.lock(%159, 0)
  %163 = AIE.buffer(%159) : memref<32x32xf32>
  %164 = AIE.buffer(%159) : memref<32x32xf32>
  %165 = AIE.buffer(%159) : memref<32x32xf32>
  %166 = AIE.buffer(%159) : memref<32x32xf32>
  %167 = AIE.core(%159) {
    AIE.useLock(%161, Acquire, 1)
    AIE.useLock(%162, Acquire, 1)
    AIE.useLock(%173, Acquire, 0)
    call @extern_kernel(%166, %163, %164, %165) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%173, Release, 1)
    AIE.useLock(%162, Release, 0)
    AIE.useLock(%161, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %168 = AIE.mem(%159) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%162, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%165 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%162, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%161, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%164 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%161, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %169 = AIE.tile(12, 3)
  %170 = AIE.switchbox(%169) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.amsel<1> (3)
    %441 = AIE.masterset(DMA : 0, %433)
    %442 = AIE.masterset(DMA : 1, %436)
    %443 = AIE.masterset(South : 0, %438)
    %444 = AIE.masterset(South : 1, %440)
    %445 = AIE.masterset(West : 0, %435)
    %446 = AIE.masterset(West : 1, %434)
    %447 = AIE.masterset(North : 0, %439)
    %448 = AIE.masterset(North : 1, %437)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %434)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %435)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %433)
      AIE.rule(30, 6, %437)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %436)
      AIE.rule(30, 2, %439)
    }
  }
  %171 = AIE.lock(%169, 2)
  %172 = AIE.lock(%169, 1)
  %173 = AIE.lock(%169, 0)
  %174 = AIE.buffer(%169) : memref<32x32xf32>
  %175 = AIE.buffer(%169) : memref<32x32xf32>
  %176 = AIE.buffer(%169) : memref<32x32xf32>
  %177 = AIE.core(%169) {
    AIE.useLock(%183, Acquire, 0)
    AIE.useLock(%172, Acquire, 1)
    AIE.useLock(%171, Acquire, 1)
    AIE.useLock(%173, Acquire, 1)
    call @extern_kernel(%163, %174, %175, %176) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%173, Release, 0)
    AIE.useLock(%171, Release, 0)
    AIE.useLock(%172, Release, 0)
    AIE.useLock(%183, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %178 = AIE.mem(%169) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%171, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%176 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%171, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%172, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%175 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%172, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %179 = AIE.tile(12, 4)
  %180 = AIE.switchbox(%179) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.amsel<1> (3)
    %441 = AIE.masterset(DMA : 0, %439)
    %442 = AIE.masterset(DMA : 1, %433)
    %443 = AIE.masterset(South : 0, %440)
    %444 = AIE.masterset(South : 1, %436)
    %445 = AIE.masterset(West : 0, %438)
    %446 = AIE.masterset(West : 1, %434)
    %447 = AIE.masterset(North : 0, %437)
    %448 = AIE.masterset(North : 1, %435)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %434)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %436)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %439)
      AIE.rule(31, 7, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %433)
      AIE.rule(31, 3, %437)
    }
  }
  %181 = AIE.lock(%179, 2)
  %182 = AIE.lock(%179, 1)
  %183 = AIE.lock(%179, 0)
  %184 = AIE.buffer(%179) : memref<32x32xf32>
  %185 = AIE.buffer(%179) : memref<32x32xf32>
  %186 = AIE.buffer(%179) : memref<32x32xf32>
  %187 = AIE.core(%179) {
    AIE.useLock(%183, Acquire, 1)
    AIE.useLock(%192, Acquire, 0)
    AIE.useLock(%181, Acquire, 1)
    AIE.useLock(%182, Acquire, 1)
    call @extern_kernel(%174, %184, %185, %186) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%182, Release, 0)
    AIE.useLock(%181, Release, 0)
    AIE.useLock(%192, Release, 1)
    AIE.useLock(%183, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %188 = AIE.mem(%179) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%182, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%182, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%181, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%185 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%181, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %189 = AIE.tile(12, 5) {polyaie.leaf}
  %190 = AIE.switchbox(%189) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.masterset(DMA : 0, %439)
    %441 = AIE.masterset(DMA : 1, %438)
    %442 = AIE.masterset(South : 0, %437)
    %443 = AIE.masterset(West : 0, %436)
    %444 = AIE.masterset(West : 1, %434)
    %445 = AIE.masterset(West : 2, %433)
    %446 = AIE.masterset(West : 3, %435)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 2, %437)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 1, %435)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %433)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %434)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %436)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %439)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %438)
    }
  }
  %191 = AIE.lock(%189, 3)
  %192 = AIE.lock(%189, 2)
  %193 = AIE.lock(%189, 1)
  %194 = AIE.lock(%189, 0)
  %195 = AIE.buffer(%189) : memref<32x32xf32>
  %196 = AIE.buffer(%189) : memref<32x32xf32>
  %197 = AIE.buffer(%189) : memref<32x32xf32>
  %198 = AIE.core(%189) {
    AIE.useLock(%193, Acquire, 0)
    AIE.useLock(%192, Acquire, 1)
    AIE.useLock(%194, Acquire, 1)
    AIE.useLock(%191, Acquire, 1)
    call @extern_kernel(%184, %195, %196, %197) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%191, Release, 0)
    AIE.useLock(%194, Release, 0)
    AIE.useLock(%192, Release, 0)
    AIE.useLock(%193, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %199 = AIE.mem(%189) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%191, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%197 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%191, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%194, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%196 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%194, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%193, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%195 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%193, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %200 = AIE.tile(13, 2)
  %201 = AIE.switchbox(%200) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %434)
    %438 = AIE.masterset(DMA : 1, %436)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %435)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %434)
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %436)
      AIE.rule(28, 0, %433)
    }
  }
  %202 = AIE.lock(%200, 1)
  %203 = AIE.lock(%200, 0)
  %204 = AIE.buffer(%200) : memref<32x32xf32>
  %205 = AIE.buffer(%200) : memref<32x32xf32>
  %206 = AIE.buffer(%200) : memref<32x32xf32>
  %207 = AIE.buffer(%200) : memref<32x32xf32>
  %208 = AIE.core(%200) {
    AIE.useLock(%202, Acquire, 1)
    AIE.useLock(%203, Acquire, 1)
    AIE.useLock(%214, Acquire, 0)
    call @extern_kernel(%207, %204, %205, %206) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%214, Release, 1)
    AIE.useLock(%203, Release, 0)
    AIE.useLock(%202, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %209 = AIE.mem(%200) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%203, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%206 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%203, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%202, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%205 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%202, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %210 = AIE.tile(13, 3)
  %211 = AIE.switchbox(%210) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %435)
    %438 = AIE.masterset(DMA : 1, %434)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %436)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %434)
      AIE.rule(30, 6, %436)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %435)
      AIE.rule(30, 2, %433)
    }
  }
  %212 = AIE.lock(%210, 2)
  %213 = AIE.lock(%210, 1)
  %214 = AIE.lock(%210, 0)
  %215 = AIE.buffer(%210) : memref<32x32xf32>
  %216 = AIE.buffer(%210) : memref<32x32xf32>
  %217 = AIE.buffer(%210) : memref<32x32xf32>
  %218 = AIE.core(%210) {
    AIE.useLock(%212, Acquire, 1)
    AIE.useLock(%213, Acquire, 1)
    AIE.useLock(%214, Acquire, 1)
    AIE.useLock(%224, Acquire, 0)
    call @extern_kernel(%204, %215, %216, %217) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%224, Release, 1)
    AIE.useLock(%214, Release, 0)
    AIE.useLock(%213, Release, 0)
    AIE.useLock(%212, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %219 = AIE.mem(%210) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%213, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%216 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%213, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%212, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%217 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%212, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %220 = AIE.tile(13, 4)
  %221 = AIE.switchbox(%220) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<0> (2)
    %437 = AIE.amsel<0> (3)
    %438 = AIE.masterset(DMA : 0, %435)
    %439 = AIE.masterset(DMA : 1, %433)
    %440 = AIE.masterset(West : 0, %434)
    %441 = AIE.masterset(North : 0, %437)
    %442 = AIE.masterset(North : 1, %436)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 3, %434)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %433)
      AIE.rule(31, 7, %436)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %435)
      AIE.rule(31, 3, %437)
    }
  }
  %222 = AIE.lock(%220, 2)
  %223 = AIE.lock(%220, 1)
  %224 = AIE.lock(%220, 0)
  %225 = AIE.buffer(%220) : memref<32x32xf32>
  %226 = AIE.buffer(%220) : memref<32x32xf32>
  %227 = AIE.buffer(%220) : memref<32x32xf32>
  %228 = AIE.core(%220) {
    AIE.useLock(%232, Acquire, 0)
    AIE.useLock(%223, Acquire, 1)
    AIE.useLock(%222, Acquire, 1)
    AIE.useLock(%224, Acquire, 1)
    call @extern_kernel(%215, %225, %226, %227) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%224, Release, 0)
    AIE.useLock(%222, Release, 0)
    AIE.useLock(%223, Release, 0)
    AIE.useLock(%232, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %229 = AIE.mem(%220) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%222, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%226 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%222, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%223, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%227 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%223, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %230 = AIE.tile(13, 5) {polyaie.leaf}
  %231 = AIE.switchbox(%230) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<1> (2)
    %439 = AIE.amsel<0> (3)
    %440 = AIE.masterset(DMA : 0, %436)
    %441 = AIE.masterset(DMA : 1, %437)
    %442 = AIE.masterset(South : 0, %438)
    %443 = AIE.masterset(West : 0, %435)
    %444 = AIE.masterset(West : 1, %433)
    %445 = AIE.masterset(West : 2, %439)
    %446 = AIE.masterset(West : 3, %434)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 3, %438)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %439)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %433)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %435)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %436)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %437)
    }
  }
  %232 = AIE.lock(%230, 3)
  %233 = AIE.lock(%230, 2)
  %234 = AIE.lock(%230, 1)
  %235 = AIE.lock(%230, 0)
  %236 = AIE.buffer(%230) : memref<32x32xf32>
  %237 = AIE.buffer(%230) : memref<32x32xf32>
  %238 = AIE.buffer(%230) : memref<32x32xf32>
  %239 = AIE.core(%230) {
    AIE.useLock(%232, Acquire, 1)
    AIE.useLock(%235, Acquire, 1)
    AIE.useLock(%234, Acquire, 0)
    AIE.useLock(%233, Acquire, 1)
    call @extern_kernel(%225, %236, %237, %238) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%233, Release, 0)
    AIE.useLock(%234, Release, 1)
    AIE.useLock(%235, Release, 0)
    AIE.useLock(%232, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %240 = AIE.mem(%230) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%233, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%238 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%233, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%235, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%237 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%235, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %435)
    %438 = AIE.masterset(DMA : 1, %436)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %434)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %436)
      AIE.rule(28, 0, %434)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %435)
      AIE.rule(28, 4, %433)
    }
  }
  %243 = AIE.lock(%241, 1)
  %244 = AIE.lock(%241, 0)
  %245 = AIE.buffer(%241) : memref<32x32xf32>
  %246 = AIE.buffer(%241) : memref<32x32xf32>
  %247 = AIE.buffer(%241) : memref<32x32xf32>
  %248 = AIE.buffer(%241) : memref<32x32xf32>
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
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%243, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%247 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%243, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %434)
    %438 = AIE.masterset(DMA : 1, %436)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %435)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %434)
      AIE.rule(30, 2, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %436)
      AIE.rule(30, 6, %433)
    }
  }
  %253 = AIE.lock(%251, 2)
  %254 = AIE.lock(%251, 1)
  %255 = AIE.lock(%251, 0)
  %256 = AIE.buffer(%251) : memref<32x32xf32>
  %257 = AIE.buffer(%251) : memref<32x32xf32>
  %258 = AIE.buffer(%251) : memref<32x32xf32>
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
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%255, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%257 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%255, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %435)
    %438 = AIE.masterset(DMA : 1, %433)
    %439 = AIE.masterset(North : 0, %434)
    %440 = AIE.masterset(North : 1, %436)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %435)
      AIE.rule(31, 3, %436)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %433)
      AIE.rule(31, 7, %434)
    }
  }
  %263 = AIE.lock(%261, 2)
  %264 = AIE.lock(%261, 1)
  %265 = AIE.lock(%261, 0)
  %266 = AIE.buffer(%261) : memref<32x32xf32>
  %267 = AIE.buffer(%261) : memref<32x32xf32>
  %268 = AIE.buffer(%261) : memref<32x32xf32>
  %269 = AIE.core(%261) {
    AIE.useLock(%264, Acquire, 1)
    AIE.useLock(%263, Acquire, 1)
    AIE.useLock(%265, Acquire, 1)
    AIE.useLock(%273, Acquire, 0)
    call @extern_kernel(%256, %266, %267, %268) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%273, Release, 1)
    AIE.useLock(%265, Release, 0)
    AIE.useLock(%263, Release, 0)
    AIE.useLock(%264, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %270 = AIE.mem(%261) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%263, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%267 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%263, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
  %272 = AIE.switchbox(%271) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<0> (3)
    %439 = AIE.masterset(DMA : 0, %435)
    %440 = AIE.masterset(DMA : 1, %433)
    %441 = AIE.masterset(West : 0, %434)
    %442 = AIE.masterset(West : 1, %437)
    %443 = AIE.masterset(West : 2, %438)
    %444 = AIE.masterset(West : 3, %436)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %436)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %438)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %437)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %434)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 7, %435)
    }
  }
  %273 = AIE.lock(%271, 3)
  %274 = AIE.lock(%271, 2)
  %275 = AIE.lock(%271, 1)
  %276 = AIE.lock(%271, 0)
  %277 = AIE.buffer(%271) : memref<32x32xf32>
  %278 = AIE.buffer(%271) : memref<32x32xf32>
  %279 = AIE.buffer(%271) : memref<32x32xf32>
  %280 = AIE.core(%271) {
    AIE.useLock(%275, Acquire, 1)
    AIE.useLock(%274, Acquire, 0)
    AIE.useLock(%276, Acquire, 1)
    AIE.useLock(%273, Acquire, 1)
    call @extern_kernel(%266, %277, %278, %279) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%273, Release, 0)
    AIE.useLock(%276, Release, 0)
    AIE.useLock(%274, Release, 1)
    AIE.useLock(%275, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %281 = AIE.mem(%271) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%276, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%279 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%276, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%275, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%278 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%274, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%277 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%274, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %282 = AIE.tile(15, 2)
  %283 = AIE.switchbox(%282) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %436)
    %438 = AIE.masterset(DMA : 1, %434)
    %439 = AIE.masterset(North : 0, %435)
    %440 = AIE.masterset(North : 1, %433)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %436)
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %434)
      AIE.rule(28, 0, %435)
    }
  }
  %284 = AIE.lock(%282, 1)
  %285 = AIE.lock(%282, 0)
  %286 = AIE.buffer(%282) : memref<32x32xf32>
  %287 = AIE.buffer(%282) : memref<32x32xf32>
  %288 = AIE.buffer(%282) : memref<32x32xf32>
  %289 = AIE.buffer(%282) : memref<32x32xf32>
  %290 = AIE.core(%282) {
    AIE.useLock(%284, Acquire, 1)
    AIE.useLock(%285, Acquire, 1)
    AIE.useLock(%294, Acquire, 0)
    call @extern_kernel(%289, %286, %287, %288) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%294, Release, 1)
    AIE.useLock(%285, Release, 0)
    AIE.useLock(%284, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %291 = AIE.mem(%282) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%285, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%288 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%285, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%284, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%287 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%284, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %292 = AIE.tile(15, 3)
  %293 = AIE.switchbox(%292) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %435)
    %438 = AIE.masterset(DMA : 1, %436)
    %439 = AIE.masterset(North : 0, %434)
    %440 = AIE.masterset(North : 1, %433)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %436)
      AIE.rule(30, 6, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %435)
      AIE.rule(30, 2, %434)
    }
  }
  %294 = AIE.lock(%292, 2)
  %295 = AIE.lock(%292, 1)
  %296 = AIE.lock(%292, 0)
  %297 = AIE.buffer(%292) : memref<32x32xf32>
  %298 = AIE.buffer(%292) : memref<32x32xf32>
  %299 = AIE.buffer(%292) : memref<32x32xf32>
  %300 = AIE.core(%292) {
    AIE.useLock(%306, Acquire, 0)
    AIE.useLock(%294, Acquire, 1)
    AIE.useLock(%295, Acquire, 1)
    AIE.useLock(%296, Acquire, 1)
    call @extern_kernel(%286, %297, %298, %299) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%296, Release, 0)
    AIE.useLock(%295, Release, 0)
    AIE.useLock(%294, Release, 0)
    AIE.useLock(%306, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %301 = AIE.mem(%292) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%296, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%298 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%296, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%295, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%299 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%295, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %302 = AIE.tile(15, 4)
  %303 = AIE.switchbox(%302) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %434)
    %438 = AIE.masterset(DMA : 1, %436)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %435)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %434)
      AIE.rule(31, 7, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %436)
      AIE.rule(31, 3, %433)
    }
  }
  %304 = AIE.lock(%302, 2)
  %305 = AIE.lock(%302, 1)
  %306 = AIE.lock(%302, 0)
  %307 = AIE.buffer(%302) : memref<32x32xf32>
  %308 = AIE.buffer(%302) : memref<32x32xf32>
  %309 = AIE.buffer(%302) : memref<32x32xf32>
  %310 = AIE.core(%302) {
    AIE.useLock(%305, Acquire, 1)
    AIE.useLock(%306, Acquire, 1)
    AIE.useLock(%304, Acquire, 1)
    AIE.useLock(%316, Acquire, 0)
    call @extern_kernel(%297, %307, %308, %309) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%316, Release, 1)
    AIE.useLock(%304, Release, 0)
    AIE.useLock(%306, Release, 0)
    AIE.useLock(%305, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %311 = AIE.mem(%302) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%304, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%309 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%304, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%305, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%308 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%305, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %312 = AIE.tile(15, 5) {polyaie.leaf}
  %313 = AIE.switchbox(%312) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<0> (2)
    %437 = AIE.amsel<0> (3)
    %438 = AIE.masterset(DMA : 0, %434)
    %439 = AIE.masterset(DMA : 1, %437)
    %440 = AIE.masterset(West : 0, %435)
    %441 = AIE.masterset(West : 1, %433)
    %442 = AIE.masterset(West : 2, %436)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %436)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %433)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %435)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %434)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %437)
    }
  }
  %314 = AIE.lock(%312, 3)
  %315 = AIE.lock(%312, 2)
  %316 = AIE.lock(%312, 1)
  %317 = AIE.lock(%312, 0)
  %318 = AIE.buffer(%312) : memref<32x32xf32>
  %319 = AIE.buffer(%312) : memref<32x32xf32>
  %320 = AIE.buffer(%312) : memref<32x32xf32>
  %321 = AIE.core(%312) {
    AIE.useLock(%317, Acquire, 0)
    AIE.useLock(%314, Acquire, 1)
    AIE.useLock(%315, Acquire, 1)
    AIE.useLock(%316, Acquire, 1)
    call @extern_kernel(%307, %318, %319, %320) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%316, Release, 0)
    AIE.useLock(%315, Release, 0)
    AIE.useLock(%314, Release, 0)
    AIE.useLock(%317, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %322 = AIE.mem(%312) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%315, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%320 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%315, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%314, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%319 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%314, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%317, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%318 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%317, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %323 = AIE.tile(16, 2)
  %324 = AIE.switchbox(%323) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %436)
    %438 = AIE.masterset(DMA : 1, %434)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %435)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %436)
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %434)
      AIE.rule(28, 0, %433)
    }
  }
  %325 = AIE.lock(%323, 1)
  %326 = AIE.lock(%323, 0)
  %327 = AIE.buffer(%323) : memref<32x32xf32>
  %328 = AIE.buffer(%323) : memref<32x32xf32>
  %329 = AIE.buffer(%323) : memref<32x32xf32>
  %330 = AIE.buffer(%323) : memref<32x32xf32>
  %331 = AIE.core(%323) {
    AIE.useLock(%336, Acquire, 0)
    AIE.useLock(%326, Acquire, 1)
    AIE.useLock(%325, Acquire, 1)
    call @extern_kernel(%330, %327, %328, %329) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%325, Release, 0)
    AIE.useLock(%326, Release, 0)
    AIE.useLock(%336, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %332 = AIE.mem(%323) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%325, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%329 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%325, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%326, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%328 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%326, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %333 = AIE.tile(16, 3)
  %334 = AIE.switchbox(%333) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %434)
    %438 = AIE.masterset(DMA : 1, %436)
    %439 = AIE.masterset(North : 0, %435)
    %440 = AIE.masterset(North : 1, %433)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %436)
      AIE.rule(30, 6, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %434)
      AIE.rule(30, 2, %435)
    }
  }
  %335 = AIE.lock(%333, 2)
  %336 = AIE.lock(%333, 1)
  %337 = AIE.lock(%333, 0)
  %338 = AIE.buffer(%333) : memref<32x32xf32>
  %339 = AIE.buffer(%333) : memref<32x32xf32>
  %340 = AIE.buffer(%333) : memref<32x32xf32>
  %341 = AIE.core(%333) {
    AIE.useLock(%336, Acquire, 1)
    AIE.useLock(%347, Acquire, 0)
    AIE.useLock(%335, Acquire, 1)
    AIE.useLock(%337, Acquire, 1)
    call @extern_kernel(%327, %338, %339, %340) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%337, Release, 0)
    AIE.useLock(%335, Release, 0)
    AIE.useLock(%347, Release, 1)
    AIE.useLock(%336, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %342 = AIE.mem(%333) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%337, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%339 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%337, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%335, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%340 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%335, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %343 = AIE.tile(16, 4)
  %344 = AIE.switchbox(%343) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %433)
    %438 = AIE.masterset(DMA : 1, %434)
    %439 = AIE.masterset(North : 0, %436)
    %440 = AIE.masterset(North : 1, %435)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %433)
      AIE.rule(31, 7, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %434)
      AIE.rule(31, 3, %436)
    }
  }
  %345 = AIE.lock(%343, 2)
  %346 = AIE.lock(%343, 1)
  %347 = AIE.lock(%343, 0)
  %348 = AIE.buffer(%343) : memref<32x32xf32>
  %349 = AIE.buffer(%343) : memref<32x32xf32>
  %350 = AIE.buffer(%343) : memref<32x32xf32>
  %351 = AIE.core(%343) {
    AIE.useLock(%345, Acquire, 1)
    AIE.useLock(%347, Acquire, 1)
    AIE.useLock(%357, Acquire, 0)
    AIE.useLock(%346, Acquire, 1)
    call @extern_kernel(%338, %348, %349, %350) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%346, Release, 0)
    AIE.useLock(%357, Release, 1)
    AIE.useLock(%347, Release, 0)
    AIE.useLock(%345, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %352 = AIE.mem(%343) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%346, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%350 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%346, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%345, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%349 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%345, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %353 = AIE.tile(16, 5) {polyaie.leaf}
  %354 = AIE.switchbox(%353) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %436)
    %438 = AIE.masterset(DMA : 1, %435)
    %439 = AIE.masterset(West : 0, %434)
    %440 = AIE.masterset(West : 1, %433)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %433)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %436)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %435)
    }
  }
  %355 = AIE.lock(%353, 3)
  %356 = AIE.lock(%353, 2)
  %357 = AIE.lock(%353, 1)
  %358 = AIE.lock(%353, 0)
  %359 = AIE.buffer(%353) : memref<32x32xf32>
  %360 = AIE.buffer(%353) : memref<32x32xf32>
  %361 = AIE.buffer(%353) : memref<32x32xf32>
  %362 = AIE.core(%353) {
    AIE.useLock(%356, Acquire, 1)
    AIE.useLock(%358, Acquire, 0)
    AIE.useLock(%357, Acquire, 1)
    AIE.useLock(%355, Acquire, 1)
    call @extern_kernel(%348, %359, %360, %361) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%355, Release, 0)
    AIE.useLock(%357, Release, 0)
    AIE.useLock(%358, Release, 1)
    AIE.useLock(%356, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %363 = AIE.mem(%353) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%355, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%361 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%355, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%356, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%360 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%356, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%358, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%359 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%358, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %364 = AIE.tile(17, 2)
  %365 = AIE.switchbox(%364) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %436)
    %438 = AIE.masterset(DMA : 1, %433)
    %439 = AIE.masterset(North : 0, %434)
    %440 = AIE.masterset(North : 1, %435)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %436)
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %433)
      AIE.rule(28, 0, %434)
    }
  }
  %366 = AIE.lock(%364, 1)
  %367 = AIE.lock(%364, 0)
  %368 = AIE.buffer(%364) : memref<32x32xf32>
  %369 = AIE.buffer(%364) : memref<32x32xf32>
  %370 = AIE.buffer(%364) : memref<32x32xf32>
  %371 = AIE.buffer(%364) : memref<32x32xf32>
  %372 = AIE.core(%364) {
    AIE.useLock(%377, Acquire, 0)
    AIE.useLock(%367, Acquire, 1)
    AIE.useLock(%366, Acquire, 1)
    call @extern_kernel(%371, %368, %369, %370) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%366, Release, 0)
    AIE.useLock(%367, Release, 0)
    AIE.useLock(%377, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %373 = AIE.mem(%364) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%366, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%370 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%366, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%367, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%369 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%367, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %374 = AIE.tile(17, 3)
  %375 = AIE.switchbox(%374) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %436)
    %438 = AIE.masterset(DMA : 1, %435)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %434)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %435)
      AIE.rule(30, 6, %434)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %436)
      AIE.rule(30, 2, %433)
    }
  }
  %376 = AIE.lock(%374, 2)
  %377 = AIE.lock(%374, 1)
  %378 = AIE.lock(%374, 0)
  %379 = AIE.buffer(%374) : memref<32x32xf32>
  %380 = AIE.buffer(%374) : memref<32x32xf32>
  %381 = AIE.buffer(%374) : memref<32x32xf32>
  %382 = AIE.core(%374) {
    AIE.useLock(%377, Acquire, 1)
    AIE.useLock(%376, Acquire, 1)
    AIE.useLock(%388, Acquire, 0)
    AIE.useLock(%378, Acquire, 1)
    call @extern_kernel(%368, %379, %380, %381) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%378, Release, 0)
    AIE.useLock(%388, Release, 1)
    AIE.useLock(%376, Release, 0)
    AIE.useLock(%377, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %383 = AIE.mem(%374) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%378, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%380 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%378, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%376, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%381 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%376, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %384 = AIE.tile(17, 4)
  %385 = AIE.switchbox(%384) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(DMA : 0, %436)
    %438 = AIE.masterset(DMA : 1, %434)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %435)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %436)
      AIE.rule(31, 7, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %434)
      AIE.rule(31, 3, %433)
    }
  }
  %386 = AIE.lock(%384, 2)
  %387 = AIE.lock(%384, 1)
  %388 = AIE.lock(%384, 0)
  %389 = AIE.buffer(%384) : memref<32x32xf32>
  %390 = AIE.buffer(%384) : memref<32x32xf32>
  %391 = AIE.buffer(%384) : memref<32x32xf32>
  %392 = AIE.core(%384) {
    AIE.useLock(%386, Acquire, 1)
    AIE.useLock(%387, Acquire, 1)
    AIE.useLock(%388, Acquire, 1)
    AIE.useLock(%399, Acquire, 0)
    call @extern_kernel(%379, %389, %390, %391) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%399, Release, 1)
    AIE.useLock(%388, Release, 0)
    AIE.useLock(%387, Release, 0)
    AIE.useLock(%386, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %393 = AIE.mem(%384) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%387, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%391 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%387, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%386, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%390 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%386, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %394 = AIE.tile(17, 5) {polyaie.leaf}
  %395 = AIE.switchbox(%394) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.masterset(DMA : 0, %435)
    %437 = AIE.masterset(DMA : 1, %433)
    %438 = AIE.masterset(West : 0, %434)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %434)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %433)
    }
  }
  %396 = AIE.lock(%394, 3)
  %397 = AIE.lock(%394, 2)
  %398 = AIE.lock(%394, 1)
  %399 = AIE.lock(%394, 0)
  %400 = AIE.buffer(%394) : memref<32x32xf32>
  %401 = AIE.buffer(%394) : memref<32x32xf32>
  %402 = AIE.buffer(%394) : memref<32x32xf32>
  %403 = AIE.core(%394) {
    AIE.useLock(%397, Acquire, 1)
    AIE.useLock(%396, Acquire, 0)
    AIE.useLock(%399, Acquire, 1)
    AIE.useLock(%398, Acquire, 1)
    call @extern_kernel(%389, %400, %401, %402) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%398, Release, 0)
    AIE.useLock(%399, Release, 0)
    AIE.useLock(%396, Release, 1)
    AIE.useLock(%397, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %404 = AIE.mem(%394) {
    %433 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%398, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%402 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%398, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %434 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%397, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%401 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%397, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %435 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%396, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%400 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%396, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %405 = AIE.tile(12, 0)
  %406 = AIE.switchbox(%405) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<0> (3)
    %439 = AIE.masterset(West : 0, %433)
    %440 = AIE.masterset(West : 1, %436)
    %441 = AIE.masterset(North : 0, %437)
    %442 = AIE.masterset(North : 1, %435)
    %443 = AIE.masterset(East : 0, %437)
    %444 = AIE.masterset(East : 1, %434)
    %445 = AIE.masterset(East : 2, %435)
    %446 = AIE.masterset(East : 3, %438)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %436)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %433)
    }
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %438)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %437)
    }
  }
  %407 = AIE.tile(13, 0)
  %408 = AIE.switchbox(%407) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<0> (2)
    %437 = AIE.amsel<0> (3)
    %438 = AIE.masterset(North : 0, %433)
    %439 = AIE.masterset(North : 1, %435)
    %440 = AIE.masterset(East : 0, %434)
    %441 = AIE.masterset(East : 1, %436)
    %442 = AIE.masterset(East : 2, %437)
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %437)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %436)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %433)
    }
  }
  %409 = AIE.tile(16, 0)
  %410 = AIE.switchbox(%409) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.masterset(West : 0, %435)
    %437 = AIE.masterset(West : 1, %433)
    %438 = AIE.masterset(North : 0, %435)
    %439 = AIE.masterset(North : 1, %434)
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %435)
    }
  }
  %411 = AIE.tile(16, 1)
  %412 = AIE.switchbox(%411) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.masterset(North : 0, %434)
    %436 = AIE.masterset(North : 1, %433)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %434)
    }
  }
  %413 = AIE.tile(15, 1)
  %414 = AIE.switchbox(%413) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.masterset(North : 0, %434)
    %436 = AIE.masterset(North : 1, %433)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %434)
    }
  }
  %415 = AIE.tile(17, 1)
  %416 = AIE.switchbox(%415) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.masterset(North : 0, %433)
    %436 = AIE.masterset(North : 1, %434)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %433)
    }
  }
  %417 = AIE.tile(17, 0)
  %418 = AIE.switchbox(%417) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.masterset(West : 0, %433)
    %436 = AIE.masterset(West : 1, %434)
    %437 = AIE.masterset(North : 0, %433)
    %438 = AIE.masterset(North : 1, %434)
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %433)
    }
  }
  %419 = AIE.tile(14, 0)
  %420 = AIE.switchbox(%419) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<0> (2)
    %437 = AIE.amsel<0> (3)
    %438 = AIE.masterset(West : 0, %433)
    %439 = AIE.masterset(North : 0, %437)
    %440 = AIE.masterset(North : 1, %435)
    %441 = AIE.masterset(East : 0, %436)
    %442 = AIE.masterset(East : 1, %434)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %436)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %435)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %437)
    }
  }
  %421 = AIE.tile(12, 1)
  %422 = AIE.switchbox(%421) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<0> (3)
    %439 = AIE.masterset(South : 0, %434)
    %440 = AIE.masterset(South : 1, %437)
    %441 = AIE.masterset(West : 0, %436)
    %442 = AIE.masterset(West : 1, %438)
    %443 = AIE.masterset(North : 0, %433)
    %444 = AIE.masterset(North : 1, %435)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %436)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %433)
    }
  }
  %423 = AIE.tile(15, 0)
  %424 = AIE.switchbox(%423) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.amsel<0> (2)
    %436 = AIE.amsel<0> (3)
    %437 = AIE.masterset(West : 0, %433)
    %438 = AIE.masterset(West : 1, %434)
    %439 = AIE.masterset(North : 0, %433)
    %440 = AIE.masterset(North : 1, %436)
    %441 = AIE.masterset(East : 0, %435)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %436)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %435)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %434)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %433)
    }
  }
  %425 = AIE.tile(11, 1)
  %426 = AIE.switchbox(%425) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<2> (0)
    %436 = AIE.amsel<0> (1)
    %437 = AIE.amsel<1> (1)
    %438 = AIE.amsel<2> (1)
    %439 = AIE.amsel<0> (2)
    %440 = AIE.amsel<1> (2)
    %441 = AIE.amsel<0> (3)
    %442 = AIE.amsel<1> (3)
    %443 = AIE.masterset(South : 0, %439)
    %444 = AIE.masterset(South : 1, %442)
    %445 = AIE.masterset(South : 2, %440)
    %446 = AIE.masterset(South : 3, %437)
    %447 = AIE.masterset(West : 0, %434)
    %448 = AIE.masterset(West : 1, %438)
    %449 = AIE.masterset(North : 0, %436)
    %450 = AIE.masterset(North : 1, %433)
    %451 = AIE.masterset(East : 0, %441)
    %452 = AIE.masterset(East : 1, %435)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %435)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %434)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %440)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %439)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %436)
    }
  }
  %427 = AIE.tile(14, 1)
  %428 = AIE.switchbox(%427) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.masterset(North : 0, %434)
    %436 = AIE.masterset(North : 1, %433)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %434)
    }
  }
  %429 = AIE.tile(13, 1)
  %430 = AIE.switchbox(%429) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<0> (1)
    %435 = AIE.masterset(North : 0, %434)
    %436 = AIE.masterset(North : 1, %433)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %434)
    }
  }
  %431 = AIE.tile(10, 1)
  %432 = AIE.switchbox(%431) {
    %433 = AIE.amsel<0> (0)
    %434 = AIE.amsel<1> (0)
    %435 = AIE.amsel<0> (1)
    %436 = AIE.amsel<1> (1)
    %437 = AIE.amsel<0> (2)
    %438 = AIE.amsel<0> (3)
    %439 = AIE.masterset(South : 0, %436)
    %440 = AIE.masterset(South : 1, %438)
    %441 = AIE.masterset(North : 0, %435)
    %442 = AIE.masterset(North : 1, %433)
    %443 = AIE.masterset(East : 0, %434)
    %444 = AIE.masterset(East : 1, %437)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %437)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %434)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %438)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %436)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %433)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %435)
    }
  }
}


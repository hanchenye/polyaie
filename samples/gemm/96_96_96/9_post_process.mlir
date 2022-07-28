module @gemm {
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
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(South : 2, %395)
    %398 = AIE.masterset(South : 3, %396)
    %399 = AIE.masterset(North : 0, %393)
    %400 = AIE.masterset(North : 1, %394)
    %401 = AIE.masterset(East : 0, %393)
    %402 = AIE.masterset(East : 1, %394)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %396)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %396)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %396)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %396)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %395)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %395)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %395)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %393)
    }
  }
  %6 = AIE.lock(%3, 5)
  %7 = AIE.lock(%3, 4)
  %8 = AIE.lock(%3, 3)
  %9 = AIE.lock(%3, 2)
  %10 = AIE.lock(%3, 1)
  %11 = AIE.lock(%3, 0)
  %12 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %13 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %14 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %15 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %16 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %17 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %18 = AIE.external_buffer 90112 {sym_name = "buf6"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %18) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %19 = AIE.external_buffer 98304 {sym_name = "buf7"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %19) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %20 = AIE.external_buffer 106496 {sym_name = "buf8"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %20) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %21 = AIE.external_buffer 114688 {sym_name = "buf9"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %21) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %22 = AIE.external_buffer 122880 {sym_name = "buf10"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %22) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %23 = AIE.external_buffer 131072 {sym_name = "buf11"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %23) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %24 = AIE.external_buffer 139264 {sym_name = "buf12"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %24) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %25 = AIE.external_buffer 147456 {sym_name = "buf13"} : memref<1025xf32>
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
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
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
    %394 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
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
    %395 = AIE.dmaStart(MM2S0, ^bb11, ^bb14)
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
    %396 = AIE.dmaStart(MM2S1, ^bb15, ^bb18)
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
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.masterset(West : 0, %395)
    %397 = AIE.masterset(West : 1, %394)
    %398 = AIE.masterset(North : 0, %394)
    %399 = AIE.masterset(North : 1, %393)
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %395)
    }
  }
  %31 = AIE.lock(%28, 5)
  %32 = AIE.lock(%28, 4)
  %33 = AIE.lock(%28, 3)
  %34 = AIE.lock(%28, 2)
  %35 = AIE.lock(%28, 1)
  %36 = AIE.lock(%28, 0)
  %37 = AIE.external_buffer 40960 {sym_name = "buf14"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %38 = AIE.external_buffer 45056 {sym_name = "buf15"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %39 = AIE.external_buffer 49152 {sym_name = "buf16"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %40 = AIE.external_buffer 53248 {sym_name = "buf17"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%40, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %41 = AIE.external_buffer 57344 {sym_name = "buf18"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%41, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %42 = AIE.external_buffer 61440 {sym_name = "buf19"} : memref<32x32xf32>
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
    %393 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
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
    %394 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
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
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<0> (3)
    %399 = AIE.masterset(South : 2, %396)
    %400 = AIE.masterset(West : 0, %395)
    %401 = AIE.masterset(North : 0, %393)
    %402 = AIE.masterset(North : 1, %394)
    %403 = AIE.masterset(East : 0, %397)
    %404 = AIE.masterset(East : 1, %393)
    %405 = AIE.masterset(East : 2, %394)
    %406 = AIE.masterset(East : 3, %398)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %396)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %395)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %398)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %393)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %397)
    }
  }
  %48 = AIE.lock(%45, 5)
  %49 = AIE.lock(%45, 4)
  %50 = AIE.lock(%45, 3)
  %51 = AIE.lock(%45, 2)
  %52 = AIE.lock(%45, 1)
  %53 = AIE.lock(%45, 0)
  %54 = AIE.external_buffer 65536 {sym_name = "buf20"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%54, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %55 = AIE.external_buffer 69632 {sym_name = "buf21"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%55, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %56 = AIE.external_buffer 73728 {sym_name = "buf22"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %57 = AIE.external_buffer 77824 {sym_name = "buf23"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %58 = AIE.external_buffer 81920 {sym_name = "buf24"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%58, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %59 = AIE.external_buffer 86016 {sym_name = "buf25"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%59, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %60 = AIE.external_buffer 155648 {sym_name = "buf26"} : memref<1025xf32>
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
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBd(<%60 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(MM2S0, ^bb3, ^bb6)
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
    %395 = AIE.dmaStart(MM2S1, ^bb7, ^bb10)
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
  %64 = AIE.core(%63) {
    AIE.end
  }
  %65 = AIE.tile(10, 2)
  %66 = AIE.switchbox(%65) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<2> (0)
    %396 = AIE.amsel<0> (1)
    %397 = AIE.amsel<1> (1)
    %398 = AIE.amsel<2> (1)
    %399 = AIE.amsel<0> (2)
    %400 = AIE.amsel<1> (2)
    %401 = AIE.amsel<2> (2)
    %402 = AIE.amsel<0> (3)
    %403 = AIE.amsel<1> (3)
    %404 = AIE.amsel<2> (3)
    %405 = AIE.masterset(DMA : 0, %399)
    %406 = AIE.masterset(DMA : 1, %393)
    %407 = AIE.masterset(South : 0, %400)
    %408 = AIE.masterset(South : 1, %404)
    %409 = AIE.masterset(South : 2, %395)
    %410 = AIE.masterset(South : 3, %401)
    %411 = AIE.masterset(West : 0, %398)
    %412 = AIE.masterset(North : 0, %403)
    %413 = AIE.masterset(North : 1, %402)
    %414 = AIE.masterset(East : 0, %394)
    %415 = AIE.masterset(East : 1, %396)
    %416 = AIE.masterset(East : 2, %397)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %397)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %396)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %394)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %398)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %401)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %404)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %400)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %393)
      AIE.rule(28, 0, %402)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %399)
      AIE.rule(28, 4, %403)
    }
  }
  %67 = AIE.lock(%65, 1)
  %68 = AIE.lock(%65, 0)
  %69 = AIE.buffer(%65) {sym_name = "buf27"} : memref<32x32xf32>
  %70 = AIE.buffer(%65) {sym_name = "buf28"} : memref<32x32xf32>
  %71 = AIE.buffer(%65) {sym_name = "buf29"} : memref<32x32xf32>
  %72 = AIE.buffer(%65) {sym_name = "buf30"} : memref<32x32xf32>
  %73 = AIE.core(%65) {
    AIE.useLock(%67, Acquire, 1)
    AIE.useLock(%77, Acquire, 0)
    AIE.useLock(%68, Acquire, 1)
    call @extern_kernel(%72, %69, %70, %71) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%68, Release, 0)
    AIE.useLock(%77, Release, 1)
    AIE.useLock(%67, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %74 = AIE.mem(%65) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%68, Acquire, 0)
    AIE.dmaBd(<%71 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%68, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%67, Acquire, 0)
    AIE.dmaBd(<%70 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%67, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %75 = AIE.tile(10, 3)
  %76 = AIE.switchbox(%75) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<2> (0)
    %396 = AIE.amsel<0> (1)
    %397 = AIE.amsel<1> (1)
    %398 = AIE.amsel<2> (1)
    %399 = AIE.amsel<0> (2)
    %400 = AIE.amsel<1> (2)
    %401 = AIE.amsel<2> (2)
    %402 = AIE.amsel<0> (3)
    %403 = AIE.amsel<1> (3)
    %404 = AIE.amsel<2> (3)
    %405 = AIE.masterset(DMA : 0, %393)
    %406 = AIE.masterset(DMA : 1, %404)
    %407 = AIE.masterset(South : 0, %403)
    %408 = AIE.masterset(South : 1, %401)
    %409 = AIE.masterset(South : 2, %398)
    %410 = AIE.masterset(South : 3, %400)
    %411 = AIE.masterset(West : 0, %395)
    %412 = AIE.masterset(West : 1, %397)
    %413 = AIE.masterset(West : 2, %399)
    %414 = AIE.masterset(North : 0, %396)
    %415 = AIE.masterset(North : 1, %394)
    %416 = AIE.masterset(East : 0, %402)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %399)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %397)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %395)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %402)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %400)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %398)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %401)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %403)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %404)
      AIE.rule(31, 2, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %393)
      AIE.rule(31, 6, %396)
    }
  }
  %77 = AIE.lock(%75, 2)
  %78 = AIE.lock(%75, 1)
  %79 = AIE.lock(%75, 0)
  %80 = AIE.buffer(%75) {sym_name = "buf31"} : memref<32x32xf32>
  %81 = AIE.buffer(%75) {sym_name = "buf32"} : memref<32x32xf32>
  %82 = AIE.buffer(%75) {sym_name = "buf33"} : memref<32x32xf32>
  %83 = AIE.core(%75) {
    AIE.useLock(%89, Acquire, 0)
    AIE.useLock(%79, Acquire, 1)
    AIE.useLock(%77, Acquire, 1)
    AIE.useLock(%78, Acquire, 1)
    call @extern_kernel(%69, %80, %81, %82) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%78, Release, 0)
    AIE.useLock(%77, Release, 0)
    AIE.useLock(%79, Release, 0)
    AIE.useLock(%89, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %84 = AIE.mem(%75) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%78, Acquire, 0)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%78, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %85 = AIE.tile(10, 4) {polyaie.leaf}
  %86 = AIE.lock(%85, 15)
  %87 = AIE.switchbox(%85) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<1> (2)
    %399 = AIE.amsel<0> (3)
    %400 = AIE.masterset(DMA : 0, %397)
    %401 = AIE.masterset(DMA : 1, %398)
    %402 = AIE.masterset(South : 0, %393)
    %403 = AIE.masterset(South : 1, %396)
    %404 = AIE.masterset(South : 2, %399)
    %405 = AIE.masterset(South : 3, %394)
    %406 = AIE.masterset(West : 0, %395)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %395)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %399)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %396)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %397)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %398)
    }
  }
  %88 = AIE.lock(%85, 3)
  %89 = AIE.lock(%85, 2)
  %90 = AIE.lock(%85, 1)
  %91 = AIE.lock(%85, 0)
  %92 = AIE.buffer(%85) {sym_name = "buf34"} : memref<32x32xf32>
  %93 = AIE.buffer(%85) {sym_name = "buf35"} : memref<32x32xf32>
  %94 = AIE.buffer(%85) {sym_name = "buf36"} : memref<32x32xf32>
  %95 = AIE.core(%85) {
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%88, Acquire, 1)
    AIE.useLock(%90, Acquire, 0)
    AIE.useLock(%91, Acquire, 1)
    call @extern_kernel(%80, %92, %93, %94) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%91, Release, 0)
    AIE.useLock(%90, Release, 1)
    AIE.useLock(%88, Release, 0)
    AIE.useLock(%89, Release, 0)
    AIE.useLock(%86, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %96 = AIE.mem(%85) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%91, Acquire, 0)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%91, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%88, Acquire, 0)
    AIE.dmaBd(<%94 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<2> (0)
    %396 = AIE.amsel<0> (1)
    %397 = AIE.amsel<1> (1)
    %398 = AIE.amsel<0> (2)
    %399 = AIE.amsel<1> (2)
    %400 = AIE.amsel<0> (3)
    %401 = AIE.amsel<1> (3)
    %402 = AIE.masterset(DMA : 0, %401)
    %403 = AIE.masterset(DMA : 1, %397)
    %404 = AIE.masterset(South : 0, %399)
    %405 = AIE.masterset(South : 1, %398)
    %406 = AIE.masterset(South : 2, %394)
    %407 = AIE.masterset(South : 3, %393)
    %408 = AIE.masterset(West : 0, %396)
    %409 = AIE.masterset(North : 0, %400)
    %410 = AIE.masterset(North : 1, %395)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %398)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %399)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %396)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %397)
      AIE.rule(28, 4, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %401)
      AIE.rule(28, 0, %400)
    }
  }
  %99 = AIE.lock(%97, 1)
  %100 = AIE.lock(%97, 0)
  %101 = AIE.buffer(%97) {sym_name = "buf37"} : memref<32x32xf32>
  %102 = AIE.buffer(%97) {sym_name = "buf38"} : memref<32x32xf32>
  %103 = AIE.buffer(%97) {sym_name = "buf39"} : memref<32x32xf32>
  %104 = AIE.buffer(%97) {sym_name = "buf40"} : memref<32x32xf32>
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
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%100, Acquire, 0)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%100, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<2> (0)
    %396 = AIE.amsel<0> (1)
    %397 = AIE.amsel<1> (1)
    %398 = AIE.amsel<0> (2)
    %399 = AIE.amsel<1> (2)
    %400 = AIE.amsel<0> (3)
    %401 = AIE.amsel<1> (3)
    %402 = AIE.masterset(DMA : 0, %400)
    %403 = AIE.masterset(DMA : 1, %395)
    %404 = AIE.masterset(South : 0, %401)
    %405 = AIE.masterset(South : 1, %399)
    %406 = AIE.masterset(West : 0, %397)
    %407 = AIE.masterset(West : 1, %393)
    %408 = AIE.masterset(West : 2, %394)
    %409 = AIE.masterset(North : 0, %396)
    %410 = AIE.masterset(North : 1, %398)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %399)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %393)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %397)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %401)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %400)
      AIE.rule(31, 6, %398)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %395)
      AIE.rule(31, 2, %396)
    }
  }
  %109 = AIE.lock(%107, 2)
  %110 = AIE.lock(%107, 1)
  %111 = AIE.lock(%107, 0)
  %112 = AIE.buffer(%107) {sym_name = "buf41"} : memref<32x32xf32>
  %113 = AIE.buffer(%107) {sym_name = "buf42"} : memref<32x32xf32>
  %114 = AIE.buffer(%107) {sym_name = "buf43"} : memref<32x32xf32>
  %115 = AIE.core(%107) {
    AIE.useLock(%120, Acquire, 0)
    AIE.useLock(%110, Acquire, 1)
    AIE.useLock(%111, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    call @extern_kernel(%101, %112, %113, %114) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%111, Release, 0)
    AIE.useLock(%110, Release, 0)
    AIE.useLock(%120, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %116 = AIE.mem(%107) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%109, Acquire, 0)
    AIE.dmaBd(<%114 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%110, Acquire, 0)
    AIE.dmaBd(<%113 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%110, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %117 = AIE.tile(11, 4) {polyaie.leaf}
  %118 = AIE.lock(%117, 15)
  %119 = AIE.switchbox(%117) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<1> (2)
    %399 = AIE.amsel<0> (3)
    %400 = AIE.masterset(DMA : 0, %395)
    %401 = AIE.masterset(DMA : 1, %398)
    %402 = AIE.masterset(South : 0, %399)
    %403 = AIE.masterset(West : 0, %394)
    %404 = AIE.masterset(West : 1, %396)
    %405 = AIE.masterset(West : 2, %397)
    %406 = AIE.masterset(West : 3, %393)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 1, %399)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %397)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %396)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %394)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %398)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %395)
    }
  }
  %120 = AIE.lock(%117, 3)
  %121 = AIE.lock(%117, 2)
  %122 = AIE.lock(%117, 1)
  %123 = AIE.lock(%117, 0)
  %124 = AIE.buffer(%117) {sym_name = "buf44"} : memref<32x32xf32>
  %125 = AIE.buffer(%117) {sym_name = "buf45"} : memref<32x32xf32>
  %126 = AIE.buffer(%117) {sym_name = "buf46"} : memref<32x32xf32>
  %127 = AIE.core(%117) {
    AIE.useLock(%121, Acquire, 1)
    AIE.useLock(%120, Acquire, 1)
    AIE.useLock(%122, Acquire, 0)
    AIE.useLock(%123, Acquire, 1)
    call @extern_kernel(%112, %124, %125, %126) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%123, Release, 0)
    AIE.useLock(%122, Release, 1)
    AIE.useLock(%120, Release, 0)
    AIE.useLock(%121, Release, 0)
    AIE.useLock(%118, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %128 = AIE.mem(%117) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%123, Acquire, 0)
    AIE.dmaBd(<%125 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%123, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%121, Acquire, 0)
    AIE.dmaBd(<%126 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%121, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%122, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%124 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%122, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %129 = AIE.tile(12, 2)
  %130 = AIE.switchbox(%129) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %396)
    %398 = AIE.masterset(DMA : 1, %393)
    %399 = AIE.masterset(North : 0, %395)
    %400 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %396)
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %393)
      AIE.rule(28, 0, %395)
    }
  }
  %131 = AIE.lock(%129, 1)
  %132 = AIE.lock(%129, 0)
  %133 = AIE.buffer(%129) {sym_name = "buf47"} : memref<32x32xf32>
  %134 = AIE.buffer(%129) {sym_name = "buf48"} : memref<32x32xf32>
  %135 = AIE.buffer(%129) {sym_name = "buf49"} : memref<32x32xf32>
  %136 = AIE.buffer(%129) {sym_name = "buf50"} : memref<32x32xf32>
  %137 = AIE.core(%129) {
    AIE.useLock(%131, Acquire, 1)
    AIE.useLock(%141, Acquire, 0)
    AIE.useLock(%132, Acquire, 1)
    call @extern_kernel(%136, %133, %134, %135) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%132, Release, 0)
    AIE.useLock(%141, Release, 1)
    AIE.useLock(%131, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %138 = AIE.mem(%129) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%132, Acquire, 0)
    AIE.dmaBd(<%135 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%132, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%131, Acquire, 0)
    AIE.dmaBd(<%134 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%131, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %139 = AIE.tile(12, 3)
  %140 = AIE.switchbox(%139) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<1> (2)
    %399 = AIE.amsel<0> (3)
    %400 = AIE.masterset(DMA : 0, %399)
    %401 = AIE.masterset(DMA : 1, %393)
    %402 = AIE.masterset(West : 0, %394)
    %403 = AIE.masterset(West : 1, %395)
    %404 = AIE.masterset(West : 2, %398)
    %405 = AIE.masterset(North : 0, %397)
    %406 = AIE.masterset(North : 1, %396)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %398)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %395)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %394)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %399)
      AIE.rule(31, 6, %396)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %393)
      AIE.rule(31, 2, %397)
    }
  }
  %141 = AIE.lock(%139, 2)
  %142 = AIE.lock(%139, 1)
  %143 = AIE.lock(%139, 0)
  %144 = AIE.buffer(%139) {sym_name = "buf51"} : memref<32x32xf32>
  %145 = AIE.buffer(%139) {sym_name = "buf52"} : memref<32x32xf32>
  %146 = AIE.buffer(%139) {sym_name = "buf53"} : memref<32x32xf32>
  %147 = AIE.core(%139) {
    AIE.useLock(%143, Acquire, 1)
    AIE.useLock(%141, Acquire, 1)
    AIE.useLock(%142, Acquire, 1)
    AIE.useLock(%154, Acquire, 0)
    call @extern_kernel(%133, %144, %145, %146) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%154, Release, 1)
    AIE.useLock(%142, Release, 0)
    AIE.useLock(%141, Release, 0)
    AIE.useLock(%143, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %148 = AIE.mem(%139) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%142, Acquire, 0)
    AIE.dmaBd(<%146 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%142, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%143, Acquire, 0)
    AIE.dmaBd(<%145 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%143, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %149 = AIE.tile(12, 4) {polyaie.leaf}
  %150 = AIE.lock(%149, 15)
  %151 = AIE.switchbox(%149) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<1> (2)
    %399 = AIE.amsel<0> (3)
    %400 = AIE.masterset(DMA : 0, %397)
    %401 = AIE.masterset(DMA : 1, %395)
    %402 = AIE.masterset(South : 0, %394)
    %403 = AIE.masterset(West : 0, %398)
    %404 = AIE.masterset(West : 1, %396)
    %405 = AIE.masterset(West : 2, %393)
    %406 = AIE.masterset(West : 3, %399)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 2, %394)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 1, %399)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %396)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %398)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %397)
    }
  }
  %152 = AIE.lock(%149, 3)
  %153 = AIE.lock(%149, 2)
  %154 = AIE.lock(%149, 1)
  %155 = AIE.lock(%149, 0)
  %156 = AIE.buffer(%149) {sym_name = "buf54"} : memref<32x32xf32>
  %157 = AIE.buffer(%149) {sym_name = "buf55"} : memref<32x32xf32>
  %158 = AIE.buffer(%149) {sym_name = "buf56"} : memref<32x32xf32>
  %159 = AIE.core(%149) {
    AIE.useLock(%152, Acquire, 1)
    AIE.useLock(%154, Acquire, 1)
    AIE.useLock(%153, Acquire, 0)
    AIE.useLock(%155, Acquire, 1)
    call @extern_kernel(%144, %156, %157, %158) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%155, Release, 0)
    AIE.useLock(%153, Release, 1)
    AIE.useLock(%154, Release, 0)
    AIE.useLock(%152, Release, 0)
    AIE.useLock(%150, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %160 = AIE.mem(%149) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%155, Acquire, 0)
    AIE.dmaBd(<%157 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%155, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%152, Acquire, 0)
    AIE.dmaBd(<%158 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%152, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%153, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%156 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%153, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %161 = AIE.tile(13, 2)
  %162 = AIE.switchbox(%161) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %395)
    %398 = AIE.masterset(DMA : 1, %396)
    %399 = AIE.masterset(North : 0, %393)
    %400 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %396)
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %395)
      AIE.rule(28, 4, %393)
    }
  }
  %163 = AIE.lock(%161, 1)
  %164 = AIE.lock(%161, 0)
  %165 = AIE.buffer(%161) {sym_name = "buf57"} : memref<32x32xf32>
  %166 = AIE.buffer(%161) {sym_name = "buf58"} : memref<32x32xf32>
  %167 = AIE.buffer(%161) {sym_name = "buf59"} : memref<32x32xf32>
  %168 = AIE.buffer(%161) {sym_name = "buf60"} : memref<32x32xf32>
  %169 = AIE.core(%161) {
    AIE.useLock(%174, Acquire, 0)
    AIE.useLock(%164, Acquire, 1)
    AIE.useLock(%163, Acquire, 1)
    call @extern_kernel(%168, %165, %166, %167) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%163, Release, 0)
    AIE.useLock(%164, Release, 0)
    AIE.useLock(%174, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %170 = AIE.mem(%161) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%163, Acquire, 0)
    AIE.dmaBd(<%167 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%163, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%164, Acquire, 0)
    AIE.dmaBd(<%166 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%164, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %171 = AIE.tile(13, 3)
  %172 = AIE.switchbox(%171) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<0> (3)
    %399 = AIE.masterset(DMA : 0, %393)
    %400 = AIE.masterset(DMA : 1, %398)
    %401 = AIE.masterset(West : 0, %397)
    %402 = AIE.masterset(West : 1, %396)
    %403 = AIE.masterset(North : 0, %394)
    %404 = AIE.masterset(North : 1, %395)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %396)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 3, %397)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %398)
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %393)
      AIE.rule(31, 6, %394)
    }
  }
  %173 = AIE.lock(%171, 2)
  %174 = AIE.lock(%171, 1)
  %175 = AIE.lock(%171, 0)
  %176 = AIE.buffer(%171) {sym_name = "buf61"} : memref<32x32xf32>
  %177 = AIE.buffer(%171) {sym_name = "buf62"} : memref<32x32xf32>
  %178 = AIE.buffer(%171) {sym_name = "buf63"} : memref<32x32xf32>
  %179 = AIE.core(%171) {
    AIE.useLock(%184, Acquire, 0)
    AIE.useLock(%174, Acquire, 1)
    AIE.useLock(%173, Acquire, 1)
    AIE.useLock(%175, Acquire, 1)
    call @extern_kernel(%165, %176, %177, %178) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%175, Release, 0)
    AIE.useLock(%173, Release, 0)
    AIE.useLock(%174, Release, 0)
    AIE.useLock(%184, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %180 = AIE.mem(%171) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%175, Acquire, 0)
    AIE.dmaBd(<%178 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%175, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%173, Acquire, 0)
    AIE.dmaBd(<%177 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%173, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %181 = AIE.tile(13, 4) {polyaie.leaf}
  %182 = AIE.lock(%181, 15)
  %183 = AIE.switchbox(%181) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<1> (2)
    %399 = AIE.amsel<0> (3)
    %400 = AIE.masterset(DMA : 0, %399)
    %401 = AIE.masterset(DMA : 1, %394)
    %402 = AIE.masterset(South : 0, %396)
    %403 = AIE.masterset(West : 0, %398)
    %404 = AIE.masterset(West : 1, %397)
    %405 = AIE.masterset(West : 2, %393)
    %406 = AIE.masterset(West : 3, %395)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 3, %396)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %393)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %397)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %398)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %399)
    }
  }
  %184 = AIE.lock(%181, 3)
  %185 = AIE.lock(%181, 2)
  %186 = AIE.lock(%181, 1)
  %187 = AIE.lock(%181, 0)
  %188 = AIE.buffer(%181) {sym_name = "buf64"} : memref<32x32xf32>
  %189 = AIE.buffer(%181) {sym_name = "buf65"} : memref<32x32xf32>
  %190 = AIE.buffer(%181) {sym_name = "buf66"} : memref<32x32xf32>
  %191 = AIE.core(%181) {
    AIE.useLock(%187, Acquire, 1)
    AIE.useLock(%184, Acquire, 1)
    AIE.useLock(%185, Acquire, 1)
    AIE.useLock(%186, Acquire, 0)
    call @extern_kernel(%176, %188, %189, %190) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%186, Release, 1)
    AIE.useLock(%185, Release, 0)
    AIE.useLock(%184, Release, 0)
    AIE.useLock(%187, Release, 0)
    AIE.useLock(%182, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %192 = AIE.mem(%181) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%185, Acquire, 0)
    AIE.dmaBd(<%190 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%185, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%187, Acquire, 0)
    AIE.dmaBd(<%189 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%187, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%186, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%188 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%186, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %193 = AIE.tile(14, 2)
  %194 = AIE.switchbox(%193) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %394)
    %398 = AIE.masterset(DMA : 1, %395)
    %399 = AIE.masterset(North : 0, %396)
    %400 = AIE.masterset(North : 1, %393)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %395)
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %394)
      AIE.rule(28, 0, %396)
    }
  }
  %195 = AIE.lock(%193, 1)
  %196 = AIE.lock(%193, 0)
  %197 = AIE.buffer(%193) {sym_name = "buf67"} : memref<32x32xf32>
  %198 = AIE.buffer(%193) {sym_name = "buf68"} : memref<32x32xf32>
  %199 = AIE.buffer(%193) {sym_name = "buf69"} : memref<32x32xf32>
  %200 = AIE.buffer(%193) {sym_name = "buf70"} : memref<32x32xf32>
  %201 = AIE.core(%193) {
    AIE.useLock(%195, Acquire, 1)
    AIE.useLock(%205, Acquire, 0)
    AIE.useLock(%196, Acquire, 1)
    call @extern_kernel(%200, %197, %198, %199) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%196, Release, 0)
    AIE.useLock(%205, Release, 1)
    AIE.useLock(%195, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %202 = AIE.mem(%193) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%196, Acquire, 0)
    AIE.dmaBd(<%198 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%196, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%195, Acquire, 0)
    AIE.dmaBd(<%199 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%195, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %203 = AIE.tile(14, 3)
  %204 = AIE.switchbox(%203) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<0> (2)
    %397 = AIE.amsel<0> (3)
    %398 = AIE.masterset(DMA : 0, %396)
    %399 = AIE.masterset(DMA : 1, %397)
    %400 = AIE.masterset(West : 0, %394)
    %401 = AIE.masterset(North : 0, %395)
    %402 = AIE.masterset(North : 1, %393)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %394)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %396)
      AIE.rule(31, 6, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %397)
      AIE.rule(31, 2, %395)
    }
  }
  %205 = AIE.lock(%203, 2)
  %206 = AIE.lock(%203, 1)
  %207 = AIE.lock(%203, 0)
  %208 = AIE.buffer(%203) {sym_name = "buf71"} : memref<32x32xf32>
  %209 = AIE.buffer(%203) {sym_name = "buf72"} : memref<32x32xf32>
  %210 = AIE.buffer(%203) {sym_name = "buf73"} : memref<32x32xf32>
  %211 = AIE.core(%203) {
    AIE.useLock(%216, Acquire, 0)
    AIE.useLock(%205, Acquire, 1)
    AIE.useLock(%206, Acquire, 1)
    AIE.useLock(%207, Acquire, 1)
    call @extern_kernel(%197, %208, %209, %210) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%207, Release, 0)
    AIE.useLock(%206, Release, 0)
    AIE.useLock(%205, Release, 0)
    AIE.useLock(%216, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %212 = AIE.mem(%203) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%207, Acquire, 0)
    AIE.dmaBd(<%210 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%207, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%206, Acquire, 0)
    AIE.dmaBd(<%209 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%206, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %213 = AIE.tile(14, 4) {polyaie.leaf}
  %214 = AIE.lock(%213, 15)
  %215 = AIE.switchbox(%213) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<1> (2)
    %399 = AIE.amsel<0> (3)
    %400 = AIE.masterset(DMA : 0, %399)
    %401 = AIE.masterset(DMA : 1, %396)
    %402 = AIE.masterset(South : 0, %393)
    %403 = AIE.masterset(West : 0, %395)
    %404 = AIE.masterset(West : 1, %394)
    %405 = AIE.masterset(West : 2, %398)
    %406 = AIE.masterset(West : 3, %397)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %397)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %398)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %394)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %395)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %396)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %399)
    }
  }
  %216 = AIE.lock(%213, 3)
  %217 = AIE.lock(%213, 2)
  %218 = AIE.lock(%213, 1)
  %219 = AIE.lock(%213, 0)
  %220 = AIE.buffer(%213) {sym_name = "buf74"} : memref<32x32xf32>
  %221 = AIE.buffer(%213) {sym_name = "buf75"} : memref<32x32xf32>
  %222 = AIE.buffer(%213) {sym_name = "buf76"} : memref<32x32xf32>
  %223 = AIE.core(%213) {
    AIE.useLock(%218, Acquire, 1)
    AIE.useLock(%219, Acquire, 1)
    AIE.useLock(%217, Acquire, 0)
    AIE.useLock(%216, Acquire, 1)
    call @extern_kernel(%208, %220, %221, %222) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%216, Release, 0)
    AIE.useLock(%217, Release, 1)
    AIE.useLock(%219, Release, 0)
    AIE.useLock(%218, Release, 0)
    AIE.useLock(%214, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %224 = AIE.mem(%213) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%219, Acquire, 0)
    AIE.dmaBd(<%221 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%219, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%218, Acquire, 0)
    AIE.dmaBd(<%222 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%218, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%217, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%220 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%217, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %225 = AIE.tile(15, 2)
  %226 = AIE.switchbox(%225) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %394)
    %398 = AIE.masterset(DMA : 1, %396)
    %399 = AIE.masterset(North : 0, %395)
    %400 = AIE.masterset(North : 1, %393)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %394)
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %396)
      AIE.rule(28, 0, %395)
    }
  }
  %227 = AIE.lock(%225, 1)
  %228 = AIE.lock(%225, 0)
  %229 = AIE.buffer(%225) {sym_name = "buf77"} : memref<32x32xf32>
  %230 = AIE.buffer(%225) {sym_name = "buf78"} : memref<32x32xf32>
  %231 = AIE.buffer(%225) {sym_name = "buf79"} : memref<32x32xf32>
  %232 = AIE.buffer(%225) {sym_name = "buf80"} : memref<32x32xf32>
  %233 = AIE.core(%225) {
    AIE.useLock(%237, Acquire, 0)
    AIE.useLock(%228, Acquire, 1)
    AIE.useLock(%227, Acquire, 1)
    call @extern_kernel(%232, %229, %230, %231) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%227, Release, 0)
    AIE.useLock(%228, Release, 0)
    AIE.useLock(%237, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %234 = AIE.mem(%225) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%227, Acquire, 0)
    AIE.dmaBd(<%231 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%227, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%228, Acquire, 0)
    AIE.dmaBd(<%230 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%228, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %235 = AIE.tile(15, 3)
  %236 = AIE.switchbox(%235) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %396)
    %398 = AIE.masterset(DMA : 1, %395)
    %399 = AIE.masterset(North : 0, %393)
    %400 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %396)
      AIE.rule(31, 6, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %395)
      AIE.rule(31, 2, %393)
    }
  }
  %237 = AIE.lock(%235, 2)
  %238 = AIE.lock(%235, 1)
  %239 = AIE.lock(%235, 0)
  %240 = AIE.buffer(%235) {sym_name = "buf81"} : memref<32x32xf32>
  %241 = AIE.buffer(%235) {sym_name = "buf82"} : memref<32x32xf32>
  %242 = AIE.buffer(%235) {sym_name = "buf83"} : memref<32x32xf32>
  %243 = AIE.core(%235) {
    AIE.useLock(%237, Acquire, 1)
    AIE.useLock(%238, Acquire, 1)
    AIE.useLock(%239, Acquire, 1)
    AIE.useLock(%250, Acquire, 0)
    call @extern_kernel(%229, %240, %241, %242) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%250, Release, 1)
    AIE.useLock(%239, Release, 0)
    AIE.useLock(%238, Release, 0)
    AIE.useLock(%237, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %244 = AIE.mem(%235) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%239, Acquire, 0)
    AIE.dmaBd(<%242 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%239, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%238, Acquire, 0)
    AIE.dmaBd(<%241 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%238, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %245 = AIE.tile(15, 4) {polyaie.leaf}
  %246 = AIE.lock(%245, 15)
  %247 = AIE.switchbox(%245) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<0> (3)
    %399 = AIE.masterset(DMA : 0, %398)
    %400 = AIE.masterset(DMA : 1, %396)
    %401 = AIE.masterset(West : 0, %397)
    %402 = AIE.masterset(West : 1, %393)
    %403 = AIE.masterset(West : 2, %394)
    %404 = AIE.masterset(West : 3, %395)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %395)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %393)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %397)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %398)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %396)
    }
  }
  %248 = AIE.lock(%245, 3)
  %249 = AIE.lock(%245, 2)
  %250 = AIE.lock(%245, 1)
  %251 = AIE.lock(%245, 0)
  %252 = AIE.buffer(%245) {sym_name = "buf84"} : memref<32x32xf32>
  %253 = AIE.buffer(%245) {sym_name = "buf85"} : memref<32x32xf32>
  %254 = AIE.buffer(%245) {sym_name = "buf86"} : memref<32x32xf32>
  %255 = AIE.core(%245) {
    AIE.useLock(%251, Acquire, 1)
    AIE.useLock(%248, Acquire, 1)
    AIE.useLock(%249, Acquire, 0)
    AIE.useLock(%250, Acquire, 1)
    call @extern_kernel(%240, %252, %253, %254) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%250, Release, 0)
    AIE.useLock(%249, Release, 1)
    AIE.useLock(%248, Release, 0)
    AIE.useLock(%251, Release, 0)
    AIE.useLock(%246, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %256 = AIE.mem(%245) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%248, Acquire, 0)
    AIE.dmaBd(<%254 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%248, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%251, Acquire, 0)
    AIE.dmaBd(<%253 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%251, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%249, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%252 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%249, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %257 = AIE.tile(16, 2)
  %258 = AIE.switchbox(%257) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %396)
    %398 = AIE.masterset(DMA : 1, %394)
    %399 = AIE.masterset(North : 0, %393)
    %400 = AIE.masterset(North : 1, %395)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %394)
      AIE.rule(28, 0, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %396)
      AIE.rule(28, 4, %393)
    }
  }
  %259 = AIE.lock(%257, 1)
  %260 = AIE.lock(%257, 0)
  %261 = AIE.buffer(%257) {sym_name = "buf87"} : memref<32x32xf32>
  %262 = AIE.buffer(%257) {sym_name = "buf88"} : memref<32x32xf32>
  %263 = AIE.buffer(%257) {sym_name = "buf89"} : memref<32x32xf32>
  %264 = AIE.buffer(%257) {sym_name = "buf90"} : memref<32x32xf32>
  %265 = AIE.core(%257) {
    AIE.useLock(%260, Acquire, 1)
    AIE.useLock(%270, Acquire, 0)
    AIE.useLock(%259, Acquire, 1)
    call @extern_kernel(%264, %261, %262, %263) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%259, Release, 0)
    AIE.useLock(%270, Release, 1)
    AIE.useLock(%260, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %266 = AIE.mem(%257) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%259, Acquire, 0)
    AIE.dmaBd(<%263 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%259, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%260, Acquire, 0)
    AIE.dmaBd(<%262 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%260, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %267 = AIE.tile(16, 3)
  %268 = AIE.switchbox(%267) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %396)
    %398 = AIE.masterset(DMA : 1, %394)
    %399 = AIE.masterset(North : 0, %393)
    %400 = AIE.masterset(North : 1, %395)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %396)
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %394)
      AIE.rule(31, 6, %393)
    }
  }
  %269 = AIE.lock(%267, 2)
  %270 = AIE.lock(%267, 1)
  %271 = AIE.lock(%267, 0)
  %272 = AIE.buffer(%267) {sym_name = "buf91"} : memref<32x32xf32>
  %273 = AIE.buffer(%267) {sym_name = "buf92"} : memref<32x32xf32>
  %274 = AIE.buffer(%267) {sym_name = "buf93"} : memref<32x32xf32>
  %275 = AIE.core(%267) {
    AIE.useLock(%270, Acquire, 1)
    AIE.useLock(%283, Acquire, 0)
    AIE.useLock(%271, Acquire, 1)
    AIE.useLock(%269, Acquire, 1)
    call @extern_kernel(%261, %272, %273, %274) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%269, Release, 0)
    AIE.useLock(%271, Release, 0)
    AIE.useLock(%283, Release, 1)
    AIE.useLock(%270, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %276 = AIE.mem(%267) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%269, Acquire, 0)
    AIE.dmaBd(<%273 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%269, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%271, Acquire, 0)
    AIE.dmaBd(<%274 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%271, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %277 = AIE.tile(16, 4) {polyaie.leaf}
  %278 = AIE.lock(%277, 15)
  %279 = AIE.switchbox(%277) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<0> (2)
    %397 = AIE.amsel<0> (3)
    %398 = AIE.masterset(DMA : 0, %395)
    %399 = AIE.masterset(DMA : 1, %394)
    %400 = AIE.masterset(West : 0, %396)
    %401 = AIE.masterset(West : 1, %393)
    %402 = AIE.masterset(West : 2, %397)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %397)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %393)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %396)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %394)
    }
  }
  %280 = AIE.lock(%277, 3)
  %281 = AIE.lock(%277, 2)
  %282 = AIE.lock(%277, 1)
  %283 = AIE.lock(%277, 0)
  %284 = AIE.buffer(%277) {sym_name = "buf94"} : memref<32x32xf32>
  %285 = AIE.buffer(%277) {sym_name = "buf95"} : memref<32x32xf32>
  %286 = AIE.buffer(%277) {sym_name = "buf96"} : memref<32x32xf32>
  %287 = AIE.core(%277) {
    AIE.useLock(%281, Acquire, 1)
    AIE.useLock(%282, Acquire, 1)
    AIE.useLock(%283, Acquire, 1)
    AIE.useLock(%280, Acquire, 0)
    call @extern_kernel(%272, %284, %285, %286) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%280, Release, 1)
    AIE.useLock(%283, Release, 0)
    AIE.useLock(%282, Release, 0)
    AIE.useLock(%281, Release, 0)
    AIE.useLock(%278, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %288 = AIE.mem(%277) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%282, Acquire, 0)
    AIE.dmaBd(<%285 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%282, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%281, Acquire, 0)
    AIE.dmaBd(<%286 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%281, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%280, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%284 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%280, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %289 = AIE.tile(17, 2)
  %290 = AIE.switchbox(%289) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %393)
    %398 = AIE.masterset(DMA : 1, %396)
    %399 = AIE.masterset(North : 0, %395)
    %400 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %396)
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %393)
      AIE.rule(28, 0, %395)
    }
  }
  %291 = AIE.lock(%289, 1)
  %292 = AIE.lock(%289, 0)
  %293 = AIE.buffer(%289) {sym_name = "buf97"} : memref<32x32xf32>
  %294 = AIE.buffer(%289) {sym_name = "buf98"} : memref<32x32xf32>
  %295 = AIE.buffer(%289) {sym_name = "buf99"} : memref<32x32xf32>
  %296 = AIE.buffer(%289) {sym_name = "buf100"} : memref<32x32xf32>
  %297 = AIE.core(%289) {
    AIE.useLock(%291, Acquire, 1)
    AIE.useLock(%292, Acquire, 1)
    AIE.useLock(%303, Acquire, 0)
    call @extern_kernel(%296, %293, %294, %295) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%303, Release, 1)
    AIE.useLock(%292, Release, 0)
    AIE.useLock(%291, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %298 = AIE.mem(%289) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%292, Acquire, 0)
    AIE.dmaBd(<%294 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%292, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%291, Acquire, 0)
    AIE.dmaBd(<%295 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%291, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %299 = AIE.tile(17, 3)
  %300 = AIE.switchbox(%299) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %394)
    %398 = AIE.masterset(DMA : 1, %393)
    %399 = AIE.masterset(North : 0, %396)
    %400 = AIE.masterset(North : 1, %395)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %393)
      AIE.rule(31, 6, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %394)
      AIE.rule(31, 2, %396)
    }
  }
  %301 = AIE.lock(%299, 2)
  %302 = AIE.lock(%299, 1)
  %303 = AIE.lock(%299, 0)
  %304 = AIE.buffer(%299) {sym_name = "buf101"} : memref<32x32xf32>
  %305 = AIE.buffer(%299) {sym_name = "buf102"} : memref<32x32xf32>
  %306 = AIE.buffer(%299) {sym_name = "buf103"} : memref<32x32xf32>
  %307 = AIE.core(%299) {
    AIE.useLock(%303, Acquire, 1)
    AIE.useLock(%302, Acquire, 1)
    AIE.useLock(%314, Acquire, 0)
    AIE.useLock(%301, Acquire, 1)
    call @extern_kernel(%293, %304, %305, %306) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%301, Release, 0)
    AIE.useLock(%314, Release, 1)
    AIE.useLock(%302, Release, 0)
    AIE.useLock(%303, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %308 = AIE.mem(%299) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%301, Acquire, 0)
    AIE.dmaBd(<%305 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%301, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%302, Acquire, 0)
    AIE.dmaBd(<%306 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%302, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %309 = AIE.tile(17, 4) {polyaie.leaf}
  %310 = AIE.lock(%309, 15)
  %311 = AIE.switchbox(%309) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %395)
    %398 = AIE.masterset(DMA : 1, %393)
    %399 = AIE.masterset(West : 0, %394)
    %400 = AIE.masterset(West : 1, %396)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %396)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %395)
    }
  }
  %312 = AIE.lock(%309, 3)
  %313 = AIE.lock(%309, 2)
  %314 = AIE.lock(%309, 1)
  %315 = AIE.lock(%309, 0)
  %316 = AIE.buffer(%309) {sym_name = "buf104"} : memref<32x32xf32>
  %317 = AIE.buffer(%309) {sym_name = "buf105"} : memref<32x32xf32>
  %318 = AIE.buffer(%309) {sym_name = "buf106"} : memref<32x32xf32>
  %319 = AIE.core(%309) {
    AIE.useLock(%313, Acquire, 1)
    AIE.useLock(%315, Acquire, 1)
    AIE.useLock(%312, Acquire, 0)
    AIE.useLock(%314, Acquire, 1)
    call @extern_kernel(%304, %316, %317, %318) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%314, Release, 0)
    AIE.useLock(%312, Release, 1)
    AIE.useLock(%315, Release, 0)
    AIE.useLock(%313, Release, 0)
    AIE.useLock(%310, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %320 = AIE.mem(%309) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%315, Acquire, 0)
    AIE.dmaBd(<%317 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%315, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%313, Acquire, 0)
    AIE.dmaBd(<%318 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%313, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%312, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%316 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%312, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %321 = AIE.tile(18, 2)
  %322 = AIE.switchbox(%321) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %393)
    %398 = AIE.masterset(DMA : 1, %396)
    %399 = AIE.masterset(North : 0, %394)
    %400 = AIE.masterset(North : 1, %395)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %393)
      AIE.rule(28, 4, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %396)
      AIE.rule(28, 0, %394)
    }
  }
  %323 = AIE.lock(%321, 1)
  %324 = AIE.lock(%321, 0)
  %325 = AIE.buffer(%321) {sym_name = "buf107"} : memref<32x32xf32>
  %326 = AIE.buffer(%321) {sym_name = "buf108"} : memref<32x32xf32>
  %327 = AIE.buffer(%321) {sym_name = "buf109"} : memref<32x32xf32>
  %328 = AIE.buffer(%321) {sym_name = "buf110"} : memref<32x32xf32>
  %329 = AIE.core(%321) {
    AIE.useLock(%324, Acquire, 1)
    AIE.useLock(%334, Acquire, 0)
    AIE.useLock(%323, Acquire, 1)
    call @extern_kernel(%328, %325, %326, %327) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%323, Release, 0)
    AIE.useLock(%334, Release, 1)
    AIE.useLock(%324, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %330 = AIE.mem(%321) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%323, Acquire, 0)
    AIE.dmaBd(<%327 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%323, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%324, Acquire, 0)
    AIE.dmaBd(<%326 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%324, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %331 = AIE.tile(18, 3)
  %332 = AIE.switchbox(%331) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(DMA : 0, %393)
    %398 = AIE.masterset(DMA : 1, %396)
    %399 = AIE.masterset(North : 0, %395)
    %400 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %396)
      AIE.rule(31, 6, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %393)
      AIE.rule(31, 2, %395)
    }
  }
  %333 = AIE.lock(%331, 2)
  %334 = AIE.lock(%331, 1)
  %335 = AIE.lock(%331, 0)
  %336 = AIE.buffer(%331) {sym_name = "buf111"} : memref<32x32xf32>
  %337 = AIE.buffer(%331) {sym_name = "buf112"} : memref<32x32xf32>
  %338 = AIE.buffer(%331) {sym_name = "buf113"} : memref<32x32xf32>
  %339 = AIE.core(%331) {
    AIE.useLock(%334, Acquire, 1)
    AIE.useLock(%346, Acquire, 0)
    AIE.useLock(%335, Acquire, 1)
    AIE.useLock(%333, Acquire, 1)
    call @extern_kernel(%325, %336, %337, %338) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%333, Release, 0)
    AIE.useLock(%335, Release, 0)
    AIE.useLock(%346, Release, 1)
    AIE.useLock(%334, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %340 = AIE.mem(%331) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%333, Acquire, 0)
    AIE.dmaBd(<%337 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%333, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%335, Acquire, 0)
    AIE.dmaBd(<%338 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%335, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %341 = AIE.tile(18, 4) {polyaie.leaf}
  %342 = AIE.lock(%341, 15)
  %343 = AIE.switchbox(%341) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.masterset(DMA : 0, %395)
    %397 = AIE.masterset(DMA : 1, %394)
    %398 = AIE.masterset(West : 0, %393)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %394)
    }
  }
  %344 = AIE.lock(%341, 3)
  %345 = AIE.lock(%341, 2)
  %346 = AIE.lock(%341, 1)
  %347 = AIE.lock(%341, 0)
  %348 = AIE.buffer(%341) {sym_name = "buf114"} : memref<32x32xf32>
  %349 = AIE.buffer(%341) {sym_name = "buf115"} : memref<32x32xf32>
  %350 = AIE.buffer(%341) {sym_name = "buf116"} : memref<32x32xf32>
  %351 = AIE.core(%341) {
    AIE.useLock(%347, Acquire, 1)
    AIE.useLock(%346, Acquire, 1)
    AIE.useLock(%345, Acquire, 1)
    AIE.useLock(%344, Acquire, 0)
    call @extern_kernel(%336, %348, %349, %350) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%344, Release, 1)
    AIE.useLock(%345, Release, 0)
    AIE.useLock(%346, Release, 0)
    AIE.useLock(%347, Release, 0)
    AIE.useLock(%342, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %352 = AIE.mem(%341) {
    %393 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%345, Acquire, 0)
    AIE.dmaBd(<%350 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%345, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %394 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%347, Acquire, 0)
    AIE.dmaBd(<%349 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%347, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %395 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%344, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%348 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%344, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %353 = AIE.tile(12, 0)
  %354 = AIE.switchbox(%353) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(North : 0, %395)
    %398 = AIE.masterset(North : 1, %393)
    %399 = AIE.masterset(East : 0, %396)
    %400 = AIE.masterset(East : 1, %394)
    %401 = AIE.masterset(East : 2, %393)
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %395)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %396)
    }
  }
  %355 = AIE.tile(13, 0)
  %356 = AIE.switchbox(%355) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(North : 0, %396)
    %398 = AIE.masterset(North : 1, %395)
    %399 = AIE.masterset(East : 0, %396)
    %400 = AIE.masterset(East : 1, %393)
    %401 = AIE.masterset(East : 2, %394)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %395)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %396)
    }
  }
  %357 = AIE.tile(16, 0)
  %358 = AIE.switchbox(%357) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<0> (2)
    %397 = AIE.amsel<0> (3)
    %398 = AIE.masterset(West : 0, %393)
    %399 = AIE.masterset(North : 0, %396)
    %400 = AIE.masterset(North : 1, %395)
    %401 = AIE.masterset(East : 0, %394)
    %402 = AIE.masterset(East : 1, %397)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %397)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %395)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %393)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %396)
    }
  }
  %359 = AIE.tile(9, 2)
  %360 = AIE.switchbox(%359) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(South : 0, %393)
    %398 = AIE.masterset(East : 0, %394)
    %399 = AIE.masterset(East : 1, %395)
    %400 = AIE.masterset(East : 2, %396)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %396)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %394)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %393)
    }
  }
  %361 = AIE.tile(9, 4)
  %362 = AIE.switchbox(%361) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.masterset(South : 0, %393)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %393)
    }
  }
  %363 = AIE.tile(16, 1)
  %364 = AIE.switchbox(%363) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.masterset(North : 0, %393)
    %396 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %393)
    }
  }
  %365 = AIE.tile(15, 1)
  %366 = AIE.switchbox(%365) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.masterset(North : 0, %394)
    %396 = AIE.masterset(North : 1, %393)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %394)
    }
  }
  %367 = AIE.tile(9, 1)
  %368 = AIE.switchbox(%367) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(South : 0, %395)
    %398 = AIE.masterset(South : 1, %396)
    %399 = AIE.masterset(South : 2, %394)
    %400 = AIE.masterset(East : 0, %393)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %396)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %395)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %393)
    }
  }
  %369 = AIE.tile(17, 1)
  %370 = AIE.switchbox(%369) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.masterset(North : 0, %394)
    %396 = AIE.masterset(North : 1, %393)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %394)
    }
  }
  %371 = AIE.tile(17, 0)
  %372 = AIE.switchbox(%371) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(West : 0, %393)
    %398 = AIE.masterset(West : 1, %394)
    %399 = AIE.masterset(North : 0, %394)
    %400 = AIE.masterset(North : 1, %396)
    %401 = AIE.masterset(East : 0, %395)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %395)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %396)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %393)
    }
  }
  %373 = AIE.tile(9, 0)
  %374 = AIE.switchbox(%373) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.masterset(East : 0, %395)
    %397 = AIE.masterset(East : 1, %393)
    %398 = AIE.masterset(East : 2, %394)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %393)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %395)
    }
  }
  %375 = AIE.tile(14, 0)
  %376 = AIE.switchbox(%375) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(West : 0, %396)
    %398 = AIE.masterset(North : 0, %396)
    %399 = AIE.masterset(North : 1, %393)
    %400 = AIE.masterset(East : 0, %395)
    %401 = AIE.masterset(East : 1, %393)
    %402 = AIE.masterset(East : 2, %394)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %396)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %395)
    }
  }
  %377 = AIE.tile(12, 1)
  %378 = AIE.switchbox(%377) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.masterset(North : 0, %394)
    %396 = AIE.masterset(North : 1, %393)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %394)
    }
  }
  %379 = AIE.tile(15, 0)
  %380 = AIE.switchbox(%379) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(West : 0, %394)
    %398 = AIE.masterset(North : 0, %394)
    %399 = AIE.masterset(North : 1, %393)
    %400 = AIE.masterset(East : 0, %395)
    %401 = AIE.masterset(East : 1, %396)
    %402 = AIE.masterset(East : 2, %393)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %396)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %395)
    }
  }
  %381 = AIE.tile(11, 1)
  %382 = AIE.switchbox(%381) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<0> (1)
    %396 = AIE.amsel<1> (1)
    %397 = AIE.amsel<0> (2)
    %398 = AIE.amsel<1> (2)
    %399 = AIE.amsel<0> (3)
    %400 = AIE.masterset(South : 0, %398)
    %401 = AIE.masterset(South : 1, %396)
    %402 = AIE.masterset(West : 0, %397)
    %403 = AIE.masterset(West : 1, %394)
    %404 = AIE.masterset(West : 2, %399)
    %405 = AIE.masterset(North : 0, %395)
    %406 = AIE.masterset(North : 1, %393)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 0, %396)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %399)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %394)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %397)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %398)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %393)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %395)
    }
  }
  %383 = AIE.tile(14, 1)
  %384 = AIE.switchbox(%383) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.masterset(North : 0, %393)
    %396 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %393)
    }
  }
  %385 = AIE.tile(13, 1)
  %386 = AIE.switchbox(%385) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.masterset(North : 0, %393)
    %396 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %393)
    }
  }
  %387 = AIE.tile(18, 1)
  %388 = AIE.switchbox(%387) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.masterset(North : 0, %393)
    %396 = AIE.masterset(North : 1, %394)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %393)
    }
  }
  %389 = AIE.tile(9, 3)
  %390 = AIE.switchbox(%389) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<0> (1)
    %395 = AIE.amsel<0> (2)
    %396 = AIE.amsel<0> (3)
    %397 = AIE.masterset(South : 0, %394)
    %398 = AIE.masterset(South : 1, %396)
    %399 = AIE.masterset(South : 2, %395)
    %400 = AIE.masterset(East : 0, %393)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %395)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %396)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %394)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %393)
    }
  }
  %391 = AIE.tile(10, 1)
  %392 = AIE.switchbox(%391) {
    %393 = AIE.amsel<0> (0)
    %394 = AIE.amsel<1> (0)
    %395 = AIE.amsel<2> (0)
    %396 = AIE.amsel<0> (1)
    %397 = AIE.amsel<1> (1)
    %398 = AIE.amsel<2> (1)
    %399 = AIE.amsel<0> (2)
    %400 = AIE.amsel<1> (2)
    %401 = AIE.amsel<0> (3)
    %402 = AIE.amsel<1> (3)
    %403 = AIE.masterset(South : 0, %398)
    %404 = AIE.masterset(South : 1, %393)
    %405 = AIE.masterset(South : 2, %394)
    %406 = AIE.masterset(South : 3, %396)
    %407 = AIE.masterset(West : 0, %397)
    %408 = AIE.masterset(West : 1, %395)
    %409 = AIE.masterset(West : 2, %402)
    %410 = AIE.masterset(North : 0, %399)
    %411 = AIE.masterset(North : 1, %401)
    %412 = AIE.masterset(East : 0, %400)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %402)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %397)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %400)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %396)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %394)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %393)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %398)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %401)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %399)
    }
  }
}


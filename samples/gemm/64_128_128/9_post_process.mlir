module @gemm {
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
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(North : 0, %440)
    %445 = AIE.masterset(North : 1, %442)
    %446 = AIE.masterset(East : 0, %440)
    %447 = AIE.masterset(East : 1, %442)
    %448 = AIE.masterset(East : 2, %443)
    %449 = AIE.masterset(East : 3, %441)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %441)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %440)
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
  %14 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %15 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %16 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %17 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %18 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %19 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %20 = AIE.external_buffer 40960 {sym_name = "buf6"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %21 = AIE.external_buffer 45056 {sym_name = "buf7"} : memref<32x32xf32>
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
    %440 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
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
    %441 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
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
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.masterset(West : 0, %440)
    %443 = AIE.masterset(West : 1, %441)
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 0, %440)
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
  %35 = AIE.external_buffer 49152 {sym_name = "buf8"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %36 = AIE.external_buffer 53248 {sym_name = "buf9"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %37 = AIE.external_buffer 57344 {sym_name = "buf10"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %38 = AIE.external_buffer 61440 {sym_name = "buf11"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %39 = AIE.external_buffer 65536 {sym_name = "buf12"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %40 = AIE.external_buffer 69632 {sym_name = "buf13"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%40, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %41 = AIE.external_buffer 73728 {sym_name = "buf14"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%41, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %42 = AIE.external_buffer 77824 {sym_name = "buf15"} : memref<32x32xf32>
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
    %440 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
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
    %441 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
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
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<0> (3)
    %446 = AIE.masterset(South : 2, %442)
    %447 = AIE.masterset(South : 3, %441)
    %448 = AIE.masterset(North : 0, %444)
    %449 = AIE.masterset(North : 1, %440)
    %450 = AIE.masterset(East : 0, %444)
    %451 = AIE.masterset(East : 1, %443)
    %452 = AIE.masterset(East : 2, %445)
    %453 = AIE.masterset(East : 3, %440)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(West : 3) {
      AIE.rule(31, 1, %441)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(31, 0, %441)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %442)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %442)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %442)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %445)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %443)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %444)
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
  %56 = AIE.external_buffer 81920 {sym_name = "buf16"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %57 = AIE.external_buffer 86016 {sym_name = "buf17"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %58 = AIE.external_buffer 90112 {sym_name = "buf18"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%58, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %59 = AIE.external_buffer 94208 {sym_name = "buf19"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%59, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %60 = AIE.external_buffer 98304 {sym_name = "buf20"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%60, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %61 = AIE.external_buffer 102400 {sym_name = "buf21"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%61, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %62 = AIE.external_buffer 106496 {sym_name = "buf22"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%62, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %63 = AIE.external_buffer 110592 {sym_name = "buf23"} : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%63, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %64 = AIE.external_buffer 114688 {sym_name = "buf24"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %64) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %65 = AIE.external_buffer 118788 {sym_name = "buf25"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %65) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %66 = AIE.external_buffer 122888 {sym_name = "buf26"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %66) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %67 = AIE.external_buffer 126988 {sym_name = "buf27"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %67) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %68 = AIE.external_buffer 131088 {sym_name = "buf28"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %68) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %69 = AIE.external_buffer 135188 {sym_name = "buf29"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %69) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %70 = AIE.external_buffer 139288 {sym_name = "buf30"} : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %70) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %71 = AIE.external_buffer 143388 {sym_name = "buf31"} : memref<1025xf32>
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
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
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
    %441 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
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
    %442 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
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
    %443 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
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
  %75 = AIE.core(%74) {
    AIE.end
  }
  %76 = AIE.tile(10, 2)
  %77 = AIE.switchbox(%76) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.masterset(DMA : 0, %446)
    %449 = AIE.masterset(DMA : 1, %440)
    %450 = AIE.masterset(South : 0, %441)
    %451 = AIE.masterset(South : 1, %444)
    %452 = AIE.masterset(North : 0, %443)
    %453 = AIE.masterset(North : 1, %442)
    %454 = AIE.masterset(East : 0, %447)
    %455 = AIE.masterset(East : 1, %445)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %444)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %447)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %446)
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %440)
      AIE.rule(28, 0, %443)
    }
  }
  %78 = AIE.lock(%76, 1)
  %79 = AIE.lock(%76, 0)
  %80 = AIE.buffer(%76) {sym_name = "buf32"} : memref<32x32xf32>
  %81 = AIE.buffer(%76) {sym_name = "buf33"} : memref<32x32xf32>
  %82 = AIE.buffer(%76) {sym_name = "buf34"} : memref<32x32xf32>
  %83 = AIE.buffer(%76) {sym_name = "buf35"} : memref<32x32xf32>
  %84 = AIE.core(%76) {
    AIE.useLock(%79, Acquire, 1)
    AIE.useLock(%88, Acquire, 0)
    AIE.useLock(%78, Acquire, 1)
    call @extern_kernel(%83, %80, %81, %82) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%78, Release, 0)
    AIE.useLock(%88, Release, 1)
    AIE.useLock(%79, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %85 = AIE.mem(%76) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%78, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%78, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%79, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %86 = AIE.tile(10, 3)
  %87 = AIE.switchbox(%86) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.masterset(DMA : 0, %444)
    %449 = AIE.masterset(DMA : 1, %447)
    %450 = AIE.masterset(South : 0, %443)
    %451 = AIE.masterset(South : 1, %445)
    %452 = AIE.masterset(North : 0, %440)
    %453 = AIE.masterset(North : 1, %442)
    %454 = AIE.masterset(East : 0, %446)
    %455 = AIE.masterset(East : 1, %441)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %446)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %444)
      AIE.rule(30, 6, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %447)
      AIE.rule(30, 2, %440)
    }
  }
  %88 = AIE.lock(%86, 2)
  %89 = AIE.lock(%86, 1)
  %90 = AIE.lock(%86, 0)
  %91 = AIE.buffer(%86) {sym_name = "buf36"} : memref<32x32xf32>
  %92 = AIE.buffer(%86) {sym_name = "buf37"} : memref<32x32xf32>
  %93 = AIE.buffer(%86) {sym_name = "buf38"} : memref<32x32xf32>
  %94 = AIE.core(%86) {
    AIE.useLock(%100, Acquire, 0)
    AIE.useLock(%88, Acquire, 1)
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%90, Acquire, 1)
    call @extern_kernel(%80, %91, %92, %93) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%90, Release, 0)
    AIE.useLock(%89, Release, 0)
    AIE.useLock(%88, Release, 0)
    AIE.useLock(%100, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %95 = AIE.mem(%86) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%90, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%90, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%89, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%89, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %96 = AIE.tile(10, 4)
  %97 = AIE.switchbox(%96) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.masterset(DMA : 0, %440)
    %449 = AIE.masterset(DMA : 1, %445)
    %450 = AIE.masterset(South : 0, %446)
    %451 = AIE.masterset(South : 1, %444)
    %452 = AIE.masterset(North : 0, %441)
    %453 = AIE.masterset(North : 1, %447)
    %454 = AIE.masterset(East : 0, %442)
    %455 = AIE.masterset(East : 1, %443)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %444)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %446)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %443)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %442)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %445)
      AIE.rule(31, 7, %447)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %440)
      AIE.rule(31, 3, %441)
    }
  }
  %98 = AIE.lock(%96, 2)
  %99 = AIE.lock(%96, 1)
  %100 = AIE.lock(%96, 0)
  %101 = AIE.buffer(%96) {sym_name = "buf39"} : memref<32x32xf32>
  %102 = AIE.buffer(%96) {sym_name = "buf40"} : memref<32x32xf32>
  %103 = AIE.buffer(%96) {sym_name = "buf41"} : memref<32x32xf32>
  %104 = AIE.core(%96) {
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%100, Acquire, 1)
    AIE.useLock(%98, Acquire, 1)
    AIE.useLock(%109, Acquire, 0)
    call @extern_kernel(%91, %101, %102, %103) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%109, Release, 1)
    AIE.useLock(%98, Release, 0)
    AIE.useLock(%100, Release, 0)
    AIE.useLock(%99, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %105 = AIE.mem(%96) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%98, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%98, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%103 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %106 = AIE.tile(10, 5) {polyaie.leaf}
  %107 = AIE.lock(%106, 15)
  %108 = AIE.switchbox(%106) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<0> (3)
    %445 = AIE.masterset(DMA : 0, %444)
    %446 = AIE.masterset(DMA : 1, %442)
    %447 = AIE.masterset(South : 0, %441)
    %448 = AIE.masterset(South : 1, %440)
    %449 = AIE.masterset(East : 0, %443)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %441)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %444)
    }
  }
  %109 = AIE.lock(%106, 3)
  %110 = AIE.lock(%106, 2)
  %111 = AIE.lock(%106, 1)
  %112 = AIE.lock(%106, 0)
  %113 = AIE.buffer(%106) {sym_name = "buf42"} : memref<32x32xf32>
  %114 = AIE.buffer(%106) {sym_name = "buf43"} : memref<32x32xf32>
  %115 = AIE.buffer(%106) {sym_name = "buf44"} : memref<32x32xf32>
  %116 = AIE.core(%106) {
    AIE.useLock(%112, Acquire, 0)
    AIE.useLock(%110, Acquire, 1)
    AIE.useLock(%111, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    call @extern_kernel(%101, %113, %114, %115) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%111, Release, 0)
    AIE.useLock(%110, Release, 0)
    AIE.useLock(%112, Release, 1)
    AIE.useLock(%107, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %117 = AIE.mem(%106) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%111, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%114 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%111, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%110, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%115 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%110, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<2> (0)
    %443 = AIE.amsel<0> (1)
    %444 = AIE.amsel<1> (1)
    %445 = AIE.amsel<2> (1)
    %446 = AIE.amsel<0> (2)
    %447 = AIE.amsel<1> (2)
    %448 = AIE.amsel<2> (2)
    %449 = AIE.amsel<0> (3)
    %450 = AIE.amsel<1> (3)
    %451 = AIE.amsel<2> (3)
    %452 = AIE.masterset(DMA : 0, %451)
    %453 = AIE.masterset(DMA : 1, %450)
    %454 = AIE.masterset(South : 0, %440)
    %455 = AIE.masterset(South : 1, %448)
    %456 = AIE.masterset(South : 2, %441)
    %457 = AIE.masterset(South : 3, %444)
    %458 = AIE.masterset(West : 0, %447)
    %459 = AIE.masterset(West : 1, %442)
    %460 = AIE.masterset(North : 0, %446)
    %461 = AIE.masterset(North : 1, %449)
    %462 = AIE.masterset(East : 0, %443)
    %463 = AIE.masterset(East : 1, %445)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %442)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %447)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %444)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %448)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %451)
      AIE.rule(28, 4, %449)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %450)
      AIE.rule(28, 0, %446)
    }
  }
  %120 = AIE.lock(%118, 1)
  %121 = AIE.lock(%118, 0)
  %122 = AIE.buffer(%118) {sym_name = "buf45"} : memref<32x32xf32>
  %123 = AIE.buffer(%118) {sym_name = "buf46"} : memref<32x32xf32>
  %124 = AIE.buffer(%118) {sym_name = "buf47"} : memref<32x32xf32>
  %125 = AIE.buffer(%118) {sym_name = "buf48"} : memref<32x32xf32>
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
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%121, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%124 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%121, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<2> (0)
    %443 = AIE.amsel<0> (1)
    %444 = AIE.amsel<1> (1)
    %445 = AIE.amsel<2> (1)
    %446 = AIE.amsel<0> (2)
    %447 = AIE.amsel<1> (2)
    %448 = AIE.amsel<2> (2)
    %449 = AIE.amsel<0> (3)
    %450 = AIE.amsel<1> (3)
    %451 = AIE.amsel<2> (3)
    %452 = AIE.masterset(DMA : 0, %445)
    %453 = AIE.masterset(DMA : 1, %450)
    %454 = AIE.masterset(South : 0, %442)
    %455 = AIE.masterset(South : 1, %443)
    %456 = AIE.masterset(South : 2, %451)
    %457 = AIE.masterset(South : 3, %449)
    %458 = AIE.masterset(West : 0, %446)
    %459 = AIE.masterset(West : 1, %447)
    %460 = AIE.masterset(North : 0, %440)
    %461 = AIE.masterset(North : 1, %441)
    %462 = AIE.masterset(East : 0, %444)
    %463 = AIE.masterset(East : 1, %448)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %448)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %444)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %447)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %446)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %449)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %451)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %443)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %442)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %450)
      AIE.rule(30, 6, %441)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %445)
      AIE.rule(30, 2, %440)
    }
  }
  %130 = AIE.lock(%128, 2)
  %131 = AIE.lock(%128, 1)
  %132 = AIE.lock(%128, 0)
  %133 = AIE.buffer(%128) {sym_name = "buf49"} : memref<32x32xf32>
  %134 = AIE.buffer(%128) {sym_name = "buf50"} : memref<32x32xf32>
  %135 = AIE.buffer(%128) {sym_name = "buf51"} : memref<32x32xf32>
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
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%130, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%134 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%130, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<2> (0)
    %443 = AIE.amsel<0> (1)
    %444 = AIE.amsel<1> (1)
    %445 = AIE.amsel<2> (1)
    %446 = AIE.amsel<0> (2)
    %447 = AIE.amsel<1> (2)
    %448 = AIE.amsel<2> (2)
    %449 = AIE.amsel<0> (3)
    %450 = AIE.amsel<1> (3)
    %451 = AIE.amsel<2> (3)
    %452 = AIE.masterset(DMA : 0, %442)
    %453 = AIE.masterset(DMA : 1, %446)
    %454 = AIE.masterset(South : 0, %444)
    %455 = AIE.masterset(South : 1, %447)
    %456 = AIE.masterset(South : 2, %445)
    %457 = AIE.masterset(South : 3, %450)
    %458 = AIE.masterset(West : 0, %441)
    %459 = AIE.masterset(West : 1, %448)
    %460 = AIE.masterset(North : 0, %440)
    %461 = AIE.masterset(North : 1, %451)
    %462 = AIE.masterset(East : 0, %449)
    %463 = AIE.masterset(East : 1, %443)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %448)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %443)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %449)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %450)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %445)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %447)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %444)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %446)
      AIE.rule(31, 7, %451)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %442)
      AIE.rule(31, 3, %440)
    }
  }
  %140 = AIE.lock(%138, 2)
  %141 = AIE.lock(%138, 1)
  %142 = AIE.lock(%138, 0)
  %143 = AIE.buffer(%138) {sym_name = "buf52"} : memref<32x32xf32>
  %144 = AIE.buffer(%138) {sym_name = "buf53"} : memref<32x32xf32>
  %145 = AIE.buffer(%138) {sym_name = "buf54"} : memref<32x32xf32>
  %146 = AIE.core(%138) {
    AIE.useLock(%141, Acquire, 1)
    AIE.useLock(%154, Acquire, 0)
    AIE.useLock(%140, Acquire, 1)
    AIE.useLock(%142, Acquire, 1)
    call @extern_kernel(%133, %143, %144, %145) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%142, Release, 0)
    AIE.useLock(%140, Release, 0)
    AIE.useLock(%154, Release, 1)
    AIE.useLock(%141, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %147 = AIE.mem(%138) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%142, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%144 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%142, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
  %149 = AIE.lock(%148, 15)
  %150 = AIE.switchbox(%148) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.masterset(DMA : 0, %445)
    %449 = AIE.masterset(DMA : 1, %442)
    %450 = AIE.masterset(South : 0, %446)
    %451 = AIE.masterset(South : 1, %444)
    %452 = AIE.masterset(South : 2, %441)
    %453 = AIE.masterset(South : 3, %440)
    %454 = AIE.masterset(West : 0, %447)
    %455 = AIE.masterset(West : 1, %443)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 1, %443)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %447)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %444)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %446)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %445)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %442)
    }
  }
  %151 = AIE.lock(%148, 3)
  %152 = AIE.lock(%148, 2)
  %153 = AIE.lock(%148, 1)
  %154 = AIE.lock(%148, 0)
  %155 = AIE.buffer(%148) {sym_name = "buf55"} : memref<32x32xf32>
  %156 = AIE.buffer(%148) {sym_name = "buf56"} : memref<32x32xf32>
  %157 = AIE.buffer(%148) {sym_name = "buf57"} : memref<32x32xf32>
  %158 = AIE.core(%148) {
    AIE.useLock(%151, Acquire, 1)
    AIE.useLock(%153, Acquire, 0)
    AIE.useLock(%154, Acquire, 1)
    AIE.useLock(%152, Acquire, 1)
    call @extern_kernel(%143, %155, %156, %157) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%152, Release, 0)
    AIE.useLock(%154, Release, 0)
    AIE.useLock(%153, Release, 1)
    AIE.useLock(%151, Release, 0)
    AIE.useLock(%149, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %159 = AIE.mem(%148) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%152, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%157 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%152, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%151, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%156 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%151, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%153, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%155 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%153, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %160 = AIE.tile(12, 2)
  %161 = AIE.switchbox(%160) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.masterset(DMA : 0, %441)
    %449 = AIE.masterset(DMA : 1, %446)
    %450 = AIE.masterset(South : 0, %444)
    %451 = AIE.masterset(South : 1, %445)
    %452 = AIE.masterset(West : 0, %447)
    %453 = AIE.masterset(West : 1, %440)
    %454 = AIE.masterset(North : 0, %442)
    %455 = AIE.masterset(North : 1, %443)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %447)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %444)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %441)
      AIE.rule(28, 4, %443)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %446)
      AIE.rule(28, 0, %442)
    }
  }
  %162 = AIE.lock(%160, 1)
  %163 = AIE.lock(%160, 0)
  %164 = AIE.buffer(%160) {sym_name = "buf58"} : memref<32x32xf32>
  %165 = AIE.buffer(%160) {sym_name = "buf59"} : memref<32x32xf32>
  %166 = AIE.buffer(%160) {sym_name = "buf60"} : memref<32x32xf32>
  %167 = AIE.buffer(%160) {sym_name = "buf61"} : memref<32x32xf32>
  %168 = AIE.core(%160) {
    AIE.useLock(%162, Acquire, 1)
    AIE.useLock(%163, Acquire, 1)
    AIE.useLock(%174, Acquire, 0)
    call @extern_kernel(%167, %164, %165, %166) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%174, Release, 1)
    AIE.useLock(%163, Release, 0)
    AIE.useLock(%162, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %169 = AIE.mem(%160) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%163, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%166 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%163, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%162, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%165 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%162, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %170 = AIE.tile(12, 3)
  %171 = AIE.switchbox(%170) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.masterset(DMA : 0, %440)
    %449 = AIE.masterset(DMA : 1, %443)
    %450 = AIE.masterset(South : 0, %445)
    %451 = AIE.masterset(South : 1, %447)
    %452 = AIE.masterset(West : 0, %442)
    %453 = AIE.masterset(West : 1, %441)
    %454 = AIE.masterset(North : 0, %446)
    %455 = AIE.masterset(North : 1, %444)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %447)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %445)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %441)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %442)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %440)
      AIE.rule(30, 6, %444)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %443)
      AIE.rule(30, 2, %446)
    }
  }
  %172 = AIE.lock(%170, 2)
  %173 = AIE.lock(%170, 1)
  %174 = AIE.lock(%170, 0)
  %175 = AIE.buffer(%170) {sym_name = "buf62"} : memref<32x32xf32>
  %176 = AIE.buffer(%170) {sym_name = "buf63"} : memref<32x32xf32>
  %177 = AIE.buffer(%170) {sym_name = "buf64"} : memref<32x32xf32>
  %178 = AIE.core(%170) {
    AIE.useLock(%184, Acquire, 0)
    AIE.useLock(%173, Acquire, 1)
    AIE.useLock(%172, Acquire, 1)
    AIE.useLock(%174, Acquire, 1)
    call @extern_kernel(%164, %175, %176, %177) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%174, Release, 0)
    AIE.useLock(%172, Release, 0)
    AIE.useLock(%173, Release, 0)
    AIE.useLock(%184, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %179 = AIE.mem(%170) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%172, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%177 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%172, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%173, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%176 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%173, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %180 = AIE.tile(12, 4)
  %181 = AIE.switchbox(%180) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.amsel<1> (3)
    %448 = AIE.masterset(DMA : 0, %446)
    %449 = AIE.masterset(DMA : 1, %440)
    %450 = AIE.masterset(South : 0, %447)
    %451 = AIE.masterset(South : 1, %443)
    %452 = AIE.masterset(West : 0, %445)
    %453 = AIE.masterset(West : 1, %441)
    %454 = AIE.masterset(North : 0, %444)
    %455 = AIE.masterset(North : 1, %442)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %445)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 1, %443)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %447)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %446)
      AIE.rule(31, 7, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %440)
      AIE.rule(31, 3, %444)
    }
  }
  %182 = AIE.lock(%180, 2)
  %183 = AIE.lock(%180, 1)
  %184 = AIE.lock(%180, 0)
  %185 = AIE.buffer(%180) {sym_name = "buf65"} : memref<32x32xf32>
  %186 = AIE.buffer(%180) {sym_name = "buf66"} : memref<32x32xf32>
  %187 = AIE.buffer(%180) {sym_name = "buf67"} : memref<32x32xf32>
  %188 = AIE.core(%180) {
    AIE.useLock(%184, Acquire, 1)
    AIE.useLock(%194, Acquire, 0)
    AIE.useLock(%182, Acquire, 1)
    AIE.useLock(%183, Acquire, 1)
    call @extern_kernel(%175, %185, %186, %187) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%183, Release, 0)
    AIE.useLock(%182, Release, 0)
    AIE.useLock(%194, Release, 1)
    AIE.useLock(%184, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %189 = AIE.mem(%180) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%183, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%187 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%183, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%182, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%182, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %190 = AIE.tile(12, 5) {polyaie.leaf}
  %191 = AIE.lock(%190, 15)
  %192 = AIE.switchbox(%190) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.masterset(DMA : 0, %446)
    %448 = AIE.masterset(DMA : 1, %445)
    %449 = AIE.masterset(South : 0, %444)
    %450 = AIE.masterset(West : 0, %443)
    %451 = AIE.masterset(West : 1, %441)
    %452 = AIE.masterset(West : 2, %440)
    %453 = AIE.masterset(West : 3, %442)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 2, %444)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %443)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %446)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %445)
    }
  }
  %193 = AIE.lock(%190, 3)
  %194 = AIE.lock(%190, 2)
  %195 = AIE.lock(%190, 1)
  %196 = AIE.lock(%190, 0)
  %197 = AIE.buffer(%190) {sym_name = "buf68"} : memref<32x32xf32>
  %198 = AIE.buffer(%190) {sym_name = "buf69"} : memref<32x32xf32>
  %199 = AIE.buffer(%190) {sym_name = "buf70"} : memref<32x32xf32>
  %200 = AIE.core(%190) {
    AIE.useLock(%195, Acquire, 0)
    AIE.useLock(%194, Acquire, 1)
    AIE.useLock(%196, Acquire, 1)
    AIE.useLock(%193, Acquire, 1)
    call @extern_kernel(%185, %197, %198, %199) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%193, Release, 0)
    AIE.useLock(%196, Release, 0)
    AIE.useLock(%194, Release, 0)
    AIE.useLock(%195, Release, 1)
    AIE.useLock(%191, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %201 = AIE.mem(%190) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%193, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%199 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%193, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%196, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%198 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%196, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%195, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%197 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%195, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %202 = AIE.tile(13, 2)
  %203 = AIE.switchbox(%202) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %441)
    %445 = AIE.masterset(DMA : 1, %443)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %442)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %441)
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %443)
      AIE.rule(28, 0, %440)
    }
  }
  %204 = AIE.lock(%202, 1)
  %205 = AIE.lock(%202, 0)
  %206 = AIE.buffer(%202) {sym_name = "buf71"} : memref<32x32xf32>
  %207 = AIE.buffer(%202) {sym_name = "buf72"} : memref<32x32xf32>
  %208 = AIE.buffer(%202) {sym_name = "buf73"} : memref<32x32xf32>
  %209 = AIE.buffer(%202) {sym_name = "buf74"} : memref<32x32xf32>
  %210 = AIE.core(%202) {
    AIE.useLock(%204, Acquire, 1)
    AIE.useLock(%205, Acquire, 1)
    AIE.useLock(%216, Acquire, 0)
    call @extern_kernel(%209, %206, %207, %208) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%216, Release, 1)
    AIE.useLock(%205, Release, 0)
    AIE.useLock(%204, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %211 = AIE.mem(%202) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%205, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%208 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%205, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%204, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%207 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%204, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %212 = AIE.tile(13, 3)
  %213 = AIE.switchbox(%212) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %442)
    %445 = AIE.masterset(DMA : 1, %441)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %443)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %441)
      AIE.rule(30, 6, %443)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %442)
      AIE.rule(30, 2, %440)
    }
  }
  %214 = AIE.lock(%212, 2)
  %215 = AIE.lock(%212, 1)
  %216 = AIE.lock(%212, 0)
  %217 = AIE.buffer(%212) {sym_name = "buf75"} : memref<32x32xf32>
  %218 = AIE.buffer(%212) {sym_name = "buf76"} : memref<32x32xf32>
  %219 = AIE.buffer(%212) {sym_name = "buf77"} : memref<32x32xf32>
  %220 = AIE.core(%212) {
    AIE.useLock(%214, Acquire, 1)
    AIE.useLock(%215, Acquire, 1)
    AIE.useLock(%216, Acquire, 1)
    AIE.useLock(%226, Acquire, 0)
    call @extern_kernel(%206, %217, %218, %219) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%226, Release, 1)
    AIE.useLock(%216, Release, 0)
    AIE.useLock(%215, Release, 0)
    AIE.useLock(%214, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %221 = AIE.mem(%212) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%215, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%218 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%215, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%214, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%219 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%214, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %222 = AIE.tile(13, 4)
  %223 = AIE.switchbox(%222) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<0> (3)
    %445 = AIE.masterset(DMA : 0, %442)
    %446 = AIE.masterset(DMA : 1, %440)
    %447 = AIE.masterset(West : 0, %441)
    %448 = AIE.masterset(North : 0, %444)
    %449 = AIE.masterset(North : 1, %443)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %440)
      AIE.rule(31, 7, %443)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %442)
      AIE.rule(31, 3, %444)
    }
  }
  %224 = AIE.lock(%222, 2)
  %225 = AIE.lock(%222, 1)
  %226 = AIE.lock(%222, 0)
  %227 = AIE.buffer(%222) {sym_name = "buf78"} : memref<32x32xf32>
  %228 = AIE.buffer(%222) {sym_name = "buf79"} : memref<32x32xf32>
  %229 = AIE.buffer(%222) {sym_name = "buf80"} : memref<32x32xf32>
  %230 = AIE.core(%222) {
    AIE.useLock(%235, Acquire, 0)
    AIE.useLock(%225, Acquire, 1)
    AIE.useLock(%224, Acquire, 1)
    AIE.useLock(%226, Acquire, 1)
    call @extern_kernel(%217, %227, %228, %229) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%226, Release, 0)
    AIE.useLock(%224, Release, 0)
    AIE.useLock(%225, Release, 0)
    AIE.useLock(%235, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %231 = AIE.mem(%222) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%224, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%228 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%224, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%225, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%229 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%225, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %232 = AIE.tile(13, 5) {polyaie.leaf}
  %233 = AIE.lock(%232, 15)
  %234 = AIE.switchbox(%232) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<1> (2)
    %446 = AIE.amsel<0> (3)
    %447 = AIE.masterset(DMA : 0, %443)
    %448 = AIE.masterset(DMA : 1, %444)
    %449 = AIE.masterset(South : 0, %445)
    %450 = AIE.masterset(West : 0, %442)
    %451 = AIE.masterset(West : 1, %440)
    %452 = AIE.masterset(West : 2, %446)
    %453 = AIE.masterset(West : 3, %441)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 3, %445)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %446)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %440)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %442)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %443)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %444)
    }
  }
  %235 = AIE.lock(%232, 3)
  %236 = AIE.lock(%232, 2)
  %237 = AIE.lock(%232, 1)
  %238 = AIE.lock(%232, 0)
  %239 = AIE.buffer(%232) {sym_name = "buf81"} : memref<32x32xf32>
  %240 = AIE.buffer(%232) {sym_name = "buf82"} : memref<32x32xf32>
  %241 = AIE.buffer(%232) {sym_name = "buf83"} : memref<32x32xf32>
  %242 = AIE.core(%232) {
    AIE.useLock(%235, Acquire, 1)
    AIE.useLock(%238, Acquire, 1)
    AIE.useLock(%237, Acquire, 0)
    AIE.useLock(%236, Acquire, 1)
    call @extern_kernel(%227, %239, %240, %241) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%236, Release, 0)
    AIE.useLock(%237, Release, 1)
    AIE.useLock(%238, Release, 0)
    AIE.useLock(%235, Release, 0)
    AIE.useLock(%233, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %243 = AIE.mem(%232) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%236, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%241 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%236, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%238, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%240 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%238, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%237, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%239 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%237, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %244 = AIE.tile(14, 2)
  %245 = AIE.switchbox(%244) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %442)
    %445 = AIE.masterset(DMA : 1, %443)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %441)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %443)
      AIE.rule(28, 0, %441)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %442)
      AIE.rule(28, 4, %440)
    }
  }
  %246 = AIE.lock(%244, 1)
  %247 = AIE.lock(%244, 0)
  %248 = AIE.buffer(%244) {sym_name = "buf84"} : memref<32x32xf32>
  %249 = AIE.buffer(%244) {sym_name = "buf85"} : memref<32x32xf32>
  %250 = AIE.buffer(%244) {sym_name = "buf86"} : memref<32x32xf32>
  %251 = AIE.buffer(%244) {sym_name = "buf87"} : memref<32x32xf32>
  %252 = AIE.core(%244) {
    AIE.useLock(%257, Acquire, 0)
    AIE.useLock(%247, Acquire, 1)
    AIE.useLock(%246, Acquire, 1)
    call @extern_kernel(%251, %248, %249, %250) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%246, Release, 0)
    AIE.useLock(%247, Release, 0)
    AIE.useLock(%257, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %253 = AIE.mem(%244) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%246, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%250 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%246, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%247, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%249 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%247, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %254 = AIE.tile(14, 3)
  %255 = AIE.switchbox(%254) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %441)
    %445 = AIE.masterset(DMA : 1, %443)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %442)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %441)
      AIE.rule(30, 2, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %443)
      AIE.rule(30, 6, %440)
    }
  }
  %256 = AIE.lock(%254, 2)
  %257 = AIE.lock(%254, 1)
  %258 = AIE.lock(%254, 0)
  %259 = AIE.buffer(%254) {sym_name = "buf88"} : memref<32x32xf32>
  %260 = AIE.buffer(%254) {sym_name = "buf89"} : memref<32x32xf32>
  %261 = AIE.buffer(%254) {sym_name = "buf90"} : memref<32x32xf32>
  %262 = AIE.core(%254) {
    AIE.useLock(%257, Acquire, 1)
    AIE.useLock(%268, Acquire, 0)
    AIE.useLock(%256, Acquire, 1)
    AIE.useLock(%258, Acquire, 1)
    call @extern_kernel(%248, %259, %260, %261) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%258, Release, 0)
    AIE.useLock(%256, Release, 0)
    AIE.useLock(%268, Release, 1)
    AIE.useLock(%257, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %263 = AIE.mem(%254) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%258, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%260 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%258, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%256, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%261 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%256, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %264 = AIE.tile(14, 4)
  %265 = AIE.switchbox(%264) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %442)
    %445 = AIE.masterset(DMA : 1, %440)
    %446 = AIE.masterset(North : 0, %441)
    %447 = AIE.masterset(North : 1, %443)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %442)
      AIE.rule(31, 3, %443)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %440)
      AIE.rule(31, 7, %441)
    }
  }
  %266 = AIE.lock(%264, 2)
  %267 = AIE.lock(%264, 1)
  %268 = AIE.lock(%264, 0)
  %269 = AIE.buffer(%264) {sym_name = "buf91"} : memref<32x32xf32>
  %270 = AIE.buffer(%264) {sym_name = "buf92"} : memref<32x32xf32>
  %271 = AIE.buffer(%264) {sym_name = "buf93"} : memref<32x32xf32>
  %272 = AIE.core(%264) {
    AIE.useLock(%267, Acquire, 1)
    AIE.useLock(%266, Acquire, 1)
    AIE.useLock(%268, Acquire, 1)
    AIE.useLock(%277, Acquire, 0)
    call @extern_kernel(%259, %269, %270, %271) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%277, Release, 1)
    AIE.useLock(%268, Release, 0)
    AIE.useLock(%266, Release, 0)
    AIE.useLock(%267, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %273 = AIE.mem(%264) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%266, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%270 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%266, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%267, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%271 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%267, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %274 = AIE.tile(14, 5) {polyaie.leaf}
  %275 = AIE.lock(%274, 15)
  %276 = AIE.switchbox(%274) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<0> (3)
    %446 = AIE.masterset(DMA : 0, %442)
    %447 = AIE.masterset(DMA : 1, %440)
    %448 = AIE.masterset(West : 0, %441)
    %449 = AIE.masterset(West : 1, %444)
    %450 = AIE.masterset(West : 2, %445)
    %451 = AIE.masterset(West : 3, %443)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %443)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %445)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %444)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %441)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 7, %442)
    }
  }
  %277 = AIE.lock(%274, 3)
  %278 = AIE.lock(%274, 2)
  %279 = AIE.lock(%274, 1)
  %280 = AIE.lock(%274, 0)
  %281 = AIE.buffer(%274) {sym_name = "buf94"} : memref<32x32xf32>
  %282 = AIE.buffer(%274) {sym_name = "buf95"} : memref<32x32xf32>
  %283 = AIE.buffer(%274) {sym_name = "buf96"} : memref<32x32xf32>
  %284 = AIE.core(%274) {
    AIE.useLock(%279, Acquire, 1)
    AIE.useLock(%278, Acquire, 0)
    AIE.useLock(%280, Acquire, 1)
    AIE.useLock(%277, Acquire, 1)
    call @extern_kernel(%269, %281, %282, %283) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%277, Release, 0)
    AIE.useLock(%280, Release, 0)
    AIE.useLock(%278, Release, 1)
    AIE.useLock(%279, Release, 0)
    AIE.useLock(%275, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %285 = AIE.mem(%274) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%280, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%283 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%280, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%279, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%282 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%279, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%278, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%281 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%278, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %286 = AIE.tile(15, 2)
  %287 = AIE.switchbox(%286) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %443)
    %445 = AIE.masterset(DMA : 1, %441)
    %446 = AIE.masterset(North : 0, %442)
    %447 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %443)
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %441)
      AIE.rule(28, 0, %442)
    }
  }
  %288 = AIE.lock(%286, 1)
  %289 = AIE.lock(%286, 0)
  %290 = AIE.buffer(%286) {sym_name = "buf97"} : memref<32x32xf32>
  %291 = AIE.buffer(%286) {sym_name = "buf98"} : memref<32x32xf32>
  %292 = AIE.buffer(%286) {sym_name = "buf99"} : memref<32x32xf32>
  %293 = AIE.buffer(%286) {sym_name = "buf100"} : memref<32x32xf32>
  %294 = AIE.core(%286) {
    AIE.useLock(%288, Acquire, 1)
    AIE.useLock(%289, Acquire, 1)
    AIE.useLock(%298, Acquire, 0)
    call @extern_kernel(%293, %290, %291, %292) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%298, Release, 1)
    AIE.useLock(%289, Release, 0)
    AIE.useLock(%288, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %295 = AIE.mem(%286) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%289, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%292 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%289, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%288, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%291 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%288, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %296 = AIE.tile(15, 3)
  %297 = AIE.switchbox(%296) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %442)
    %445 = AIE.masterset(DMA : 1, %443)
    %446 = AIE.masterset(North : 0, %441)
    %447 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %443)
      AIE.rule(30, 6, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %442)
      AIE.rule(30, 2, %441)
    }
  }
  %298 = AIE.lock(%296, 2)
  %299 = AIE.lock(%296, 1)
  %300 = AIE.lock(%296, 0)
  %301 = AIE.buffer(%296) {sym_name = "buf101"} : memref<32x32xf32>
  %302 = AIE.buffer(%296) {sym_name = "buf102"} : memref<32x32xf32>
  %303 = AIE.buffer(%296) {sym_name = "buf103"} : memref<32x32xf32>
  %304 = AIE.core(%296) {
    AIE.useLock(%310, Acquire, 0)
    AIE.useLock(%298, Acquire, 1)
    AIE.useLock(%299, Acquire, 1)
    AIE.useLock(%300, Acquire, 1)
    call @extern_kernel(%290, %301, %302, %303) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%300, Release, 0)
    AIE.useLock(%299, Release, 0)
    AIE.useLock(%298, Release, 0)
    AIE.useLock(%310, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %305 = AIE.mem(%296) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%300, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%302 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%300, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%299, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%303 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%299, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %306 = AIE.tile(15, 4)
  %307 = AIE.switchbox(%306) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %441)
    %445 = AIE.masterset(DMA : 1, %443)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %442)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %441)
      AIE.rule(31, 7, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %443)
      AIE.rule(31, 3, %440)
    }
  }
  %308 = AIE.lock(%306, 2)
  %309 = AIE.lock(%306, 1)
  %310 = AIE.lock(%306, 0)
  %311 = AIE.buffer(%306) {sym_name = "buf104"} : memref<32x32xf32>
  %312 = AIE.buffer(%306) {sym_name = "buf105"} : memref<32x32xf32>
  %313 = AIE.buffer(%306) {sym_name = "buf106"} : memref<32x32xf32>
  %314 = AIE.core(%306) {
    AIE.useLock(%309, Acquire, 1)
    AIE.useLock(%310, Acquire, 1)
    AIE.useLock(%308, Acquire, 1)
    AIE.useLock(%321, Acquire, 0)
    call @extern_kernel(%301, %311, %312, %313) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%321, Release, 1)
    AIE.useLock(%308, Release, 0)
    AIE.useLock(%310, Release, 0)
    AIE.useLock(%309, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %315 = AIE.mem(%306) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%308, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%313 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%308, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%309, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%312 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%309, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %316 = AIE.tile(15, 5) {polyaie.leaf}
  %317 = AIE.lock(%316, 15)
  %318 = AIE.switchbox(%316) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<0> (3)
    %445 = AIE.masterset(DMA : 0, %441)
    %446 = AIE.masterset(DMA : 1, %444)
    %447 = AIE.masterset(West : 0, %442)
    %448 = AIE.masterset(West : 1, %440)
    %449 = AIE.masterset(West : 2, %443)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %443)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %440)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %442)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %441)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %444)
    }
  }
  %319 = AIE.lock(%316, 3)
  %320 = AIE.lock(%316, 2)
  %321 = AIE.lock(%316, 1)
  %322 = AIE.lock(%316, 0)
  %323 = AIE.buffer(%316) {sym_name = "buf107"} : memref<32x32xf32>
  %324 = AIE.buffer(%316) {sym_name = "buf108"} : memref<32x32xf32>
  %325 = AIE.buffer(%316) {sym_name = "buf109"} : memref<32x32xf32>
  %326 = AIE.core(%316) {
    AIE.useLock(%322, Acquire, 0)
    AIE.useLock(%319, Acquire, 1)
    AIE.useLock(%320, Acquire, 1)
    AIE.useLock(%321, Acquire, 1)
    call @extern_kernel(%311, %323, %324, %325) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%321, Release, 0)
    AIE.useLock(%320, Release, 0)
    AIE.useLock(%319, Release, 0)
    AIE.useLock(%322, Release, 1)
    AIE.useLock(%317, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %327 = AIE.mem(%316) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%320, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%325 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%320, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%319, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%324 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%319, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%322, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%323 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%322, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %328 = AIE.tile(16, 2)
  %329 = AIE.switchbox(%328) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %443)
    %445 = AIE.masterset(DMA : 1, %441)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %442)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %443)
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %441)
      AIE.rule(28, 0, %440)
    }
  }
  %330 = AIE.lock(%328, 1)
  %331 = AIE.lock(%328, 0)
  %332 = AIE.buffer(%328) {sym_name = "buf110"} : memref<32x32xf32>
  %333 = AIE.buffer(%328) {sym_name = "buf111"} : memref<32x32xf32>
  %334 = AIE.buffer(%328) {sym_name = "buf112"} : memref<32x32xf32>
  %335 = AIE.buffer(%328) {sym_name = "buf113"} : memref<32x32xf32>
  %336 = AIE.core(%328) {
    AIE.useLock(%341, Acquire, 0)
    AIE.useLock(%331, Acquire, 1)
    AIE.useLock(%330, Acquire, 1)
    call @extern_kernel(%335, %332, %333, %334) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%330, Release, 0)
    AIE.useLock(%331, Release, 0)
    AIE.useLock(%341, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %337 = AIE.mem(%328) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%330, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%334 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%330, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%331, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%333 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%331, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %338 = AIE.tile(16, 3)
  %339 = AIE.switchbox(%338) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %441)
    %445 = AIE.masterset(DMA : 1, %443)
    %446 = AIE.masterset(North : 0, %442)
    %447 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %443)
      AIE.rule(30, 6, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %441)
      AIE.rule(30, 2, %442)
    }
  }
  %340 = AIE.lock(%338, 2)
  %341 = AIE.lock(%338, 1)
  %342 = AIE.lock(%338, 0)
  %343 = AIE.buffer(%338) {sym_name = "buf114"} : memref<32x32xf32>
  %344 = AIE.buffer(%338) {sym_name = "buf115"} : memref<32x32xf32>
  %345 = AIE.buffer(%338) {sym_name = "buf116"} : memref<32x32xf32>
  %346 = AIE.core(%338) {
    AIE.useLock(%341, Acquire, 1)
    AIE.useLock(%352, Acquire, 0)
    AIE.useLock(%340, Acquire, 1)
    AIE.useLock(%342, Acquire, 1)
    call @extern_kernel(%332, %343, %344, %345) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%342, Release, 0)
    AIE.useLock(%340, Release, 0)
    AIE.useLock(%352, Release, 1)
    AIE.useLock(%341, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %347 = AIE.mem(%338) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%342, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%344 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%342, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%340, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%345 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%340, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %348 = AIE.tile(16, 4)
  %349 = AIE.switchbox(%348) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %440)
    %445 = AIE.masterset(DMA : 1, %441)
    %446 = AIE.masterset(North : 0, %443)
    %447 = AIE.masterset(North : 1, %442)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %440)
      AIE.rule(31, 7, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %441)
      AIE.rule(31, 3, %443)
    }
  }
  %350 = AIE.lock(%348, 2)
  %351 = AIE.lock(%348, 1)
  %352 = AIE.lock(%348, 0)
  %353 = AIE.buffer(%348) {sym_name = "buf117"} : memref<32x32xf32>
  %354 = AIE.buffer(%348) {sym_name = "buf118"} : memref<32x32xf32>
  %355 = AIE.buffer(%348) {sym_name = "buf119"} : memref<32x32xf32>
  %356 = AIE.core(%348) {
    AIE.useLock(%350, Acquire, 1)
    AIE.useLock(%352, Acquire, 1)
    AIE.useLock(%363, Acquire, 0)
    AIE.useLock(%351, Acquire, 1)
    call @extern_kernel(%343, %353, %354, %355) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%351, Release, 0)
    AIE.useLock(%363, Release, 1)
    AIE.useLock(%352, Release, 0)
    AIE.useLock(%350, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %357 = AIE.mem(%348) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%351, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%355 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%351, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%350, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%354 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%350, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %358 = AIE.tile(16, 5) {polyaie.leaf}
  %359 = AIE.lock(%358, 15)
  %360 = AIE.switchbox(%358) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %443)
    %445 = AIE.masterset(DMA : 1, %442)
    %446 = AIE.masterset(West : 0, %441)
    %447 = AIE.masterset(West : 1, %440)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %440)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %443)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %442)
    }
  }
  %361 = AIE.lock(%358, 3)
  %362 = AIE.lock(%358, 2)
  %363 = AIE.lock(%358, 1)
  %364 = AIE.lock(%358, 0)
  %365 = AIE.buffer(%358) {sym_name = "buf120"} : memref<32x32xf32>
  %366 = AIE.buffer(%358) {sym_name = "buf121"} : memref<32x32xf32>
  %367 = AIE.buffer(%358) {sym_name = "buf122"} : memref<32x32xf32>
  %368 = AIE.core(%358) {
    AIE.useLock(%362, Acquire, 1)
    AIE.useLock(%364, Acquire, 0)
    AIE.useLock(%363, Acquire, 1)
    AIE.useLock(%361, Acquire, 1)
    call @extern_kernel(%353, %365, %366, %367) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%361, Release, 0)
    AIE.useLock(%363, Release, 0)
    AIE.useLock(%364, Release, 1)
    AIE.useLock(%362, Release, 0)
    AIE.useLock(%359, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %369 = AIE.mem(%358) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%361, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%367 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%361, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%362, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%366 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%362, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%364, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%365 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%364, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %370 = AIE.tile(17, 2)
  %371 = AIE.switchbox(%370) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %443)
    %445 = AIE.masterset(DMA : 1, %440)
    %446 = AIE.masterset(North : 0, %441)
    %447 = AIE.masterset(North : 1, %442)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %443)
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %440)
      AIE.rule(28, 0, %441)
    }
  }
  %372 = AIE.lock(%370, 1)
  %373 = AIE.lock(%370, 0)
  %374 = AIE.buffer(%370) {sym_name = "buf123"} : memref<32x32xf32>
  %375 = AIE.buffer(%370) {sym_name = "buf124"} : memref<32x32xf32>
  %376 = AIE.buffer(%370) {sym_name = "buf125"} : memref<32x32xf32>
  %377 = AIE.buffer(%370) {sym_name = "buf126"} : memref<32x32xf32>
  %378 = AIE.core(%370) {
    AIE.useLock(%383, Acquire, 0)
    AIE.useLock(%373, Acquire, 1)
    AIE.useLock(%372, Acquire, 1)
    call @extern_kernel(%377, %374, %375, %376) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%372, Release, 0)
    AIE.useLock(%373, Release, 0)
    AIE.useLock(%383, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %379 = AIE.mem(%370) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%372, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%376 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%372, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%373, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%375 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%373, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %380 = AIE.tile(17, 3)
  %381 = AIE.switchbox(%380) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %443)
    %445 = AIE.masterset(DMA : 1, %442)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %441)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %442)
      AIE.rule(30, 6, %441)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %443)
      AIE.rule(30, 2, %440)
    }
  }
  %382 = AIE.lock(%380, 2)
  %383 = AIE.lock(%380, 1)
  %384 = AIE.lock(%380, 0)
  %385 = AIE.buffer(%380) {sym_name = "buf127"} : memref<32x32xf32>
  %386 = AIE.buffer(%380) {sym_name = "buf128"} : memref<32x32xf32>
  %387 = AIE.buffer(%380) {sym_name = "buf129"} : memref<32x32xf32>
  %388 = AIE.core(%380) {
    AIE.useLock(%383, Acquire, 1)
    AIE.useLock(%382, Acquire, 1)
    AIE.useLock(%394, Acquire, 0)
    AIE.useLock(%384, Acquire, 1)
    call @extern_kernel(%374, %385, %386, %387) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%384, Release, 0)
    AIE.useLock(%394, Release, 1)
    AIE.useLock(%382, Release, 0)
    AIE.useLock(%383, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %389 = AIE.mem(%380) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%384, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%386 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%384, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%382, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%387 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%382, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %390 = AIE.tile(17, 4)
  %391 = AIE.switchbox(%390) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(DMA : 0, %443)
    %445 = AIE.masterset(DMA : 1, %441)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %442)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %443)
      AIE.rule(31, 7, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %441)
      AIE.rule(31, 3, %440)
    }
  }
  %392 = AIE.lock(%390, 2)
  %393 = AIE.lock(%390, 1)
  %394 = AIE.lock(%390, 0)
  %395 = AIE.buffer(%390) {sym_name = "buf130"} : memref<32x32xf32>
  %396 = AIE.buffer(%390) {sym_name = "buf131"} : memref<32x32xf32>
  %397 = AIE.buffer(%390) {sym_name = "buf132"} : memref<32x32xf32>
  %398 = AIE.core(%390) {
    AIE.useLock(%392, Acquire, 1)
    AIE.useLock(%393, Acquire, 1)
    AIE.useLock(%394, Acquire, 1)
    AIE.useLock(%406, Acquire, 0)
    call @extern_kernel(%385, %395, %396, %397) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%406, Release, 1)
    AIE.useLock(%394, Release, 0)
    AIE.useLock(%393, Release, 0)
    AIE.useLock(%392, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %399 = AIE.mem(%390) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%393, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%397 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%393, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%392, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%396 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%392, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %400 = AIE.tile(17, 5) {polyaie.leaf}
  %401 = AIE.lock(%400, 15)
  %402 = AIE.switchbox(%400) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.masterset(DMA : 0, %442)
    %444 = AIE.masterset(DMA : 1, %440)
    %445 = AIE.masterset(West : 0, %441)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %441)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 7, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 3, %440)
    }
  }
  %403 = AIE.lock(%400, 3)
  %404 = AIE.lock(%400, 2)
  %405 = AIE.lock(%400, 1)
  %406 = AIE.lock(%400, 0)
  %407 = AIE.buffer(%400) {sym_name = "buf133"} : memref<32x32xf32>
  %408 = AIE.buffer(%400) {sym_name = "buf134"} : memref<32x32xf32>
  %409 = AIE.buffer(%400) {sym_name = "buf135"} : memref<32x32xf32>
  %410 = AIE.core(%400) {
    AIE.useLock(%404, Acquire, 1)
    AIE.useLock(%403, Acquire, 0)
    AIE.useLock(%406, Acquire, 1)
    AIE.useLock(%405, Acquire, 1)
    call @extern_kernel(%395, %407, %408, %409) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%405, Release, 0)
    AIE.useLock(%406, Release, 0)
    AIE.useLock(%403, Release, 1)
    AIE.useLock(%404, Release, 0)
    AIE.useLock(%401, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %411 = AIE.mem(%400) {
    %440 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%405, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%409 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%405, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %441 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%404, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%408 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%404, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %442 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%403, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%407 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%403, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %412 = AIE.tile(12, 0)
  %413 = AIE.switchbox(%412) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<0> (3)
    %446 = AIE.masterset(West : 0, %440)
    %447 = AIE.masterset(West : 1, %443)
    %448 = AIE.masterset(North : 0, %444)
    %449 = AIE.masterset(North : 1, %442)
    %450 = AIE.masterset(East : 0, %444)
    %451 = AIE.masterset(East : 1, %441)
    %452 = AIE.masterset(East : 2, %442)
    %453 = AIE.masterset(East : 3, %445)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %443)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %440)
    }
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %445)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %444)
    }
  }
  %414 = AIE.tile(13, 0)
  %415 = AIE.switchbox(%414) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<0> (3)
    %445 = AIE.masterset(North : 0, %440)
    %446 = AIE.masterset(North : 1, %442)
    %447 = AIE.masterset(East : 0, %441)
    %448 = AIE.masterset(East : 1, %443)
    %449 = AIE.masterset(East : 2, %444)
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %444)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %443)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 0, %440)
    }
  }
  %416 = AIE.tile(16, 0)
  %417 = AIE.switchbox(%416) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.masterset(West : 0, %442)
    %444 = AIE.masterset(West : 1, %440)
    %445 = AIE.masterset(North : 0, %442)
    %446 = AIE.masterset(North : 1, %441)
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %442)
    }
  }
  %418 = AIE.tile(16, 1)
  %419 = AIE.switchbox(%418) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.masterset(North : 0, %441)
    %443 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %441)
    }
  }
  %420 = AIE.tile(15, 1)
  %421 = AIE.switchbox(%420) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.masterset(North : 0, %441)
    %443 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %441)
    }
  }
  %422 = AIE.tile(17, 1)
  %423 = AIE.switchbox(%422) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.masterset(North : 0, %440)
    %443 = AIE.masterset(North : 1, %441)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %440)
    }
  }
  %424 = AIE.tile(17, 0)
  %425 = AIE.switchbox(%424) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.masterset(West : 0, %440)
    %443 = AIE.masterset(West : 1, %441)
    %444 = AIE.masterset(North : 0, %440)
    %445 = AIE.masterset(North : 1, %441)
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %440)
    }
  }
  %426 = AIE.tile(14, 0)
  %427 = AIE.switchbox(%426) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<0> (2)
    %444 = AIE.amsel<0> (3)
    %445 = AIE.masterset(West : 0, %440)
    %446 = AIE.masterset(North : 0, %444)
    %447 = AIE.masterset(North : 1, %442)
    %448 = AIE.masterset(East : 0, %443)
    %449 = AIE.masterset(East : 1, %441)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %443)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %442)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %444)
    }
  }
  %428 = AIE.tile(12, 1)
  %429 = AIE.switchbox(%428) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<0> (3)
    %446 = AIE.masterset(South : 0, %441)
    %447 = AIE.masterset(South : 1, %444)
    %448 = AIE.masterset(West : 0, %443)
    %449 = AIE.masterset(West : 1, %445)
    %450 = AIE.masterset(North : 0, %440)
    %451 = AIE.masterset(North : 1, %442)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %444)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %440)
    }
  }
  %430 = AIE.tile(15, 0)
  %431 = AIE.switchbox(%430) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.amsel<0> (2)
    %443 = AIE.amsel<0> (3)
    %444 = AIE.masterset(West : 0, %440)
    %445 = AIE.masterset(West : 1, %441)
    %446 = AIE.masterset(North : 0, %440)
    %447 = AIE.masterset(North : 1, %443)
    %448 = AIE.masterset(East : 0, %442)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %443)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %442)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 4, %441)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %440)
    }
  }
  %432 = AIE.tile(11, 1)
  %433 = AIE.switchbox(%432) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<2> (0)
    %443 = AIE.amsel<0> (1)
    %444 = AIE.amsel<1> (1)
    %445 = AIE.amsel<2> (1)
    %446 = AIE.amsel<0> (2)
    %447 = AIE.amsel<1> (2)
    %448 = AIE.amsel<0> (3)
    %449 = AIE.amsel<1> (3)
    %450 = AIE.masterset(South : 0, %446)
    %451 = AIE.masterset(South : 1, %449)
    %452 = AIE.masterset(South : 2, %447)
    %453 = AIE.masterset(South : 3, %444)
    %454 = AIE.masterset(West : 0, %441)
    %455 = AIE.masterset(West : 1, %445)
    %456 = AIE.masterset(North : 0, %443)
    %457 = AIE.masterset(North : 1, %440)
    %458 = AIE.masterset(East : 0, %448)
    %459 = AIE.masterset(East : 1, %442)
    AIE.packetrules(West : 1) {
      AIE.rule(31, 3, %442)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 2, %448)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %441)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %444)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %447)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %449)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %446)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %443)
    }
  }
  %434 = AIE.tile(14, 1)
  %435 = AIE.switchbox(%434) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.masterset(North : 0, %441)
    %443 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %441)
    }
  }
  %436 = AIE.tile(13, 1)
  %437 = AIE.switchbox(%436) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<0> (1)
    %442 = AIE.masterset(North : 0, %441)
    %443 = AIE.masterset(North : 1, %440)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %441)
    }
  }
  %438 = AIE.tile(10, 1)
  %439 = AIE.switchbox(%438) {
    %440 = AIE.amsel<0> (0)
    %441 = AIE.amsel<1> (0)
    %442 = AIE.amsel<0> (1)
    %443 = AIE.amsel<1> (1)
    %444 = AIE.amsel<0> (2)
    %445 = AIE.amsel<0> (3)
    %446 = AIE.masterset(South : 0, %443)
    %447 = AIE.masterset(South : 1, %445)
    %448 = AIE.masterset(North : 0, %442)
    %449 = AIE.masterset(North : 1, %440)
    %450 = AIE.masterset(East : 0, %441)
    %451 = AIE.masterset(East : 1, %444)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 3, %444)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %441)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %445)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %443)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %440)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %442)
    }
  }
}


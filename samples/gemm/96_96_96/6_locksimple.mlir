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
  %4 = AIE.lock(%3, 5)
  %5 = AIE.lock(%3, 4)
  %6 = AIE.lock(%3, 3)
  %7 = AIE.lock(%3, 2)
  %8 = AIE.lock(%3, 1)
  %9 = AIE.lock(%3, 0)
  %10 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %11 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %12 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %13 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %14 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %15 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %16 = AIE.external_buffer 90112 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %17 = AIE.external_buffer 98304 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %18 = AIE.external_buffer 106496 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %18) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %19 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %19) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %20 = AIE.external_buffer 122880 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %20) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %21 = AIE.external_buffer 131072 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %21) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %22 = AIE.external_buffer 139264 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %22) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %23 = AIE.external_buffer 147456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %23) {kind = 2 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %24 = AIE.core(%3) {
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%5, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%4, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.end
  }
  %25 = AIE.shimDMA(%3) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBd(<%16 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBd(<%17 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBd(<%18 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBd(<%19 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBd(<%20 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBd(<%21 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBd(<%22 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBd(<%23 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %313 = AIE.dmaStart(MM2S0, ^bb11, ^bb14)
  ^bb11:  // 2 preds: ^bb10, ^bb13
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb11
  ^bb14:  // pred: ^bb10
    %314 = AIE.dmaStart(MM2S1, ^bb15, ^bb18)
  ^bb15:  // 2 preds: ^bb14, ^bb17
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb16
  ^bb16:  // pred: ^bb15
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb15
  ^bb18:  // pred: ^bb14
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%59, DMA : 0>
      AIE.bp_dest<%143, DMA : 0>
      AIE.bp_dest<%227, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%68, DMA : 0>
      AIE.bp_dest<%152, DMA : 0>
      AIE.bp_dest<%236, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%77, DMA : 1>
      AIE.bp_dest<%161, DMA : 0>
      AIE.bp_dest<%245, DMA : 1>
    }
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%59, DMA : 1>
      AIE.bp_dest<%87, DMA : 0>
      AIE.bp_dest<%115, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%68, DMA : 1>
      AIE.bp_dest<%96, DMA : 1>
      AIE.bp_dest<%124, DMA : 1>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%77, DMA : 0>
      AIE.bp_dest<%105, DMA : 0>
      AIE.bp_dest<%133, DMA : 0>
    }
  }
  %26 = AIE.tile(18, 0)
  %27 = AIE.lock(%26, 5)
  %28 = AIE.lock(%26, 4)
  %29 = AIE.lock(%26, 3)
  %30 = AIE.lock(%26, 2)
  %31 = AIE.lock(%26, 1)
  %32 = AIE.lock(%26, 0)
  %33 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %34 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %35 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %36 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %37 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %38 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %39 = AIE.core(%26) {
    AIE.useLock(%29, Acquire, 0)
    AIE.useLock(%31, Acquire, 0)
    AIE.useLock(%30, Acquire, 0)
    AIE.useLock(%32, Acquire, 0)
    AIE.useLock(%28, Acquire, 0)
    AIE.useLock(%27, Acquire, 0)
    AIE.useLock(%27, Release, 1)
    AIE.useLock(%28, Release, 1)
    AIE.useLock(%32, Release, 1)
    AIE.useLock(%30, Release, 1)
    AIE.useLock(%31, Release, 1)
    AIE.useLock(%29, Release, 1)
    AIE.end
  }
  %40 = AIE.shimDMA(%26) {
    %311 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%32, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%38 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%37 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %312 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%29, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%27, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%30, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%26, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%143, DMA : 1>
      AIE.bp_dest<%171, DMA : 0>
      AIE.bp_dest<%199, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%152, DMA : 1>
      AIE.bp_dest<%180, DMA : 1>
      AIE.bp_dest<%208, DMA : 1>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%161, DMA : 1>
      AIE.bp_dest<%189, DMA : 0>
      AIE.bp_dest<%217, DMA : 1>
    }
  }
  AIE.broad_packet(%26, DMA : 1) {
    AIE.bp_id(0) {
      AIE.bp_dest<%227, DMA : 1>
      AIE.bp_dest<%255, DMA : 0>
      AIE.bp_dest<%283, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%236, DMA : 0>
      AIE.bp_dest<%264, DMA : 0>
      AIE.bp_dest<%292, DMA : 0>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%245, DMA : 0>
      AIE.bp_dest<%273, DMA : 0>
      AIE.bp_dest<%301, DMA : 1>
    }
  }
  %41 = AIE.tile(11, 0)
  %42 = AIE.lock(%41, 5)
  %43 = AIE.lock(%41, 4)
  %44 = AIE.lock(%41, 3)
  %45 = AIE.lock(%41, 2)
  %46 = AIE.lock(%41, 1)
  %47 = AIE.lock(%41, 0)
  %48 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%48, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %49 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%49, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %50 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%50, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %51 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%51, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %52 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%52, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %53 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%53, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %54 = AIE.external_buffer 155648 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %54) {kind = 2 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %55 = AIE.core(%41) {
    AIE.useLock(%44, Acquire, 0)
    AIE.useLock(%42, Acquire, 0)
    AIE.useLock(%45, Acquire, 0)
    AIE.useLock(%43, Acquire, 0)
    AIE.useLock(%47, Acquire, 0)
    AIE.useLock(%46, Acquire, 0)
    AIE.useLock(%46, Release, 1)
    AIE.useLock(%47, Release, 1)
    AIE.useLock(%43, Release, 1)
    AIE.useLock(%45, Release, 1)
    AIE.useLock(%42, Release, 1)
    AIE.useLock(%44, Release, 1)
    AIE.end
  }
  %56 = AIE.shimDMA(%41) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBd(<%54 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(MM2S0, ^bb3, ^bb6)
  ^bb3:  // 2 preds: ^bb2, ^bb5
    AIE.useLock(%42, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%42, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%45, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%52 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 0)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%44, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%51 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 0)
    br ^bb3
  ^bb6:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S1, ^bb7, ^bb10)
  ^bb7:  // 2 preds: ^bb6, ^bb9
    AIE.useLock(%46, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%50 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%47, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%49 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%43, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 0)
    br ^bb7
  ^bb10:  // pred: ^bb6
    AIE.end
  }
  AIE.broad_packet(%41, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%87, DMA : 1>
      AIE.bp_dest<%171, DMA : 1>
      AIE.bp_dest<%255, DMA : 1>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%96, DMA : 0>
      AIE.bp_dest<%180, DMA : 0>
      AIE.bp_dest<%264, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%105, DMA : 1>
      AIE.bp_dest<%189, DMA : 1>
      AIE.bp_dest<%273, DMA : 1>
    }
  }
  AIE.broad_packet(%41, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%115, DMA : 0>
      AIE.bp_dest<%199, DMA : 0>
      AIE.bp_dest<%283, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%124, DMA : 0>
      AIE.bp_dest<%208, DMA : 0>
      AIE.bp_dest<%292, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%133, DMA : 1>
      AIE.bp_dest<%217, DMA : 0>
      AIE.bp_dest<%301, DMA : 0>
    }
  }
  %57 = AIE.tile(0, 0)
  %58 = AIE.core(%57) {
    AIE.end
  }
  %59 = AIE.tile(10, 2)
  %60 = AIE.lock(%59, 1)
  %61 = AIE.lock(%59, 0)
  %62 = AIE.buffer(%59) : memref<32x32xf32>
  %63 = AIE.buffer(%59) : memref<32x32xf32>
  %64 = AIE.buffer(%59) : memref<32x32xf32>
  %65 = AIE.buffer(%59) : memref<32x32xf32>
  %66 = AIE.core(%59) {
    AIE.useLock(%60, Acquire, 1)
    AIE.useLock(%69, Acquire, 0)
    AIE.useLock(%61, Acquire, 1)
    call @extern_kernel(%65, %62, %63, %64) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%61, Release, 0)
    AIE.useLock(%69, Release, 1)
    AIE.useLock(%60, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %67 = AIE.mem(%59) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%61, Acquire, 0)
    AIE.dmaBd(<%64 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%61, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %68 = AIE.tile(10, 3)
  %69 = AIE.lock(%68, 2)
  %70 = AIE.lock(%68, 1)
  %71 = AIE.lock(%68, 0)
  %72 = AIE.buffer(%68) : memref<32x32xf32>
  %73 = AIE.buffer(%68) : memref<32x32xf32>
  %74 = AIE.buffer(%68) : memref<32x32xf32>
  %75 = AIE.core(%68) {
    AIE.useLock(%79, Acquire, 0)
    AIE.useLock(%71, Acquire, 1)
    AIE.useLock(%69, Acquire, 1)
    AIE.useLock(%70, Acquire, 1)
    call @extern_kernel(%62, %72, %73, %74) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%70, Release, 0)
    AIE.useLock(%69, Release, 0)
    AIE.useLock(%71, Release, 0)
    AIE.useLock(%79, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %76 = AIE.mem(%68) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%70, Acquire, 0)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%70, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%71, Acquire, 0)
    AIE.dmaBd(<%73 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%71, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %77 = AIE.tile(10, 4) {polyaie.leaf}
  %78 = AIE.lock(%77, 3)
  %79 = AIE.lock(%77, 2)
  %80 = AIE.lock(%77, 1)
  %81 = AIE.lock(%77, 0)
  %82 = AIE.buffer(%77) : memref<32x32xf32>
  %83 = AIE.buffer(%77) : memref<32x32xf32>
  %84 = AIE.buffer(%77) : memref<32x32xf32>
  %85 = AIE.core(%77) {
    AIE.useLock(%79, Acquire, 1)
    AIE.useLock(%78, Acquire, 1)
    AIE.useLock(%80, Acquire, 0)
    AIE.useLock(%81, Acquire, 1)
    call @extern_kernel(%72, %82, %83, %84) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%81, Release, 0)
    AIE.useLock(%80, Release, 1)
    AIE.useLock(%78, Release, 0)
    AIE.useLock(%79, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %86 = AIE.mem(%77) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBd(<%83 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%78, Acquire, 0)
    AIE.dmaBd(<%84 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%78, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%80, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%80, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%77, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %87 = AIE.tile(11, 2)
  %88 = AIE.lock(%87, 1)
  %89 = AIE.lock(%87, 0)
  %90 = AIE.buffer(%87) : memref<32x32xf32>
  %91 = AIE.buffer(%87) : memref<32x32xf32>
  %92 = AIE.buffer(%87) : memref<32x32xf32>
  %93 = AIE.buffer(%87) : memref<32x32xf32>
  %94 = AIE.core(%87) {
    AIE.useLock(%88, Acquire, 1)
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%99, Acquire, 0)
    call @extern_kernel(%93, %90, %91, %92) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%99, Release, 1)
    AIE.useLock(%89, Release, 0)
    AIE.useLock(%88, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %95 = AIE.mem(%87) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%89, Acquire, 0)
    AIE.dmaBd(<%91 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%89, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%88, Acquire, 0)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %96 = AIE.tile(11, 3)
  %97 = AIE.lock(%96, 2)
  %98 = AIE.lock(%96, 1)
  %99 = AIE.lock(%96, 0)
  %100 = AIE.buffer(%96) : memref<32x32xf32>
  %101 = AIE.buffer(%96) : memref<32x32xf32>
  %102 = AIE.buffer(%96) : memref<32x32xf32>
  %103 = AIE.core(%96) {
    AIE.useLock(%106, Acquire, 0)
    AIE.useLock(%98, Acquire, 1)
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%97, Acquire, 1)
    call @extern_kernel(%90, %100, %101, %102) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%97, Release, 0)
    AIE.useLock(%99, Release, 0)
    AIE.useLock(%98, Release, 0)
    AIE.useLock(%106, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %104 = AIE.mem(%96) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%97, Acquire, 0)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%97, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%98, Acquire, 0)
    AIE.dmaBd(<%101 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%98, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %105 = AIE.tile(11, 4) {polyaie.leaf}
  %106 = AIE.lock(%105, 3)
  %107 = AIE.lock(%105, 2)
  %108 = AIE.lock(%105, 1)
  %109 = AIE.lock(%105, 0)
  %110 = AIE.buffer(%105) : memref<32x32xf32>
  %111 = AIE.buffer(%105) : memref<32x32xf32>
  %112 = AIE.buffer(%105) : memref<32x32xf32>
  %113 = AIE.core(%105) {
    AIE.useLock(%107, Acquire, 1)
    AIE.useLock(%106, Acquire, 1)
    AIE.useLock(%108, Acquire, 0)
    AIE.useLock(%109, Acquire, 1)
    call @extern_kernel(%100, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%108, Release, 1)
    AIE.useLock(%106, Release, 0)
    AIE.useLock(%107, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %114 = AIE.mem(%105) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%109, Acquire, 0)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%107, Acquire, 0)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%107, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%108, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%110 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%105, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %115 = AIE.tile(12, 2)
  %116 = AIE.lock(%115, 1)
  %117 = AIE.lock(%115, 0)
  %118 = AIE.buffer(%115) : memref<32x32xf32>
  %119 = AIE.buffer(%115) : memref<32x32xf32>
  %120 = AIE.buffer(%115) : memref<32x32xf32>
  %121 = AIE.buffer(%115) : memref<32x32xf32>
  %122 = AIE.core(%115) {
    AIE.useLock(%116, Acquire, 1)
    AIE.useLock(%125, Acquire, 0)
    AIE.useLock(%117, Acquire, 1)
    call @extern_kernel(%121, %118, %119, %120) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%117, Release, 0)
    AIE.useLock(%125, Release, 1)
    AIE.useLock(%116, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %123 = AIE.mem(%115) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%117, Acquire, 0)
    AIE.dmaBd(<%120 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%116, Acquire, 0)
    AIE.dmaBd(<%119 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%116, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %124 = AIE.tile(12, 3)
  %125 = AIE.lock(%124, 2)
  %126 = AIE.lock(%124, 1)
  %127 = AIE.lock(%124, 0)
  %128 = AIE.buffer(%124) : memref<32x32xf32>
  %129 = AIE.buffer(%124) : memref<32x32xf32>
  %130 = AIE.buffer(%124) : memref<32x32xf32>
  %131 = AIE.core(%124) {
    AIE.useLock(%127, Acquire, 1)
    AIE.useLock(%125, Acquire, 1)
    AIE.useLock(%126, Acquire, 1)
    AIE.useLock(%136, Acquire, 0)
    call @extern_kernel(%118, %128, %129, %130) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%136, Release, 1)
    AIE.useLock(%126, Release, 0)
    AIE.useLock(%125, Release, 0)
    AIE.useLock(%127, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %132 = AIE.mem(%124) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%126, Acquire, 0)
    AIE.dmaBd(<%130 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%126, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%127, Acquire, 0)
    AIE.dmaBd(<%129 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%127, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %133 = AIE.tile(12, 4) {polyaie.leaf}
  %134 = AIE.lock(%133, 3)
  %135 = AIE.lock(%133, 2)
  %136 = AIE.lock(%133, 1)
  %137 = AIE.lock(%133, 0)
  %138 = AIE.buffer(%133) : memref<32x32xf32>
  %139 = AIE.buffer(%133) : memref<32x32xf32>
  %140 = AIE.buffer(%133) : memref<32x32xf32>
  %141 = AIE.core(%133) {
    AIE.useLock(%134, Acquire, 1)
    AIE.useLock(%136, Acquire, 1)
    AIE.useLock(%135, Acquire, 0)
    AIE.useLock(%137, Acquire, 1)
    call @extern_kernel(%128, %138, %139, %140) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%137, Release, 0)
    AIE.useLock(%135, Release, 1)
    AIE.useLock(%136, Release, 0)
    AIE.useLock(%134, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %142 = AIE.mem(%133) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%137, Acquire, 0)
    AIE.dmaBd(<%139 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%137, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%134, Acquire, 0)
    AIE.dmaBd(<%140 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%134, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%135, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%138 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%135, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%133, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %143 = AIE.tile(13, 2)
  %144 = AIE.lock(%143, 1)
  %145 = AIE.lock(%143, 0)
  %146 = AIE.buffer(%143) : memref<32x32xf32>
  %147 = AIE.buffer(%143) : memref<32x32xf32>
  %148 = AIE.buffer(%143) : memref<32x32xf32>
  %149 = AIE.buffer(%143) : memref<32x32xf32>
  %150 = AIE.core(%143) {
    AIE.useLock(%154, Acquire, 0)
    AIE.useLock(%145, Acquire, 1)
    AIE.useLock(%144, Acquire, 1)
    call @extern_kernel(%149, %146, %147, %148) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%144, Release, 0)
    AIE.useLock(%145, Release, 0)
    AIE.useLock(%154, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %151 = AIE.mem(%143) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%144, Acquire, 0)
    AIE.dmaBd(<%148 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%144, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%145, Acquire, 0)
    AIE.dmaBd(<%147 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%145, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %152 = AIE.tile(13, 3)
  %153 = AIE.lock(%152, 2)
  %154 = AIE.lock(%152, 1)
  %155 = AIE.lock(%152, 0)
  %156 = AIE.buffer(%152) : memref<32x32xf32>
  %157 = AIE.buffer(%152) : memref<32x32xf32>
  %158 = AIE.buffer(%152) : memref<32x32xf32>
  %159 = AIE.core(%152) {
    AIE.useLock(%162, Acquire, 0)
    AIE.useLock(%154, Acquire, 1)
    AIE.useLock(%153, Acquire, 1)
    AIE.useLock(%155, Acquire, 1)
    call @extern_kernel(%146, %156, %157, %158) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%155, Release, 0)
    AIE.useLock(%153, Release, 0)
    AIE.useLock(%154, Release, 0)
    AIE.useLock(%162, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %160 = AIE.mem(%152) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%155, Acquire, 0)
    AIE.dmaBd(<%158 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%155, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%153, Acquire, 0)
    AIE.dmaBd(<%157 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%153, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %161 = AIE.tile(13, 4) {polyaie.leaf}
  %162 = AIE.lock(%161, 3)
  %163 = AIE.lock(%161, 2)
  %164 = AIE.lock(%161, 1)
  %165 = AIE.lock(%161, 0)
  %166 = AIE.buffer(%161) : memref<32x32xf32>
  %167 = AIE.buffer(%161) : memref<32x32xf32>
  %168 = AIE.buffer(%161) : memref<32x32xf32>
  %169 = AIE.core(%161) {
    AIE.useLock(%165, Acquire, 1)
    AIE.useLock(%162, Acquire, 1)
    AIE.useLock(%163, Acquire, 1)
    AIE.useLock(%164, Acquire, 0)
    call @extern_kernel(%156, %166, %167, %168) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%164, Release, 1)
    AIE.useLock(%163, Release, 0)
    AIE.useLock(%162, Release, 0)
    AIE.useLock(%165, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %170 = AIE.mem(%161) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%163, Acquire, 0)
    AIE.dmaBd(<%168 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%163, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%165, Acquire, 0)
    AIE.dmaBd(<%167 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%165, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%164, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%166 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%164, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%161, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %171 = AIE.tile(14, 2)
  %172 = AIE.lock(%171, 1)
  %173 = AIE.lock(%171, 0)
  %174 = AIE.buffer(%171) : memref<32x32xf32>
  %175 = AIE.buffer(%171) : memref<32x32xf32>
  %176 = AIE.buffer(%171) : memref<32x32xf32>
  %177 = AIE.buffer(%171) : memref<32x32xf32>
  %178 = AIE.core(%171) {
    AIE.useLock(%172, Acquire, 1)
    AIE.useLock(%181, Acquire, 0)
    AIE.useLock(%173, Acquire, 1)
    call @extern_kernel(%177, %174, %175, %176) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%173, Release, 0)
    AIE.useLock(%181, Release, 1)
    AIE.useLock(%172, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %179 = AIE.mem(%171) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%173, Acquire, 0)
    AIE.dmaBd(<%175 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%173, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%172, Acquire, 0)
    AIE.dmaBd(<%176 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%172, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %180 = AIE.tile(14, 3)
  %181 = AIE.lock(%180, 2)
  %182 = AIE.lock(%180, 1)
  %183 = AIE.lock(%180, 0)
  %184 = AIE.buffer(%180) : memref<32x32xf32>
  %185 = AIE.buffer(%180) : memref<32x32xf32>
  %186 = AIE.buffer(%180) : memref<32x32xf32>
  %187 = AIE.core(%180) {
    AIE.useLock(%190, Acquire, 0)
    AIE.useLock(%181, Acquire, 1)
    AIE.useLock(%182, Acquire, 1)
    AIE.useLock(%183, Acquire, 1)
    call @extern_kernel(%174, %184, %185, %186) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%183, Release, 0)
    AIE.useLock(%182, Release, 0)
    AIE.useLock(%181, Release, 0)
    AIE.useLock(%190, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %188 = AIE.mem(%180) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%183, Acquire, 0)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%183, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%182, Acquire, 0)
    AIE.dmaBd(<%185 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%182, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %189 = AIE.tile(14, 4) {polyaie.leaf}
  %190 = AIE.lock(%189, 3)
  %191 = AIE.lock(%189, 2)
  %192 = AIE.lock(%189, 1)
  %193 = AIE.lock(%189, 0)
  %194 = AIE.buffer(%189) : memref<32x32xf32>
  %195 = AIE.buffer(%189) : memref<32x32xf32>
  %196 = AIE.buffer(%189) : memref<32x32xf32>
  %197 = AIE.core(%189) {
    AIE.useLock(%192, Acquire, 1)
    AIE.useLock(%193, Acquire, 1)
    AIE.useLock(%191, Acquire, 0)
    AIE.useLock(%190, Acquire, 1)
    call @extern_kernel(%184, %194, %195, %196) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%190, Release, 0)
    AIE.useLock(%191, Release, 1)
    AIE.useLock(%193, Release, 0)
    AIE.useLock(%192, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %198 = AIE.mem(%189) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%193, Acquire, 0)
    AIE.dmaBd(<%195 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%193, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%192, Acquire, 0)
    AIE.dmaBd(<%196 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%192, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%191, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%194 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%191, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%189, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %199 = AIE.tile(15, 2)
  %200 = AIE.lock(%199, 1)
  %201 = AIE.lock(%199, 0)
  %202 = AIE.buffer(%199) : memref<32x32xf32>
  %203 = AIE.buffer(%199) : memref<32x32xf32>
  %204 = AIE.buffer(%199) : memref<32x32xf32>
  %205 = AIE.buffer(%199) : memref<32x32xf32>
  %206 = AIE.core(%199) {
    AIE.useLock(%209, Acquire, 0)
    AIE.useLock(%201, Acquire, 1)
    AIE.useLock(%200, Acquire, 1)
    call @extern_kernel(%205, %202, %203, %204) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%200, Release, 0)
    AIE.useLock(%201, Release, 0)
    AIE.useLock(%209, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %207 = AIE.mem(%199) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%200, Acquire, 0)
    AIE.dmaBd(<%204 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%200, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%201, Acquire, 0)
    AIE.dmaBd(<%203 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%201, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %208 = AIE.tile(15, 3)
  %209 = AIE.lock(%208, 2)
  %210 = AIE.lock(%208, 1)
  %211 = AIE.lock(%208, 0)
  %212 = AIE.buffer(%208) : memref<32x32xf32>
  %213 = AIE.buffer(%208) : memref<32x32xf32>
  %214 = AIE.buffer(%208) : memref<32x32xf32>
  %215 = AIE.core(%208) {
    AIE.useLock(%209, Acquire, 1)
    AIE.useLock(%210, Acquire, 1)
    AIE.useLock(%211, Acquire, 1)
    AIE.useLock(%220, Acquire, 0)
    call @extern_kernel(%202, %212, %213, %214) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%220, Release, 1)
    AIE.useLock(%211, Release, 0)
    AIE.useLock(%210, Release, 0)
    AIE.useLock(%209, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %216 = AIE.mem(%208) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%211, Acquire, 0)
    AIE.dmaBd(<%214 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%211, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%210, Acquire, 0)
    AIE.dmaBd(<%213 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%210, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %217 = AIE.tile(15, 4) {polyaie.leaf}
  %218 = AIE.lock(%217, 3)
  %219 = AIE.lock(%217, 2)
  %220 = AIE.lock(%217, 1)
  %221 = AIE.lock(%217, 0)
  %222 = AIE.buffer(%217) : memref<32x32xf32>
  %223 = AIE.buffer(%217) : memref<32x32xf32>
  %224 = AIE.buffer(%217) : memref<32x32xf32>
  %225 = AIE.core(%217) {
    AIE.useLock(%221, Acquire, 1)
    AIE.useLock(%218, Acquire, 1)
    AIE.useLock(%219, Acquire, 0)
    AIE.useLock(%220, Acquire, 1)
    call @extern_kernel(%212, %222, %223, %224) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%220, Release, 0)
    AIE.useLock(%219, Release, 1)
    AIE.useLock(%218, Release, 0)
    AIE.useLock(%221, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %226 = AIE.mem(%217) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%218, Acquire, 0)
    AIE.dmaBd(<%224 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%218, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%221, Acquire, 0)
    AIE.dmaBd(<%223 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%221, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%219, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%222 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%219, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%217, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %227 = AIE.tile(16, 2)
  %228 = AIE.lock(%227, 1)
  %229 = AIE.lock(%227, 0)
  %230 = AIE.buffer(%227) : memref<32x32xf32>
  %231 = AIE.buffer(%227) : memref<32x32xf32>
  %232 = AIE.buffer(%227) : memref<32x32xf32>
  %233 = AIE.buffer(%227) : memref<32x32xf32>
  %234 = AIE.core(%227) {
    AIE.useLock(%229, Acquire, 1)
    AIE.useLock(%238, Acquire, 0)
    AIE.useLock(%228, Acquire, 1)
    call @extern_kernel(%233, %230, %231, %232) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%228, Release, 0)
    AIE.useLock(%238, Release, 1)
    AIE.useLock(%229, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %235 = AIE.mem(%227) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%228, Acquire, 0)
    AIE.dmaBd(<%232 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%228, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%229, Acquire, 0)
    AIE.dmaBd(<%231 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%229, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %236 = AIE.tile(16, 3)
  %237 = AIE.lock(%236, 2)
  %238 = AIE.lock(%236, 1)
  %239 = AIE.lock(%236, 0)
  %240 = AIE.buffer(%236) : memref<32x32xf32>
  %241 = AIE.buffer(%236) : memref<32x32xf32>
  %242 = AIE.buffer(%236) : memref<32x32xf32>
  %243 = AIE.core(%236) {
    AIE.useLock(%238, Acquire, 1)
    AIE.useLock(%249, Acquire, 0)
    AIE.useLock(%239, Acquire, 1)
    AIE.useLock(%237, Acquire, 1)
    call @extern_kernel(%230, %240, %241, %242) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%237, Release, 0)
    AIE.useLock(%239, Release, 0)
    AIE.useLock(%249, Release, 1)
    AIE.useLock(%238, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %244 = AIE.mem(%236) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%237, Acquire, 0)
    AIE.dmaBd(<%241 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%237, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%239, Acquire, 0)
    AIE.dmaBd(<%242 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%239, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %245 = AIE.tile(16, 4) {polyaie.leaf}
  %246 = AIE.lock(%245, 3)
  %247 = AIE.lock(%245, 2)
  %248 = AIE.lock(%245, 1)
  %249 = AIE.lock(%245, 0)
  %250 = AIE.buffer(%245) : memref<32x32xf32>
  %251 = AIE.buffer(%245) : memref<32x32xf32>
  %252 = AIE.buffer(%245) : memref<32x32xf32>
  %253 = AIE.core(%245) {
    AIE.useLock(%247, Acquire, 1)
    AIE.useLock(%248, Acquire, 1)
    AIE.useLock(%249, Acquire, 1)
    AIE.useLock(%246, Acquire, 0)
    call @extern_kernel(%240, %250, %251, %252) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%246, Release, 1)
    AIE.useLock(%249, Release, 0)
    AIE.useLock(%248, Release, 0)
    AIE.useLock(%247, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %254 = AIE.mem(%245) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%248, Acquire, 0)
    AIE.dmaBd(<%251 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%248, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%247, Acquire, 0)
    AIE.dmaBd(<%252 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%247, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%246, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%250 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%246, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%245, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %255 = AIE.tile(17, 2)
  %256 = AIE.lock(%255, 1)
  %257 = AIE.lock(%255, 0)
  %258 = AIE.buffer(%255) : memref<32x32xf32>
  %259 = AIE.buffer(%255) : memref<32x32xf32>
  %260 = AIE.buffer(%255) : memref<32x32xf32>
  %261 = AIE.buffer(%255) : memref<32x32xf32>
  %262 = AIE.core(%255) {
    AIE.useLock(%256, Acquire, 1)
    AIE.useLock(%257, Acquire, 1)
    AIE.useLock(%267, Acquire, 0)
    call @extern_kernel(%261, %258, %259, %260) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%267, Release, 1)
    AIE.useLock(%257, Release, 0)
    AIE.useLock(%256, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %263 = AIE.mem(%255) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%257, Acquire, 0)
    AIE.dmaBd(<%259 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%257, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%256, Acquire, 0)
    AIE.dmaBd(<%260 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%256, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %264 = AIE.tile(17, 3)
  %265 = AIE.lock(%264, 2)
  %266 = AIE.lock(%264, 1)
  %267 = AIE.lock(%264, 0)
  %268 = AIE.buffer(%264) : memref<32x32xf32>
  %269 = AIE.buffer(%264) : memref<32x32xf32>
  %270 = AIE.buffer(%264) : memref<32x32xf32>
  %271 = AIE.core(%264) {
    AIE.useLock(%267, Acquire, 1)
    AIE.useLock(%266, Acquire, 1)
    AIE.useLock(%276, Acquire, 0)
    AIE.useLock(%265, Acquire, 1)
    call @extern_kernel(%258, %268, %269, %270) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%265, Release, 0)
    AIE.useLock(%276, Release, 1)
    AIE.useLock(%266, Release, 0)
    AIE.useLock(%267, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %272 = AIE.mem(%264) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%265, Acquire, 0)
    AIE.dmaBd(<%269 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%265, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%266, Acquire, 0)
    AIE.dmaBd(<%270 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%266, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %273 = AIE.tile(17, 4) {polyaie.leaf}
  %274 = AIE.lock(%273, 3)
  %275 = AIE.lock(%273, 2)
  %276 = AIE.lock(%273, 1)
  %277 = AIE.lock(%273, 0)
  %278 = AIE.buffer(%273) : memref<32x32xf32>
  %279 = AIE.buffer(%273) : memref<32x32xf32>
  %280 = AIE.buffer(%273) : memref<32x32xf32>
  %281 = AIE.core(%273) {
    AIE.useLock(%275, Acquire, 1)
    AIE.useLock(%277, Acquire, 1)
    AIE.useLock(%274, Acquire, 0)
    AIE.useLock(%276, Acquire, 1)
    call @extern_kernel(%268, %278, %279, %280) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%276, Release, 0)
    AIE.useLock(%274, Release, 1)
    AIE.useLock(%277, Release, 0)
    AIE.useLock(%275, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %282 = AIE.mem(%273) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%277, Acquire, 0)
    AIE.dmaBd(<%279 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%277, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%275, Acquire, 0)
    AIE.dmaBd(<%280 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%274, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%278 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%274, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%273, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %283 = AIE.tile(18, 2)
  %284 = AIE.lock(%283, 1)
  %285 = AIE.lock(%283, 0)
  %286 = AIE.buffer(%283) : memref<32x32xf32>
  %287 = AIE.buffer(%283) : memref<32x32xf32>
  %288 = AIE.buffer(%283) : memref<32x32xf32>
  %289 = AIE.buffer(%283) : memref<32x32xf32>
  %290 = AIE.core(%283) {
    AIE.useLock(%285, Acquire, 1)
    AIE.useLock(%294, Acquire, 0)
    AIE.useLock(%284, Acquire, 1)
    call @extern_kernel(%289, %286, %287, %288) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%284, Release, 0)
    AIE.useLock(%294, Release, 1)
    AIE.useLock(%285, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %291 = AIE.mem(%283) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%284, Acquire, 0)
    AIE.dmaBd(<%288 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%284, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%285, Acquire, 0)
    AIE.dmaBd(<%287 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%285, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %292 = AIE.tile(18, 3)
  %293 = AIE.lock(%292, 2)
  %294 = AIE.lock(%292, 1)
  %295 = AIE.lock(%292, 0)
  %296 = AIE.buffer(%292) : memref<32x32xf32>
  %297 = AIE.buffer(%292) : memref<32x32xf32>
  %298 = AIE.buffer(%292) : memref<32x32xf32>
  %299 = AIE.core(%292) {
    AIE.useLock(%294, Acquire, 1)
    AIE.useLock(%304, Acquire, 0)
    AIE.useLock(%295, Acquire, 1)
    AIE.useLock(%293, Acquire, 1)
    call @extern_kernel(%286, %296, %297, %298) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%293, Release, 0)
    AIE.useLock(%295, Release, 0)
    AIE.useLock(%304, Release, 1)
    AIE.useLock(%294, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %300 = AIE.mem(%292) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%293, Acquire, 0)
    AIE.dmaBd(<%297 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%293, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%295, Acquire, 0)
    AIE.dmaBd(<%298 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%295, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %301 = AIE.tile(18, 4) {polyaie.leaf}
  %302 = AIE.lock(%301, 3)
  %303 = AIE.lock(%301, 2)
  %304 = AIE.lock(%301, 1)
  %305 = AIE.lock(%301, 0)
  %306 = AIE.buffer(%301) : memref<32x32xf32>
  %307 = AIE.buffer(%301) : memref<32x32xf32>
  %308 = AIE.buffer(%301) : memref<32x32xf32>
  %309 = AIE.core(%301) {
    AIE.useLock(%305, Acquire, 1)
    AIE.useLock(%304, Acquire, 1)
    AIE.useLock(%303, Acquire, 1)
    AIE.useLock(%302, Acquire, 0)
    call @extern_kernel(%296, %306, %307, %308) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%302, Release, 1)
    AIE.useLock(%303, Release, 0)
    AIE.useLock(%304, Release, 0)
    AIE.useLock(%305, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %310 = AIE.mem(%301) {
    %311 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%303, Acquire, 0)
    AIE.dmaBd(<%308 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%303, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %312 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%305, Acquire, 0)
    AIE.dmaBd(<%307 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%305, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %313 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%302, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%306 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%302, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%301, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%41, DMA : 0>
    }
  }
}


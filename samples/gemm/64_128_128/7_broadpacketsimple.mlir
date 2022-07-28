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
  %4 = AIE.lock(%3, 7)
  %5 = AIE.lock(%3, 6)
  %6 = AIE.lock(%3, 5)
  %7 = AIE.lock(%3, 4)
  %8 = AIE.lock(%3, 3)
  %9 = AIE.lock(%3, 2)
  %10 = AIE.lock(%3, 1)
  %11 = AIE.lock(%3, 0)
  %12 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %13 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %14 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %15 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %16 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %17 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %18 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %19 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %20 = AIE.core(%3) {
    AIE.useLock(%10, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%11, Acquire, 0)
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%4, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%5, Release, 1)
    AIE.useLock(%11, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%10, Release, 1)
    AIE.end
  }
  %21 = AIE.shimDMA(%3) {
    %366 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %367 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%19 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%10, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%97, DMA : 0>
    AIE.packet_dest<%134, DMA : 1>
    AIE.packet_dest<%171, DMA : 1>
    AIE.packet_dest<%208, DMA : 1>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%88, DMA : 0>
    AIE.packet_dest<%125, DMA : 0>
    AIE.packet_dest<%162, DMA : 1>
    AIE.packet_dest<%199, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%79, DMA : 1>
    AIE.packet_dest<%116, DMA : 0>
    AIE.packet_dest<%153, DMA : 1>
    AIE.packet_dest<%190, DMA : 0>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%70, DMA : 1>
    AIE.packet_dest<%107, DMA : 1>
    AIE.packet_dest<%144, DMA : 1>
    AIE.packet_dest<%181, DMA : 1>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%97, DMA : 1>
    AIE.packet_dest<%245, DMA : 0>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%88, DMA : 1>
    AIE.packet_dest<%236, DMA : 1>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%79, DMA : 0>
    AIE.packet_dest<%227, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%70, DMA : 0>
    AIE.packet_dest<%218, DMA : 0>
  }
  %22 = AIE.tile(18, 0)
  %23 = AIE.lock(%22, 7)
  %24 = AIE.lock(%22, 6)
  %25 = AIE.lock(%22, 5)
  %26 = AIE.lock(%22, 4)
  %27 = AIE.lock(%22, 3)
  %28 = AIE.lock(%22, 2)
  %29 = AIE.lock(%22, 1)
  %30 = AIE.lock(%22, 0)
  %31 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %32 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%32, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %33 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %34 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %35 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %36 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %37 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %38 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %2) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %39 = AIE.core(%22) {
    AIE.useLock(%23, Acquire, 0)
    AIE.useLock(%25, Acquire, 0)
    AIE.useLock(%26, Acquire, 0)
    AIE.useLock(%24, Acquire, 0)
    AIE.useLock(%30, Acquire, 0)
    AIE.useLock(%28, Acquire, 0)
    AIE.useLock(%29, Acquire, 0)
    AIE.useLock(%27, Acquire, 0)
    AIE.useLock(%27, Release, 1)
    AIE.useLock(%29, Release, 1)
    AIE.useLock(%28, Release, 1)
    AIE.useLock(%30, Release, 1)
    AIE.useLock(%24, Release, 1)
    AIE.useLock(%26, Release, 1)
    AIE.useLock(%25, Release, 1)
    AIE.useLock(%23, Release, 1)
    AIE.end
  }
  %40 = AIE.shimDMA(%22) {
    %366 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%38 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%24, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%37 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%25, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%25, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%27, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %367 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%30, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%29, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%23, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%32 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%26, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%31 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%26, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%22, DMA : 1>
    AIE.packet_dest<%245, DMA : 1>
    AIE.packet_dest<%282, DMA : 1>
    AIE.packet_dest<%319, DMA : 1>
    AIE.packet_dest<%356, DMA : 1>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%22, DMA : 1>
    AIE.packet_dest<%236, DMA : 0>
    AIE.packet_dest<%273, DMA : 1>
    AIE.packet_dest<%310, DMA : 1>
    AIE.packet_dest<%347, DMA : 1>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%22, DMA : 1>
    AIE.packet_dest<%227, DMA : 0>
    AIE.packet_dest<%264, DMA : 0>
    AIE.packet_dest<%301, DMA : 0>
    AIE.packet_dest<%338, DMA : 0>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%22, DMA : 1>
    AIE.packet_dest<%218, DMA : 1>
    AIE.packet_dest<%255, DMA : 1>
    AIE.packet_dest<%292, DMA : 1>
    AIE.packet_dest<%329, DMA : 1>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%22, DMA : 0>
    AIE.packet_dest<%208, DMA : 0>
    AIE.packet_dest<%356, DMA : 0>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%22, DMA : 0>
    AIE.packet_dest<%199, DMA : 1>
    AIE.packet_dest<%347, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%22, DMA : 0>
    AIE.packet_dest<%190, DMA : 1>
    AIE.packet_dest<%338, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%22, DMA : 0>
    AIE.packet_dest<%181, DMA : 0>
    AIE.packet_dest<%329, DMA : 0>
  }
  %41 = AIE.tile(11, 0)
  %42 = AIE.lock(%41, 7)
  %43 = AIE.lock(%41, 6)
  %44 = AIE.lock(%41, 5)
  %45 = AIE.lock(%41, 4)
  %46 = AIE.lock(%41, 3)
  %47 = AIE.lock(%41, 2)
  %48 = AIE.lock(%41, 1)
  %49 = AIE.lock(%41, 0)
  %50 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%50, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %51 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%51, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %52 = AIE.external_buffer 90112 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%52, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %53 = AIE.external_buffer 94208 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%53, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %54 = AIE.external_buffer 98304 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%54, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %55 = AIE.external_buffer 102400 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%55, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %56 = AIE.external_buffer 106496 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %57 = AIE.external_buffer 110592 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %58 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %58) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %59 = AIE.external_buffer 118788 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %59) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %60 = AIE.external_buffer 122888 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %60) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %61 = AIE.external_buffer 126988 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %61) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %62 = AIE.external_buffer 131088 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %62) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %63 = AIE.external_buffer 135188 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %63) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %64 = AIE.external_buffer 139288 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %64) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %65 = AIE.external_buffer 143388 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %65) {kind = 2 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %66 = AIE.core(%41) {
    AIE.useLock(%49, Acquire, 0)
    AIE.useLock(%48, Acquire, 0)
    AIE.useLock(%43, Acquire, 0)
    AIE.useLock(%46, Acquire, 0)
    AIE.useLock(%44, Acquire, 0)
    AIE.useLock(%45, Acquire, 0)
    AIE.useLock(%42, Acquire, 0)
    AIE.useLock(%47, Acquire, 0)
    AIE.useLock(%47, Release, 1)
    AIE.useLock(%42, Release, 1)
    AIE.useLock(%45, Release, 1)
    AIE.useLock(%44, Release, 1)
    AIE.useLock(%46, Release, 1)
    AIE.useLock(%43, Release, 1)
    AIE.useLock(%48, Release, 1)
    AIE.useLock(%49, Release, 1)
    AIE.end
  }
  %67 = AIE.shimDMA(%41) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%58 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%59 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%60 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%61 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%62 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%63 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%64 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%65 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %368 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useLock(%49, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 0)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%46, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 0)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%43, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 0)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useLock(%47, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 0)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %369 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useLock(%48, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 0)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%42, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%52 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%42, Release, 0)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useLock(%44, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%51 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 0)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useLock(%45, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%50 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 0)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%41, DMA : 1>
    AIE.packet_dest<%171, DMA : 0>
    AIE.packet_dest<%319, DMA : 0>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%41, DMA : 1>
    AIE.packet_dest<%162, DMA : 0>
    AIE.packet_dest<%310, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%41, DMA : 1>
    AIE.packet_dest<%153, DMA : 0>
    AIE.packet_dest<%301, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%41, DMA : 1>
    AIE.packet_dest<%144, DMA : 0>
    AIE.packet_dest<%292, DMA : 0>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%41, DMA : 0>
    AIE.packet_dest<%134, DMA : 0>
    AIE.packet_dest<%282, DMA : 0>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%41, DMA : 0>
    AIE.packet_dest<%125, DMA : 1>
    AIE.packet_dest<%273, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%41, DMA : 0>
    AIE.packet_dest<%116, DMA : 1>
    AIE.packet_dest<%264, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%41, DMA : 0>
    AIE.packet_dest<%107, DMA : 0>
    AIE.packet_dest<%255, DMA : 0>
  }
  %68 = AIE.tile(0, 0)
  %69 = AIE.core(%68) {
    AIE.end
  }
  %70 = AIE.tile(10, 2)
  %71 = AIE.lock(%70, 1)
  %72 = AIE.lock(%70, 0)
  %73 = AIE.buffer(%70) : memref<32x32xf32>
  %74 = AIE.buffer(%70) : memref<32x32xf32>
  %75 = AIE.buffer(%70) : memref<32x32xf32>
  %76 = AIE.buffer(%70) : memref<32x32xf32>
  %77 = AIE.core(%70) {
    AIE.useLock(%72, Acquire, 1)
    AIE.useLock(%80, Acquire, 0)
    AIE.useLock(%71, Acquire, 1)
    call @extern_kernel(%76, %73, %74, %75) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%71, Release, 0)
    AIE.useLock(%80, Release, 1)
    AIE.useLock(%72, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %78 = AIE.mem(%70) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%71, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%75 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%71, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%72, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%72, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %79 = AIE.tile(10, 3)
  %80 = AIE.lock(%79, 2)
  %81 = AIE.lock(%79, 1)
  %82 = AIE.lock(%79, 0)
  %83 = AIE.buffer(%79) : memref<32x32xf32>
  %84 = AIE.buffer(%79) : memref<32x32xf32>
  %85 = AIE.buffer(%79) : memref<32x32xf32>
  %86 = AIE.core(%79) {
    AIE.useLock(%91, Acquire, 0)
    AIE.useLock(%80, Acquire, 1)
    AIE.useLock(%81, Acquire, 1)
    AIE.useLock(%82, Acquire, 1)
    call @extern_kernel(%73, %83, %84, %85) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%82, Release, 0)
    AIE.useLock(%81, Release, 0)
    AIE.useLock(%80, Release, 0)
    AIE.useLock(%91, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %87 = AIE.mem(%79) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%82, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%85 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%82, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%84 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %88 = AIE.tile(10, 4)
  %89 = AIE.lock(%88, 2)
  %90 = AIE.lock(%88, 1)
  %91 = AIE.lock(%88, 0)
  %92 = AIE.buffer(%88) : memref<32x32xf32>
  %93 = AIE.buffer(%88) : memref<32x32xf32>
  %94 = AIE.buffer(%88) : memref<32x32xf32>
  %95 = AIE.core(%88) {
    AIE.useLock(%90, Acquire, 1)
    AIE.useLock(%91, Acquire, 1)
    AIE.useLock(%89, Acquire, 1)
    AIE.useLock(%98, Acquire, 0)
    call @extern_kernel(%83, %92, %93, %94) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%98, Release, 1)
    AIE.useLock(%89, Release, 0)
    AIE.useLock(%91, Release, 0)
    AIE.useLock(%90, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %96 = AIE.mem(%88) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%89, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%89, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%90, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%94 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%90, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %97 = AIE.tile(10, 5) {polyaie.leaf}
  %98 = AIE.lock(%97, 3)
  %99 = AIE.lock(%97, 2)
  %100 = AIE.lock(%97, 1)
  %101 = AIE.lock(%97, 0)
  %102 = AIE.buffer(%97) : memref<32x32xf32>
  %103 = AIE.buffer(%97) : memref<32x32xf32>
  %104 = AIE.buffer(%97) : memref<32x32xf32>
  %105 = AIE.core(%97) {
    AIE.useLock(%101, Acquire, 0)
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%100, Acquire, 1)
    AIE.useLock(%98, Acquire, 1)
    call @extern_kernel(%92, %102, %103, %104) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%98, Release, 0)
    AIE.useLock(%100, Release, 0)
    AIE.useLock(%99, Release, 0)
    AIE.useLock(%101, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %106 = AIE.mem(%97) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%100, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%103 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%100, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%104 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%101, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%101, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%97, DMA : 0>
    AIE.packet_dest<%41, DMA : 0>
  }
  %107 = AIE.tile(11, 2)
  %108 = AIE.lock(%107, 1)
  %109 = AIE.lock(%107, 0)
  %110 = AIE.buffer(%107) : memref<32x32xf32>
  %111 = AIE.buffer(%107) : memref<32x32xf32>
  %112 = AIE.buffer(%107) : memref<32x32xf32>
  %113 = AIE.buffer(%107) : memref<32x32xf32>
  %114 = AIE.core(%107) {
    AIE.useLock(%108, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    AIE.useLock(%119, Acquire, 0)
    call @extern_kernel(%113, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%119, Release, 1)
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%108, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %115 = AIE.mem(%107) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%109, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%108, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %116 = AIE.tile(11, 3)
  %117 = AIE.lock(%116, 2)
  %118 = AIE.lock(%116, 1)
  %119 = AIE.lock(%116, 0)
  %120 = AIE.buffer(%116) : memref<32x32xf32>
  %121 = AIE.buffer(%116) : memref<32x32xf32>
  %122 = AIE.buffer(%116) : memref<32x32xf32>
  %123 = AIE.core(%116) {
    AIE.useLock(%119, Acquire, 1)
    AIE.useLock(%118, Acquire, 1)
    AIE.useLock(%117, Acquire, 1)
    AIE.useLock(%126, Acquire, 0)
    call @extern_kernel(%110, %120, %121, %122) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%126, Release, 1)
    AIE.useLock(%117, Release, 0)
    AIE.useLock(%118, Release, 0)
    AIE.useLock(%119, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %124 = AIE.mem(%116) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%117, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%121 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%118, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%122 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%118, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %125 = AIE.tile(11, 4)
  %126 = AIE.lock(%125, 2)
  %127 = AIE.lock(%125, 1)
  %128 = AIE.lock(%125, 0)
  %129 = AIE.buffer(%125) : memref<32x32xf32>
  %130 = AIE.buffer(%125) : memref<32x32xf32>
  %131 = AIE.buffer(%125) : memref<32x32xf32>
  %132 = AIE.core(%125) {
    AIE.useLock(%127, Acquire, 1)
    AIE.useLock(%138, Acquire, 0)
    AIE.useLock(%126, Acquire, 1)
    AIE.useLock(%128, Acquire, 1)
    call @extern_kernel(%120, %129, %130, %131) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%128, Release, 0)
    AIE.useLock(%126, Release, 0)
    AIE.useLock(%138, Release, 1)
    AIE.useLock(%127, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %133 = AIE.mem(%125) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%128, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%130 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%128, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%127, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%127, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %134 = AIE.tile(11, 5) {polyaie.leaf}
  %135 = AIE.lock(%134, 3)
  %136 = AIE.lock(%134, 2)
  %137 = AIE.lock(%134, 1)
  %138 = AIE.lock(%134, 0)
  %139 = AIE.buffer(%134) : memref<32x32xf32>
  %140 = AIE.buffer(%134) : memref<32x32xf32>
  %141 = AIE.buffer(%134) : memref<32x32xf32>
  %142 = AIE.core(%134) {
    AIE.useLock(%135, Acquire, 1)
    AIE.useLock(%137, Acquire, 0)
    AIE.useLock(%138, Acquire, 1)
    AIE.useLock(%136, Acquire, 1)
    call @extern_kernel(%129, %139, %140, %141) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%136, Release, 0)
    AIE.useLock(%138, Release, 0)
    AIE.useLock(%137, Release, 1)
    AIE.useLock(%135, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %143 = AIE.mem(%134) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%136, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%141 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%136, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%135, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%140 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%135, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%137, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%139 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%137, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%134, DMA : 0>
    AIE.packet_dest<%41, DMA : 0>
  }
  %144 = AIE.tile(12, 2)
  %145 = AIE.lock(%144, 1)
  %146 = AIE.lock(%144, 0)
  %147 = AIE.buffer(%144) : memref<32x32xf32>
  %148 = AIE.buffer(%144) : memref<32x32xf32>
  %149 = AIE.buffer(%144) : memref<32x32xf32>
  %150 = AIE.buffer(%144) : memref<32x32xf32>
  %151 = AIE.core(%144) {
    AIE.useLock(%145, Acquire, 1)
    AIE.useLock(%146, Acquire, 1)
    AIE.useLock(%156, Acquire, 0)
    call @extern_kernel(%150, %147, %148, %149) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%156, Release, 1)
    AIE.useLock(%146, Release, 0)
    AIE.useLock(%145, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %152 = AIE.mem(%144) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%146, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%149 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%146, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%145, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%148 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%145, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %153 = AIE.tile(12, 3)
  %154 = AIE.lock(%153, 2)
  %155 = AIE.lock(%153, 1)
  %156 = AIE.lock(%153, 0)
  %157 = AIE.buffer(%153) : memref<32x32xf32>
  %158 = AIE.buffer(%153) : memref<32x32xf32>
  %159 = AIE.buffer(%153) : memref<32x32xf32>
  %160 = AIE.core(%153) {
    AIE.useLock(%165, Acquire, 0)
    AIE.useLock(%155, Acquire, 1)
    AIE.useLock(%154, Acquire, 1)
    AIE.useLock(%156, Acquire, 1)
    call @extern_kernel(%147, %157, %158, %159) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%156, Release, 0)
    AIE.useLock(%154, Release, 0)
    AIE.useLock(%155, Release, 0)
    AIE.useLock(%165, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %161 = AIE.mem(%153) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%154, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%159 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%154, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%155, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%158 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%155, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %162 = AIE.tile(12, 4)
  %163 = AIE.lock(%162, 2)
  %164 = AIE.lock(%162, 1)
  %165 = AIE.lock(%162, 0)
  %166 = AIE.buffer(%162) : memref<32x32xf32>
  %167 = AIE.buffer(%162) : memref<32x32xf32>
  %168 = AIE.buffer(%162) : memref<32x32xf32>
  %169 = AIE.core(%162) {
    AIE.useLock(%165, Acquire, 1)
    AIE.useLock(%173, Acquire, 0)
    AIE.useLock(%163, Acquire, 1)
    AIE.useLock(%164, Acquire, 1)
    call @extern_kernel(%157, %166, %167, %168) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%164, Release, 0)
    AIE.useLock(%163, Release, 0)
    AIE.useLock(%173, Release, 1)
    AIE.useLock(%165, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %170 = AIE.mem(%162) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%164, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%168 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%164, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%163, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%167 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%163, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %171 = AIE.tile(12, 5) {polyaie.leaf}
  %172 = AIE.lock(%171, 3)
  %173 = AIE.lock(%171, 2)
  %174 = AIE.lock(%171, 1)
  %175 = AIE.lock(%171, 0)
  %176 = AIE.buffer(%171) : memref<32x32xf32>
  %177 = AIE.buffer(%171) : memref<32x32xf32>
  %178 = AIE.buffer(%171) : memref<32x32xf32>
  %179 = AIE.core(%171) {
    AIE.useLock(%174, Acquire, 0)
    AIE.useLock(%173, Acquire, 1)
    AIE.useLock(%175, Acquire, 1)
    AIE.useLock(%172, Acquire, 1)
    call @extern_kernel(%166, %176, %177, %178) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%172, Release, 0)
    AIE.useLock(%175, Release, 0)
    AIE.useLock(%173, Release, 0)
    AIE.useLock(%174, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %180 = AIE.mem(%171) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%172, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%178 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%172, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%175, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%177 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%175, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%174, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%176 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%174, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%171, DMA : 0>
    AIE.packet_dest<%41, DMA : 0>
  }
  %181 = AIE.tile(13, 2)
  %182 = AIE.lock(%181, 1)
  %183 = AIE.lock(%181, 0)
  %184 = AIE.buffer(%181) : memref<32x32xf32>
  %185 = AIE.buffer(%181) : memref<32x32xf32>
  %186 = AIE.buffer(%181) : memref<32x32xf32>
  %187 = AIE.buffer(%181) : memref<32x32xf32>
  %188 = AIE.core(%181) {
    AIE.useLock(%182, Acquire, 1)
    AIE.useLock(%183, Acquire, 1)
    AIE.useLock(%193, Acquire, 0)
    call @extern_kernel(%187, %184, %185, %186) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%193, Release, 1)
    AIE.useLock(%183, Release, 0)
    AIE.useLock(%182, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %189 = AIE.mem(%181) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%183, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%183, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%182, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%185 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%182, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %190 = AIE.tile(13, 3)
  %191 = AIE.lock(%190, 2)
  %192 = AIE.lock(%190, 1)
  %193 = AIE.lock(%190, 0)
  %194 = AIE.buffer(%190) : memref<32x32xf32>
  %195 = AIE.buffer(%190) : memref<32x32xf32>
  %196 = AIE.buffer(%190) : memref<32x32xf32>
  %197 = AIE.core(%190) {
    AIE.useLock(%191, Acquire, 1)
    AIE.useLock(%192, Acquire, 1)
    AIE.useLock(%193, Acquire, 1)
    AIE.useLock(%202, Acquire, 0)
    call @extern_kernel(%184, %194, %195, %196) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%202, Release, 1)
    AIE.useLock(%193, Release, 0)
    AIE.useLock(%192, Release, 0)
    AIE.useLock(%191, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %198 = AIE.mem(%190) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%192, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%195 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%192, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%191, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%196 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%191, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %199 = AIE.tile(13, 4)
  %200 = AIE.lock(%199, 2)
  %201 = AIE.lock(%199, 1)
  %202 = AIE.lock(%199, 0)
  %203 = AIE.buffer(%199) : memref<32x32xf32>
  %204 = AIE.buffer(%199) : memref<32x32xf32>
  %205 = AIE.buffer(%199) : memref<32x32xf32>
  %206 = AIE.core(%199) {
    AIE.useLock(%209, Acquire, 0)
    AIE.useLock(%201, Acquire, 1)
    AIE.useLock(%200, Acquire, 1)
    AIE.useLock(%202, Acquire, 1)
    call @extern_kernel(%194, %203, %204, %205) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%202, Release, 0)
    AIE.useLock(%200, Release, 0)
    AIE.useLock(%201, Release, 0)
    AIE.useLock(%209, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %207 = AIE.mem(%199) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%200, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%204 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%200, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%201, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%205 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%201, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %208 = AIE.tile(13, 5) {polyaie.leaf}
  %209 = AIE.lock(%208, 3)
  %210 = AIE.lock(%208, 2)
  %211 = AIE.lock(%208, 1)
  %212 = AIE.lock(%208, 0)
  %213 = AIE.buffer(%208) : memref<32x32xf32>
  %214 = AIE.buffer(%208) : memref<32x32xf32>
  %215 = AIE.buffer(%208) : memref<32x32xf32>
  %216 = AIE.core(%208) {
    AIE.useLock(%209, Acquire, 1)
    AIE.useLock(%212, Acquire, 1)
    AIE.useLock(%211, Acquire, 0)
    AIE.useLock(%210, Acquire, 1)
    call @extern_kernel(%203, %213, %214, %215) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%210, Release, 0)
    AIE.useLock(%211, Release, 1)
    AIE.useLock(%212, Release, 0)
    AIE.useLock(%209, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %217 = AIE.mem(%208) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%210, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%215 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%210, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%212, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%214 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%212, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%211, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%213 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%211, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%208, DMA : 0>
    AIE.packet_dest<%41, DMA : 0>
  }
  %218 = AIE.tile(14, 2)
  %219 = AIE.lock(%218, 1)
  %220 = AIE.lock(%218, 0)
  %221 = AIE.buffer(%218) : memref<32x32xf32>
  %222 = AIE.buffer(%218) : memref<32x32xf32>
  %223 = AIE.buffer(%218) : memref<32x32xf32>
  %224 = AIE.buffer(%218) : memref<32x32xf32>
  %225 = AIE.core(%218) {
    AIE.useLock(%229, Acquire, 0)
    AIE.useLock(%220, Acquire, 1)
    AIE.useLock(%219, Acquire, 1)
    call @extern_kernel(%224, %221, %222, %223) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%219, Release, 0)
    AIE.useLock(%220, Release, 0)
    AIE.useLock(%229, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %226 = AIE.mem(%218) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%219, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%223 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%219, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%220, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%222 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%220, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %227 = AIE.tile(14, 3)
  %228 = AIE.lock(%227, 2)
  %229 = AIE.lock(%227, 1)
  %230 = AIE.lock(%227, 0)
  %231 = AIE.buffer(%227) : memref<32x32xf32>
  %232 = AIE.buffer(%227) : memref<32x32xf32>
  %233 = AIE.buffer(%227) : memref<32x32xf32>
  %234 = AIE.core(%227) {
    AIE.useLock(%229, Acquire, 1)
    AIE.useLock(%239, Acquire, 0)
    AIE.useLock(%228, Acquire, 1)
    AIE.useLock(%230, Acquire, 1)
    call @extern_kernel(%221, %231, %232, %233) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%230, Release, 0)
    AIE.useLock(%228, Release, 0)
    AIE.useLock(%239, Release, 1)
    AIE.useLock(%229, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %235 = AIE.mem(%227) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%230, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%232 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%230, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%228, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%233 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%228, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %236 = AIE.tile(14, 4)
  %237 = AIE.lock(%236, 2)
  %238 = AIE.lock(%236, 1)
  %239 = AIE.lock(%236, 0)
  %240 = AIE.buffer(%236) : memref<32x32xf32>
  %241 = AIE.buffer(%236) : memref<32x32xf32>
  %242 = AIE.buffer(%236) : memref<32x32xf32>
  %243 = AIE.core(%236) {
    AIE.useLock(%238, Acquire, 1)
    AIE.useLock(%237, Acquire, 1)
    AIE.useLock(%239, Acquire, 1)
    AIE.useLock(%246, Acquire, 0)
    call @extern_kernel(%231, %240, %241, %242) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%246, Release, 1)
    AIE.useLock(%239, Release, 0)
    AIE.useLock(%237, Release, 0)
    AIE.useLock(%238, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %244 = AIE.mem(%236) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%237, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%241 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%237, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%238, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%242 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%238, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %245 = AIE.tile(14, 5) {polyaie.leaf}
  %246 = AIE.lock(%245, 3)
  %247 = AIE.lock(%245, 2)
  %248 = AIE.lock(%245, 1)
  %249 = AIE.lock(%245, 0)
  %250 = AIE.buffer(%245) : memref<32x32xf32>
  %251 = AIE.buffer(%245) : memref<32x32xf32>
  %252 = AIE.buffer(%245) : memref<32x32xf32>
  %253 = AIE.core(%245) {
    AIE.useLock(%248, Acquire, 1)
    AIE.useLock(%247, Acquire, 0)
    AIE.useLock(%249, Acquire, 1)
    AIE.useLock(%246, Acquire, 1)
    call @extern_kernel(%240, %250, %251, %252) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%246, Release, 0)
    AIE.useLock(%249, Release, 0)
    AIE.useLock(%247, Release, 1)
    AIE.useLock(%248, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %254 = AIE.mem(%245) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%249, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%252 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%249, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%248, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%251 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%248, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%247, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%250 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%247, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%245, DMA : 0>
    AIE.packet_dest<%41, DMA : 1>
  }
  %255 = AIE.tile(15, 2)
  %256 = AIE.lock(%255, 1)
  %257 = AIE.lock(%255, 0)
  %258 = AIE.buffer(%255) : memref<32x32xf32>
  %259 = AIE.buffer(%255) : memref<32x32xf32>
  %260 = AIE.buffer(%255) : memref<32x32xf32>
  %261 = AIE.buffer(%255) : memref<32x32xf32>
  %262 = AIE.core(%255) {
    AIE.useLock(%256, Acquire, 1)
    AIE.useLock(%257, Acquire, 1)
    AIE.useLock(%265, Acquire, 0)
    call @extern_kernel(%261, %258, %259, %260) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%265, Release, 1)
    AIE.useLock(%257, Release, 0)
    AIE.useLock(%256, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %263 = AIE.mem(%255) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%257, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%260 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%257, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%256, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%259 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%256, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %264 = AIE.tile(15, 3)
  %265 = AIE.lock(%264, 2)
  %266 = AIE.lock(%264, 1)
  %267 = AIE.lock(%264, 0)
  %268 = AIE.buffer(%264) : memref<32x32xf32>
  %269 = AIE.buffer(%264) : memref<32x32xf32>
  %270 = AIE.buffer(%264) : memref<32x32xf32>
  %271 = AIE.core(%264) {
    AIE.useLock(%276, Acquire, 0)
    AIE.useLock(%265, Acquire, 1)
    AIE.useLock(%266, Acquire, 1)
    AIE.useLock(%267, Acquire, 1)
    call @extern_kernel(%258, %268, %269, %270) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%267, Release, 0)
    AIE.useLock(%266, Release, 0)
    AIE.useLock(%265, Release, 0)
    AIE.useLock(%276, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %272 = AIE.mem(%264) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%267, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%269 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%267, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%266, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%270 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%266, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %273 = AIE.tile(15, 4)
  %274 = AIE.lock(%273, 2)
  %275 = AIE.lock(%273, 1)
  %276 = AIE.lock(%273, 0)
  %277 = AIE.buffer(%273) : memref<32x32xf32>
  %278 = AIE.buffer(%273) : memref<32x32xf32>
  %279 = AIE.buffer(%273) : memref<32x32xf32>
  %280 = AIE.core(%273) {
    AIE.useLock(%275, Acquire, 1)
    AIE.useLock(%276, Acquire, 1)
    AIE.useLock(%274, Acquire, 1)
    AIE.useLock(%285, Acquire, 0)
    call @extern_kernel(%268, %277, %278, %279) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%285, Release, 1)
    AIE.useLock(%274, Release, 0)
    AIE.useLock(%276, Release, 0)
    AIE.useLock(%275, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %281 = AIE.mem(%273) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%274, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%279 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%274, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%275, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%278 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %282 = AIE.tile(15, 5) {polyaie.leaf}
  %283 = AIE.lock(%282, 3)
  %284 = AIE.lock(%282, 2)
  %285 = AIE.lock(%282, 1)
  %286 = AIE.lock(%282, 0)
  %287 = AIE.buffer(%282) : memref<32x32xf32>
  %288 = AIE.buffer(%282) : memref<32x32xf32>
  %289 = AIE.buffer(%282) : memref<32x32xf32>
  %290 = AIE.core(%282) {
    AIE.useLock(%286, Acquire, 0)
    AIE.useLock(%283, Acquire, 1)
    AIE.useLock(%284, Acquire, 1)
    AIE.useLock(%285, Acquire, 1)
    call @extern_kernel(%277, %287, %288, %289) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%285, Release, 0)
    AIE.useLock(%284, Release, 0)
    AIE.useLock(%283, Release, 0)
    AIE.useLock(%286, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %291 = AIE.mem(%282) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%284, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%289 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%284, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%283, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%288 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%283, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%286, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%287 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%286, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%282, DMA : 0>
    AIE.packet_dest<%41, DMA : 1>
  }
  %292 = AIE.tile(16, 2)
  %293 = AIE.lock(%292, 1)
  %294 = AIE.lock(%292, 0)
  %295 = AIE.buffer(%292) : memref<32x32xf32>
  %296 = AIE.buffer(%292) : memref<32x32xf32>
  %297 = AIE.buffer(%292) : memref<32x32xf32>
  %298 = AIE.buffer(%292) : memref<32x32xf32>
  %299 = AIE.core(%292) {
    AIE.useLock(%303, Acquire, 0)
    AIE.useLock(%294, Acquire, 1)
    AIE.useLock(%293, Acquire, 1)
    call @extern_kernel(%298, %295, %296, %297) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%293, Release, 0)
    AIE.useLock(%294, Release, 0)
    AIE.useLock(%303, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %300 = AIE.mem(%292) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%293, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%297 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%293, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%294, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%296 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%294, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %301 = AIE.tile(16, 3)
  %302 = AIE.lock(%301, 2)
  %303 = AIE.lock(%301, 1)
  %304 = AIE.lock(%301, 0)
  %305 = AIE.buffer(%301) : memref<32x32xf32>
  %306 = AIE.buffer(%301) : memref<32x32xf32>
  %307 = AIE.buffer(%301) : memref<32x32xf32>
  %308 = AIE.core(%301) {
    AIE.useLock(%303, Acquire, 1)
    AIE.useLock(%313, Acquire, 0)
    AIE.useLock(%302, Acquire, 1)
    AIE.useLock(%304, Acquire, 1)
    call @extern_kernel(%295, %305, %306, %307) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%304, Release, 0)
    AIE.useLock(%302, Release, 0)
    AIE.useLock(%313, Release, 1)
    AIE.useLock(%303, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %309 = AIE.mem(%301) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%304, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%306 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%304, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%302, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%307 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%302, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %310 = AIE.tile(16, 4)
  %311 = AIE.lock(%310, 2)
  %312 = AIE.lock(%310, 1)
  %313 = AIE.lock(%310, 0)
  %314 = AIE.buffer(%310) : memref<32x32xf32>
  %315 = AIE.buffer(%310) : memref<32x32xf32>
  %316 = AIE.buffer(%310) : memref<32x32xf32>
  %317 = AIE.core(%310) {
    AIE.useLock(%311, Acquire, 1)
    AIE.useLock(%313, Acquire, 1)
    AIE.useLock(%322, Acquire, 0)
    AIE.useLock(%312, Acquire, 1)
    call @extern_kernel(%305, %314, %315, %316) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%312, Release, 0)
    AIE.useLock(%322, Release, 1)
    AIE.useLock(%313, Release, 0)
    AIE.useLock(%311, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %318 = AIE.mem(%310) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%312, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%316 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%312, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%311, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%315 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%311, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %319 = AIE.tile(16, 5) {polyaie.leaf}
  %320 = AIE.lock(%319, 3)
  %321 = AIE.lock(%319, 2)
  %322 = AIE.lock(%319, 1)
  %323 = AIE.lock(%319, 0)
  %324 = AIE.buffer(%319) : memref<32x32xf32>
  %325 = AIE.buffer(%319) : memref<32x32xf32>
  %326 = AIE.buffer(%319) : memref<32x32xf32>
  %327 = AIE.core(%319) {
    AIE.useLock(%321, Acquire, 1)
    AIE.useLock(%323, Acquire, 0)
    AIE.useLock(%322, Acquire, 1)
    AIE.useLock(%320, Acquire, 1)
    call @extern_kernel(%314, %324, %325, %326) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%320, Release, 0)
    AIE.useLock(%322, Release, 0)
    AIE.useLock(%323, Release, 1)
    AIE.useLock(%321, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %328 = AIE.mem(%319) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%320, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%326 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%320, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%321, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%325 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%321, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%323, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%324 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%323, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%319, DMA : 0>
    AIE.packet_dest<%41, DMA : 1>
  }
  %329 = AIE.tile(17, 2)
  %330 = AIE.lock(%329, 1)
  %331 = AIE.lock(%329, 0)
  %332 = AIE.buffer(%329) : memref<32x32xf32>
  %333 = AIE.buffer(%329) : memref<32x32xf32>
  %334 = AIE.buffer(%329) : memref<32x32xf32>
  %335 = AIE.buffer(%329) : memref<32x32xf32>
  %336 = AIE.core(%329) {
    AIE.useLock(%340, Acquire, 0)
    AIE.useLock(%331, Acquire, 1)
    AIE.useLock(%330, Acquire, 1)
    call @extern_kernel(%335, %332, %333, %334) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%330, Release, 0)
    AIE.useLock(%331, Release, 0)
    AIE.useLock(%340, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %337 = AIE.mem(%329) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%330, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%334 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%330, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%331, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%333 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%331, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %338 = AIE.tile(17, 3)
  %339 = AIE.lock(%338, 2)
  %340 = AIE.lock(%338, 1)
  %341 = AIE.lock(%338, 0)
  %342 = AIE.buffer(%338) : memref<32x32xf32>
  %343 = AIE.buffer(%338) : memref<32x32xf32>
  %344 = AIE.buffer(%338) : memref<32x32xf32>
  %345 = AIE.core(%338) {
    AIE.useLock(%340, Acquire, 1)
    AIE.useLock(%339, Acquire, 1)
    AIE.useLock(%350, Acquire, 0)
    AIE.useLock(%341, Acquire, 1)
    call @extern_kernel(%332, %342, %343, %344) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%341, Release, 0)
    AIE.useLock(%350, Release, 1)
    AIE.useLock(%339, Release, 0)
    AIE.useLock(%340, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %346 = AIE.mem(%338) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%341, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%343 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%341, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%339, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%344 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%339, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %347 = AIE.tile(17, 4)
  %348 = AIE.lock(%347, 2)
  %349 = AIE.lock(%347, 1)
  %350 = AIE.lock(%347, 0)
  %351 = AIE.buffer(%347) : memref<32x32xf32>
  %352 = AIE.buffer(%347) : memref<32x32xf32>
  %353 = AIE.buffer(%347) : memref<32x32xf32>
  %354 = AIE.core(%347) {
    AIE.useLock(%348, Acquire, 1)
    AIE.useLock(%349, Acquire, 1)
    AIE.useLock(%350, Acquire, 1)
    AIE.useLock(%360, Acquire, 0)
    call @extern_kernel(%342, %351, %352, %353) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%360, Release, 1)
    AIE.useLock(%350, Release, 0)
    AIE.useLock(%349, Release, 0)
    AIE.useLock(%348, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %355 = AIE.mem(%347) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%349, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%353 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%349, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%348, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%352 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%348, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %356 = AIE.tile(17, 5) {polyaie.leaf}
  %357 = AIE.lock(%356, 3)
  %358 = AIE.lock(%356, 2)
  %359 = AIE.lock(%356, 1)
  %360 = AIE.lock(%356, 0)
  %361 = AIE.buffer(%356) : memref<32x32xf32>
  %362 = AIE.buffer(%356) : memref<32x32xf32>
  %363 = AIE.buffer(%356) : memref<32x32xf32>
  %364 = AIE.core(%356) {
    AIE.useLock(%358, Acquire, 1)
    AIE.useLock(%357, Acquire, 0)
    AIE.useLock(%360, Acquire, 1)
    AIE.useLock(%359, Acquire, 1)
    call @extern_kernel(%351, %361, %362, %363) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%359, Release, 0)
    AIE.useLock(%360, Release, 0)
    AIE.useLock(%357, Release, 1)
    AIE.useLock(%358, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %365 = AIE.mem(%356) {
    %366 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%359, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%363 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%359, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %367 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%358, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%362 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%358, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %368 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%357, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%361 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%357, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%356, DMA : 0>
    AIE.packet_dest<%41, DMA : 1>
  }
}


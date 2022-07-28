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
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %9 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %10 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %11 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %12 = AIE.core(%3) {
    AIE.useToken @token54(Acquire, 0)
    AIE.useToken @token43(Acquire, 0)
    AIE.useToken @token30(Acquire, 0)
    AIE.useToken @token29(Acquire, 0)
    AIE.useToken @token16(Acquire, 0)
    AIE.useToken @token13(Acquire, 0)
    AIE.useToken @token11(Acquire, 0)
    AIE.useToken @token0(Acquire, 0)
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token11(Release, 1)
    AIE.useToken @token13(Release, 1)
    AIE.useToken @token16(Release, 1)
    AIE.useToken @token29(Release, 1)
    AIE.useToken @token30(Release, 1)
    AIE.useToken @token43(Release, 1)
    AIE.useToken @token54(Release, 1)
    AIE.end
  }
  %13 = AIE.shimDMA(%3) {
    %246 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token43(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token43(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 2)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 2)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 2)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %247 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 2)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token54(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token54(Release, 2)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 2)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%46, DMA : 1>
      AIE.bp_dest<%71, DMA : 1>
      AIE.bp_dest<%96, DMA : 1>
      AIE.bp_dest<%121, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%53, DMA : 1>
      AIE.bp_dest<%78, DMA : 0>
      AIE.bp_dest<%103, DMA : 1>
      AIE.bp_dest<%128, DMA : 0>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%59, DMA : 0>
      AIE.bp_dest<%84, DMA : 0>
      AIE.bp_dest<%109, DMA : 1>
      AIE.bp_dest<%134, DMA : 0>
    }
    AIE.bp_id(3) {
      AIE.bp_dest<%65, DMA : 0>
      AIE.bp_dest<%90, DMA : 1>
      AIE.bp_dest<%115, DMA : 1>
      AIE.bp_dest<%140, DMA : 1>
    }
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%46, DMA : 0>
      AIE.bp_dest<%146, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%53, DMA : 0>
      AIE.bp_dest<%153, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%59, DMA : 1>
      AIE.bp_dest<%159, DMA : 1>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%65, DMA : 1>
      AIE.bp_dest<%165, DMA : 0>
    }
  }
  %14 = AIE.tile(18, 0)
  %15 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %16 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %17 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %18 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x128xf32>) -> ()
  %19 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%19, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %20 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%20, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %21 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %22 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %2) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %23 = AIE.core(%14) {
    AIE.useToken @token53(Acquire, 0)
    AIE.useToken @token51(Acquire, 0)
    AIE.useToken @token49(Acquire, 0)
    AIE.useToken @token44(Acquire, 0)
    AIE.useToken @token41(Acquire, 0)
    AIE.useToken @token31(Acquire, 0)
    AIE.useToken @token6(Acquire, 0)
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token6(Release, 1)
    AIE.useToken @token31(Release, 1)
    AIE.useToken @token41(Release, 1)
    AIE.useToken @token44(Release, 1)
    AIE.useToken @token49(Release, 1)
    AIE.useToken @token51(Release, 1)
    AIE.useToken @token53(Release, 1)
    AIE.end
  }
  %24 = AIE.shimDMA(%14) {
    %246 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 2)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token51(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%20 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token51(Release, 2)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%19 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %247 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 2)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token53(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token53(Release, 2)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token49(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token49(Release, 2)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.broad_packet(%14, DMA : 1) {
    AIE.bp_id(0) {
      AIE.bp_dest<%146, DMA : 1>
      AIE.bp_dest<%171, DMA : 1>
      AIE.bp_dest<%196, DMA : 1>
      AIE.bp_dest<%221, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%153, DMA : 0>
      AIE.bp_dest<%178, DMA : 0>
      AIE.bp_dest<%203, DMA : 0>
      AIE.bp_dest<%228, DMA : 0>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%159, DMA : 0>
      AIE.bp_dest<%184, DMA : 1>
      AIE.bp_dest<%209, DMA : 1>
      AIE.bp_dest<%234, DMA : 1>
    }
    AIE.bp_id(3) {
      AIE.bp_dest<%165, DMA : 1>
      AIE.bp_dest<%190, DMA : 1>
      AIE.bp_dest<%215, DMA : 1>
      AIE.bp_dest<%240, DMA : 1>
    }
  }
  AIE.broad_packet(%14, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%121, DMA : 0>
      AIE.bp_dest<%221, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%128, DMA : 1>
      AIE.bp_dest<%228, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%134, DMA : 1>
      AIE.bp_dest<%234, DMA : 0>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%140, DMA : 0>
      AIE.bp_dest<%240, DMA : 0>
    }
  }
  %25 = AIE.tile(11, 0)
  %26 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %27 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%27, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %28 = AIE.external_buffer 90112 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%28, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %29 = AIE.external_buffer 94208 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %30 = AIE.external_buffer 98304 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %31 = AIE.external_buffer 102400 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %32 = AIE.external_buffer 106496 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%32, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %33 = AIE.external_buffer 110592 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %34 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %34) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %35 = AIE.external_buffer 118788 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %35) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %36 = AIE.external_buffer 122888 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %36) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %37 = AIE.external_buffer 126988 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %37) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %38 = AIE.external_buffer 131088 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %38) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %39 = AIE.external_buffer 135188 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %39) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %40 = AIE.external_buffer 139288 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %40) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %41 = AIE.external_buffer 143388 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %41) {kind = 2 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<64x128xf32>, memref<1025xf32>) -> ()
  %42 = AIE.core(%25) {
    AIE.useToken @token40(Acquire, 0)
    AIE.useToken @token37(Acquire, 0)
    AIE.useToken @token21(Acquire, 0)
    AIE.useToken @token17(Acquire, 0)
    AIE.useToken @token10(Acquire, 0)
    AIE.useToken @token9(Acquire, 0)
    AIE.useToken @token7(Acquire, 0)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token7(Release, 1)
    AIE.useToken @token9(Release, 1)
    AIE.useToken @token10(Release, 1)
    AIE.useToken @token17(Release, 1)
    AIE.useToken @token21(Release, 1)
    AIE.useToken @token37(Release, 1)
    AIE.useToken @token40(Release, 1)
    AIE.end
  }
  %43 = AIE.shimDMA(%25) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token45(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%34 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token45(Release, 3)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token23(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%35 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token23(Release, 3)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%36 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token42(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%37 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token20(Release, 3)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token34(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%38 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token34(Release, 3)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token52(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%39 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token52(Release, 3)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token35(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%40 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token35(Release, 3)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token22(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%41 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token22(Release, 3)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %248 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useToken @token40(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token40(Release, 2)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%32 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 2)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%31 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 2)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%30 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %249 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%29 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 2)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%28 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 2)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%27 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 2)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 2)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  AIE.broad_packet(%25, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%96, DMA : 0>
      AIE.bp_dest<%196, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%103, DMA : 0>
      AIE.bp_dest<%203, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%109, DMA : 0>
      AIE.bp_dest<%209, DMA : 0>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%115, DMA : 0>
      AIE.bp_dest<%215, DMA : 0>
    }
  }
  AIE.broad_packet(%25, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%71, DMA : 0>
      AIE.bp_dest<%171, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%78, DMA : 1>
      AIE.bp_dest<%178, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%84, DMA : 1>
      AIE.bp_dest<%184, DMA : 0>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%90, DMA : 0>
      AIE.bp_dest<%190, DMA : 0>
    }
  }
  %44 = AIE.tile(0, 0)
  %45 = AIE.core(%44) {
    AIE.end
  }
  %46 = AIE.tile(10, 2)
  %47 = AIE.buffer(%46) : memref<32x32xf32>
  %48 = AIE.buffer(%46) : memref<32x32xf32>
  %49 = AIE.buffer(%46) : memref<32x32xf32>
  %50 = AIE.buffer(%46) : memref<32x32xf32>
  %51 = AIE.core(%46) {
    AIE.useToken @token43(Acquire, 3)
    AIE.useToken @token33(Acquire, 0)
    AIE.useToken @token0(Acquire, 3)
    call @extern_kernel(%50, %47, %48, %49) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 4)
    AIE.useToken @token33(Release, 1)
    AIE.useToken @token43(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %52 = AIE.mem(%46) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%49 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token43(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token43(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %53 = AIE.tile(10, 3)
  %54 = AIE.buffer(%53) : memref<32x32xf32>
  %55 = AIE.buffer(%53) : memref<32x32xf32>
  %56 = AIE.buffer(%53) : memref<32x32xf32>
  %57 = AIE.core(%53) {
    AIE.useToken @token36(Acquire, 0)
    AIE.useToken @token33(Acquire, 1)
    AIE.useToken @token16(Acquire, 3)
    AIE.useToken @token13(Acquire, 3)
    call @extern_kernel(%47, %54, %55, %56) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token13(Release, 4)
    AIE.useToken @token16(Release, 4)
    AIE.useToken @token33(Release, 2)
    AIE.useToken @token36(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %58 = AIE.mem(%53) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %59 = AIE.tile(10, 4)
  %60 = AIE.buffer(%59) : memref<32x32xf32>
  %61 = AIE.buffer(%59) : memref<32x32xf32>
  %62 = AIE.buffer(%59) : memref<32x32xf32>
  %63 = AIE.core(%59) {
    AIE.useToken @token54(Acquire, 3)
    AIE.useToken @token36(Acquire, 1)
    AIE.useToken @token11(Acquire, 3)
    AIE.useToken @token2(Acquire, 0)
    call @extern_kernel(%54, %60, %61, %62) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token11(Release, 4)
    AIE.useToken @token36(Release, 2)
    AIE.useToken @token54(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %64 = AIE.mem(%59) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%61 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token54(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token54(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %65 = AIE.tile(10, 5) {polyaie.leaf}
  %66 = AIE.buffer(%65) : memref<32x32xf32>
  %67 = AIE.buffer(%65) : memref<32x32xf32>
  %68 = AIE.buffer(%65) : memref<32x32xf32>
  %69 = AIE.core(%65) {
    AIE.useToken @token45(Acquire, 0)
    AIE.useToken @token30(Acquire, 3)
    AIE.useToken @token29(Acquire, 3)
    AIE.useToken @token2(Acquire, 1)
    call @extern_kernel(%60, %66, %67, %68) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 2)
    AIE.useToken @token29(Release, 4)
    AIE.useToken @token30(Release, 4)
    AIE.useToken @token45(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %70 = AIE.mem(%65) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%67 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%68 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token45(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%66 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token45(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%65, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%25, DMA : 0>
    }
  }
  %71 = AIE.tile(11, 2)
  %72 = AIE.buffer(%71) : memref<32x32xf32>
  %73 = AIE.buffer(%71) : memref<32x32xf32>
  %74 = AIE.buffer(%71) : memref<32x32xf32>
  %75 = AIE.buffer(%71) : memref<32x32xf32>
  %76 = AIE.core(%71) {
    AIE.useToken @token43(Acquire, 5)
    AIE.useToken @token40(Acquire, 3)
    AIE.useToken @token24(Acquire, 0)
    call @extern_kernel(%75, %72, %73, %74) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token24(Release, 1)
    AIE.useToken @token40(Release, 4)
    AIE.useToken @token43(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %77 = AIE.mem(%71) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token40(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token40(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token43(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%73 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token43(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %78 = AIE.tile(11, 3)
  %79 = AIE.buffer(%78) : memref<32x32xf32>
  %80 = AIE.buffer(%78) : memref<32x32xf32>
  %81 = AIE.buffer(%78) : memref<32x32xf32>
  %82 = AIE.core(%78) {
    AIE.useToken @token24(Acquire, 1)
    AIE.useToken @token17(Acquire, 3)
    AIE.useToken @token16(Acquire, 5)
    AIE.useToken @token15(Acquire, 0)
    call @extern_kernel(%72, %79, %80, %81) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token15(Release, 1)
    AIE.useToken @token16(Release, 6)
    AIE.useToken @token17(Release, 4)
    AIE.useToken @token24(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %83 = AIE.mem(%78) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%80 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %84 = AIE.tile(11, 4)
  %85 = AIE.buffer(%84) : memref<32x32xf32>
  %86 = AIE.buffer(%84) : memref<32x32xf32>
  %87 = AIE.buffer(%84) : memref<32x32xf32>
  %88 = AIE.core(%84) {
    AIE.useToken @token21(Acquire, 3)
    AIE.useToken @token18(Acquire, 0)
    AIE.useToken @token15(Acquire, 1)
    AIE.useToken @token11(Acquire, 5)
    call @extern_kernel(%79, %85, %86, %87) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token11(Release, 6)
    AIE.useToken @token15(Release, 2)
    AIE.useToken @token18(Release, 1)
    AIE.useToken @token21(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %89 = AIE.mem(%84) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%86 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%87 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %90 = AIE.tile(11, 5) {polyaie.leaf}
  %91 = AIE.buffer(%90) : memref<32x32xf32>
  %92 = AIE.buffer(%90) : memref<32x32xf32>
  %93 = AIE.buffer(%90) : memref<32x32xf32>
  %94 = AIE.core(%90) {
    AIE.useToken @token29(Acquire, 5)
    AIE.useToken @token23(Acquire, 0)
    AIE.useToken @token18(Acquire, 1)
    AIE.useToken @token4(Acquire, 3)
    call @extern_kernel(%85, %91, %92, %93) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token4(Release, 4)
    AIE.useToken @token18(Release, 2)
    AIE.useToken @token23(Release, 1)
    AIE.useToken @token29(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %95 = AIE.mem(%90) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token23(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%91 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token23(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%90, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%25, DMA : 0>
    }
  }
  %96 = AIE.tile(12, 2)
  %97 = AIE.buffer(%96) : memref<32x32xf32>
  %98 = AIE.buffer(%96) : memref<32x32xf32>
  %99 = AIE.buffer(%96) : memref<32x32xf32>
  %100 = AIE.buffer(%96) : memref<32x32xf32>
  %101 = AIE.core(%96) {
    AIE.useToken @token43(Acquire, 7)
    AIE.useToken @token37(Acquire, 3)
    AIE.useToken @token5(Acquire, 0)
    call @extern_kernel(%100, %97, %98, %99) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 1)
    AIE.useToken @token37(Release, 4)
    AIE.useToken @token43(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %102 = AIE.mem(%96) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%99 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token43(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%98 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token43(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %103 = AIE.tile(12, 3)
  %104 = AIE.buffer(%103) : memref<32x32xf32>
  %105 = AIE.buffer(%103) : memref<32x32xf32>
  %106 = AIE.buffer(%103) : memref<32x32xf32>
  %107 = AIE.core(%103) {
    AIE.useToken @token38(Acquire, 0)
    AIE.useToken @token16(Acquire, 7)
    AIE.useToken @token7(Acquire, 3)
    AIE.useToken @token5(Acquire, 1)
    call @extern_kernel(%97, %104, %105, %106) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 2)
    AIE.useToken @token7(Release, 4)
    AIE.useToken @token16(Release, 8)
    AIE.useToken @token38(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %108 = AIE.mem(%103) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%106 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%105 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %109 = AIE.tile(12, 4)
  %110 = AIE.buffer(%109) : memref<32x32xf32>
  %111 = AIE.buffer(%109) : memref<32x32xf32>
  %112 = AIE.buffer(%109) : memref<32x32xf32>
  %113 = AIE.core(%109) {
    AIE.useToken @token38(Acquire, 1)
    AIE.useToken @token32(Acquire, 0)
    AIE.useToken @token11(Acquire, 7)
    AIE.useToken @token10(Acquire, 3)
    call @extern_kernel(%104, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token10(Release, 4)
    AIE.useToken @token11(Release, 8)
    AIE.useToken @token32(Release, 1)
    AIE.useToken @token38(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %114 = AIE.mem(%109) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %115 = AIE.tile(12, 5) {polyaie.leaf}
  %116 = AIE.buffer(%115) : memref<32x32xf32>
  %117 = AIE.buffer(%115) : memref<32x32xf32>
  %118 = AIE.buffer(%115) : memref<32x32xf32>
  %119 = AIE.core(%115) {
    AIE.useToken @token42(Acquire, 0)
    AIE.useToken @token32(Acquire, 1)
    AIE.useToken @token29(Acquire, 7)
    AIE.useToken @token9(Acquire, 3)
    call @extern_kernel(%110, %116, %117, %118) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 4)
    AIE.useToken @token29(Release, 8)
    AIE.useToken @token32(Release, 2)
    AIE.useToken @token42(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %120 = AIE.mem(%115) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%118 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%117 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%116 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token42(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%115, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%25, DMA : 0>
    }
  }
  %121 = AIE.tile(13, 2)
  %122 = AIE.buffer(%121) : memref<32x32xf32>
  %123 = AIE.buffer(%121) : memref<32x32xf32>
  %124 = AIE.buffer(%121) : memref<32x32xf32>
  %125 = AIE.buffer(%121) : memref<32x32xf32>
  %126 = AIE.core(%121) {
    AIE.useToken @token43(Acquire, 9)
    AIE.useToken @token31(Acquire, 3)
    AIE.useToken @token14(Acquire, 0)
    call @extern_kernel(%125, %122, %123, %124) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token14(Release, 1)
    AIE.useToken @token31(Release, 4)
    AIE.useToken @token43(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %127 = AIE.mem(%121) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%124 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token43(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%123 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token43(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %128 = AIE.tile(13, 3)
  %129 = AIE.buffer(%128) : memref<32x32xf32>
  %130 = AIE.buffer(%128) : memref<32x32xf32>
  %131 = AIE.buffer(%128) : memref<32x32xf32>
  %132 = AIE.core(%128) {
    AIE.useToken @token44(Acquire, 3)
    AIE.useToken @token16(Acquire, 9)
    AIE.useToken @token14(Acquire, 1)
    AIE.useToken @token8(Acquire, 0)
    call @extern_kernel(%122, %129, %130, %131) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token8(Release, 1)
    AIE.useToken @token14(Release, 2)
    AIE.useToken @token16(Release, 10)
    AIE.useToken @token44(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %133 = AIE.mem(%128) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%130 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %134 = AIE.tile(13, 4)
  %135 = AIE.buffer(%134) : memref<32x32xf32>
  %136 = AIE.buffer(%134) : memref<32x32xf32>
  %137 = AIE.buffer(%134) : memref<32x32xf32>
  %138 = AIE.core(%134) {
    AIE.useToken @token55(Acquire, 0)
    AIE.useToken @token51(Acquire, 3)
    AIE.useToken @token11(Acquire, 9)
    AIE.useToken @token8(Acquire, 1)
    call @extern_kernel(%129, %135, %136, %137) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token8(Release, 2)
    AIE.useToken @token11(Release, 10)
    AIE.useToken @token51(Release, 4)
    AIE.useToken @token55(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %139 = AIE.mem(%134) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%136 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token51(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%137 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token51(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %140 = AIE.tile(13, 5) {polyaie.leaf}
  %141 = AIE.buffer(%140) : memref<32x32xf32>
  %142 = AIE.buffer(%140) : memref<32x32xf32>
  %143 = AIE.buffer(%140) : memref<32x32xf32>
  %144 = AIE.core(%140) {
    AIE.useToken @token55(Acquire, 1)
    AIE.useToken @token29(Acquire, 9)
    AIE.useToken @token20(Acquire, 0)
    AIE.useToken @token1(Acquire, 3)
    call @extern_kernel(%135, %141, %142, %143) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token20(Release, 1)
    AIE.useToken @token29(Release, 10)
    AIE.useToken @token55(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %145 = AIE.mem(%140) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%143 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%142 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%141 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token20(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%140, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%25, DMA : 0>
    }
  }
  %146 = AIE.tile(14, 2)
  %147 = AIE.buffer(%146) : memref<32x32xf32>
  %148 = AIE.buffer(%146) : memref<32x32xf32>
  %149 = AIE.buffer(%146) : memref<32x32xf32>
  %150 = AIE.buffer(%146) : memref<32x32xf32>
  %151 = AIE.core(%146) {
    AIE.useToken @token48(Acquire, 0)
    AIE.useToken @token41(Acquire, 3)
    AIE.useToken @token0(Acquire, 5)
    call @extern_kernel(%150, %147, %148, %149) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 6)
    AIE.useToken @token41(Release, 4)
    AIE.useToken @token48(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %152 = AIE.mem(%146) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%149 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%148 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %153 = AIE.tile(14, 3)
  %154 = AIE.buffer(%153) : memref<32x32xf32>
  %155 = AIE.buffer(%153) : memref<32x32xf32>
  %156 = AIE.buffer(%153) : memref<32x32xf32>
  %157 = AIE.core(%153) {
    AIE.useToken @token48(Acquire, 1)
    AIE.useToken @token28(Acquire, 0)
    AIE.useToken @token13(Acquire, 5)
    AIE.useToken @token6(Acquire, 3)
    call @extern_kernel(%147, %154, %155, %156) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 4)
    AIE.useToken @token13(Release, 6)
    AIE.useToken @token28(Release, 1)
    AIE.useToken @token48(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %158 = AIE.mem(%153) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%155 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%156 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %159 = AIE.tile(14, 4)
  %160 = AIE.buffer(%159) : memref<32x32xf32>
  %161 = AIE.buffer(%159) : memref<32x32xf32>
  %162 = AIE.buffer(%159) : memref<32x32xf32>
  %163 = AIE.core(%159) {
    AIE.useToken @token54(Acquire, 5)
    AIE.useToken @token53(Acquire, 3)
    AIE.useToken @token28(Acquire, 1)
    AIE.useToken @token25(Acquire, 0)
    call @extern_kernel(%154, %160, %161, %162) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token25(Release, 1)
    AIE.useToken @token28(Release, 2)
    AIE.useToken @token53(Release, 4)
    AIE.useToken @token54(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %164 = AIE.mem(%159) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token53(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%161 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token53(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token54(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%162 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token54(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %165 = AIE.tile(14, 5) {polyaie.leaf}
  %166 = AIE.buffer(%165) : memref<32x32xf32>
  %167 = AIE.buffer(%165) : memref<32x32xf32>
  %168 = AIE.buffer(%165) : memref<32x32xf32>
  %169 = AIE.core(%165) {
    AIE.useToken @token49(Acquire, 3)
    AIE.useToken @token34(Acquire, 0)
    AIE.useToken @token30(Acquire, 5)
    AIE.useToken @token25(Acquire, 1)
    call @extern_kernel(%160, %166, %167, %168) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token25(Release, 2)
    AIE.useToken @token30(Release, 6)
    AIE.useToken @token34(Release, 1)
    AIE.useToken @token49(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %170 = AIE.mem(%165) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%168 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token49(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%167 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token49(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token34(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%166 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token34(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%165, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%25, DMA : 1>
    }
  }
  %171 = AIE.tile(15, 2)
  %172 = AIE.buffer(%171) : memref<32x32xf32>
  %173 = AIE.buffer(%171) : memref<32x32xf32>
  %174 = AIE.buffer(%171) : memref<32x32xf32>
  %175 = AIE.buffer(%171) : memref<32x32xf32>
  %176 = AIE.core(%171) {
    AIE.useToken @token41(Acquire, 5)
    AIE.useToken @token40(Acquire, 5)
    AIE.useToken @token27(Acquire, 0)
    call @extern_kernel(%175, %172, %173, %174) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token27(Release, 1)
    AIE.useToken @token40(Release, 6)
    AIE.useToken @token41(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %177 = AIE.mem(%171) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token40(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%174 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token40(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%173 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %178 = AIE.tile(15, 3)
  %179 = AIE.buffer(%178) : memref<32x32xf32>
  %180 = AIE.buffer(%178) : memref<32x32xf32>
  %181 = AIE.buffer(%178) : memref<32x32xf32>
  %182 = AIE.core(%178) {
    AIE.useToken @token39(Acquire, 0)
    AIE.useToken @token27(Acquire, 1)
    AIE.useToken @token17(Acquire, 5)
    AIE.useToken @token6(Acquire, 5)
    call @extern_kernel(%172, %179, %180, %181) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 6)
    AIE.useToken @token17(Release, 6)
    AIE.useToken @token27(Release, 2)
    AIE.useToken @token39(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %183 = AIE.mem(%178) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%180 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%181 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %184 = AIE.tile(15, 4)
  %185 = AIE.buffer(%184) : memref<32x32xf32>
  %186 = AIE.buffer(%184) : memref<32x32xf32>
  %187 = AIE.buffer(%184) : memref<32x32xf32>
  %188 = AIE.core(%184) {
    AIE.useToken @token53(Acquire, 5)
    AIE.useToken @token39(Acquire, 1)
    AIE.useToken @token21(Acquire, 5)
    AIE.useToken @token3(Acquire, 0)
    call @extern_kernel(%179, %185, %186, %187) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token21(Release, 6)
    AIE.useToken @token39(Release, 2)
    AIE.useToken @token53(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %189 = AIE.mem(%184) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%187 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token53(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token53(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %190 = AIE.tile(15, 5) {polyaie.leaf}
  %191 = AIE.buffer(%190) : memref<32x32xf32>
  %192 = AIE.buffer(%190) : memref<32x32xf32>
  %193 = AIE.buffer(%190) : memref<32x32xf32>
  %194 = AIE.core(%190) {
    AIE.useToken @token52(Acquire, 0)
    AIE.useToken @token49(Acquire, 5)
    AIE.useToken @token4(Acquire, 5)
    AIE.useToken @token3(Acquire, 1)
    call @extern_kernel(%185, %191, %192, %193) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 2)
    AIE.useToken @token4(Release, 6)
    AIE.useToken @token49(Release, 6)
    AIE.useToken @token52(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %195 = AIE.mem(%190) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%193 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token49(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%192 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token49(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token52(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%191 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token52(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%190, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%25, DMA : 1>
    }
  }
  %196 = AIE.tile(16, 2)
  %197 = AIE.buffer(%196) : memref<32x32xf32>
  %198 = AIE.buffer(%196) : memref<32x32xf32>
  %199 = AIE.buffer(%196) : memref<32x32xf32>
  %200 = AIE.buffer(%196) : memref<32x32xf32>
  %201 = AIE.core(%196) {
    AIE.useToken @token50(Acquire, 0)
    AIE.useToken @token41(Acquire, 7)
    AIE.useToken @token37(Acquire, 5)
    call @extern_kernel(%200, %197, %198, %199) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token37(Release, 6)
    AIE.useToken @token41(Release, 8)
    AIE.useToken @token50(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %202 = AIE.mem(%196) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%199 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%198 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %203 = AIE.tile(16, 3)
  %204 = AIE.buffer(%203) : memref<32x32xf32>
  %205 = AIE.buffer(%203) : memref<32x32xf32>
  %206 = AIE.buffer(%203) : memref<32x32xf32>
  %207 = AIE.core(%203) {
    AIE.useToken @token50(Acquire, 1)
    AIE.useToken @token46(Acquire, 0)
    AIE.useToken @token7(Acquire, 5)
    AIE.useToken @token6(Acquire, 7)
    call @extern_kernel(%197, %204, %205, %206) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 8)
    AIE.useToken @token7(Release, 6)
    AIE.useToken @token46(Release, 1)
    AIE.useToken @token50(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %208 = AIE.mem(%203) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%205 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%206 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %209 = AIE.tile(16, 4)
  %210 = AIE.buffer(%209) : memref<32x32xf32>
  %211 = AIE.buffer(%209) : memref<32x32xf32>
  %212 = AIE.buffer(%209) : memref<32x32xf32>
  %213 = AIE.core(%209) {
    AIE.useToken @token53(Acquire, 7)
    AIE.useToken @token46(Acquire, 1)
    AIE.useToken @token12(Acquire, 0)
    AIE.useToken @token10(Acquire, 5)
    call @extern_kernel(%204, %210, %211, %212) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token10(Release, 6)
    AIE.useToken @token12(Release, 1)
    AIE.useToken @token46(Release, 2)
    AIE.useToken @token53(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %214 = AIE.mem(%209) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%212 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token53(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%211 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token53(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %215 = AIE.tile(16, 5) {polyaie.leaf}
  %216 = AIE.buffer(%215) : memref<32x32xf32>
  %217 = AIE.buffer(%215) : memref<32x32xf32>
  %218 = AIE.buffer(%215) : memref<32x32xf32>
  %219 = AIE.core(%215) {
    AIE.useToken @token49(Acquire, 7)
    AIE.useToken @token35(Acquire, 0)
    AIE.useToken @token12(Acquire, 1)
    AIE.useToken @token9(Acquire, 5)
    call @extern_kernel(%210, %216, %217, %218) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 6)
    AIE.useToken @token12(Release, 2)
    AIE.useToken @token35(Release, 1)
    AIE.useToken @token49(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %220 = AIE.mem(%215) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%218 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token49(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%217 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token49(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token35(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%216 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token35(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%215, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%25, DMA : 1>
    }
  }
  %221 = AIE.tile(17, 2)
  %222 = AIE.buffer(%221) : memref<32x32xf32>
  %223 = AIE.buffer(%221) : memref<32x32xf32>
  %224 = AIE.buffer(%221) : memref<32x32xf32>
  %225 = AIE.buffer(%221) : memref<32x32xf32>
  %226 = AIE.core(%221) {
    AIE.useToken @token47(Acquire, 0)
    AIE.useToken @token41(Acquire, 9)
    AIE.useToken @token31(Acquire, 5)
    call @extern_kernel(%225, %222, %223, %224) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token31(Release, 6)
    AIE.useToken @token41(Release, 10)
    AIE.useToken @token47(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %227 = AIE.mem(%221) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%224 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%223 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %228 = AIE.tile(17, 3)
  %229 = AIE.buffer(%228) : memref<32x32xf32>
  %230 = AIE.buffer(%228) : memref<32x32xf32>
  %231 = AIE.buffer(%228) : memref<32x32xf32>
  %232 = AIE.core(%228) {
    AIE.useToken @token47(Acquire, 1)
    AIE.useToken @token44(Acquire, 5)
    AIE.useToken @token26(Acquire, 0)
    AIE.useToken @token6(Acquire, 9)
    call @extern_kernel(%222, %229, %230, %231) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 10)
    AIE.useToken @token26(Release, 1)
    AIE.useToken @token44(Release, 6)
    AIE.useToken @token47(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %233 = AIE.mem(%228) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%230 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%231 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %234 = AIE.tile(17, 4)
  %235 = AIE.buffer(%234) : memref<32x32xf32>
  %236 = AIE.buffer(%234) : memref<32x32xf32>
  %237 = AIE.buffer(%234) : memref<32x32xf32>
  %238 = AIE.core(%234) {
    AIE.useToken @token53(Acquire, 9)
    AIE.useToken @token51(Acquire, 5)
    AIE.useToken @token26(Acquire, 1)
    AIE.useToken @token19(Acquire, 0)
    call @extern_kernel(%229, %235, %236, %237) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token19(Release, 1)
    AIE.useToken @token26(Release, 2)
    AIE.useToken @token51(Release, 6)
    AIE.useToken @token53(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %239 = AIE.mem(%234) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token51(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%237 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token51(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token53(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%236 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token53(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %240 = AIE.tile(17, 5) {polyaie.leaf}
  %241 = AIE.buffer(%240) : memref<32x32xf32>
  %242 = AIE.buffer(%240) : memref<32x32xf32>
  %243 = AIE.buffer(%240) : memref<32x32xf32>
  %244 = AIE.core(%240) {
    AIE.useToken @token49(Acquire, 9)
    AIE.useToken @token22(Acquire, 0)
    AIE.useToken @token19(Acquire, 1)
    AIE.useToken @token1(Acquire, 5)
    call @extern_kernel(%235, %241, %242, %243) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 6)
    AIE.useToken @token19(Release, 2)
    AIE.useToken @token22(Release, 1)
    AIE.useToken @token49(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %245 = AIE.mem(%240) {
    %246 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%243 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %247 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token49(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%242 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token49(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %248 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token22(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%241 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token22(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%240, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%25, DMA : 1>
    }
  }
}


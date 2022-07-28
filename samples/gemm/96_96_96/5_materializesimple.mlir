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
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %9 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %10 = AIE.external_buffer 90112 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %10) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %11 = AIE.external_buffer 98304 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %11) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %12 = AIE.external_buffer 106496 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %13 = AIE.external_buffer 114688 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %13) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %14 = AIE.external_buffer 122880 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %15 = AIE.external_buffer 131072 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %16 = AIE.external_buffer 139264 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %17 = AIE.external_buffer 147456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %18 = AIE.core(%3) {
    AIE.useToken @token37(Acquire, 0)
    AIE.useToken @token34(Acquire, 0)
    AIE.useToken @token32(Acquire, 0)
    AIE.useToken @token11(Acquire, 0)
    AIE.useToken @token9(Acquire, 0)
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token9(Release, 1)
    AIE.useToken @token11(Release, 1)
    AIE.useToken @token32(Release, 1)
    AIE.useToken @token34(Release, 1)
    AIE.useToken @token37(Release, 1)
    AIE.end
  }
  %19 = AIE.shimDMA(%3) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token28(Acquire, 1)
    AIE.dmaBd(<%10 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token28(Release, 3)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBd(<%11 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token5(Release, 3)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBd(<%12 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token24(Acquire, 1)
    AIE.dmaBd(<%13 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token24(Release, 3)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token36(Acquire, 1)
    AIE.dmaBd(<%14 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token36(Release, 3)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBd(<%15 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBd(<%16 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token20(Release, 3)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBd(<%17 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token15(Release, 3)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %214 = AIE.dmaStart(MM2S0, ^bb11, ^bb14)
  ^bb11:  // 2 preds: ^bb10, ^bb13
    AIE.useToken @token34(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token34(Release, 2)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 2)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb11
  ^bb14:  // pred: ^bb10
    %215 = AIE.dmaStart(MM2S1, ^bb15, ^bb18)
  ^bb15:  // 2 preds: ^bb14, ^bb17
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 2)
    br ^bb16
  ^bb16:  // pred: ^bb15
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 2)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 2)
    br ^bb15
  ^bb18:  // pred: ^bb14
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%41, DMA : 0>
      AIE.bp_dest<%98, DMA : 0>
      AIE.bp_dest<%155, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%48, DMA : 0>
      AIE.bp_dest<%105, DMA : 0>
      AIE.bp_dest<%162, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%54, DMA : 1>
      AIE.bp_dest<%111, DMA : 0>
      AIE.bp_dest<%168, DMA : 1>
    }
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%41, DMA : 1>
      AIE.bp_dest<%60, DMA : 0>
      AIE.bp_dest<%79, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%48, DMA : 1>
      AIE.bp_dest<%67, DMA : 1>
      AIE.bp_dest<%86, DMA : 1>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%54, DMA : 0>
      AIE.bp_dest<%73, DMA : 0>
      AIE.bp_dest<%92, DMA : 0>
    }
  }
  %20 = AIE.tile(18, 0)
  %21 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%21, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %22 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %23 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %24 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %25 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %26 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %27 = AIE.core(%20) {
    AIE.useToken @token41(Acquire, 0)
    AIE.useToken @token40(Acquire, 0)
    AIE.useToken @token30(Acquire, 0)
    AIE.useToken @token18(Acquire, 0)
    AIE.useToken @token17(Acquire, 0)
    AIE.useToken @token7(Acquire, 0)
    AIE.useToken @token7(Release, 1)
    AIE.useToken @token17(Release, 1)
    AIE.useToken @token18(Release, 1)
    AIE.useToken @token30(Release, 1)
    AIE.useToken @token40(Release, 1)
    AIE.useToken @token41(Release, 1)
    AIE.end
  }
  %28 = AIE.shimDMA(%20) {
    %212 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%25 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 2)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token40(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%24 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token40(Release, 2)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %213 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%23 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 2)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%21 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 2)
    br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%20, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%98, DMA : 1>
      AIE.bp_dest<%117, DMA : 0>
      AIE.bp_dest<%136, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%105, DMA : 1>
      AIE.bp_dest<%124, DMA : 1>
      AIE.bp_dest<%143, DMA : 1>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%111, DMA : 1>
      AIE.bp_dest<%130, DMA : 0>
      AIE.bp_dest<%149, DMA : 1>
    }
  }
  AIE.broad_packet(%20, DMA : 1) {
    AIE.bp_id(0) {
      AIE.bp_dest<%155, DMA : 1>
      AIE.bp_dest<%174, DMA : 0>
      AIE.bp_dest<%193, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%162, DMA : 0>
      AIE.bp_dest<%181, DMA : 0>
      AIE.bp_dest<%200, DMA : 0>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%168, DMA : 0>
      AIE.bp_dest<%187, DMA : 0>
      AIE.bp_dest<%206, DMA : 1>
    }
  }
  %29 = AIE.tile(11, 0)
  %30 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %31 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %32 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%32, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %33 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%33, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %34 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %35 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %36 = AIE.external_buffer 155648 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %36) {kind = 2 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<96x96xf32>, memref<1025xf32>) -> ()
  %37 = AIE.core(%29) {
    AIE.useToken @token44(Acquire, 0)
    AIE.useToken @token42(Acquire, 0)
    AIE.useToken @token16(Acquire, 0)
    AIE.useToken @token14(Acquire, 0)
    AIE.useToken @token8(Acquire, 0)
    AIE.useToken @token2(Acquire, 0)
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token8(Release, 1)
    AIE.useToken @token14(Release, 1)
    AIE.useToken @token16(Release, 1)
    AIE.useToken @token42(Release, 1)
    AIE.useToken @token44(Release, 1)
    AIE.end
  }
  %38 = AIE.shimDMA(%29) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBd(<%36 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token12(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(MM2S0, ^bb3, ^bb6)
  ^bb3:  // 2 preds: ^bb2, ^bb5
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token42(Release, 2)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 2)
    br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%33 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 2)
    br ^bb3
  ^bb6:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S1, ^bb7, ^bb10)
  ^bb7:  // 2 preds: ^bb6, ^bb9
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%32 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 2)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%31 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 2)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%30 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 2)
    br ^bb7
  ^bb10:  // pred: ^bb6
    AIE.end
  }
  AIE.broad_packet(%29, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%60, DMA : 1>
      AIE.bp_dest<%117, DMA : 1>
      AIE.bp_dest<%174, DMA : 1>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%67, DMA : 0>
      AIE.bp_dest<%124, DMA : 0>
      AIE.bp_dest<%181, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%73, DMA : 1>
      AIE.bp_dest<%130, DMA : 1>
      AIE.bp_dest<%187, DMA : 1>
    }
  }
  AIE.broad_packet(%29, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%79, DMA : 0>
      AIE.bp_dest<%136, DMA : 0>
      AIE.bp_dest<%193, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%86, DMA : 0>
      AIE.bp_dest<%143, DMA : 0>
      AIE.bp_dest<%200, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%92, DMA : 1>
      AIE.bp_dest<%149, DMA : 0>
      AIE.bp_dest<%206, DMA : 0>
    }
  }
  %39 = AIE.tile(0, 0)
  %40 = AIE.core(%39) {
    AIE.end
  }
  %41 = AIE.tile(10, 2)
  %42 = AIE.buffer(%41) : memref<32x32xf32>
  %43 = AIE.buffer(%41) : memref<32x32xf32>
  %44 = AIE.buffer(%41) : memref<32x32xf32>
  %45 = AIE.buffer(%41) : memref<32x32xf32>
  %46 = AIE.core(%41) {
    AIE.useToken @token34(Acquire, 3)
    AIE.useToken @token25(Acquire, 0)
    AIE.useToken @token9(Acquire, 3)
    call @extern_kernel(%45, %42, %43, %44) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 4)
    AIE.useToken @token25(Release, 1)
    AIE.useToken @token34(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %47 = AIE.mem(%41) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBd(<%44 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token34(Acquire, 1)
    AIE.dmaBd(<%43 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token34(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %48 = AIE.tile(10, 3)
  %49 = AIE.buffer(%48) : memref<32x32xf32>
  %50 = AIE.buffer(%48) : memref<32x32xf32>
  %51 = AIE.buffer(%48) : memref<32x32xf32>
  %52 = AIE.core(%48) {
    AIE.useToken @token43(Acquire, 0)
    AIE.useToken @token32(Acquire, 3)
    AIE.useToken @token25(Acquire, 1)
    AIE.useToken @token11(Acquire, 3)
    call @extern_kernel(%42, %49, %50, %51) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token11(Release, 4)
    AIE.useToken @token25(Release, 2)
    AIE.useToken @token32(Release, 4)
    AIE.useToken @token43(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %53 = AIE.mem(%48) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBd(<%51 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBd(<%50 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %54 = AIE.tile(10, 4) {polyaie.leaf}
  %55 = AIE.buffer(%54) : memref<32x32xf32>
  %56 = AIE.buffer(%54) : memref<32x32xf32>
  %57 = AIE.buffer(%54) : memref<32x32xf32>
  %58 = AIE.core(%54) {
    AIE.useToken @token43(Acquire, 1)
    AIE.useToken @token37(Acquire, 3)
    AIE.useToken @token28(Acquire, 0)
    AIE.useToken @token1(Acquire, 3)
    call @extern_kernel(%49, %55, %56, %57) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token28(Release, 1)
    AIE.useToken @token37(Release, 4)
    AIE.useToken @token43(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %59 = AIE.mem(%54) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token28(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token28(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%54, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %60 = AIE.tile(11, 2)
  %61 = AIE.buffer(%60) : memref<32x32xf32>
  %62 = AIE.buffer(%60) : memref<32x32xf32>
  %63 = AIE.buffer(%60) : memref<32x32xf32>
  %64 = AIE.buffer(%60) : memref<32x32xf32>
  %65 = AIE.core(%60) {
    AIE.useToken @token42(Acquire, 3)
    AIE.useToken @token34(Acquire, 5)
    AIE.useToken @token31(Acquire, 0)
    call @extern_kernel(%64, %61, %62, %63) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token31(Release, 1)
    AIE.useToken @token34(Release, 6)
    AIE.useToken @token42(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %66 = AIE.mem(%60) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token34(Acquire, 1)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token34(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token42(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %67 = AIE.tile(11, 3)
  %68 = AIE.buffer(%67) : memref<32x32xf32>
  %69 = AIE.buffer(%67) : memref<32x32xf32>
  %70 = AIE.buffer(%67) : memref<32x32xf32>
  %71 = AIE.core(%67) {
    AIE.useToken @token38(Acquire, 0)
    AIE.useToken @token32(Acquire, 5)
    AIE.useToken @token31(Acquire, 1)
    AIE.useToken @token16(Acquire, 3)
    call @extern_kernel(%61, %68, %69, %70) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token16(Release, 4)
    AIE.useToken @token31(Release, 2)
    AIE.useToken @token32(Release, 6)
    AIE.useToken @token38(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %72 = AIE.mem(%67) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBd(<%70 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBd(<%69 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %73 = AIE.tile(11, 4) {polyaie.leaf}
  %74 = AIE.buffer(%73) : memref<32x32xf32>
  %75 = AIE.buffer(%73) : memref<32x32xf32>
  %76 = AIE.buffer(%73) : memref<32x32xf32>
  %77 = AIE.core(%73) {
    AIE.useToken @token44(Acquire, 3)
    AIE.useToken @token38(Acquire, 1)
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token1(Acquire, 5)
    call @extern_kernel(%68, %74, %75, %76) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 6)
    AIE.useToken @token5(Release, 1)
    AIE.useToken @token38(Release, 2)
    AIE.useToken @token44(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %78 = AIE.mem(%73) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBd(<%75 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBd(<%76 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%73, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %79 = AIE.tile(12, 2)
  %80 = AIE.buffer(%79) : memref<32x32xf32>
  %81 = AIE.buffer(%79) : memref<32x32xf32>
  %82 = AIE.buffer(%79) : memref<32x32xf32>
  %83 = AIE.buffer(%79) : memref<32x32xf32>
  %84 = AIE.core(%79) {
    AIE.useToken @token34(Acquire, 7)
    AIE.useToken @token13(Acquire, 0)
    AIE.useToken @token2(Acquire, 3)
    call @extern_kernel(%83, %80, %81, %82) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 4)
    AIE.useToken @token13(Release, 1)
    AIE.useToken @token34(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %85 = AIE.mem(%79) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token34(Acquire, 1)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token34(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %86 = AIE.tile(12, 3)
  %87 = AIE.buffer(%86) : memref<32x32xf32>
  %88 = AIE.buffer(%86) : memref<32x32xf32>
  %89 = AIE.buffer(%86) : memref<32x32xf32>
  %90 = AIE.core(%86) {
    AIE.useToken @token32(Acquire, 7)
    AIE.useToken @token13(Acquire, 1)
    AIE.useToken @token8(Acquire, 3)
    AIE.useToken @token6(Acquire, 0)
    call @extern_kernel(%80, %87, %88, %89) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 1)
    AIE.useToken @token8(Release, 4)
    AIE.useToken @token13(Release, 2)
    AIE.useToken @token32(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %91 = AIE.mem(%86) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBd(<%89 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBd(<%88 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %92 = AIE.tile(12, 4) {polyaie.leaf}
  %93 = AIE.buffer(%92) : memref<32x32xf32>
  %94 = AIE.buffer(%92) : memref<32x32xf32>
  %95 = AIE.buffer(%92) : memref<32x32xf32>
  %96 = AIE.core(%92) {
    AIE.useToken @token14(Acquire, 3)
    AIE.useToken @token6(Acquire, 1)
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token1(Acquire, 7)
    call @extern_kernel(%87, %93, %94, %95) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 8)
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token6(Release, 2)
    AIE.useToken @token14(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %97 = AIE.mem(%92) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBd(<%94 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBd(<%95 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%92, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %98 = AIE.tile(13, 2)
  %99 = AIE.buffer(%98) : memref<32x32xf32>
  %100 = AIE.buffer(%98) : memref<32x32xf32>
  %101 = AIE.buffer(%98) : memref<32x32xf32>
  %102 = AIE.buffer(%98) : memref<32x32xf32>
  %103 = AIE.core(%98) {
    AIE.useToken @token35(Acquire, 0)
    AIE.useToken @token18(Acquire, 3)
    AIE.useToken @token9(Acquire, 5)
    call @extern_kernel(%102, %99, %100, %101) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 6)
    AIE.useToken @token18(Release, 4)
    AIE.useToken @token35(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %104 = AIE.mem(%98) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBd(<%101 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBd(<%100 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %105 = AIE.tile(13, 3)
  %106 = AIE.buffer(%105) : memref<32x32xf32>
  %107 = AIE.buffer(%105) : memref<32x32xf32>
  %108 = AIE.buffer(%105) : memref<32x32xf32>
  %109 = AIE.core(%105) {
    AIE.useToken @token39(Acquire, 0)
    AIE.useToken @token35(Acquire, 1)
    AIE.useToken @token17(Acquire, 3)
    AIE.useToken @token11(Acquire, 5)
    call @extern_kernel(%99, %106, %107, %108) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token11(Release, 6)
    AIE.useToken @token17(Release, 4)
    AIE.useToken @token35(Release, 2)
    AIE.useToken @token39(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %110 = AIE.mem(%105) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBd(<%108 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBd(<%107 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %111 = AIE.tile(13, 4) {polyaie.leaf}
  %112 = AIE.buffer(%111) : memref<32x32xf32>
  %113 = AIE.buffer(%111) : memref<32x32xf32>
  %114 = AIE.buffer(%111) : memref<32x32xf32>
  %115 = AIE.core(%111) {
    AIE.useToken @token40(Acquire, 3)
    AIE.useToken @token39(Acquire, 1)
    AIE.useToken @token37(Acquire, 5)
    AIE.useToken @token24(Acquire, 0)
    call @extern_kernel(%106, %112, %113, %114) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token24(Release, 1)
    AIE.useToken @token37(Release, 6)
    AIE.useToken @token39(Release, 2)
    AIE.useToken @token40(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %116 = AIE.mem(%111) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBd(<%114 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token40(Acquire, 1)
    AIE.dmaBd(<%113 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token40(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token24(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token24(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%111, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %117 = AIE.tile(14, 2)
  %118 = AIE.buffer(%117) : memref<32x32xf32>
  %119 = AIE.buffer(%117) : memref<32x32xf32>
  %120 = AIE.buffer(%117) : memref<32x32xf32>
  %121 = AIE.buffer(%117) : memref<32x32xf32>
  %122 = AIE.core(%117) {
    AIE.useToken @token42(Acquire, 5)
    AIE.useToken @token22(Acquire, 0)
    AIE.useToken @token18(Acquire, 5)
    call @extern_kernel(%121, %118, %119, %120) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token18(Release, 6)
    AIE.useToken @token22(Release, 1)
    AIE.useToken @token42(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %123 = AIE.mem(%117) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBd(<%119 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBd(<%120 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token42(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %124 = AIE.tile(14, 3)
  %125 = AIE.buffer(%124) : memref<32x32xf32>
  %126 = AIE.buffer(%124) : memref<32x32xf32>
  %127 = AIE.buffer(%124) : memref<32x32xf32>
  %128 = AIE.core(%124) {
    AIE.useToken @token29(Acquire, 0)
    AIE.useToken @token22(Acquire, 1)
    AIE.useToken @token17(Acquire, 5)
    AIE.useToken @token16(Acquire, 5)
    call @extern_kernel(%118, %125, %126, %127) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token16(Release, 6)
    AIE.useToken @token17(Release, 6)
    AIE.useToken @token22(Release, 2)
    AIE.useToken @token29(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %129 = AIE.mem(%124) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBd(<%127 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBd(<%126 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %130 = AIE.tile(14, 4) {polyaie.leaf}
  %131 = AIE.buffer(%130) : memref<32x32xf32>
  %132 = AIE.buffer(%130) : memref<32x32xf32>
  %133 = AIE.buffer(%130) : memref<32x32xf32>
  %134 = AIE.core(%130) {
    AIE.useToken @token44(Acquire, 5)
    AIE.useToken @token40(Acquire, 5)
    AIE.useToken @token36(Acquire, 0)
    AIE.useToken @token29(Acquire, 1)
    call @extern_kernel(%125, %131, %132, %133) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token29(Release, 2)
    AIE.useToken @token36(Release, 1)
    AIE.useToken @token40(Release, 6)
    AIE.useToken @token44(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %135 = AIE.mem(%130) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token40(Acquire, 1)
    AIE.dmaBd(<%132 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token40(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBd(<%133 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token36(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token36(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%130, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %136 = AIE.tile(15, 2)
  %137 = AIE.buffer(%136) : memref<32x32xf32>
  %138 = AIE.buffer(%136) : memref<32x32xf32>
  %139 = AIE.buffer(%136) : memref<32x32xf32>
  %140 = AIE.buffer(%136) : memref<32x32xf32>
  %141 = AIE.core(%136) {
    AIE.useToken @token19(Acquire, 0)
    AIE.useToken @token18(Acquire, 7)
    AIE.useToken @token2(Acquire, 5)
    call @extern_kernel(%140, %137, %138, %139) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 6)
    AIE.useToken @token18(Release, 8)
    AIE.useToken @token19(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %142 = AIE.mem(%136) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBd(<%139 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBd(<%138 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %143 = AIE.tile(15, 3)
  %144 = AIE.buffer(%143) : memref<32x32xf32>
  %145 = AIE.buffer(%143) : memref<32x32xf32>
  %146 = AIE.buffer(%143) : memref<32x32xf32>
  %147 = AIE.core(%143) {
    AIE.useToken @token19(Acquire, 1)
    AIE.useToken @token17(Acquire, 7)
    AIE.useToken @token8(Acquire, 5)
    AIE.useToken @token0(Acquire, 0)
    call @extern_kernel(%137, %144, %145, %146) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token8(Release, 6)
    AIE.useToken @token17(Release, 8)
    AIE.useToken @token19(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %148 = AIE.mem(%143) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBd(<%146 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBd(<%145 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %149 = AIE.tile(15, 4) {polyaie.leaf}
  %150 = AIE.buffer(%149) : memref<32x32xf32>
  %151 = AIE.buffer(%149) : memref<32x32xf32>
  %152 = AIE.buffer(%149) : memref<32x32xf32>
  %153 = AIE.core(%149) {
    AIE.useToken @token40(Acquire, 7)
    AIE.useToken @token14(Acquire, 5)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token0(Acquire, 1)
    call @extern_kernel(%144, %150, %151, %152) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 2)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token14(Release, 6)
    AIE.useToken @token40(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %154 = AIE.mem(%149) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBd(<%152 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token40(Acquire, 1)
    AIE.dmaBd(<%151 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token40(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%150 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%149, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %155 = AIE.tile(16, 2)
  %156 = AIE.buffer(%155) : memref<32x32xf32>
  %157 = AIE.buffer(%155) : memref<32x32xf32>
  %158 = AIE.buffer(%155) : memref<32x32xf32>
  %159 = AIE.buffer(%155) : memref<32x32xf32>
  %160 = AIE.core(%155) {
    AIE.useToken @token41(Acquire, 3)
    AIE.useToken @token27(Acquire, 0)
    AIE.useToken @token9(Acquire, 7)
    call @extern_kernel(%159, %156, %157, %158) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 8)
    AIE.useToken @token27(Release, 1)
    AIE.useToken @token41(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %161 = AIE.mem(%155) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBd(<%158 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBd(<%157 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %162 = AIE.tile(16, 3)
  %163 = AIE.buffer(%162) : memref<32x32xf32>
  %164 = AIE.buffer(%162) : memref<32x32xf32>
  %165 = AIE.buffer(%162) : memref<32x32xf32>
  %166 = AIE.core(%162) {
    AIE.useToken @token27(Acquire, 1)
    AIE.useToken @token23(Acquire, 0)
    AIE.useToken @token11(Acquire, 7)
    AIE.useToken @token7(Acquire, 3)
    call @extern_kernel(%156, %163, %164, %165) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token7(Release, 4)
    AIE.useToken @token11(Release, 8)
    AIE.useToken @token23(Release, 1)
    AIE.useToken @token27(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %167 = AIE.mem(%162) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBd(<%164 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBd(<%165 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %168 = AIE.tile(16, 4) {polyaie.leaf}
  %169 = AIE.buffer(%168) : memref<32x32xf32>
  %170 = AIE.buffer(%168) : memref<32x32xf32>
  %171 = AIE.buffer(%168) : memref<32x32xf32>
  %172 = AIE.core(%168) {
    AIE.useToken @token37(Acquire, 7)
    AIE.useToken @token30(Acquire, 3)
    AIE.useToken @token23(Acquire, 1)
    AIE.useToken @token20(Acquire, 0)
    call @extern_kernel(%163, %169, %170, %171) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token20(Release, 1)
    AIE.useToken @token23(Release, 2)
    AIE.useToken @token30(Release, 4)
    AIE.useToken @token37(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %173 = AIE.mem(%168) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBd(<%170 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBd(<%171 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%169 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token20(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%168, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %174 = AIE.tile(17, 2)
  %175 = AIE.buffer(%174) : memref<32x32xf32>
  %176 = AIE.buffer(%174) : memref<32x32xf32>
  %177 = AIE.buffer(%174) : memref<32x32xf32>
  %178 = AIE.buffer(%174) : memref<32x32xf32>
  %179 = AIE.core(%174) {
    AIE.useToken @token42(Acquire, 7)
    AIE.useToken @token41(Acquire, 5)
    AIE.useToken @token33(Acquire, 0)
    call @extern_kernel(%178, %175, %176, %177) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token33(Release, 1)
    AIE.useToken @token41(Release, 6)
    AIE.useToken @token42(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %180 = AIE.mem(%174) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBd(<%176 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBd(<%177 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token42(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %181 = AIE.tile(17, 3)
  %182 = AIE.buffer(%181) : memref<32x32xf32>
  %183 = AIE.buffer(%181) : memref<32x32xf32>
  %184 = AIE.buffer(%181) : memref<32x32xf32>
  %185 = AIE.core(%181) {
    AIE.useToken @token33(Acquire, 1)
    AIE.useToken @token16(Acquire, 7)
    AIE.useToken @token10(Acquire, 0)
    AIE.useToken @token7(Acquire, 5)
    call @extern_kernel(%175, %182, %183, %184) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token7(Release, 6)
    AIE.useToken @token10(Release, 1)
    AIE.useToken @token16(Release, 8)
    AIE.useToken @token33(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %186 = AIE.mem(%181) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBd(<%183 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBd(<%184 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %187 = AIE.tile(17, 4) {polyaie.leaf}
  %188 = AIE.buffer(%187) : memref<32x32xf32>
  %189 = AIE.buffer(%187) : memref<32x32xf32>
  %190 = AIE.buffer(%187) : memref<32x32xf32>
  %191 = AIE.core(%187) {
    AIE.useToken @token44(Acquire, 7)
    AIE.useToken @token30(Acquire, 5)
    AIE.useToken @token15(Acquire, 0)
    AIE.useToken @token10(Acquire, 1)
    call @extern_kernel(%182, %188, %189, %190) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token10(Release, 2)
    AIE.useToken @token15(Release, 1)
    AIE.useToken @token30(Release, 6)
    AIE.useToken @token44(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %192 = AIE.mem(%187) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBd(<%189 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBd(<%190 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%188 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%187, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %193 = AIE.tile(18, 2)
  %194 = AIE.buffer(%193) : memref<32x32xf32>
  %195 = AIE.buffer(%193) : memref<32x32xf32>
  %196 = AIE.buffer(%193) : memref<32x32xf32>
  %197 = AIE.buffer(%193) : memref<32x32xf32>
  %198 = AIE.core(%193) {
    AIE.useToken @token41(Acquire, 7)
    AIE.useToken @token26(Acquire, 0)
    AIE.useToken @token2(Acquire, 7)
    call @extern_kernel(%197, %194, %195, %196) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 8)
    AIE.useToken @token26(Release, 1)
    AIE.useToken @token41(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %199 = AIE.mem(%193) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBd(<%196 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token41(Acquire, 1)
    AIE.dmaBd(<%195 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token41(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %200 = AIE.tile(18, 3)
  %201 = AIE.buffer(%200) : memref<32x32xf32>
  %202 = AIE.buffer(%200) : memref<32x32xf32>
  %203 = AIE.buffer(%200) : memref<32x32xf32>
  %204 = AIE.core(%200) {
    AIE.useToken @token26(Acquire, 1)
    AIE.useToken @token21(Acquire, 0)
    AIE.useToken @token8(Acquire, 7)
    AIE.useToken @token7(Acquire, 7)
    call @extern_kernel(%194, %201, %202, %203) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token7(Release, 8)
    AIE.useToken @token8(Release, 8)
    AIE.useToken @token21(Release, 1)
    AIE.useToken @token26(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %205 = AIE.mem(%200) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBd(<%202 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBd(<%203 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %206 = AIE.tile(18, 4) {polyaie.leaf}
  %207 = AIE.buffer(%206) : memref<32x32xf32>
  %208 = AIE.buffer(%206) : memref<32x32xf32>
  %209 = AIE.buffer(%206) : memref<32x32xf32>
  %210 = AIE.core(%206) {
    AIE.useToken @token30(Acquire, 7)
    AIE.useToken @token21(Acquire, 1)
    AIE.useToken @token14(Acquire, 7)
    AIE.useToken @token12(Acquire, 0)
    call @extern_kernel(%201, %207, %208, %209) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token12(Release, 1)
    AIE.useToken @token14(Release, 8)
    AIE.useToken @token21(Release, 2)
    AIE.useToken @token30(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %211 = AIE.mem(%206) {
    %212 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBd(<%209 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %213 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBd(<%208 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %214 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%207 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token12(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%206, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%29, DMA : 0>
    }
  }
}


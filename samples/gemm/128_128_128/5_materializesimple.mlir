module @gemm {
  AIE.token(0) {sym_name = "token95"}
  AIE.token(0) {sym_name = "token94"}
  AIE.token(0) {sym_name = "token93"}
  AIE.token(0) {sym_name = "token92"}
  AIE.token(0) {sym_name = "token91"}
  AIE.token(0) {sym_name = "token90"}
  AIE.token(0) {sym_name = "token89"}
  AIE.token(0) {sym_name = "token88"}
  AIE.token(0) {sym_name = "token87"}
  AIE.token(0) {sym_name = "token86"}
  AIE.token(0) {sym_name = "token85"}
  AIE.token(0) {sym_name = "token84"}
  AIE.token(0) {sym_name = "token83"}
  AIE.token(0) {sym_name = "token82"}
  AIE.token(0) {sym_name = "token81"}
  AIE.token(0) {sym_name = "token80"}
  AIE.token(0) {sym_name = "token79"}
  AIE.token(0) {sym_name = "token78"}
  AIE.token(0) {sym_name = "token77"}
  AIE.token(0) {sym_name = "token76"}
  AIE.token(0) {sym_name = "token75"}
  AIE.token(0) {sym_name = "token74"}
  AIE.token(0) {sym_name = "token73"}
  AIE.token(0) {sym_name = "token72"}
  AIE.token(0) {sym_name = "token71"}
  AIE.token(0) {sym_name = "token70"}
  AIE.token(0) {sym_name = "token69"}
  AIE.token(0) {sym_name = "token68"}
  AIE.token(0) {sym_name = "token67"}
  AIE.token(0) {sym_name = "token66"}
  AIE.token(0) {sym_name = "token65"}
  AIE.token(0) {sym_name = "token64"}
  AIE.token(0) {sym_name = "token63"}
  AIE.token(0) {sym_name = "token62"}
  AIE.token(0) {sym_name = "token61"}
  AIE.token(0) {sym_name = "token60"}
  AIE.token(0) {sym_name = "token59"}
  AIE.token(0) {sym_name = "token58"}
  AIE.token(0) {sym_name = "token57"}
  AIE.token(0) {sym_name = "token56"}
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
  %0 = memref.alloc() : memref<128x128xf32>
  %1 = memref.alloc() : memref<128x128xf32>
  %2 = memref.alloc() : memref<128x128xf32>
  %3 = AIE.tile(19, 0)
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %1) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %1) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %9 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %1) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %10 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %11 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %1) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %12 = AIE.external_buffer 147456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %12) {kind = 2 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %13 = AIE.external_buffer 151556 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %13) {kind = 2 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %14 = AIE.external_buffer 155656 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %14) {kind = 2 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %15 = AIE.external_buffer 159756 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %15) {kind = 2 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %16 = AIE.external_buffer 163856 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %16) {kind = 2 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %17 = AIE.external_buffer 167956 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %18 = AIE.external_buffer 172056 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %18) {kind = 2 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %19 = AIE.external_buffer 176156 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %19) {kind = 2 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %20 = AIE.core(%3) {
    AIE.useToken @token95(Acquire, 0)
    AIE.useToken @token92(Acquire, 0)
    AIE.useToken @token78(Acquire, 0)
    AIE.useToken @token55(Acquire, 0)
    AIE.useToken @token48(Acquire, 0)
    AIE.useToken @token24(Acquire, 0)
    AIE.useToken @token14(Acquire, 0)
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token14(Release, 1)
    AIE.useToken @token24(Release, 1)
    AIE.useToken @token48(Release, 1)
    AIE.useToken @token55(Release, 1)
    AIE.useToken @token78(Release, 1)
    AIE.useToken @token92(Release, 1)
    AIE.useToken @token95(Release, 1)
    AIE.end
  }
  %21 = AIE.shimDMA(%3) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%12 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token30(Release, 3)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token53(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%13 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token53(Release, 3)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token63(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%14 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token63(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token51(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%15 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token51(Release, 3)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token80(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%16 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token80(Release, 3)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token64(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%17 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token64(Release, 3)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token62(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%18 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token62(Release, 3)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%19 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token42(Release, 3)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %467 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useToken @token92(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token92(Release, 2)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useToken @token78(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token78(Release, 2)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useToken @token48(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token48(Release, 2)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %468 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useToken @token55(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token55(Release, 2)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useToken @token24(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token24(Release, 2)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useToken @token95(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token95(Release, 2)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 2)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(0) {
      AIE.bp_dest<%365, DMA : 1>
      AIE.bp_dest<%390, DMA : 1>
      AIE.bp_dest<%415, DMA : 0>
      AIE.bp_dest<%440, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%372, DMA : 0>
      AIE.bp_dest<%397, DMA : 1>
      AIE.bp_dest<%422, DMA : 0>
      AIE.bp_dest<%447, DMA : 0>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%378, DMA : 1>
      AIE.bp_dest<%403, DMA : 1>
      AIE.bp_dest<%428, DMA : 1>
      AIE.bp_dest<%453, DMA : 1>
    }
    AIE.bp_id(3) {
      AIE.bp_dest<%384, DMA : 0>
      AIE.bp_dest<%409, DMA : 0>
      AIE.bp_dest<%434, DMA : 0>
      AIE.bp_dest<%459, DMA : 0>
    }
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%265, DMA : 1>
      AIE.bp_dest<%290, DMA : 1>
      AIE.bp_dest<%315, DMA : 1>
      AIE.bp_dest<%340, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%272, DMA : 1>
      AIE.bp_dest<%297, DMA : 1>
      AIE.bp_dest<%322, DMA : 1>
      AIE.bp_dest<%347, DMA : 1>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%278, DMA : 1>
      AIE.bp_dest<%303, DMA : 0>
      AIE.bp_dest<%328, DMA : 1>
      AIE.bp_dest<%353, DMA : 0>
    }
    AIE.bp_id(3) {
      AIE.bp_dest<%284, DMA : 0>
      AIE.bp_dest<%309, DMA : 0>
      AIE.bp_dest<%334, DMA : 0>
      AIE.bp_dest<%359, DMA : 0>
    }
  }
  %22 = AIE.tile(10, 0)
  %23 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %1) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %24 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%24, %2) {kind = 0 : i64, offsets = [96, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %25 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %26 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %27 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%27, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %28 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%28, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %29 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %30 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %31 = AIE.core(%22) {
    AIE.useToken @token93(Acquire, 0)
    AIE.useToken @token58(Acquire, 0)
    AIE.useToken @token56(Acquire, 0)
    AIE.useToken @token52(Acquire, 0)
    AIE.useToken @token47(Acquire, 0)
    AIE.useToken @token31(Acquire, 0)
    AIE.useToken @token27(Acquire, 0)
    AIE.useToken @token25(Acquire, 0)
    AIE.useToken @token25(Release, 1)
    AIE.useToken @token27(Release, 1)
    AIE.useToken @token31(Release, 1)
    AIE.useToken @token47(Release, 1)
    AIE.useToken @token52(Release, 1)
    AIE.useToken @token56(Release, 1)
    AIE.useToken @token58(Release, 1)
    AIE.useToken @token93(Release, 1)
    AIE.end
  }
  %32 = AIE.shimDMA(%22) {
    %465 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token93(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%29 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token93(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token58(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%27 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token58(Release, 2)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token56(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%25 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token56(Release, 2)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token27(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%23 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token27(Release, 2)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %466 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%30 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token52(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%28 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token52(Release, 2)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token25(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token25(Release, 2)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token47(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%24 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token47(Release, 2)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.broad_packet(%22, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%65, DMA : 1>
      AIE.bp_dest<%90, DMA : 1>
      AIE.bp_dest<%115, DMA : 1>
      AIE.bp_dest<%140, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%72, DMA : 1>
      AIE.bp_dest<%97, DMA : 1>
      AIE.bp_dest<%122, DMA : 1>
      AIE.bp_dest<%147, DMA : 1>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%78, DMA : 1>
      AIE.bp_dest<%103, DMA : 0>
      AIE.bp_dest<%128, DMA : 1>
      AIE.bp_dest<%153, DMA : 0>
    }
    AIE.bp_id(3) {
      AIE.bp_dest<%84, DMA : 0>
      AIE.bp_dest<%109, DMA : 0>
      AIE.bp_dest<%134, DMA : 1>
      AIE.bp_dest<%159, DMA : 0>
    }
  }
  AIE.broad_packet(%22, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%65, DMA : 0>
      AIE.bp_dest<%165, DMA : 0>
      AIE.bp_dest<%265, DMA : 0>
      AIE.bp_dest<%365, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%72, DMA : 0>
      AIE.bp_dest<%172, DMA : 1>
      AIE.bp_dest<%272, DMA : 0>
      AIE.bp_dest<%372, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%78, DMA : 0>
      AIE.bp_dest<%178, DMA : 1>
      AIE.bp_dest<%278, DMA : 0>
      AIE.bp_dest<%378, DMA : 0>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%84, DMA : 1>
      AIE.bp_dest<%184, DMA : 1>
      AIE.bp_dest<%284, DMA : 1>
      AIE.bp_dest<%384, DMA : 1>
    }
  }
  %33 = AIE.tile(18, 0)
  %34 = AIE.external_buffer 81920 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%34, %1) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %35 = AIE.external_buffer 86016 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %1) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %36 = AIE.external_buffer 90112 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %37 = AIE.external_buffer 94208 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%37, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %38 = AIE.external_buffer 98304 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%38, %2) {kind = 0 : i64, offsets = [96, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %39 = AIE.external_buffer 102400 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%39, %2) {kind = 0 : i64, offsets = [64, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %40 = AIE.external_buffer 106496 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%40, %2) {kind = 0 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %41 = AIE.external_buffer 110592 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%41, %2) {kind = 0 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %42 = AIE.external_buffer 180256 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %42) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %43 = AIE.external_buffer 184356 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %43) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %44 = AIE.external_buffer 188456 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %44) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %45 = AIE.external_buffer 192556 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %45) {kind = 2 : i64, offsets = [0, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %46 = AIE.external_buffer 196656 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %46) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %47 = AIE.external_buffer 200756 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %47) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %48 = AIE.external_buffer 204856 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %48) {kind = 2 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %49 = AIE.external_buffer 208956 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %49) {kind = 2 : i64, offsets = [32, 96], sizes = [32, 32], strides = [1, 1]} : (memref<128x128xf32>, memref<1025xf32>) -> ()
  %50 = AIE.core(%33) {
    AIE.useToken @token70(Acquire, 0)
    AIE.useToken @token60(Acquire, 0)
    AIE.useToken @token38(Acquire, 0)
    AIE.useToken @token33(Acquire, 0)
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token0(Acquire, 0)
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token5(Release, 1)
    AIE.useToken @token33(Release, 1)
    AIE.useToken @token38(Release, 1)
    AIE.useToken @token60(Release, 1)
    AIE.useToken @token70(Release, 1)
    AIE.end
  }
  %51 = AIE.shimDMA(%33) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token81(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%42 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token81(Release, 3)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token43(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%43 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token43(Release, 3)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%44 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token8(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token71(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%45 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token71(Release, 3)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token86(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%46 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token86(Release, 3)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token49(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%47 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token49(Release, 3)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%48 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token37(Release, 3)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%49 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token10(Release, 3)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %467 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 2)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useToken @token33(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token33(Release, 2)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useToken @token70(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token70(Release, 2)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useToken @token60(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%38 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token60(Release, 2)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %468 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useToken @token38(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%37 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token38(Release, 2)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%34 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  AIE.broad_packet(%33, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%140, DMA : 0>
      AIE.bp_dest<%240, DMA : 0>
      AIE.bp_dest<%340, DMA : 0>
      AIE.bp_dest<%440, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%147, DMA : 0>
      AIE.bp_dest<%247, DMA : 1>
      AIE.bp_dest<%347, DMA : 0>
      AIE.bp_dest<%447, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%153, DMA : 1>
      AIE.bp_dest<%253, DMA : 1>
      AIE.bp_dest<%353, DMA : 1>
      AIE.bp_dest<%453, DMA : 0>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%159, DMA : 1>
      AIE.bp_dest<%259, DMA : 1>
      AIE.bp_dest<%359, DMA : 1>
      AIE.bp_dest<%459, DMA : 1>
    }
  }
  AIE.broad_packet(%33, DMA : 1) {
    AIE.bp_id(0) {
      AIE.bp_dest<%165, DMA : 1>
      AIE.bp_dest<%190, DMA : 1>
      AIE.bp_dest<%215, DMA : 0>
      AIE.bp_dest<%240, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%172, DMA : 0>
      AIE.bp_dest<%197, DMA : 0>
      AIE.bp_dest<%222, DMA : 0>
      AIE.bp_dest<%247, DMA : 0>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%178, DMA : 0>
      AIE.bp_dest<%203, DMA : 0>
      AIE.bp_dest<%228, DMA : 0>
      AIE.bp_dest<%253, DMA : 0>
    }
    AIE.bp_id(3) {
      AIE.bp_dest<%184, DMA : 0>
      AIE.bp_dest<%209, DMA : 0>
      AIE.bp_dest<%234, DMA : 0>
      AIE.bp_dest<%259, DMA : 0>
    }
  }
  %52 = AIE.tile(11, 0)
  %53 = AIE.external_buffer 114688 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%53, %2) {kind = 0 : i64, offsets = [96, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %54 = AIE.external_buffer 118784 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%54, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %55 = AIE.external_buffer 122880 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%55, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %56 = AIE.external_buffer 126976 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%56, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %57 = AIE.external_buffer 131072 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%57, %2) {kind = 0 : i64, offsets = [96, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %58 = AIE.external_buffer 135168 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%58, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %59 = AIE.external_buffer 139264 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%59, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %60 = AIE.external_buffer 143360 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%60, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<128x128xf32>) -> ()
  %61 = AIE.core(%52) {
    AIE.useToken @token88(Acquire, 0)
    AIE.useToken @token85(Acquire, 0)
    AIE.useToken @token44(Acquire, 0)
    AIE.useToken @token32(Acquire, 0)
    AIE.useToken @token29(Acquire, 0)
    AIE.useToken @token22(Acquire, 0)
    AIE.useToken @token21(Acquire, 0)
    AIE.useToken @token15(Acquire, 0)
    AIE.useToken @token15(Release, 1)
    AIE.useToken @token21(Release, 1)
    AIE.useToken @token22(Release, 1)
    AIE.useToken @token29(Release, 1)
    AIE.useToken @token32(Release, 1)
    AIE.useToken @token44(Release, 1)
    AIE.useToken @token85(Release, 1)
    AIE.useToken @token88(Release, 1)
    AIE.end
  }
  %62 = AIE.shimDMA(%52) {
    %465 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%60 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 2)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token88(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token88(Release, 2)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 2)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %466 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useToken @token85(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token85(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 2)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 2)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useToken @token22(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token22(Release, 2)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.broad_packet(%52, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%90, DMA : 0>
      AIE.bp_dest<%190, DMA : 0>
      AIE.bp_dest<%290, DMA : 0>
      AIE.bp_dest<%390, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%97, DMA : 0>
      AIE.bp_dest<%197, DMA : 1>
      AIE.bp_dest<%297, DMA : 0>
      AIE.bp_dest<%397, DMA : 0>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%103, DMA : 1>
      AIE.bp_dest<%203, DMA : 1>
      AIE.bp_dest<%303, DMA : 1>
      AIE.bp_dest<%403, DMA : 0>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%109, DMA : 1>
      AIE.bp_dest<%209, DMA : 1>
      AIE.bp_dest<%309, DMA : 1>
      AIE.bp_dest<%409, DMA : 1>
    }
  }
  AIE.broad_packet(%52, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%115, DMA : 0>
      AIE.bp_dest<%215, DMA : 1>
      AIE.bp_dest<%315, DMA : 0>
      AIE.bp_dest<%415, DMA : 1>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%122, DMA : 0>
      AIE.bp_dest<%222, DMA : 1>
      AIE.bp_dest<%322, DMA : 0>
      AIE.bp_dest<%422, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%128, DMA : 0>
      AIE.bp_dest<%228, DMA : 1>
      AIE.bp_dest<%328, DMA : 0>
      AIE.bp_dest<%428, DMA : 0>
    }
    AIE.bp_id(7) {
      AIE.bp_dest<%134, DMA : 0>
      AIE.bp_dest<%234, DMA : 1>
      AIE.bp_dest<%334, DMA : 1>
      AIE.bp_dest<%434, DMA : 1>
    }
  }
  %63 = AIE.tile(0, 0)
  %64 = AIE.core(%63) {
    AIE.end
  }
  %65 = AIE.tile(10, 2)
  %66 = AIE.buffer(%65) : memref<32x32xf32>
  %67 = AIE.buffer(%65) : memref<32x32xf32>
  %68 = AIE.buffer(%65) : memref<32x32xf32>
  %69 = AIE.buffer(%65) : memref<32x32xf32>
  %70 = AIE.core(%65) {
    AIE.useToken @token93(Acquire, 3)
    AIE.useToken @token31(Acquire, 3)
    AIE.useToken @token9(Acquire, 0)
    call @extern_kernel(%69, %66, %67, %68) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 1)
    AIE.useToken @token31(Release, 4)
    AIE.useToken @token93(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %71 = AIE.mem(%65) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%68 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token93(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%67 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token93(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %72 = AIE.tile(10, 3)
  %73 = AIE.buffer(%72) : memref<32x32xf32>
  %74 = AIE.buffer(%72) : memref<32x32xf32>
  %75 = AIE.buffer(%72) : memref<32x32xf32>
  %76 = AIE.core(%72) {
    AIE.useToken @token65(Acquire, 0)
    AIE.useToken @token58(Acquire, 3)
    AIE.useToken @token52(Acquire, 3)
    AIE.useToken @token9(Acquire, 1)
    call @extern_kernel(%66, %73, %74, %75) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token9(Release, 2)
    AIE.useToken @token52(Release, 4)
    AIE.useToken @token58(Release, 4)
    AIE.useToken @token65(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %77 = AIE.mem(%72) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token52(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%75 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token52(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token58(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token58(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %78 = AIE.tile(10, 4)
  %79 = AIE.buffer(%78) : memref<32x32xf32>
  %80 = AIE.buffer(%78) : memref<32x32xf32>
  %81 = AIE.buffer(%78) : memref<32x32xf32>
  %82 = AIE.core(%78) {
    AIE.useToken @token65(Acquire, 1)
    AIE.useToken @token56(Acquire, 3)
    AIE.useToken @token25(Acquire, 3)
    AIE.useToken @token17(Acquire, 0)
    call @extern_kernel(%73, %79, %80, %81) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token17(Release, 1)
    AIE.useToken @token25(Release, 4)
    AIE.useToken @token56(Release, 4)
    AIE.useToken @token65(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %83 = AIE.mem(%78) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token25(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token25(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token56(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%80 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token56(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %84 = AIE.tile(10, 5) {polyaie.leaf}
  %85 = AIE.buffer(%84) : memref<32x32xf32>
  %86 = AIE.buffer(%84) : memref<32x32xf32>
  %87 = AIE.buffer(%84) : memref<32x32xf32>
  %88 = AIE.core(%84) {
    AIE.useToken @token81(Acquire, 0)
    AIE.useToken @token47(Acquire, 3)
    AIE.useToken @token27(Acquire, 3)
    AIE.useToken @token17(Acquire, 1)
    call @extern_kernel(%79, %85, %86, %87) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token17(Release, 2)
    AIE.useToken @token27(Release, 4)
    AIE.useToken @token47(Release, 4)
    AIE.useToken @token81(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %89 = AIE.mem(%84) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token27(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%86 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token27(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token47(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%87 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token47(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token81(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%85 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token81(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%84, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%33, DMA : 0>
    }
  }
  %90 = AIE.tile(11, 2)
  %91 = AIE.buffer(%90) : memref<32x32xf32>
  %92 = AIE.buffer(%90) : memref<32x32xf32>
  %93 = AIE.buffer(%90) : memref<32x32xf32>
  %94 = AIE.buffer(%90) : memref<32x32xf32>
  %95 = AIE.core(%90) {
    AIE.useToken @token93(Acquire, 5)
    AIE.useToken @token67(Acquire, 0)
    AIE.useToken @token32(Acquire, 3)
    call @extern_kernel(%94, %91, %92, %93) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token32(Release, 4)
    AIE.useToken @token67(Release, 1)
    AIE.useToken @token93(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %96 = AIE.mem(%90) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%93 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token93(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token93(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %97 = AIE.tile(11, 3)
  %98 = AIE.buffer(%97) : memref<32x32xf32>
  %99 = AIE.buffer(%97) : memref<32x32xf32>
  %100 = AIE.buffer(%97) : memref<32x32xf32>
  %101 = AIE.core(%97) {
    AIE.useToken @token73(Acquire, 0)
    AIE.useToken @token67(Acquire, 1)
    AIE.useToken @token58(Acquire, 5)
    AIE.useToken @token21(Acquire, 3)
    call @extern_kernel(%91, %98, %99, %100) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token21(Release, 4)
    AIE.useToken @token58(Release, 6)
    AIE.useToken @token67(Release, 2)
    AIE.useToken @token73(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %102 = AIE.mem(%97) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%100 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token58(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%99 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token58(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %103 = AIE.tile(11, 4)
  %104 = AIE.buffer(%103) : memref<32x32xf32>
  %105 = AIE.buffer(%103) : memref<32x32xf32>
  %106 = AIE.buffer(%103) : memref<32x32xf32>
  %107 = AIE.core(%103) {
    AIE.useToken @token88(Acquire, 3)
    AIE.useToken @token73(Acquire, 1)
    AIE.useToken @token56(Acquire, 5)
    AIE.useToken @token50(Acquire, 0)
    call @extern_kernel(%98, %104, %105, %106) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token50(Release, 1)
    AIE.useToken @token56(Release, 6)
    AIE.useToken @token73(Release, 2)
    AIE.useToken @token88(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %108 = AIE.mem(%103) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token56(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%105 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token56(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token88(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%106 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token88(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %109 = AIE.tile(11, 5) {polyaie.leaf}
  %110 = AIE.buffer(%109) : memref<32x32xf32>
  %111 = AIE.buffer(%109) : memref<32x32xf32>
  %112 = AIE.buffer(%109) : memref<32x32xf32>
  %113 = AIE.core(%109) {
    AIE.useToken @token50(Acquire, 1)
    AIE.useToken @token44(Acquire, 3)
    AIE.useToken @token43(Acquire, 0)
    AIE.useToken @token27(Acquire, 5)
    call @extern_kernel(%104, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token27(Release, 6)
    AIE.useToken @token43(Release, 1)
    AIE.useToken @token44(Release, 4)
    AIE.useToken @token50(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %114 = AIE.mem(%109) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token27(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token27(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token43(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%110 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token43(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%109, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%33, DMA : 0>
    }
  }
  %115 = AIE.tile(12, 2)
  %116 = AIE.buffer(%115) : memref<32x32xf32>
  %117 = AIE.buffer(%115) : memref<32x32xf32>
  %118 = AIE.buffer(%115) : memref<32x32xf32>
  %119 = AIE.buffer(%115) : memref<32x32xf32>
  %120 = AIE.core(%115) {
    AIE.useToken @token93(Acquire, 7)
    AIE.useToken @token85(Acquire, 3)
    AIE.useToken @token19(Acquire, 0)
    call @extern_kernel(%119, %116, %117, %118) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token19(Release, 1)
    AIE.useToken @token85(Release, 4)
    AIE.useToken @token93(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %121 = AIE.mem(%115) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token85(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%118 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token85(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token93(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%117 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token93(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %122 = AIE.tile(12, 3)
  %123 = AIE.buffer(%122) : memref<32x32xf32>
  %124 = AIE.buffer(%122) : memref<32x32xf32>
  %125 = AIE.buffer(%122) : memref<32x32xf32>
  %126 = AIE.core(%122) {
    AIE.useToken @token91(Acquire, 0)
    AIE.useToken @token58(Acquire, 7)
    AIE.useToken @token29(Acquire, 3)
    AIE.useToken @token19(Acquire, 1)
    call @extern_kernel(%116, %123, %124, %125) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token19(Release, 2)
    AIE.useToken @token29(Release, 4)
    AIE.useToken @token58(Release, 8)
    AIE.useToken @token91(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %127 = AIE.mem(%122) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%125 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token58(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%124 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token58(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %128 = AIE.tile(12, 4)
  %129 = AIE.buffer(%128) : memref<32x32xf32>
  %130 = AIE.buffer(%128) : memref<32x32xf32>
  %131 = AIE.buffer(%128) : memref<32x32xf32>
  %132 = AIE.core(%128) {
    AIE.useToken @token91(Acquire, 1)
    AIE.useToken @token56(Acquire, 7)
    AIE.useToken @token54(Acquire, 0)
    AIE.useToken @token15(Acquire, 3)
    call @extern_kernel(%123, %129, %130, %131) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token15(Release, 4)
    AIE.useToken @token54(Release, 1)
    AIE.useToken @token56(Release, 8)
    AIE.useToken @token91(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %133 = AIE.mem(%128) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token56(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%130 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token56(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %134 = AIE.tile(12, 5) {polyaie.leaf}
  %135 = AIE.buffer(%134) : memref<32x32xf32>
  %136 = AIE.buffer(%134) : memref<32x32xf32>
  %137 = AIE.buffer(%134) : memref<32x32xf32>
  %138 = AIE.core(%134) {
    AIE.useToken @token54(Acquire, 1)
    AIE.useToken @token27(Acquire, 7)
    AIE.useToken @token22(Acquire, 3)
    AIE.useToken @token8(Acquire, 0)
    call @extern_kernel(%129, %135, %136, %137) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token8(Release, 1)
    AIE.useToken @token22(Release, 4)
    AIE.useToken @token27(Release, 8)
    AIE.useToken @token54(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %139 = AIE.mem(%134) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token22(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%137 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token22(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token27(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%136 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token27(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%135 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%134, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%33, DMA : 0>
    }
  }
  %140 = AIE.tile(13, 2)
  %141 = AIE.buffer(%140) : memref<32x32xf32>
  %142 = AIE.buffer(%140) : memref<32x32xf32>
  %143 = AIE.buffer(%140) : memref<32x32xf32>
  %144 = AIE.buffer(%140) : memref<32x32xf32>
  %145 = AIE.core(%140) {
    AIE.useToken @token93(Acquire, 9)
    AIE.useToken @token83(Acquire, 0)
    AIE.useToken @token5(Acquire, 3)
    call @extern_kernel(%144, %141, %142, %143) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 4)
    AIE.useToken @token83(Release, 1)
    AIE.useToken @token93(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %146 = AIE.mem(%140) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%143 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token93(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%142 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token93(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %147 = AIE.tile(13, 3)
  %148 = AIE.buffer(%147) : memref<32x32xf32>
  %149 = AIE.buffer(%147) : memref<32x32xf32>
  %150 = AIE.buffer(%147) : memref<32x32xf32>
  %151 = AIE.core(%147) {
    AIE.useToken @token83(Acquire, 1)
    AIE.useToken @token58(Acquire, 9)
    AIE.useToken @token33(Acquire, 3)
    AIE.useToken @token12(Acquire, 0)
    call @extern_kernel(%141, %148, %149, %150) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token12(Release, 1)
    AIE.useToken @token33(Release, 4)
    AIE.useToken @token58(Release, 10)
    AIE.useToken @token83(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %152 = AIE.mem(%147) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token33(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%150 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token33(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token58(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%149 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token58(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %153 = AIE.tile(13, 4)
  %154 = AIE.buffer(%153) : memref<32x32xf32>
  %155 = AIE.buffer(%153) : memref<32x32xf32>
  %156 = AIE.buffer(%153) : memref<32x32xf32>
  %157 = AIE.core(%153) {
    AIE.useToken @token70(Acquire, 3)
    AIE.useToken @token56(Acquire, 9)
    AIE.useToken @token16(Acquire, 0)
    AIE.useToken @token12(Acquire, 1)
    call @extern_kernel(%148, %154, %155, %156) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token12(Release, 2)
    AIE.useToken @token16(Release, 1)
    AIE.useToken @token56(Release, 10)
    AIE.useToken @token70(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %158 = AIE.mem(%153) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token56(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%155 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token56(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token70(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%156 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token70(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %159 = AIE.tile(13, 5) {polyaie.leaf}
  %160 = AIE.buffer(%159) : memref<32x32xf32>
  %161 = AIE.buffer(%159) : memref<32x32xf32>
  %162 = AIE.buffer(%159) : memref<32x32xf32>
  %163 = AIE.core(%159) {
    AIE.useToken @token71(Acquire, 0)
    AIE.useToken @token60(Acquire, 3)
    AIE.useToken @token27(Acquire, 9)
    AIE.useToken @token16(Acquire, 1)
    call @extern_kernel(%154, %160, %161, %162) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token16(Release, 2)
    AIE.useToken @token27(Release, 10)
    AIE.useToken @token60(Release, 4)
    AIE.useToken @token71(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %164 = AIE.mem(%159) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token27(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%161 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token27(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token60(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%162 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token60(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token71(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%160 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token71(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%159, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%33, DMA : 0>
    }
  }
  %165 = AIE.tile(14, 2)
  %166 = AIE.buffer(%165) : memref<32x32xf32>
  %167 = AIE.buffer(%165) : memref<32x32xf32>
  %168 = AIE.buffer(%165) : memref<32x32xf32>
  %169 = AIE.buffer(%165) : memref<32x32xf32>
  %170 = AIE.core(%165) {
    AIE.useToken @token38(Acquire, 3)
    AIE.useToken @token31(Acquire, 5)
    AIE.useToken @token2(Acquire, 0)
    call @extern_kernel(%169, %166, %167, %168) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token31(Release, 6)
    AIE.useToken @token38(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %171 = AIE.mem(%165) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%168 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token38(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%167 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token38(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %172 = AIE.tile(14, 3)
  %173 = AIE.buffer(%172) : memref<32x32xf32>
  %174 = AIE.buffer(%172) : memref<32x32xf32>
  %175 = AIE.buffer(%172) : memref<32x32xf32>
  %176 = AIE.core(%172) {
    AIE.useToken @token52(Acquire, 5)
    AIE.useToken @token11(Acquire, 0)
    AIE.useToken @token2(Acquire, 1)
    AIE.useToken @token0(Acquire, 3)
    call @extern_kernel(%166, %173, %174, %175) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 4)
    AIE.useToken @token2(Release, 2)
    AIE.useToken @token11(Release, 1)
    AIE.useToken @token52(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %177 = AIE.mem(%172) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%174 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token52(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%175 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token52(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %178 = AIE.tile(14, 4)
  %179 = AIE.buffer(%178) : memref<32x32xf32>
  %180 = AIE.buffer(%178) : memref<32x32xf32>
  %181 = AIE.buffer(%178) : memref<32x32xf32>
  %182 = AIE.core(%178) {
    AIE.useToken @token75(Acquire, 0)
    AIE.useToken @token25(Acquire, 5)
    AIE.useToken @token11(Acquire, 1)
    AIE.useToken @token4(Acquire, 3)
    call @extern_kernel(%173, %179, %180, %181) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token4(Release, 4)
    AIE.useToken @token11(Release, 2)
    AIE.useToken @token25(Release, 6)
    AIE.useToken @token75(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %183 = AIE.mem(%178) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%180 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token25(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%181 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token25(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %184 = AIE.tile(14, 5) {polyaie.leaf}
  %185 = AIE.buffer(%184) : memref<32x32xf32>
  %186 = AIE.buffer(%184) : memref<32x32xf32>
  %187 = AIE.buffer(%184) : memref<32x32xf32>
  %188 = AIE.core(%184) {
    AIE.useToken @token86(Acquire, 0)
    AIE.useToken @token75(Acquire, 1)
    AIE.useToken @token47(Acquire, 5)
    AIE.useToken @token1(Acquire, 3)
    call @extern_kernel(%179, %185, %186, %187) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token47(Release, 6)
    AIE.useToken @token75(Release, 2)
    AIE.useToken @token86(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %189 = AIE.mem(%184) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token47(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%187 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token47(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token86(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%185 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token86(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%184, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%33, DMA : 1>
    }
  }
  %190 = AIE.tile(15, 2)
  %191 = AIE.buffer(%190) : memref<32x32xf32>
  %192 = AIE.buffer(%190) : memref<32x32xf32>
  %193 = AIE.buffer(%190) : memref<32x32xf32>
  %194 = AIE.buffer(%190) : memref<32x32xf32>
  %195 = AIE.core(%190) {
    AIE.useToken @token66(Acquire, 0)
    AIE.useToken @token38(Acquire, 5)
    AIE.useToken @token32(Acquire, 5)
    call @extern_kernel(%194, %191, %192, %193) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token32(Release, 6)
    AIE.useToken @token38(Release, 6)
    AIE.useToken @token66(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %196 = AIE.mem(%190) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%193 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token38(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%192 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token38(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %197 = AIE.tile(15, 3)
  %198 = AIE.buffer(%197) : memref<32x32xf32>
  %199 = AIE.buffer(%197) : memref<32x32xf32>
  %200 = AIE.buffer(%197) : memref<32x32xf32>
  %201 = AIE.core(%197) {
    AIE.useToken @token66(Acquire, 1)
    AIE.useToken @token35(Acquire, 0)
    AIE.useToken @token21(Acquire, 5)
    AIE.useToken @token0(Acquire, 5)
    call @extern_kernel(%191, %198, %199, %200) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 6)
    AIE.useToken @token21(Release, 6)
    AIE.useToken @token35(Release, 1)
    AIE.useToken @token66(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %202 = AIE.mem(%197) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%199 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%200 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %203 = AIE.tile(15, 4)
  %204 = AIE.buffer(%203) : memref<32x32xf32>
  %205 = AIE.buffer(%203) : memref<32x32xf32>
  %206 = AIE.buffer(%203) : memref<32x32xf32>
  %207 = AIE.core(%203) {
    AIE.useToken @token88(Acquire, 5)
    AIE.useToken @token72(Acquire, 0)
    AIE.useToken @token35(Acquire, 1)
    AIE.useToken @token4(Acquire, 5)
    call @extern_kernel(%198, %204, %205, %206) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token4(Release, 6)
    AIE.useToken @token35(Release, 2)
    AIE.useToken @token72(Release, 1)
    AIE.useToken @token88(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %208 = AIE.mem(%203) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%205 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token88(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%206 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token88(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %209 = AIE.tile(15, 5) {polyaie.leaf}
  %210 = AIE.buffer(%209) : memref<32x32xf32>
  %211 = AIE.buffer(%209) : memref<32x32xf32>
  %212 = AIE.buffer(%209) : memref<32x32xf32>
  %213 = AIE.core(%209) {
    AIE.useToken @token72(Acquire, 1)
    AIE.useToken @token49(Acquire, 0)
    AIE.useToken @token44(Acquire, 5)
    AIE.useToken @token1(Acquire, 5)
    call @extern_kernel(%204, %210, %211, %212) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 6)
    AIE.useToken @token44(Release, 6)
    AIE.useToken @token49(Release, 1)
    AIE.useToken @token72(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %214 = AIE.mem(%209) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%211 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%212 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token49(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%210 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token49(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%209, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%33, DMA : 1>
    }
  }
  %215 = AIE.tile(16, 2)
  %216 = AIE.buffer(%215) : memref<32x32xf32>
  %217 = AIE.buffer(%215) : memref<32x32xf32>
  %218 = AIE.buffer(%215) : memref<32x32xf32>
  %219 = AIE.buffer(%215) : memref<32x32xf32>
  %220 = AIE.core(%215) {
    AIE.useToken @token85(Acquire, 5)
    AIE.useToken @token69(Acquire, 0)
    AIE.useToken @token38(Acquire, 7)
    call @extern_kernel(%219, %216, %217, %218) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token38(Release, 8)
    AIE.useToken @token69(Release, 1)
    AIE.useToken @token85(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %221 = AIE.mem(%215) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token38(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%217 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token38(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token85(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%218 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token85(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %222 = AIE.tile(16, 3)
  %223 = AIE.buffer(%222) : memref<32x32xf32>
  %224 = AIE.buffer(%222) : memref<32x32xf32>
  %225 = AIE.buffer(%222) : memref<32x32xf32>
  %226 = AIE.core(%222) {
    AIE.useToken @token82(Acquire, 0)
    AIE.useToken @token69(Acquire, 1)
    AIE.useToken @token29(Acquire, 5)
    AIE.useToken @token0(Acquire, 7)
    call @extern_kernel(%216, %223, %224, %225) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 8)
    AIE.useToken @token29(Release, 6)
    AIE.useToken @token69(Release, 2)
    AIE.useToken @token82(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %227 = AIE.mem(%222) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%224 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%225 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %228 = AIE.tile(16, 4)
  %229 = AIE.buffer(%228) : memref<32x32xf32>
  %230 = AIE.buffer(%228) : memref<32x32xf32>
  %231 = AIE.buffer(%228) : memref<32x32xf32>
  %232 = AIE.core(%228) {
    AIE.useToken @token82(Acquire, 1)
    AIE.useToken @token79(Acquire, 0)
    AIE.useToken @token15(Acquire, 5)
    AIE.useToken @token4(Acquire, 7)
    call @extern_kernel(%223, %229, %230, %231) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token4(Release, 8)
    AIE.useToken @token15(Release, 6)
    AIE.useToken @token79(Release, 1)
    AIE.useToken @token82(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %233 = AIE.mem(%228) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%230 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%231 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %234 = AIE.tile(16, 5) {polyaie.leaf}
  %235 = AIE.buffer(%234) : memref<32x32xf32>
  %236 = AIE.buffer(%234) : memref<32x32xf32>
  %237 = AIE.buffer(%234) : memref<32x32xf32>
  %238 = AIE.core(%234) {
    AIE.useToken @token79(Acquire, 1)
    AIE.useToken @token37(Acquire, 0)
    AIE.useToken @token22(Acquire, 5)
    AIE.useToken @token1(Acquire, 7)
    call @extern_kernel(%229, %235, %236, %237) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 8)
    AIE.useToken @token22(Release, 6)
    AIE.useToken @token37(Release, 1)
    AIE.useToken @token79(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %239 = AIE.mem(%234) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%236 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token22(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%237 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token22(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token37(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%235 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token37(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%234, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%33, DMA : 1>
    }
  }
  %240 = AIE.tile(17, 2)
  %241 = AIE.buffer(%240) : memref<32x32xf32>
  %242 = AIE.buffer(%240) : memref<32x32xf32>
  %243 = AIE.buffer(%240) : memref<32x32xf32>
  %244 = AIE.buffer(%240) : memref<32x32xf32>
  %245 = AIE.core(%240) {
    AIE.useToken @token59(Acquire, 0)
    AIE.useToken @token38(Acquire, 9)
    AIE.useToken @token5(Acquire, 5)
    call @extern_kernel(%244, %241, %242, %243) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 6)
    AIE.useToken @token38(Release, 10)
    AIE.useToken @token59(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %246 = AIE.mem(%240) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%243 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token38(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%242 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token38(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %247 = AIE.tile(17, 3)
  %248 = AIE.buffer(%247) : memref<32x32xf32>
  %249 = AIE.buffer(%247) : memref<32x32xf32>
  %250 = AIE.buffer(%247) : memref<32x32xf32>
  %251 = AIE.core(%247) {
    AIE.useToken @token59(Acquire, 1)
    AIE.useToken @token40(Acquire, 0)
    AIE.useToken @token33(Acquire, 5)
    AIE.useToken @token0(Acquire, 9)
    call @extern_kernel(%241, %248, %249, %250) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 10)
    AIE.useToken @token33(Release, 6)
    AIE.useToken @token40(Release, 1)
    AIE.useToken @token59(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %252 = AIE.mem(%247) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%249 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token33(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%250 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token33(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %253 = AIE.tile(17, 4)
  %254 = AIE.buffer(%253) : memref<32x32xf32>
  %255 = AIE.buffer(%253) : memref<32x32xf32>
  %256 = AIE.buffer(%253) : memref<32x32xf32>
  %257 = AIE.core(%253) {
    AIE.useToken @token70(Acquire, 5)
    AIE.useToken @token40(Acquire, 1)
    AIE.useToken @token34(Acquire, 0)
    AIE.useToken @token4(Acquire, 9)
    call @extern_kernel(%248, %254, %255, %256) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token4(Release, 10)
    AIE.useToken @token34(Release, 1)
    AIE.useToken @token40(Release, 2)
    AIE.useToken @token70(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %258 = AIE.mem(%253) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%255 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token70(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%256 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token70(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %259 = AIE.tile(17, 5) {polyaie.leaf}
  %260 = AIE.buffer(%259) : memref<32x32xf32>
  %261 = AIE.buffer(%259) : memref<32x32xf32>
  %262 = AIE.buffer(%259) : memref<32x32xf32>
  %263 = AIE.core(%259) {
    AIE.useToken @token60(Acquire, 5)
    AIE.useToken @token34(Acquire, 1)
    AIE.useToken @token10(Acquire, 0)
    AIE.useToken @token1(Acquire, 9)
    call @extern_kernel(%254, %260, %261, %262) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 10)
    AIE.useToken @token10(Release, 1)
    AIE.useToken @token34(Release, 2)
    AIE.useToken @token60(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %264 = AIE.mem(%259) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%261 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token60(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%262 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token60(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%260 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%259, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%33, DMA : 1>
    }
  }
  %265 = AIE.tile(18, 2)
  %266 = AIE.buffer(%265) : memref<32x32xf32>
  %267 = AIE.buffer(%265) : memref<32x32xf32>
  %268 = AIE.buffer(%265) : memref<32x32xf32>
  %269 = AIE.buffer(%265) : memref<32x32xf32>
  %270 = AIE.core(%265) {
    AIE.useToken @token92(Acquire, 3)
    AIE.useToken @token57(Acquire, 0)
    AIE.useToken @token31(Acquire, 7)
    call @extern_kernel(%269, %266, %267, %268) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token31(Release, 8)
    AIE.useToken @token57(Release, 1)
    AIE.useToken @token92(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %271 = AIE.mem(%265) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%268 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token92(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%267 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token92(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %272 = AIE.tile(18, 3)
  %273 = AIE.buffer(%272) : memref<32x32xf32>
  %274 = AIE.buffer(%272) : memref<32x32xf32>
  %275 = AIE.buffer(%272) : memref<32x32xf32>
  %276 = AIE.core(%272) {
    AIE.useToken @token87(Acquire, 0)
    AIE.useToken @token78(Acquire, 3)
    AIE.useToken @token57(Acquire, 1)
    AIE.useToken @token52(Acquire, 7)
    call @extern_kernel(%266, %273, %274, %275) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token52(Release, 8)
    AIE.useToken @token57(Release, 2)
    AIE.useToken @token78(Release, 4)
    AIE.useToken @token87(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %277 = AIE.mem(%272) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token52(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%275 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token52(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token78(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%274 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token78(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %278 = AIE.tile(18, 4)
  %279 = AIE.buffer(%278) : memref<32x32xf32>
  %280 = AIE.buffer(%278) : memref<32x32xf32>
  %281 = AIE.buffer(%278) : memref<32x32xf32>
  %282 = AIE.core(%278) {
    AIE.useToken @token87(Acquire, 1)
    AIE.useToken @token48(Acquire, 3)
    AIE.useToken @token39(Acquire, 0)
    AIE.useToken @token25(Acquire, 7)
    call @extern_kernel(%273, %279, %280, %281) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token25(Release, 8)
    AIE.useToken @token39(Release, 1)
    AIE.useToken @token48(Release, 4)
    AIE.useToken @token87(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %283 = AIE.mem(%278) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token25(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%281 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token25(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token48(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%280 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token48(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %284 = AIE.tile(18, 5) {polyaie.leaf}
  %285 = AIE.buffer(%284) : memref<32x32xf32>
  %286 = AIE.buffer(%284) : memref<32x32xf32>
  %287 = AIE.buffer(%284) : memref<32x32xf32>
  %288 = AIE.core(%284) {
    AIE.useToken @token47(Acquire, 7)
    AIE.useToken @token39(Acquire, 1)
    AIE.useToken @token30(Acquire, 0)
    AIE.useToken @token3(Acquire, 3)
    call @extern_kernel(%279, %285, %286, %287) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 4)
    AIE.useToken @token30(Release, 1)
    AIE.useToken @token39(Release, 2)
    AIE.useToken @token47(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %289 = AIE.mem(%284) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%286 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token47(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%287 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token47(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token30(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%285 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token30(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%284, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %290 = AIE.tile(19, 2)
  %291 = AIE.buffer(%290) : memref<32x32xf32>
  %292 = AIE.buffer(%290) : memref<32x32xf32>
  %293 = AIE.buffer(%290) : memref<32x32xf32>
  %294 = AIE.buffer(%290) : memref<32x32xf32>
  %295 = AIE.core(%290) {
    AIE.useToken @token92(Acquire, 5)
    AIE.useToken @token32(Acquire, 7)
    AIE.useToken @token28(Acquire, 0)
    call @extern_kernel(%294, %291, %292, %293) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token28(Release, 1)
    AIE.useToken @token32(Release, 8)
    AIE.useToken @token92(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %296 = AIE.mem(%290) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%293 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token92(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%292 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token92(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %297 = AIE.tile(19, 3)
  %298 = AIE.buffer(%297) : memref<32x32xf32>
  %299 = AIE.buffer(%297) : memref<32x32xf32>
  %300 = AIE.buffer(%297) : memref<32x32xf32>
  %301 = AIE.core(%297) {
    AIE.useToken @token78(Acquire, 5)
    AIE.useToken @token28(Acquire, 1)
    AIE.useToken @token21(Acquire, 7)
    AIE.useToken @token13(Acquire, 0)
    call @extern_kernel(%291, %298, %299, %300) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token13(Release, 1)
    AIE.useToken @token21(Release, 8)
    AIE.useToken @token28(Release, 2)
    AIE.useToken @token78(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %302 = AIE.mem(%297) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%300 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token78(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%299 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token78(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %303 = AIE.tile(19, 4)
  %304 = AIE.buffer(%303) : memref<32x32xf32>
  %305 = AIE.buffer(%303) : memref<32x32xf32>
  %306 = AIE.buffer(%303) : memref<32x32xf32>
  %307 = AIE.core(%303) {
    AIE.useToken @token89(Acquire, 0)
    AIE.useToken @token88(Acquire, 7)
    AIE.useToken @token48(Acquire, 5)
    AIE.useToken @token13(Acquire, 1)
    call @extern_kernel(%298, %304, %305, %306) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token13(Release, 2)
    AIE.useToken @token48(Release, 6)
    AIE.useToken @token88(Release, 8)
    AIE.useToken @token89(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %308 = AIE.mem(%303) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token48(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%305 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token48(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token88(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%306 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token88(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %309 = AIE.tile(19, 5) {polyaie.leaf}
  %310 = AIE.buffer(%309) : memref<32x32xf32>
  %311 = AIE.buffer(%309) : memref<32x32xf32>
  %312 = AIE.buffer(%309) : memref<32x32xf32>
  %313 = AIE.core(%309) {
    AIE.useToken @token89(Acquire, 1)
    AIE.useToken @token53(Acquire, 0)
    AIE.useToken @token44(Acquire, 7)
    AIE.useToken @token3(Acquire, 5)
    call @extern_kernel(%304, %310, %311, %312) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 6)
    AIE.useToken @token44(Release, 8)
    AIE.useToken @token53(Release, 1)
    AIE.useToken @token89(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %314 = AIE.mem(%309) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%311 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%312 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token53(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%310 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token53(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%309, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %315 = AIE.tile(20, 2)
  %316 = AIE.buffer(%315) : memref<32x32xf32>
  %317 = AIE.buffer(%315) : memref<32x32xf32>
  %318 = AIE.buffer(%315) : memref<32x32xf32>
  %319 = AIE.buffer(%315) : memref<32x32xf32>
  %320 = AIE.core(%315) {
    AIE.useToken @token92(Acquire, 7)
    AIE.useToken @token85(Acquire, 7)
    AIE.useToken @token45(Acquire, 0)
    call @extern_kernel(%319, %316, %317, %318) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token45(Release, 1)
    AIE.useToken @token85(Release, 8)
    AIE.useToken @token92(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %321 = AIE.mem(%315) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token85(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%318 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token85(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token92(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%317 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token92(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %322 = AIE.tile(20, 3)
  %323 = AIE.buffer(%322) : memref<32x32xf32>
  %324 = AIE.buffer(%322) : memref<32x32xf32>
  %325 = AIE.buffer(%322) : memref<32x32xf32>
  %326 = AIE.core(%322) {
    AIE.useToken @token78(Acquire, 7)
    AIE.useToken @token76(Acquire, 0)
    AIE.useToken @token45(Acquire, 1)
    AIE.useToken @token29(Acquire, 7)
    call @extern_kernel(%316, %323, %324, %325) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token29(Release, 8)
    AIE.useToken @token45(Release, 2)
    AIE.useToken @token76(Release, 1)
    AIE.useToken @token78(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %327 = AIE.mem(%322) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%325 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token78(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%324 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token78(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %328 = AIE.tile(20, 4)
  %329 = AIE.buffer(%328) : memref<32x32xf32>
  %330 = AIE.buffer(%328) : memref<32x32xf32>
  %331 = AIE.buffer(%328) : memref<32x32xf32>
  %332 = AIE.core(%328) {
    AIE.useToken @token90(Acquire, 0)
    AIE.useToken @token76(Acquire, 1)
    AIE.useToken @token48(Acquire, 7)
    AIE.useToken @token15(Acquire, 7)
    call @extern_kernel(%323, %329, %330, %331) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token15(Release, 8)
    AIE.useToken @token48(Release, 8)
    AIE.useToken @token76(Release, 2)
    AIE.useToken @token90(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %333 = AIE.mem(%328) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%331 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token48(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%330 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token48(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %334 = AIE.tile(20, 5) {polyaie.leaf}
  %335 = AIE.buffer(%334) : memref<32x32xf32>
  %336 = AIE.buffer(%334) : memref<32x32xf32>
  %337 = AIE.buffer(%334) : memref<32x32xf32>
  %338 = AIE.core(%334) {
    AIE.useToken @token90(Acquire, 1)
    AIE.useToken @token63(Acquire, 0)
    AIE.useToken @token22(Acquire, 7)
    AIE.useToken @token3(Acquire, 7)
    call @extern_kernel(%329, %335, %336, %337) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 8)
    AIE.useToken @token22(Release, 8)
    AIE.useToken @token63(Release, 1)
    AIE.useToken @token90(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %339 = AIE.mem(%334) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%336 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token22(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%337 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token22(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token63(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%335 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token63(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%334, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %340 = AIE.tile(21, 2)
  %341 = AIE.buffer(%340) : memref<32x32xf32>
  %342 = AIE.buffer(%340) : memref<32x32xf32>
  %343 = AIE.buffer(%340) : memref<32x32xf32>
  %344 = AIE.buffer(%340) : memref<32x32xf32>
  %345 = AIE.core(%340) {
    AIE.useToken @token92(Acquire, 9)
    AIE.useToken @token20(Acquire, 0)
    AIE.useToken @token5(Acquire, 7)
    call @extern_kernel(%344, %341, %342, %343) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 8)
    AIE.useToken @token20(Release, 1)
    AIE.useToken @token92(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %346 = AIE.mem(%340) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%343 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token92(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%342 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token92(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %347 = AIE.tile(21, 3)
  %348 = AIE.buffer(%347) : memref<32x32xf32>
  %349 = AIE.buffer(%347) : memref<32x32xf32>
  %350 = AIE.buffer(%347) : memref<32x32xf32>
  %351 = AIE.core(%347) {
    AIE.useToken @token78(Acquire, 9)
    AIE.useToken @token74(Acquire, 0)
    AIE.useToken @token33(Acquire, 7)
    AIE.useToken @token20(Acquire, 1)
    call @extern_kernel(%341, %348, %349, %350) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token20(Release, 2)
    AIE.useToken @token33(Release, 8)
    AIE.useToken @token74(Release, 1)
    AIE.useToken @token78(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %352 = AIE.mem(%347) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token33(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%350 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token33(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token78(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%349 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token78(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %353 = AIE.tile(21, 4)
  %354 = AIE.buffer(%353) : memref<32x32xf32>
  %355 = AIE.buffer(%353) : memref<32x32xf32>
  %356 = AIE.buffer(%353) : memref<32x32xf32>
  %357 = AIE.core(%353) {
    AIE.useToken @token84(Acquire, 0)
    AIE.useToken @token74(Acquire, 1)
    AIE.useToken @token70(Acquire, 7)
    AIE.useToken @token48(Acquire, 9)
    call @extern_kernel(%348, %354, %355, %356) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token48(Release, 10)
    AIE.useToken @token70(Release, 8)
    AIE.useToken @token74(Release, 2)
    AIE.useToken @token84(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %358 = AIE.mem(%353) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token48(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%355 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token48(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token70(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%356 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token70(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %359 = AIE.tile(21, 5) {polyaie.leaf}
  %360 = AIE.buffer(%359) : memref<32x32xf32>
  %361 = AIE.buffer(%359) : memref<32x32xf32>
  %362 = AIE.buffer(%359) : memref<32x32xf32>
  %363 = AIE.core(%359) {
    AIE.useToken @token84(Acquire, 1)
    AIE.useToken @token60(Acquire, 7)
    AIE.useToken @token51(Acquire, 0)
    AIE.useToken @token3(Acquire, 9)
    call @extern_kernel(%354, %360, %361, %362) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 10)
    AIE.useToken @token51(Release, 1)
    AIE.useToken @token60(Release, 8)
    AIE.useToken @token84(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %364 = AIE.mem(%359) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%361 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token60(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%362 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token60(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token51(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%360 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token51(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%359, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%3, DMA : 0>
    }
  }
  %365 = AIE.tile(22, 2)
  %366 = AIE.buffer(%365) : memref<32x32xf32>
  %367 = AIE.buffer(%365) : memref<32x32xf32>
  %368 = AIE.buffer(%365) : memref<32x32xf32>
  %369 = AIE.buffer(%365) : memref<32x32xf32>
  %370 = AIE.core(%365) {
    AIE.useToken @token55(Acquire, 3)
    AIE.useToken @token41(Acquire, 0)
    AIE.useToken @token31(Acquire, 9)
    call @extern_kernel(%369, %366, %367, %368) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token31(Release, 10)
    AIE.useToken @token41(Release, 1)
    AIE.useToken @token55(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %371 = AIE.mem(%365) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token31(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%368 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token31(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token55(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%367 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token55(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %372 = AIE.tile(22, 3)
  %373 = AIE.buffer(%372) : memref<32x32xf32>
  %374 = AIE.buffer(%372) : memref<32x32xf32>
  %375 = AIE.buffer(%372) : memref<32x32xf32>
  %376 = AIE.core(%372) {
    AIE.useToken @token52(Acquire, 9)
    AIE.useToken @token41(Acquire, 1)
    AIE.useToken @token26(Acquire, 0)
    AIE.useToken @token24(Acquire, 3)
    call @extern_kernel(%366, %373, %374, %375) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token24(Release, 4)
    AIE.useToken @token26(Release, 1)
    AIE.useToken @token41(Release, 2)
    AIE.useToken @token52(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %377 = AIE.mem(%372) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token24(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%374 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token24(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token52(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%375 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token52(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %378 = AIE.tile(22, 4)
  %379 = AIE.buffer(%378) : memref<32x32xf32>
  %380 = AIE.buffer(%378) : memref<32x32xf32>
  %381 = AIE.buffer(%378) : memref<32x32xf32>
  %382 = AIE.core(%378) {
    AIE.useToken @token95(Acquire, 3)
    AIE.useToken @token26(Acquire, 1)
    AIE.useToken @token25(Acquire, 9)
    AIE.useToken @token23(Acquire, 0)
    call @extern_kernel(%373, %379, %380, %381) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token23(Release, 1)
    AIE.useToken @token25(Release, 10)
    AIE.useToken @token26(Release, 2)
    AIE.useToken @token95(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %383 = AIE.mem(%378) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token25(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%381 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token25(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token95(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%380 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token95(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %384 = AIE.tile(22, 5) {polyaie.leaf}
  %385 = AIE.buffer(%384) : memref<32x32xf32>
  %386 = AIE.buffer(%384) : memref<32x32xf32>
  %387 = AIE.buffer(%384) : memref<32x32xf32>
  %388 = AIE.core(%384) {
    AIE.useToken @token80(Acquire, 0)
    AIE.useToken @token47(Acquire, 9)
    AIE.useToken @token23(Acquire, 1)
    AIE.useToken @token14(Acquire, 3)
    call @extern_kernel(%379, %385, %386, %387) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token14(Release, 4)
    AIE.useToken @token23(Release, 2)
    AIE.useToken @token47(Release, 10)
    AIE.useToken @token80(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %389 = AIE.mem(%384) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%386 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token47(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%387 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token47(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token80(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%385 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token80(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%384, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %390 = AIE.tile(23, 2)
  %391 = AIE.buffer(%390) : memref<32x32xf32>
  %392 = AIE.buffer(%390) : memref<32x32xf32>
  %393 = AIE.buffer(%390) : memref<32x32xf32>
  %394 = AIE.buffer(%390) : memref<32x32xf32>
  %395 = AIE.core(%390) {
    AIE.useToken @token77(Acquire, 0)
    AIE.useToken @token55(Acquire, 5)
    AIE.useToken @token32(Acquire, 9)
    call @extern_kernel(%394, %391, %392, %393) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token32(Release, 10)
    AIE.useToken @token55(Release, 6)
    AIE.useToken @token77(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %396 = AIE.mem(%390) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token32(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%393 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token32(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token55(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%392 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token55(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %397 = AIE.tile(23, 3)
  %398 = AIE.buffer(%397) : memref<32x32xf32>
  %399 = AIE.buffer(%397) : memref<32x32xf32>
  %400 = AIE.buffer(%397) : memref<32x32xf32>
  %401 = AIE.core(%397) {
    AIE.useToken @token77(Acquire, 1)
    AIE.useToken @token24(Acquire, 5)
    AIE.useToken @token21(Acquire, 9)
    AIE.useToken @token7(Acquire, 0)
    call @extern_kernel(%391, %398, %399, %400) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token7(Release, 1)
    AIE.useToken @token21(Release, 10)
    AIE.useToken @token24(Release, 6)
    AIE.useToken @token77(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %402 = AIE.mem(%397) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token21(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%400 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token21(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token24(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%399 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token24(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %403 = AIE.tile(23, 4)
  %404 = AIE.buffer(%403) : memref<32x32xf32>
  %405 = AIE.buffer(%403) : memref<32x32xf32>
  %406 = AIE.buffer(%403) : memref<32x32xf32>
  %407 = AIE.core(%403) {
    AIE.useToken @token95(Acquire, 5)
    AIE.useToken @token88(Acquire, 9)
    AIE.useToken @token46(Acquire, 0)
    AIE.useToken @token7(Acquire, 1)
    call @extern_kernel(%398, %404, %405, %406) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token7(Release, 2)
    AIE.useToken @token46(Release, 1)
    AIE.useToken @token88(Release, 10)
    AIE.useToken @token95(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %408 = AIE.mem(%403) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token88(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%406 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token88(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token95(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%405 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token95(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %409 = AIE.tile(23, 5) {polyaie.leaf}
  %410 = AIE.buffer(%409) : memref<32x32xf32>
  %411 = AIE.buffer(%409) : memref<32x32xf32>
  %412 = AIE.buffer(%409) : memref<32x32xf32>
  %413 = AIE.core(%409) {
    AIE.useToken @token64(Acquire, 0)
    AIE.useToken @token46(Acquire, 1)
    AIE.useToken @token44(Acquire, 9)
    AIE.useToken @token14(Acquire, 5)
    call @extern_kernel(%404, %410, %411, %412) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token14(Release, 6)
    AIE.useToken @token44(Release, 10)
    AIE.useToken @token46(Release, 2)
    AIE.useToken @token64(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %414 = AIE.mem(%409) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%411 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token44(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%412 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token44(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token64(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%410 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token64(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%409, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %415 = AIE.tile(24, 2)
  %416 = AIE.buffer(%415) : memref<32x32xf32>
  %417 = AIE.buffer(%415) : memref<32x32xf32>
  %418 = AIE.buffer(%415) : memref<32x32xf32>
  %419 = AIE.buffer(%415) : memref<32x32xf32>
  %420 = AIE.core(%415) {
    AIE.useToken @token85(Acquire, 9)
    AIE.useToken @token55(Acquire, 7)
    AIE.useToken @token18(Acquire, 0)
    call @extern_kernel(%419, %416, %417, %418) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token18(Release, 1)
    AIE.useToken @token55(Release, 8)
    AIE.useToken @token85(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %421 = AIE.mem(%415) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token55(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%417 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token55(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token85(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%418 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token85(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %422 = AIE.tile(24, 3)
  %423 = AIE.buffer(%422) : memref<32x32xf32>
  %424 = AIE.buffer(%422) : memref<32x32xf32>
  %425 = AIE.buffer(%422) : memref<32x32xf32>
  %426 = AIE.core(%422) {
    AIE.useToken @token68(Acquire, 0)
    AIE.useToken @token29(Acquire, 9)
    AIE.useToken @token24(Acquire, 7)
    AIE.useToken @token18(Acquire, 1)
    call @extern_kernel(%416, %423, %424, %425) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token18(Release, 2)
    AIE.useToken @token24(Release, 8)
    AIE.useToken @token29(Release, 10)
    AIE.useToken @token68(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %427 = AIE.mem(%422) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token24(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%424 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token24(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token29(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%425 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token29(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %428 = AIE.tile(24, 4)
  %429 = AIE.buffer(%428) : memref<32x32xf32>
  %430 = AIE.buffer(%428) : memref<32x32xf32>
  %431 = AIE.buffer(%428) : memref<32x32xf32>
  %432 = AIE.core(%428) {
    AIE.useToken @token95(Acquire, 7)
    AIE.useToken @token94(Acquire, 0)
    AIE.useToken @token68(Acquire, 1)
    AIE.useToken @token15(Acquire, 9)
    call @extern_kernel(%423, %429, %430, %431) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token15(Release, 10)
    AIE.useToken @token68(Release, 2)
    AIE.useToken @token94(Release, 1)
    AIE.useToken @token95(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %433 = AIE.mem(%428) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%431 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token95(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%430 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token95(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %434 = AIE.tile(24, 5) {polyaie.leaf}
  %435 = AIE.buffer(%434) : memref<32x32xf32>
  %436 = AIE.buffer(%434) : memref<32x32xf32>
  %437 = AIE.buffer(%434) : memref<32x32xf32>
  %438 = AIE.core(%434) {
    AIE.useToken @token94(Acquire, 1)
    AIE.useToken @token62(Acquire, 0)
    AIE.useToken @token22(Acquire, 9)
    AIE.useToken @token14(Acquire, 7)
    call @extern_kernel(%429, %435, %436, %437) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token14(Release, 8)
    AIE.useToken @token22(Release, 10)
    AIE.useToken @token62(Release, 1)
    AIE.useToken @token94(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %439 = AIE.mem(%434) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%436 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token22(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%437 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token22(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token62(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%435 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token62(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%434, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
  %440 = AIE.tile(25, 2)
  %441 = AIE.buffer(%440) : memref<32x32xf32>
  %442 = AIE.buffer(%440) : memref<32x32xf32>
  %443 = AIE.buffer(%440) : memref<32x32xf32>
  %444 = AIE.buffer(%440) : memref<32x32xf32>
  %445 = AIE.core(%440) {
    AIE.useToken @token55(Acquire, 9)
    AIE.useToken @token36(Acquire, 0)
    AIE.useToken @token5(Acquire, 9)
    call @extern_kernel(%444, %441, %442, %443) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token5(Release, 10)
    AIE.useToken @token36(Release, 1)
    AIE.useToken @token55(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %446 = AIE.mem(%440) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%443 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token55(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%442 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token55(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %447 = AIE.tile(25, 3)
  %448 = AIE.buffer(%447) : memref<32x32xf32>
  %449 = AIE.buffer(%447) : memref<32x32xf32>
  %450 = AIE.buffer(%447) : memref<32x32xf32>
  %451 = AIE.core(%447) {
    AIE.useToken @token61(Acquire, 0)
    AIE.useToken @token36(Acquire, 1)
    AIE.useToken @token33(Acquire, 9)
    AIE.useToken @token24(Acquire, 9)
    call @extern_kernel(%441, %448, %449, %450) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token24(Release, 10)
    AIE.useToken @token33(Release, 10)
    AIE.useToken @token36(Release, 2)
    AIE.useToken @token61(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %452 = AIE.mem(%447) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token24(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%449 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token24(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token33(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%450 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token33(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %453 = AIE.tile(25, 4)
  %454 = AIE.buffer(%453) : memref<32x32xf32>
  %455 = AIE.buffer(%453) : memref<32x32xf32>
  %456 = AIE.buffer(%453) : memref<32x32xf32>
  %457 = AIE.core(%453) {
    AIE.useToken @token95(Acquire, 9)
    AIE.useToken @token70(Acquire, 9)
    AIE.useToken @token61(Acquire, 1)
    AIE.useToken @token6(Acquire, 0)
    call @extern_kernel(%448, %454, %455, %456) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 1)
    AIE.useToken @token61(Release, 2)
    AIE.useToken @token70(Release, 10)
    AIE.useToken @token95(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %458 = AIE.mem(%453) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token70(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%456 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token70(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token95(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%455 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token95(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %459 = AIE.tile(25, 5) {polyaie.leaf}
  %460 = AIE.buffer(%459) : memref<32x32xf32>
  %461 = AIE.buffer(%459) : memref<32x32xf32>
  %462 = AIE.buffer(%459) : memref<32x32xf32>
  %463 = AIE.core(%459) {
    AIE.useToken @token60(Acquire, 9)
    AIE.useToken @token42(Acquire, 0)
    AIE.useToken @token14(Acquire, 9)
    AIE.useToken @token6(Acquire, 1)
    call @extern_kernel(%454, %460, %461, %462) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token6(Release, 2)
    AIE.useToken @token14(Release, 10)
    AIE.useToken @token42(Release, 1)
    AIE.useToken @token60(Release, 10)
    AIE.end
  } {link_with = "kernel.o"}
  %464 = AIE.mem(%459) {
    %465 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%461 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 9)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %466 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token60(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%462 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token60(Release, 9)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %467 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token42(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%460 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token42(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%459, DMA : 0) {
    AIE.bp_id(3) {
      AIE.bp_dest<%3, DMA : 1>
    }
  }
}


module @gemm {
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
  %0 = memref.alloc() : memref<32x96xf32>
  %1 = memref.alloc() : memref<32x96xf32>
  %2 = memref.alloc() : memref<96x96xf32>
  %3 = AIE.tile(10, 0)
  %4 = AIE.lock(%3, 5)
  %5 = AIE.lock(%3, 4)
  %6 = AIE.lock(%3, 3)
  %7 = AIE.lock(%3, 2)
  %8 = AIE.lock(%3, 1)
  %9 = AIE.lock(%3, 0)
  %10 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %11 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %12 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %13 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %14 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %15 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %16 = AIE.core(%3) {
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%4, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%5, Release, 1)
    AIE.end
  }
  %17 = AIE.shimDMA(%3) {
    %122 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %123 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%56, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%47, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%38, DMA : 0>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%56, DMA : 1>
    AIE.packet_dest<%84, DMA : 0>
    AIE.packet_dest<%112, DMA : 1>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%47, DMA : 0>
    AIE.packet_dest<%75, DMA : 0>
    AIE.packet_dest<%103, DMA : 0>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%38, DMA : 1>
    AIE.packet_dest<%66, DMA : 1>
    AIE.packet_dest<%94, DMA : 1>
  }
  %18 = AIE.tile(11, 0)
  %19 = AIE.lock(%18, 5)
  %20 = AIE.lock(%18, 4)
  %21 = AIE.lock(%18, 3)
  %22 = AIE.lock(%18, 2)
  %23 = AIE.lock(%18, 1)
  %24 = AIE.lock(%18, 0)
  %25 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%25, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %26 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%26, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %27 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%27, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %28 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%28, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %29 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%29, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %30 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%30, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %31 = AIE.external_buffer 65536 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %31) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %32 = AIE.external_buffer 73728 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %32) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %33 = AIE.external_buffer 81920 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %33) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %34 = AIE.core(%18) {
    AIE.useLock(%20, Acquire, 0)
    AIE.useLock(%23, Acquire, 0)
    AIE.useLock(%21, Acquire, 0)
    AIE.useLock(%19, Acquire, 0)
    AIE.useLock(%24, Acquire, 0)
    AIE.useLock(%22, Acquire, 0)
    AIE.useLock(%22, Release, 1)
    AIE.useLock(%24, Release, 1)
    AIE.useLock(%19, Release, 1)
    AIE.useLock(%21, Release, 1)
    AIE.useLock(%23, Release, 1)
    AIE.useLock(%20, Release, 1)
    AIE.end
  }
  %35 = AIE.shimDMA(%18) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%31 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%32 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%33 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %123 = AIE.dmaStart(MM2S0, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%22, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%30 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%22, Release, 0)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%20, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%29 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%20, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%23, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%28 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%23, Release, 0)
    br ^bb5
  ^bb8:  // pred: ^bb4
    %124 = AIE.dmaStart(MM2S1, ^bb9, ^bb12)
  ^bb9:  // 2 preds: ^bb8, ^bb11
    AIE.useLock(%21, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%27 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%21, Release, 0)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useLock(%19, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%26 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%19, Release, 0)
    br ^bb11
  ^bb11:  // pred: ^bb10
    AIE.useLock(%24, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%25 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%24, Release, 0)
    br ^bb9
  ^bb12:  // pred: ^bb8
    AIE.end
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%18, DMA : 1>
    AIE.packet_dest<%112, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%18, DMA : 1>
    AIE.packet_dest<%103, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%18, DMA : 1>
    AIE.packet_dest<%94, DMA : 0>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%18, DMA : 0>
    AIE.packet_dest<%84, DMA : 1>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%18, DMA : 0>
    AIE.packet_dest<%75, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%18, DMA : 0>
    AIE.packet_dest<%66, DMA : 0>
  }
  %36 = AIE.tile(0, 0)
  %37 = AIE.core(%36) {
    AIE.end
  }
  %38 = AIE.tile(10, 2)
  %39 = AIE.lock(%38, 1)
  %40 = AIE.lock(%38, 0)
  %41 = AIE.buffer(%38) : memref<32x32xf32>
  %42 = AIE.buffer(%38) : memref<32x32xf32>
  %43 = AIE.buffer(%38) : memref<32x32xf32>
  %44 = AIE.buffer(%38) : memref<32x32xf32>
  %45 = AIE.core(%38) {
    AIE.useLock(%40, Acquire, 1)
    AIE.useLock(%39, Acquire, 1)
    AIE.useLock(%48, Acquire, 0)
    call @extern_kernel(%44, %41, %42, %43) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%48, Release, 1)
    AIE.useLock(%39, Release, 0)
    AIE.useLock(%40, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %46 = AIE.mem(%38) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%39, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%43 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%39, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%40, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%40, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %47 = AIE.tile(10, 3)
  %48 = AIE.lock(%47, 2)
  %49 = AIE.lock(%47, 1)
  %50 = AIE.lock(%47, 0)
  %51 = AIE.buffer(%47) : memref<32x32xf32>
  %52 = AIE.buffer(%47) : memref<32x32xf32>
  %53 = AIE.buffer(%47) : memref<32x32xf32>
  %54 = AIE.core(%47) {
    AIE.useLock(%50, Acquire, 1)
    AIE.useLock(%57, Acquire, 0)
    AIE.useLock(%48, Acquire, 1)
    AIE.useLock(%49, Acquire, 1)
    call @extern_kernel(%41, %51, %52, %53) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%49, Release, 0)
    AIE.useLock(%48, Release, 0)
    AIE.useLock(%57, Release, 1)
    AIE.useLock(%50, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %55 = AIE.mem(%47) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%49, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%52 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%49, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%50, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%53 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %56 = AIE.tile(10, 4) {polyaie.leaf}
  %57 = AIE.lock(%56, 3)
  %58 = AIE.lock(%56, 2)
  %59 = AIE.lock(%56, 1)
  %60 = AIE.lock(%56, 0)
  %61 = AIE.buffer(%56) : memref<32x32xf32>
  %62 = AIE.buffer(%56) : memref<32x32xf32>
  %63 = AIE.buffer(%56) : memref<32x32xf32>
  %64 = AIE.core(%56) {
    AIE.useLock(%57, Acquire, 1)
    AIE.useLock(%58, Acquire, 1)
    AIE.useLock(%59, Acquire, 1)
    AIE.useLock(%60, Acquire, 0)
    call @extern_kernel(%51, %61, %62, %63) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%60, Release, 1)
    AIE.useLock(%59, Release, 0)
    AIE.useLock(%58, Release, 0)
    AIE.useLock(%57, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %65 = AIE.mem(%56) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%59, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%59, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%58, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%58, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %124 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%60, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%61 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%56, DMA : 0>
    AIE.packet_dest<%18, DMA : 0>
  }
  %66 = AIE.tile(11, 2)
  %67 = AIE.lock(%66, 1)
  %68 = AIE.lock(%66, 0)
  %69 = AIE.buffer(%66) : memref<32x32xf32>
  %70 = AIE.buffer(%66) : memref<32x32xf32>
  %71 = AIE.buffer(%66) : memref<32x32xf32>
  %72 = AIE.buffer(%66) : memref<32x32xf32>
  %73 = AIE.core(%66) {
    AIE.useLock(%67, Acquire, 1)
    AIE.useLock(%77, Acquire, 0)
    AIE.useLock(%68, Acquire, 1)
    call @extern_kernel(%72, %69, %70, %71) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%68, Release, 0)
    AIE.useLock(%77, Release, 1)
    AIE.useLock(%67, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %74 = AIE.mem(%66) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%68, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%71 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%68, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%67, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%70 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%67, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %75 = AIE.tile(11, 3)
  %76 = AIE.lock(%75, 2)
  %77 = AIE.lock(%75, 1)
  %78 = AIE.lock(%75, 0)
  %79 = AIE.buffer(%75) : memref<32x32xf32>
  %80 = AIE.buffer(%75) : memref<32x32xf32>
  %81 = AIE.buffer(%75) : memref<32x32xf32>
  %82 = AIE.core(%75) {
    AIE.useLock(%77, Acquire, 1)
    AIE.useLock(%76, Acquire, 1)
    AIE.useLock(%85, Acquire, 0)
    AIE.useLock(%78, Acquire, 1)
    call @extern_kernel(%69, %79, %80, %81) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%78, Release, 0)
    AIE.useLock(%85, Release, 1)
    AIE.useLock(%76, Release, 0)
    AIE.useLock(%77, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %83 = AIE.mem(%75) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%78, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%80 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%78, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%76, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%76, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %84 = AIE.tile(11, 4) {polyaie.leaf}
  %85 = AIE.lock(%84, 3)
  %86 = AIE.lock(%84, 2)
  %87 = AIE.lock(%84, 1)
  %88 = AIE.lock(%84, 0)
  %89 = AIE.buffer(%84) : memref<32x32xf32>
  %90 = AIE.buffer(%84) : memref<32x32xf32>
  %91 = AIE.buffer(%84) : memref<32x32xf32>
  %92 = AIE.core(%84) {
    AIE.useLock(%87, Acquire, 1)
    AIE.useLock(%85, Acquire, 1)
    AIE.useLock(%86, Acquire, 1)
    AIE.useLock(%88, Acquire, 0)
    call @extern_kernel(%79, %89, %90, %91) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%88, Release, 1)
    AIE.useLock(%86, Release, 0)
    AIE.useLock(%85, Release, 0)
    AIE.useLock(%87, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %93 = AIE.mem(%84) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%86, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%90 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%86, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%87, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%91 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%87, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %124 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%88, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%89 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%88, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%84, DMA : 0>
    AIE.packet_dest<%18, DMA : 0>
  }
  %94 = AIE.tile(12, 2)
  %95 = AIE.lock(%94, 1)
  %96 = AIE.lock(%94, 0)
  %97 = AIE.buffer(%94) : memref<32x32xf32>
  %98 = AIE.buffer(%94) : memref<32x32xf32>
  %99 = AIE.buffer(%94) : memref<32x32xf32>
  %100 = AIE.buffer(%94) : memref<32x32xf32>
  %101 = AIE.core(%94) {
    AIE.useLock(%95, Acquire, 1)
    AIE.useLock(%96, Acquire, 1)
    AIE.useLock(%106, Acquire, 0)
    call @extern_kernel(%100, %97, %98, %99) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%106, Release, 1)
    AIE.useLock(%96, Release, 0)
    AIE.useLock(%95, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %102 = AIE.mem(%94) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%96, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%99 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%96, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%95, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%98 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%95, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %103 = AIE.tile(12, 3)
  %104 = AIE.lock(%103, 2)
  %105 = AIE.lock(%103, 1)
  %106 = AIE.lock(%103, 0)
  %107 = AIE.buffer(%103) : memref<32x32xf32>
  %108 = AIE.buffer(%103) : memref<32x32xf32>
  %109 = AIE.buffer(%103) : memref<32x32xf32>
  %110 = AIE.core(%103) {
    AIE.useLock(%113, Acquire, 0)
    AIE.useLock(%104, Acquire, 1)
    AIE.useLock(%105, Acquire, 1)
    AIE.useLock(%106, Acquire, 1)
    call @extern_kernel(%97, %107, %108, %109) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%106, Release, 0)
    AIE.useLock(%105, Release, 0)
    AIE.useLock(%104, Release, 0)
    AIE.useLock(%113, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %111 = AIE.mem(%103) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%105, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%108 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%105, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%104, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%109 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%104, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %112 = AIE.tile(12, 4) {polyaie.leaf}
  %113 = AIE.lock(%112, 3)
  %114 = AIE.lock(%112, 2)
  %115 = AIE.lock(%112, 1)
  %116 = AIE.lock(%112, 0)
  %117 = AIE.buffer(%112) : memref<32x32xf32>
  %118 = AIE.buffer(%112) : memref<32x32xf32>
  %119 = AIE.buffer(%112) : memref<32x32xf32>
  %120 = AIE.core(%112) {
    AIE.useLock(%113, Acquire, 1)
    AIE.useLock(%114, Acquire, 1)
    AIE.useLock(%116, Acquire, 1)
    AIE.useLock(%115, Acquire, 0)
    call @extern_kernel(%107, %117, %118, %119) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%115, Release, 1)
    AIE.useLock(%116, Release, 0)
    AIE.useLock(%114, Release, 0)
    AIE.useLock(%113, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %121 = AIE.mem(%112) {
    %122 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%116, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%119 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%116, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %123 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%114, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%118 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%114, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %124 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%115, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%117 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%115, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%112, DMA : 0>
    AIE.packet_dest<%18, DMA : 0>
  }
}


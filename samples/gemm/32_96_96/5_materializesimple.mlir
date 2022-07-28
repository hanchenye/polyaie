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
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %2) {kind = 0 : i64, offsets = [64, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %6 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%6, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %7 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%7, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %8 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x96xf32>) -> ()
  %9 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %10 = AIE.core(%3) {
    AIE.useToken @token20(Acquire, 0)
    AIE.useToken @token18(Acquire, 0)
    AIE.useToken @token15(Acquire, 0)
    AIE.useToken @token9(Acquire, 0)
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token5(Release, 1)
    AIE.useToken @token9(Release, 1)
    AIE.useToken @token15(Release, 1)
    AIE.useToken @token18(Release, 1)
    AIE.useToken @token20(Release, 1)
    AIE.end
  }
  %11 = AIE.shimDMA(%3) {
    %83 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token20(Release, 2)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 2)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %84 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 2)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%7 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 2)
    br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%3, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%26, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%33, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%39, DMA : 0>
    }
  }
  AIE.broad_packet(%3, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%26, DMA : 1>
      AIE.bp_dest<%45, DMA : 1>
      AIE.bp_dest<%64, DMA : 1>
    }
    AIE.bp_id(1) {
      AIE.bp_dest<%33, DMA : 0>
      AIE.bp_dest<%52, DMA : 0>
      AIE.bp_dest<%71, DMA : 0>
    }
    AIE.bp_id(2) {
      AIE.bp_dest<%39, DMA : 1>
      AIE.bp_dest<%58, DMA : 0>
      AIE.bp_dest<%77, DMA : 1>
    }
  }
  %12 = AIE.tile(11, 0)
  %13 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%13, %2) {kind = 0 : i64, offsets = [64, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %14 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%14, %2) {kind = 0 : i64, offsets = [32, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %15 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %16 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %2) {kind = 0 : i64, offsets = [64, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %17 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%17, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %18 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%18, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<96x96xf32>) -> ()
  %19 = AIE.external_buffer 65536 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %19) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %20 = AIE.external_buffer 73728 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %20) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %21 = AIE.external_buffer 81920 : memref<1025xf32>
  "dataflow.runtime.host_dma"(%0, %21) {kind = 2 : i64, offsets = [0, 64], sizes = [32, 32], strides = [1, 1]} : (memref<32x96xf32>, memref<1025xf32>) -> ()
  %22 = AIE.core(%12) {
    AIE.useToken @token14(Acquire, 0)
    AIE.useToken @token13(Acquire, 0)
    AIE.useToken @token10(Acquire, 0)
    AIE.useToken @token7(Acquire, 0)
    AIE.useToken @token6(Acquire, 0)
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token6(Release, 1)
    AIE.useToken @token7(Release, 1)
    AIE.useToken @token10(Release, 1)
    AIE.useToken @token13(Release, 1)
    AIE.useToken @token14(Release, 1)
    AIE.end
  }
  %23 = AIE.shimDMA(%12) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%19 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%20 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token8(Release, 3)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%21 : memref<1025xf32>, 0, 1025>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb4:  // pred: ^bb0
    %84 = AIE.dmaStart(MM2S0, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 2)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 2)
    br ^bb5
  ^bb8:  // pred: ^bb4
    %85 = AIE.dmaStart(MM2S1, ^bb9, ^bb12)
  ^bb9:  // 2 preds: ^bb8, ^bb11
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 2)
    br ^bb10
  ^bb10:  // pred: ^bb9
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 2)
    br ^bb11
  ^bb11:  // pred: ^bb10
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 2)
    br ^bb9
  ^bb12:  // pred: ^bb8
    AIE.end
  }
  AIE.broad_packet(%12, DMA : 1) {
    AIE.bp_id(4) {
      AIE.bp_dest<%64, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%71, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%77, DMA : 0>
    }
  }
  AIE.broad_packet(%12, DMA : 0) {
    AIE.bp_id(4) {
      AIE.bp_dest<%45, DMA : 0>
    }
    AIE.bp_id(5) {
      AIE.bp_dest<%52, DMA : 1>
    }
    AIE.bp_id(6) {
      AIE.bp_dest<%58, DMA : 1>
    }
  }
  %24 = AIE.tile(0, 0)
  %25 = AIE.core(%24) {
    AIE.end
  }
  %26 = AIE.tile(10, 2)
  %27 = AIE.buffer(%26) : memref<32x32xf32>
  %28 = AIE.buffer(%26) : memref<32x32xf32>
  %29 = AIE.buffer(%26) : memref<32x32xf32>
  %30 = AIE.buffer(%26) : memref<32x32xf32>
  %31 = AIE.core(%26) {
    AIE.useToken @token20(Acquire, 3)
    AIE.useToken @token15(Acquire, 3)
    AIE.useToken @token11(Acquire, 0)
    call @extern_kernel(%30, %27, %28, %29) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token11(Release, 1)
    AIE.useToken @token15(Release, 4)
    AIE.useToken @token20(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %32 = AIE.mem(%26) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%29 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%28 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token20(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %33 = AIE.tile(10, 3)
  %34 = AIE.buffer(%33) : memref<32x32xf32>
  %35 = AIE.buffer(%33) : memref<32x32xf32>
  %36 = AIE.buffer(%33) : memref<32x32xf32>
  %37 = AIE.core(%33) {
    AIE.useToken @token18(Acquire, 3)
    AIE.useToken @token16(Acquire, 0)
    AIE.useToken @token11(Acquire, 1)
    AIE.useToken @token4(Acquire, 3)
    call @extern_kernel(%27, %34, %35, %36) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token4(Release, 4)
    AIE.useToken @token11(Release, 2)
    AIE.useToken @token16(Release, 1)
    AIE.useToken @token18(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %38 = AIE.mem(%33) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %39 = AIE.tile(10, 4) {polyaie.leaf}
  %40 = AIE.buffer(%39) : memref<32x32xf32>
  %41 = AIE.buffer(%39) : memref<32x32xf32>
  %42 = AIE.buffer(%39) : memref<32x32xf32>
  %43 = AIE.core(%39) {
    AIE.useToken @token16(Acquire, 1)
    AIE.useToken @token9(Acquire, 3)
    AIE.useToken @token5(Acquire, 3)
    AIE.useToken @token1(Acquire, 0)
    call @extern_kernel(%34, %40, %41, %42) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token5(Release, 4)
    AIE.useToken @token9(Release, 4)
    AIE.useToken @token16(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %44 = AIE.mem(%39) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %85 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%39, DMA : 0) {
    AIE.bp_id(0) {
      AIE.bp_dest<%12, DMA : 0>
    }
  }
  %45 = AIE.tile(11, 2)
  %46 = AIE.buffer(%45) : memref<32x32xf32>
  %47 = AIE.buffer(%45) : memref<32x32xf32>
  %48 = AIE.buffer(%45) : memref<32x32xf32>
  %49 = AIE.buffer(%45) : memref<32x32xf32>
  %50 = AIE.core(%45) {
    AIE.useToken @token20(Acquire, 5)
    AIE.useToken @token19(Acquire, 0)
    AIE.useToken @token3(Acquire, 3)
    call @extern_kernel(%49, %46, %47, %48) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token3(Release, 4)
    AIE.useToken @token19(Release, 1)
    AIE.useToken @token20(Release, 6)
    AIE.end
  } {link_with = "kernel.o"}
  %51 = AIE.mem(%45) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%47 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token20(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %52 = AIE.tile(11, 3)
  %53 = AIE.buffer(%52) : memref<32x32xf32>
  %54 = AIE.buffer(%52) : memref<32x32xf32>
  %55 = AIE.buffer(%52) : memref<32x32xf32>
  %56 = AIE.core(%52) {
    AIE.useToken @token19(Acquire, 1)
    AIE.useToken @token14(Acquire, 3)
    AIE.useToken @token12(Acquire, 0)
    AIE.useToken @token4(Acquire, 5)
    call @extern_kernel(%46, %53, %54, %55) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token4(Release, 6)
    AIE.useToken @token12(Release, 1)
    AIE.useToken @token14(Release, 4)
    AIE.useToken @token19(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %57 = AIE.mem(%52) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%54 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token14(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token14(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %58 = AIE.tile(11, 4) {polyaie.leaf}
  %59 = AIE.buffer(%58) : memref<32x32xf32>
  %60 = AIE.buffer(%58) : memref<32x32xf32>
  %61 = AIE.buffer(%58) : memref<32x32xf32>
  %62 = AIE.core(%58) {
    AIE.useToken @token13(Acquire, 3)
    AIE.useToken @token12(Acquire, 1)
    AIE.useToken @token9(Acquire, 5)
    AIE.useToken @token8(Acquire, 0)
    call @extern_kernel(%53, %59, %60, %61) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token8(Release, 1)
    AIE.useToken @token9(Release, 6)
    AIE.useToken @token12(Release, 2)
    AIE.useToken @token13(Release, 4)
    AIE.end
  } {link_with = "kernel.o"}
  %63 = AIE.mem(%58) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%60 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%61 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %85 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%58, DMA : 0) {
    AIE.bp_id(1) {
      AIE.bp_dest<%12, DMA : 0>
    }
  }
  %64 = AIE.tile(12, 2)
  %65 = AIE.buffer(%64) : memref<32x32xf32>
  %66 = AIE.buffer(%64) : memref<32x32xf32>
  %67 = AIE.buffer(%64) : memref<32x32xf32>
  %68 = AIE.buffer(%64) : memref<32x32xf32>
  %69 = AIE.core(%64) {
    AIE.useToken @token20(Acquire, 7)
    AIE.useToken @token10(Acquire, 3)
    AIE.useToken @token2(Acquire, 0)
    call @extern_kernel(%68, %65, %66, %67) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token10(Release, 4)
    AIE.useToken @token20(Release, 8)
    AIE.end
  } {link_with = "kernel.o"}
  %70 = AIE.mem(%64) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token10(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%67 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token10(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token20(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%66 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token20(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %71 = AIE.tile(12, 3)
  %72 = AIE.buffer(%71) : memref<32x32xf32>
  %73 = AIE.buffer(%71) : memref<32x32xf32>
  %74 = AIE.buffer(%71) : memref<32x32xf32>
  %75 = AIE.core(%71) {
    AIE.useToken @token17(Acquire, 0)
    AIE.useToken @token7(Acquire, 3)
    AIE.useToken @token4(Acquire, 7)
    AIE.useToken @token2(Acquire, 1)
    call @extern_kernel(%65, %72, %73, %74) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token2(Release, 2)
    AIE.useToken @token4(Release, 8)
    AIE.useToken @token7(Release, 4)
    AIE.useToken @token17(Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %76 = AIE.mem(%71) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%73 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 7)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token7(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token7(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %77 = AIE.tile(12, 4) {polyaie.leaf}
  %78 = AIE.buffer(%77) : memref<32x32xf32>
  %79 = AIE.buffer(%77) : memref<32x32xf32>
  %80 = AIE.buffer(%77) : memref<32x32xf32>
  %81 = AIE.core(%77) {
    AIE.useToken @token17(Acquire, 1)
    AIE.useToken @token9(Acquire, 7)
    AIE.useToken @token6(Acquire, 3)
    AIE.useToken @token0(Acquire, 0)
    call @extern_kernel(%72, %78, %79, %80) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token6(Release, 4)
    AIE.useToken @token9(Release, 8)
    AIE.useToken @token17(Release, 2)
    AIE.end
  } {link_with = "kernel.o"}
  %82 = AIE.mem(%77) {
    %83 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token6(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%80 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token6(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %84 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%79 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 7)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %85 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%78 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.broad_packet(%77, DMA : 0) {
    AIE.bp_id(2) {
      AIE.bp_dest<%12, DMA : 0>
    }
  }
}


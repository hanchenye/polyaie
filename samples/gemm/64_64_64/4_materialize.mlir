module @gemm {
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
  %0 = memref.alloc() : memref<64x64xf32>
  %1 = memref.alloc() : memref<64x64xf32>
  %2 = memref.alloc() : memref<64x64xf32>
  %3 = AIE.tile(19, 0)
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %1) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %5 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%5, %0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %6 = AIE.external_buffer 65536 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %6) {kind = 2 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %7 = AIE.core(%3) {
    AIE.useToken @token16(Acquire, 0)
    AIE.useToken @token15(Acquire, 0)
    AIE.useToken @token0(Acquire, 3)
    AIE.useToken @token0(Release, 4)
    AIE.useToken @token15(Release, 1)
    AIE.useToken @token16(Release, 1)
    AIE.end
  }
  %8 = AIE.shimDMA(%3) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%6 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 11)
    AIE.dmaBd(<%5 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 2)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %94 = AIE.dmaStart(MM2S1, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 12)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(12) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%66, DMA : 1>
    AIE.packet_dest<%79, DMA : 1>
  }
  AIE.packet_flow(11) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%40, DMA : 1>
  }
  %9 = AIE.tile(34, 0)
  %10 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%10, %2) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %11 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%11, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %12 = AIE.core(%9) {
    AIE.useToken @token5(Acquire, 0)
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token5(Release, 1)
    AIE.end
  }
  %13 = AIE.shimDMA(%9) {
    %92 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%11 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 2)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%9, DMA : 1>
    AIE.packet_dest<%47, DMA : 1>
    AIE.packet_dest<%73, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%9, DMA : 0>
    AIE.packet_dest<%40, DMA : 0>
    AIE.packet_dest<%53, DMA : 0>
  }
  %14 = AIE.tile(27, 0)
  %15 = AIE.external_buffer 32768 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%15, %2) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %16 = AIE.external_buffer 36864 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%16, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %17 = AIE.external_buffer 69632 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %17) {kind = 2 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %18 = AIE.external_buffer 73728 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %18) {kind = 2 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %19 = AIE.core(%14) {
    AIE.useToken @token18(Acquire, 0)
    AIE.useToken @token13(Acquire, 3)
    AIE.useToken @token9(Acquire, 0)
    AIE.useToken @token3(Acquire, 3)
    AIE.useToken @token3(Release, 4)
    AIE.useToken @token9(Release, 1)
    AIE.useToken @token13(Release, 4)
    AIE.useToken @token18(Release, 1)
    AIE.end
  }
  %20 = AIE.shimDMA(%14) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 10)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %94 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    %95 = AIE.dmaStart(MM2S1, ^bb7, ^bb8)
  ^bb7:  // 2 preds: ^bb6, ^bb7
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBdPacket(0, 14)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 2)
    br ^bb7
  ^bb8:  // pred: ^bb6
    AIE.end
  }
  AIE.packet_flow(14) {
    AIE.packet_source<%14, DMA : 1>
    AIE.packet_dest<%40, DMA : 1>
    AIE.packet_dest<%66, DMA : 1>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%14, DMA : 0>
    AIE.packet_dest<%53, DMA : 1>
    AIE.packet_dest<%79, DMA : 0>
  }
  %21 = AIE.tile(18, 0)
  %22 = AIE.external_buffer 40960 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%22, %0) {kind = 0 : i64, offsets = [32, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %23 = AIE.external_buffer 45056 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%23, %0) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %24 = AIE.core(%21) {
    AIE.useToken @token11(Acquire, 0)
    AIE.useToken @token4(Acquire, 0)
    AIE.useToken @token4(Release, 1)
    AIE.useToken @token11(Release, 1)
    AIE.end
  }
  %25 = AIE.shimDMA(%21) {
    %92 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%23 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(MM2S1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 8)
    AIE.dmaBd(<%22 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 2)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  AIE.packet_flow(8) {
    AIE.packet_source<%21, DMA : 1>
    AIE.packet_dest<%66, DMA : 0>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%21, DMA : 0>
    AIE.packet_dest<%53, DMA : 1>
  }
  %26 = AIE.tile(35, 0)
  %27 = AIE.external_buffer 49152 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%27, %1) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %28 = AIE.core(%26) {
    AIE.useToken @token12(Acquire, 0)
    AIE.useToken @token12(Release, 1)
    AIE.end
  }
  %29 = AIE.shimDMA(%26) {
    %92 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%27 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token12(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(9) {
    AIE.packet_source<%26, DMA : 0>
    AIE.packet_dest<%73, DMA : 1>
    AIE.packet_dest<%86, DMA : 0>
  }
  %30 = AIE.tile(47, 0)
  %31 = AIE.external_buffer 53248 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%31, %0) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %32 = AIE.core(%30) {
    AIE.useToken @token17(Acquire, 0)
    AIE.useToken @token17(Release, 1)
    AIE.end
  }
  %33 = AIE.shimDMA(%30) {
    %92 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBdPacket(0, 13)
    AIE.dmaBd(<%31 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(13) {
    AIE.packet_source<%30, DMA : 0>
    AIE.packet_dest<%79, DMA : 1>
  }
  %34 = AIE.tile(26, 0)
  %35 = AIE.external_buffer 57344 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%35, %2) {kind = 0 : i64, offsets = [32, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %36 = AIE.external_buffer 61440 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%36, %1) {kind = 0 : i64, offsets = [0, 32], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<64x64xf32>) -> ()
  %37 = AIE.external_buffer 77824 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %37) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<64x64xf32>, memref<32x32xf32>) -> ()
  %38 = AIE.core(%34) {
    AIE.useToken @token19(Acquire, 0)
    AIE.useToken @token8(Acquire, 3)
    AIE.useToken @token2(Acquire, 0)
    AIE.useToken @token2(Release, 1)
    AIE.useToken @token8(Release, 4)
    AIE.useToken @token19(Release, 1)
    AIE.end
  }
  %39 = AIE.shimDMA(%34) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%37 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%36 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 2)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %94 = AIE.dmaStart(MM2S1, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token19(Acquire, 1)
    AIE.dmaBdPacket(0, 15)
    AIE.dmaBd(<%35 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token19(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(15) {
    AIE.packet_source<%34, DMA : 1>
    AIE.packet_dest<%60, DMA : 1>
    AIE.packet_dest<%86, DMA : 1>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%34, DMA : 0>
    AIE.packet_dest<%47, DMA : 0>
    AIE.packet_dest<%60, DMA : 0>
  }
  %40 = AIE.tile(26, 4)
  %41 = AIE.buffer(%40) : memref<32x32xf32>
  %42 = AIE.buffer(%40) : memref<32x32xf32>
  %43 = AIE.buffer(%40) : memref<32x32xf32>
  %44 = AIE.buffer(%40) : memref<32x32xf32>
  %45 = AIE.core(%40) {
    AIE.useToken @token18(Acquire, 3)
    AIE.useToken @token15(Acquire, 3)
    AIE.useToken @token7(Acquire, 0)
    AIE.useToken @token1(Acquire, 3)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %44[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %41[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %41[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %42[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %43[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %41[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token7(Release, 1)
    AIE.useToken @token15(Release, 4)
    AIE.useToken @token18(Release, 4)
    AIE.end
  }
  %46 = AIE.mem(%40) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useToken @token15(Acquire, 1)
    AIE.dmaBdPacket(0, 11)
    AIE.dmaBd(<%44 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token15(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBdPacket(0, 14)
    AIE.dmaBd(<%43 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 3)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %47 = AIE.tile(25, 4) {polyaie.leaf}
  %48 = AIE.buffer(%47) : memref<32x32xf32>
  %49 = AIE.buffer(%47) : memref<32x32xf32>
  %50 = AIE.buffer(%47) : memref<32x32xf32>
  %51 = AIE.core(%47) {
    AIE.useToken @token8(Acquire, 0)
    AIE.useToken @token7(Acquire, 1)
    AIE.useToken @token5(Acquire, 3)
    AIE.useToken @token2(Acquire, 3)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %41[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %48[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %48[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %49[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %50[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %48[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token2(Release, 4)
    AIE.useToken @token5(Release, 4)
    AIE.useToken @token7(Release, 2)
    AIE.useToken @token8(Release, 1)
    AIE.end
  }
  %52 = AIE.mem(%47) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%49 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%50 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %94 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token8(Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%48 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token8(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(6) {
    AIE.packet_dest<%34, DMA : 0>
    AIE.packet_source<%47, DMA : 0>
  }
  %53 = AIE.tile(23, 2)
  %54 = AIE.buffer(%53) : memref<32x32xf32>
  %55 = AIE.buffer(%53) : memref<32x32xf32>
  %56 = AIE.buffer(%53) : memref<32x32xf32>
  %57 = AIE.buffer(%53) : memref<32x32xf32>
  %58 = AIE.core(%53) {
    AIE.useToken @token10(Acquire, 0)
    AIE.useToken @token9(Acquire, 3)
    AIE.useToken @token4(Acquire, 3)
    AIE.useToken @token1(Acquire, 5)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %57[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %54[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %54[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %55[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %56[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %54[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token1(Release, 6)
    AIE.useToken @token4(Release, 4)
    AIE.useToken @token9(Release, 4)
    AIE.useToken @token10(Release, 1)
    AIE.end
  }
  %59 = AIE.mem(%53) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%55 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useToken @token4(Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%57 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token4(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%56 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 3)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %60 = AIE.tile(23, 3) {polyaie.leaf}
  %61 = AIE.buffer(%60) : memref<32x32xf32>
  %62 = AIE.buffer(%60) : memref<32x32xf32>
  %63 = AIE.buffer(%60) : memref<32x32xf32>
  %64 = AIE.core(%60) {
    AIE.useToken @token19(Acquire, 3)
    AIE.useToken @token10(Acquire, 1)
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token2(Acquire, 5)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %54[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %61[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %61[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %62[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %63[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %61[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token2(Release, 6)
    AIE.useToken @token3(Release, 1)
    AIE.useToken @token10(Release, 2)
    AIE.useToken @token19(Release, 4)
    AIE.end
  }
  %65 = AIE.mem(%60) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token19(Acquire, 1)
    AIE.dmaBdPacket(0, 15)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token19(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %94 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%61 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_dest<%14, DMA : 0>
    AIE.packet_source<%60, DMA : 0>
  }
  %66 = AIE.tile(26, 2)
  %67 = AIE.buffer(%66) : memref<32x32xf32>
  %68 = AIE.buffer(%66) : memref<32x32xf32>
  %69 = AIE.buffer(%66) : memref<32x32xf32>
  %70 = AIE.buffer(%66) : memref<32x32xf32>
  %71 = AIE.core(%66) {
    AIE.useToken @token18(Acquire, 5)
    AIE.useToken @token16(Acquire, 3)
    AIE.useToken @token14(Acquire, 0)
    AIE.useToken @token11(Acquire, 3)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %70[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %67[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %67[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %68[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %69[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %67[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token11(Release, 4)
    AIE.useToken @token14(Release, 1)
    AIE.useToken @token16(Release, 4)
    AIE.useToken @token18(Release, 6)
    AIE.end
  }
  %72 = AIE.mem(%66) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token11(Acquire, 1)
    AIE.dmaBdPacket(0, 8)
    AIE.dmaBd(<%70 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token11(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 12)
    AIE.dmaBd(<%68 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 3)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token18(Acquire, 1)
    AIE.dmaBdPacket(0, 14)
    AIE.dmaBd(<%69 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token18(Release, 5)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %73 = AIE.tile(26, 3) {polyaie.leaf}
  %74 = AIE.buffer(%73) : memref<32x32xf32>
  %75 = AIE.buffer(%73) : memref<32x32xf32>
  %76 = AIE.buffer(%73) : memref<32x32xf32>
  %77 = AIE.core(%73) {
    AIE.useToken @token14(Acquire, 1)
    AIE.useToken @token12(Acquire, 3)
    AIE.useToken @token5(Acquire, 5)
    AIE.useToken @token0(Acquire, 0)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %67[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %74[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %74[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %75[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %76[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %74[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token5(Release, 6)
    AIE.useToken @token12(Release, 4)
    AIE.useToken @token14(Release, 2)
    AIE.end
  }
  %78 = AIE.mem(%73) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token5(Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%76 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token5(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%75 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token12(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %94 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%74 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_dest<%3, DMA : 0>
    AIE.packet_source<%73, DMA : 0>
  }
  %79 = AIE.tile(24, 2)
  %80 = AIE.buffer(%86) : memref<32x32xf32>
  %81 = AIE.buffer(%79) : memref<32x32xf32>
  %82 = AIE.buffer(%79) : memref<32x32xf32>
  %83 = AIE.buffer(%79) : memref<32x32xf32>
  %84 = AIE.core(%79) {
    AIE.useToken @token17(Acquire, 3)
    AIE.useToken @token16(Acquire, 5)
    AIE.useToken @token9(Acquire, 5)
    AIE.useToken @token6(Acquire, 0)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %83[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %80[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %80[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %81[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %82[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %80[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token6(Release, 1)
    AIE.useToken @token9(Release, 6)
    AIE.useToken @token16(Release, 6)
    AIE.useToken @token17(Release, 4)
    AIE.end
  }
  %85 = AIE.mem(%79) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token9(Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%82 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token9(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useToken @token16(Acquire, 1)
    AIE.dmaBdPacket(0, 12)
    AIE.dmaBd(<%81 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token16(Release, 5)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useToken @token17(Acquire, 1)
    AIE.dmaBdPacket(0, 13)
    AIE.dmaBd(<%83 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token17(Release, 3)
    br ^bb3
  ^bb5:  // pred: ^bb2
    AIE.end
  }
  %86 = AIE.tile(25, 2) {polyaie.leaf}
  %87 = AIE.buffer(%86) : memref<32x32xf32>
  %88 = AIE.buffer(%86) : memref<32x32xf32>
  %89 = AIE.buffer(%86) : memref<32x32xf32>
  %90 = AIE.core(%86) {
    AIE.useToken @token19(Acquire, 5)
    AIE.useToken @token13(Acquire, 0)
    AIE.useToken @token12(Acquire, 5)
    AIE.useToken @token6(Acquire, 1)
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %92 = aievec.upd %80[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %92, %87[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %93 = aievec.upd %87[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %94 = aievec.ups %93 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %95 = aievec.upd %88[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %96 = aievec.upd %89[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %97 = aievec.concat %96, %96 : vector<8xf32>, vector<16xf32>
          %98 = aievec.mac %97, %95, %94 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %99 = aievec.srs %98 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %99, %87[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token6(Release, 2)
    AIE.useToken @token12(Release, 6)
    AIE.useToken @token13(Release, 1)
    AIE.useToken @token19(Release, 6)
    AIE.end
  }
  %91 = AIE.mem(%86) {
    %92 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token12(Acquire, 1)
    AIE.dmaBdPacket(0, 9)
    AIE.dmaBd(<%88 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token12(Release, 5)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %93 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token19(Acquire, 1)
    AIE.dmaBdPacket(0, 15)
    AIE.dmaBd(<%89 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token19(Release, 5)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %94 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token13(Acquire, 1)
    AIE.dmaBdPacket(0, 10)
    AIE.dmaBd(<%87 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token13(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(10) {
    AIE.packet_dest<%14, DMA : 1>
    AIE.packet_source<%86, DMA : 0>
  }
}


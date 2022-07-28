module @gemm {
  AIE.token(0) {sym_name = "token3"}
  AIE.token(0) {sym_name = "token2"}
  AIE.token(0) {sym_name = "token1"}
  AIE.token(0) {sym_name = "token0"}
  %0 = memref.alloc() : memref<32x32xf32>
  %1 = memref.alloc() : memref<32x32xf32>
  %2 = memref.alloc() : memref<32x32xf32>
  %3 = AIE.tile(27, 0)
  %4 = AIE.external_buffer 16384 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%4, %2) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %5 = AIE.core(%3) {
    AIE.useToken @token3(Acquire, 0)
    AIE.useToken @token3(Release, 1)
    AIE.end
  }
  %6 = AIE.shimDMA(%3) {
    %20 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%4 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 2)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%13, DMA : 1>
  }
  %7 = AIE.tile(26, 0)
  %8 = AIE.external_buffer 20480 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%8, %1) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %9 = AIE.external_buffer 24576 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%9, %0) {kind = 0 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %10 = AIE.external_buffer 28672 : memref<32x32xf32>
  "dataflow.runtime.host_dma"(%0, %10) {kind = 2 : i64, offsets = [0, 0], sizes = [32, 32], strides = [1, 1]} : (memref<32x32xf32>, memref<32x32xf32>) -> ()
  %11 = AIE.core(%7) {
    AIE.useToken @token2(Acquire, 0)
    AIE.useToken @token1(Acquire, 0)
    AIE.useToken @token0(Acquire, 3)
    AIE.useToken @token0(Release, 4)
    AIE.useToken @token1(Release, 1)
    AIE.useToken @token2(Release, 1)
    AIE.end
  }
  %12 = AIE.shimDMA(%7) {
    %20 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%10 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %21 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%9 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 2)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %22 = AIE.dmaStart(MM2S1, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%8 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%7, DMA : 1>
    AIE.packet_dest<%13, DMA : 1>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%7, DMA : 0>
    AIE.packet_dest<%13, DMA : 0>
  }
  %13 = AIE.tile(25, 2) {polyaie.leaf}
  %14 = AIE.buffer(%13) : memref<32x32xf32>
  %15 = AIE.buffer(%13) : memref<32x32xf32>
  %16 = AIE.buffer(%13) : memref<32x32xf32>
  %17 = AIE.buffer(%13) : memref<32x32xf32>
  %18 = AIE.core(%13) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    AIE.useToken @token3(Acquire, 3)
    AIE.useToken @token2(Acquire, 3)
    AIE.useToken @token1(Acquire, 3)
    AIE.useToken @token0(Acquire, 0)
    scf.for %arg0 = %c0 to %c32 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c8 {
        %20 = aievec.upd %17[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        vector.transfer_write %20, %14[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        %21 = aievec.upd %14[%arg0, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
        %22 = aievec.ups %21 {shift = 0 : i8} : vector<8xf32>, !aievec.acc<8xf32>
        scf.for %arg2 = %c0 to %c32 step %c1 {
          %23 = aievec.upd %15[%arg0, %arg2] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %24 = aievec.upd %16[%arg2, %arg1] {index = 0 : i8, offset = 0 : si32} : memref<32x32xf32>, vector<8xf32>
          %25 = aievec.concat %24, %24 : vector<8xf32>, vector<16xf32>
          %26 = aievec.mac %25, %23, %22 {xoffsets = "0x76543210", xstart = "0", zoffsets = "0x00000000", zstart = "0"} : vector<16xf32>, vector<8xf32>, !aievec.acc<8xf32>
          %27 = aievec.srs %26 {shift = 0 : i8} : !aievec.acc<8xf32>, vector<8xf32>
          vector.transfer_write %27, %14[%arg0, %arg1] {in_bounds = [true]} : vector<8xf32>, memref<32x32xf32>
        }
      }
    }
    AIE.useToken @token0(Release, 1)
    AIE.useToken @token1(Release, 4)
    AIE.useToken @token2(Release, 4)
    AIE.useToken @token3(Release, 4)
    AIE.end
  }
  %19 = AIE.mem(%13) {
    %20 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useToken @token1(Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token1(Release, 3)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %21 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useToken @token2(Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token2(Release, 3)
    AIE.useToken @token3(Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token3(Release, 3)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %22 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useToken @token0(Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useToken @token0(Release, 2)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_dest<%7, DMA : 0>
    AIE.packet_source<%13, DMA : 0>
  }
}


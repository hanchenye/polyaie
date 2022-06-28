// RUN: polyaie-translate %s -export-host-kernel | FileCheck %s

// CHECK: void kernel_2mm(

module @kernel_2mm  {
  %0 = memref.alloc() : memref<1xf32>
  %1 = memref.alloc() : memref<1xf32>
  %2 = memref.alloc() : memref<16x18xf32>
  %3 = memref.alloc() : memref<16x22xf32>
  %4 = memref.alloc() : memref<22x18xf32>
  %5 = memref.alloc() : memref<18x24xf32>
  %6 = memref.alloc() : memref<16x24xf32>
  %7 = AIE.tile(2, 2)
  %8 = AIE.switchbox(%7)  {
    %39 = AIE.amsel<0> (0)
    %40 = AIE.masterset(West : 0, %39)
    AIE.packetrules(DMA : 0)  {
      AIE.rule(31, 0, %39)
    }
  }
  %9 = AIE.lock(%7, 0)
  %10 = AIE.buffer(%7) {sym_name = "buf0"} : memref<16x24xf32>
  "dataflow.runtime.host_dma"(%10, %6) {kind = 1 : i32, offsets = [0, 0], sizes = [16, 24], strides = [1, 1]} : (memref<16x24xf32>, memref<16x24xf32>) -> ()
  %11 = AIE.buffer(%7) {sym_name = "buf1"} : memref<16x24xf32>
  %12 = AIE.buffer(%7) {sym_name = "buf2"} : memref<1xf32>
  "dataflow.runtime.host_dma"(%12, %1) {kind = 1 : i32, offsets = [0], sizes = [1], strides = [1]} : (memref<1xf32>, memref<1xf32>) -> ()
  %13 = AIE.core(%7)  {
    AIE.useLock(%9, Acquire, 0)
    %39 = affine.load %12[0] : memref<1xf32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 24 {
        %40 = affine.load %10[%arg0, %arg1] : memref<16x24xf32>
        %41 = arith.mulf %40, %39 : f32
        affine.store %41, %11[%arg0, %arg1] : memref<16x24xf32>
      } {scop.point_loop}
    } {scop.point_loop}
    AIE.useLock(%9, Release, 1)
    AIE.end
  }
  %14 = AIE.mem(%7)  {
    %39 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%11 : memref<16x24xf32>, 0, 384>, 0)
    AIE.useLock(%9, Release, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  %15 = AIE.tile(1, 2)
  %16 = AIE.switchbox(%15)  {
    %39 = AIE.amsel<0> (0)
    %40 = AIE.masterset(West : 0, %39)
    AIE.packetrules(East : 0)  {
      AIE.rule(31, 0, %39)
    }
  }
  %17 = AIE.lock(%15, 0)
  %18 = AIE.buffer(%15) {sym_name = "buf3"} : memref<16x18xf32>
  "dataflow.runtime.host_dma"(%18, %2) {kind = 1 : i32, offsets = [0, 0], sizes = [16, 18], strides = [1, 1]} : (memref<16x18xf32>, memref<16x18xf32>) -> ()
  %19 = AIE.buffer(%15) {sym_name = "buf4"} : memref<16x18xf32>
  %20 = AIE.core(%15)  {
    AIE.useLock(%17, Acquire, 0)
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        %39 = affine.load %18[%arg0, %arg1] : memref<16x18xf32>
        affine.store %39, %19[%arg0, %arg1] : memref<16x18xf32>
      }
    }
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        %cst = arith.constant 0.000000e+00 : f32
        affine.store %cst, %19[%arg0, %arg1] : memref<16x18xf32>
      } {scop.point_loop}
    } {scop.point_loop}
    AIE.useLock(%17, Release, 1)
    AIE.end
  }
  %21 = AIE.tile(0, 2) {polyaie.leaf_tile}
  %22 = AIE.lock(%21, 15)
  %23 = AIE.switchbox(%21)  {
    %39 = AIE.amsel<0> (0)
    %40 = AIE.masterset(North : 0, %39)
    AIE.packetrules(East : 0)  {
      AIE.rule(31, 0, %39)
    }
  }
  %24 = AIE.buffer(%21) {sym_name = "buf5"} : memref<16x22xf32>
  "dataflow.runtime.host_dma"(%24, %3) {kind = 1 : i32, offsets = [0, 0], sizes = [16, 22], strides = [1, 1]} : (memref<16x22xf32>, memref<16x22xf32>) -> ()
  %25 = AIE.buffer(%21) {sym_name = "buf6"} : memref<22x18xf32>
  "dataflow.runtime.host_dma"(%25, %4) {kind = 1 : i32, offsets = [0, 0], sizes = [22, 18], strides = [1, 1]} : (memref<22x18xf32>, memref<22x18xf32>) -> ()
  %26 = AIE.buffer(%21) {sym_name = "buf7"} : memref<16x18xf32>
  "dataflow.runtime.host_dma"(%2, %26) {kind = 3 : i32, offsets = [0, 0], sizes = [16, 18], strides = [1, 1]} : (memref<16x18xf32>, memref<16x18xf32>) -> ()
  %27 = AIE.buffer(%21) {sym_name = "buf8"} : memref<1xf32>
  "dataflow.runtime.host_dma"(%27, %0) {kind = 1 : i32, offsets = [0], sizes = [1], strides = [1]} : (memref<1xf32>, memref<1xf32>) -> ()
  %28 = AIE.core(%21)  {
    AIE.useLock(%33, Acquire, 0)
    AIE.useLock(%17, Acquire, 1)
    %39 = affine.load %27[0] : memref<1xf32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        %40 = affine.load %19[%arg0, %arg1] : memref<16x18xf32>
        affine.store %40, %26[%arg0, %arg1] : memref<16x18xf32>
        affine.for %arg2 = 0 to 22 {
          %41 = affine.load %26[%arg0, %arg1] : memref<16x18xf32>
          %42 = affine.load %24[%arg0, %arg2] : memref<16x22xf32>
          %43 = arith.mulf %39, %42 : f32
          %44 = affine.load %25[%arg2, %arg1] : memref<22x18xf32>
          %45 = arith.mulf %43, %44 : f32
          %46 = arith.addf %41, %45 : f32
          affine.store %46, %26[%arg0, %arg1] : memref<16x18xf32>
        } {scop.point_loop}
      } {scop.point_loop}
    } {scop.point_loop}
    AIE.useLock(%17, Release, 0)
    AIE.useLock(%33, Release, 1)
    AIE.useLock(%22, Release, 1)
    AIE.end
  }
  %29 = AIE.tile(0, 3) {polyaie.leaf_tile}
  %30 = AIE.lock(%29, 15)
  %31 = AIE.switchbox(%29)  {
    %39 = AIE.amsel<0> (0)
    %40 = AIE.masterset(DMA : 0, %39)
    AIE.packetrules(South : 0)  {
      AIE.rule(31, 0, %39)
    }
  }
  %32 = AIE.lock(%29, 1)
  %33 = AIE.lock(%29, 0)
  %34 = AIE.buffer(%29) {sym_name = "buf9"} : memref<18x24xf32>
  "dataflow.runtime.host_dma"(%34, %5) {kind = 1 : i32, offsets = [0, 0], sizes = [18, 24], strides = [1, 1]} : (memref<18x24xf32>, memref<18x24xf32>) -> ()
  %35 = AIE.buffer(%29) {sym_name = "buf10"} : memref<16x24xf32>
  %36 = AIE.buffer(%29) {sym_name = "buf11"} : memref<16x24xf32>
  "dataflow.runtime.host_dma"(%6, %36) {kind = 3 : i32, offsets = [0, 0], sizes = [16, 24], strides = [1, 1]} : (memref<16x24xf32>, memref<16x24xf32>) -> ()
  %37 = AIE.core(%29)  {
    AIE.useLock(%33, Acquire, 1)
    AIE.useLock(%32, Acquire, 1)
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 24 {
        %39 = affine.load %35[%arg0, %arg1] : memref<16x24xf32>
        affine.store %39, %36[%arg0, %arg1] : memref<16x24xf32>
        affine.for %arg2 = 0 to 18 {
          %40 = affine.load %36[%arg0, %arg1] : memref<16x24xf32>
          %41 = affine.load %26[%arg0, %arg2] : memref<16x18xf32>
          %42 = affine.load %34[%arg2, %arg1] : memref<18x24xf32>
          %43 = arith.mulf %41, %42 : f32
          %44 = arith.addf %40, %43 : f32
          affine.store %44, %36[%arg0, %arg1] : memref<16x24xf32>
        } {scop.point_loop}
      } {scop.point_loop}
    } {scop.point_loop}
    AIE.useLock(%32, Release, 0)
    AIE.useLock(%33, Release, 0)
    AIE.useLock(%30, Release, 1)
    AIE.end
  }
  %38 = AIE.mem(%29)  {
    %39 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%32, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%35 : memref<16x24xf32>, 0, 384>, 0)
    AIE.useLock(%32, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
}

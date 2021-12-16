// RUN: polyaie-translate %s -export-host-kernel | FileCheck %s

// CHECK: void kernel_2mm(

module @kernel_2mm  {
  %0 = memref.alloc() : memref<f32>
  %1 = memref.alloc() : memref<f32>
  %2 = memref.alloc() : memref<16x18xf32>
  %3 = memref.alloc() : memref<16x22xf32>
  %4 = memref.alloc() : memref<22x18xf32>
  %5 = memref.alloc() : memref<18x24xf32>
  %6 = memref.alloc() : memref<16x24xf32>
  "memrefext.memcpy"(%9, %6) {lengths = [16, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x24xf32>, memref<16x24xf32>) -> ()
  "memrefext.memcpy"(%10, %1) {lengths = [1], sourceOffsets = [0], targetOffsets = [0]} : (memref<f32>, memref<f32>) -> ()
  %7 = AIE.tile(17, 2)
  %8 = AIE.lock(%7, 0)
  %9 = AIE.buffer(%7) {address = 4096 : i32, sym_name = "buf0"} : memref<16x24xf32>
  %10 = AIE.buffer(%7) {address = 5632 : i32, sym_name = "buf1"} : memref<f32>
  %11 = AIE.core(%7)  {
    AIE.useLock(%8, Acquire, 0, 0)
    %36 = affine.load %10[] : memref<f32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 24 {
        %37 = affine.load %9[%arg0, %arg1] : memref<16x24xf32>
        %38 = arith.mulf %37, %36 : f32
        affine.store %38, %9[%arg0, %arg1] : memref<16x24xf32>
      }
    }
    AIE.useLock(%8, Release, 1, 0)
    AIE.end
  }
  %12 = AIE.mem(%7)  {
    %36 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%8, Acquire, 1, 0)
    AIE.dmaBd(<%9 : memref<16x24xf32>, 0, 384>, 0)
    AIE.useLock(%8, Release, 0, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  "memrefext.memcpy"(%15, %2) {lengths = [16, 18], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x18xf32>, memref<16x18xf32>) -> ()
  %13 = AIE.tile(16, 2)
  %14 = AIE.lock(%13, 0)
  %15 = AIE.buffer(%13) {address = 4096 : i32, sym_name = "buf2"} : memref<16x18xf32>
  %16 = AIE.core(%13)  {
    AIE.useLock(%14, Acquire, 0, 0)
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        affine.store %cst, %15[%arg0, %arg1] : memref<16x18xf32>
      }
    }
    AIE.useLock(%14, Release, 1, 0)
    AIE.end
  }
  "memrefext.memcpy"(%20, %4) {lengths = [22, 18], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<22x18xf32>, memref<22x18xf32>) -> ()
  "memrefext.memcpy"(%21, %0) {lengths = [1], sourceOffsets = [0], targetOffsets = [0]} : (memref<f32>, memref<f32>) -> ()
  "memrefext.memcpy"(%22, %3) {lengths = [16, 22], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x22xf32>, memref<16x22xf32>) -> ()
  %17 = AIE.tile(15, 2)
  %18 = AIE.lock(%17, 0)
  %19 = AIE.buffer(%17) {address = 7088 : i32, sym_name = "buf3"} : memref<16x18xf32>
  %20 = AIE.buffer(%17) {address = 4096 : i32, sym_name = "buf4"} : memref<22x18xf32>
  %21 = AIE.buffer(%17) {address = 8240 : i32, sym_name = "buf5"} : memref<f32>
  %22 = AIE.buffer(%17) {address = 5680 : i32, sym_name = "buf6"} : memref<16x22xf32>
  %23 = AIE.core(%17)  {
    AIE.useLock(%18, Acquire, 0, 0)
    AIE.useLock(%14, Acquire, 1, 0)
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        %37 = affine.load %15[%arg0, %arg1] : memref<16x18xf32>
        affine.store %37, %19[%arg0, %arg1] : memref<16x18xf32>
      }
    }
    %36 = affine.load %21[] : memref<f32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 22 {
        affine.for %arg2 = 0 to 18 {
          %37 = affine.load %19[%arg0, %arg2] : memref<16x18xf32>
          %38 = affine.load %22[%arg0, %arg1] : memref<16x22xf32>
          %39 = arith.mulf %36, %38 : f32
          %40 = affine.load %20[%arg1, %arg2] : memref<22x18xf32>
          %41 = arith.mulf %39, %40 : f32
          %42 = arith.addf %37, %41 : f32
          affine.store %42, %19[%arg0, %arg2] : memref<16x18xf32>
        }
      }
    }
    AIE.useLock(%14, Release, 0, 0)
    AIE.useLock(%18, Release, 1, 0)
    AIE.end
  }
  "memrefext.memcpy"(%28, %5) {lengths = [18, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<18x24xf32>, memref<18x24xf32>) -> ()
  %24 = AIE.tile(14, 2)
  %25 = AIE.lock(%24, 0)
  %26 = AIE.lock(%24, 15)
  %27 = AIE.buffer(%24) {address = 5824 : i32, sym_name = "buf7"} : memref<16x24xf32>
  %28 = AIE.buffer(%24) {address = 4096 : i32, sym_name = "buf8"} : memref<18x24xf32>
  %29 = AIE.buffer(%24) {address = 7360 : i32, sym_name = "buf9"} : memref<16x18xf32>
  %30 = AIE.core(%24)  {
    AIE.useLock(%18, Acquire, 1, 0)
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        %36 = affine.load %19[%arg0, %arg1] : memref<16x18xf32>
        affine.store %36, %29[%arg0, %arg1] : memref<16x18xf32>
      }
    }
    AIE.useLock(%25, Acquire, 1, 0)
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        affine.for %arg2 = 0 to 24 {
          %36 = affine.load %27[%arg0, %arg2] : memref<16x24xf32>
          %37 = affine.load %29[%arg0, %arg1] : memref<16x18xf32>
          %38 = affine.load %28[%arg1, %arg2] : memref<18x24xf32>
          %39 = arith.mulf %37, %38 : f32
          %40 = arith.addf %36, %39 : f32
          affine.store %40, %27[%arg0, %arg2] : memref<16x24xf32>
        }
      }
    }
    AIE.useLock(%18, Release, 0, 0)
    AIE.useLock(%25, Release, 0, 0)
    AIE.useLock(%26, Release, 1, 0)
    AIE.end
  }
  %31 = AIE.mem(%24)  {
    %36 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%25, Acquire, 0, 0)
    AIE.dmaBd(<%27 : memref<16x24xf32>, 0, 384>, 0)
    AIE.useLock(%25, Release, 1, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  "memrefext.memcpy"(%6, %27) {lengths = [16, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x24xf32>, memref<16x24xf32>) -> ()
  %32 = AIE.switchbox(%24)  {
    AIE.connect<East : 0, DMA : 0>
  }
  %33 = AIE.switchbox(%17)  {
    AIE.connect<East : 0, West : 0>
  }
  %34 = AIE.switchbox(%13)  {
    AIE.connect<East : 0, West : 0>
  }
  %35 = AIE.switchbox(%7)  {
    AIE.connect<DMA : 0, West : 0>
  }
}

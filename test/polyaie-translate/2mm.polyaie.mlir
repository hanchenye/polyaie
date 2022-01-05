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
  "dataflow.memcpy"(%12, %6) {lengths = [16, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x24xf32>, memref<16x24xf32>) -> ()
  "dataflow.memcpy"(%11, %1) {lengths = [1], sourceOffsets = [0], targetOffsets = [0]} : (memref<f32>, memref<f32>) -> ()
  %7 = AIE.tile(2, 2)
  %8 = AIE.buffer(%7) {polyaie.iter_num_buf, sym_name = "buf0"} : memref<i32>
  %9 = AIE.lock(%7, 0)
  %10 = AIE.buffer(%7) {sym_name = "buf1"} : memref<16x24xf32>
  %11 = AIE.buffer(%7) {sym_name = "buf2"} : memref<f32>
  %12 = AIE.buffer(%7) {sym_name = "buf3"} : memref<16x24xf32>
  %13 = AIE.core(%7)  {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %46 = memref.load %8[] : memref<i32>
    %47 = arith.index_cast %46 : i32 to index
    scf.for %arg0 = %c0 to %47 step %c1 {
      AIE.useLock(%9, Acquire, 0)
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 24 {
          %49 = affine.load %12[%arg1, %arg2] : memref<16x24xf32>
          affine.store %49, %10[%arg1, %arg2] : memref<16x24xf32>
        }
      }
      %48 = affine.load %11[] : memref<f32>
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 24 {
          %49 = affine.load %10[%arg1, %arg2] : memref<16x24xf32>
          %50 = arith.mulf %49, %48 : f32
          affine.store %50, %10[%arg1, %arg2] : memref<16x24xf32>
        }
      }
      AIE.useLock(%9, Release, 1)
    }
    AIE.end
  }
  %14 = AIE.mem(%7)  {
    %46 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBd(<%10 : memref<16x24xf32>, 0, 384>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  "dataflow.memcpy"(%19, %2) {lengths = [16, 18], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x18xf32>, memref<16x18xf32>) -> ()
  %15 = AIE.tile(1, 2)
  %16 = AIE.buffer(%15) {polyaie.iter_num_buf, sym_name = "buf4"} : memref<i32>
  %17 = AIE.lock(%15, 0)
  %18 = AIE.buffer(%15) {sym_name = "buf5"} : memref<16x18xf32>
  %19 = AIE.buffer(%15) {sym_name = "buf6"} : memref<16x18xf32>
  %20 = AIE.core(%15)  {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %46 = memref.load %16[] : memref<i32>
    %47 = arith.index_cast %46 : i32 to index
    scf.for %arg0 = %c0 to %47 step %c1 {
      AIE.useLock(%17, Acquire, 0)
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 18 {
          %48 = affine.load %19[%arg1, %arg2] : memref<16x18xf32>
          affine.store %48, %18[%arg1, %arg2] : memref<16x18xf32>
        }
      }
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 18 {
          affine.store %cst, %18[%arg1, %arg2] : memref<16x18xf32>
        }
      }
      AIE.useLock(%17, Release, 1)
    }
    AIE.end
  }
  "dataflow.memcpy"(%24, %4) {lengths = [22, 18], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<22x18xf32>, memref<22x18xf32>) -> ()
  "dataflow.memcpy"(%25, %0) {lengths = [1], sourceOffsets = [0], targetOffsets = [0]} : (memref<f32>, memref<f32>) -> ()
  "dataflow.memcpy"(%26, %3) {lengths = [16, 22], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x22xf32>, memref<16x22xf32>) -> ()
  %21 = AIE.tile(0, 2)
  %22 = AIE.buffer(%21) {polyaie.iter_num_buf, sym_name = "buf7"} : memref<i32>
  %23 = AIE.buffer(%21) {sym_name = "buf8"} : memref<16x18xf32>
  %24 = AIE.buffer(%21) {sym_name = "buf9"} : memref<22x18xf32>
  %25 = AIE.buffer(%21) {sym_name = "buf10"} : memref<f32>
  %26 = AIE.buffer(%21) {sym_name = "buf11"} : memref<16x22xf32>
  %27 = AIE.buffer(%21) {sym_name = "buf12"} : memref<16x18xf32>
  %28 = AIE.core(%21)  {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %46 = memref.load %22[] : memref<i32>
    %47 = arith.index_cast %46 : i32 to index
    scf.for %arg0 = %c0 to %47 step %c1 {
      AIE.useLock(%17, Acquire, 1)
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 18 {
          %49 = affine.load %18[%arg1, %arg2] : memref<16x18xf32>
          affine.store %49, %27[%arg1, %arg2] : memref<16x18xf32>
        }
      }
      AIE.useLock(%17, Release, 0)
      AIE.useLock(%32, Acquire, 0)
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 18 {
          %49 = affine.load %27[%arg1, %arg2] : memref<16x18xf32>
          affine.store %49, %23[%arg1, %arg2] : memref<16x18xf32>
        }
      }
      %48 = affine.load %25[] : memref<f32>
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 22 {
          affine.for %arg3 = 0 to 18 {
            %49 = affine.load %23[%arg1, %arg3] : memref<16x18xf32>
            %50 = affine.load %26[%arg1, %arg2] : memref<16x22xf32>
            %51 = arith.mulf %48, %50 : f32
            %52 = affine.load %24[%arg2, %arg3] : memref<22x18xf32>
            %53 = arith.mulf %51, %52 : f32
            %54 = arith.addf %49, %53 : f32
            affine.store %54, %23[%arg1, %arg3] : memref<16x18xf32>
          }
        }
      }
      AIE.useLock(%32, Release, 1)
    }
    AIE.end
  }
  "dataflow.memcpy"(%35, %5) {lengths = [18, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<18x24xf32>, memref<18x24xf32>) -> ()
  %29 = AIE.tile(0, 3) {polyaie.leaf_tile}
  %30 = AIE.lock(%29, 15)
  %31 = AIE.buffer(%29) {polyaie.iter_num_buf, sym_name = "buf13"} : memref<i32>
  %32 = AIE.lock(%29, 1)
  %33 = AIE.lock(%29, 0)
  %34 = AIE.buffer(%29) {sym_name = "buf14"} : memref<16x24xf32>
  %35 = AIE.buffer(%29) {sym_name = "buf15"} : memref<18x24xf32>
  %36 = AIE.buffer(%29) {sym_name = "buf16"} : memref<16x18xf32>
  %37 = AIE.buffer(%29) {sym_name = "buf17"} : memref<16x24xf32>
  %38 = AIE.core(%29)  {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %46 = memref.load %31[] : memref<i32>
    %47 = arith.index_cast %46 : i32 to index
    scf.for %arg0 = %c0 to %47 step %c1 {
      AIE.useLock(%33, Acquire, 1)
      AIE.useLock(%32, Acquire, 1)
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 18 {
          %48 = affine.load %23[%arg1, %arg2] : memref<16x18xf32>
          affine.store %48, %36[%arg1, %arg2] : memref<16x18xf32>
        }
      }
      AIE.useLock(%32, Release, 0)
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 24 {
          %48 = affine.load %37[%arg1, %arg2] : memref<16x24xf32>
          affine.store %48, %34[%arg1, %arg2] : memref<16x24xf32>
        }
      }
      affine.for %arg1 = 0 to 16 {
        affine.for %arg2 = 0 to 18 {
          affine.for %arg3 = 0 to 24 {
            %48 = affine.load %34[%arg1, %arg3] : memref<16x24xf32>
            %49 = affine.load %36[%arg1, %arg2] : memref<16x18xf32>
            %50 = affine.load %35[%arg2, %arg3] : memref<18x24xf32>
            %51 = arith.mulf %49, %50 : f32
            %52 = arith.addf %48, %51 : f32
            affine.store %52, %34[%arg1, %arg3] : memref<16x24xf32>
          }
        }
      }
      AIE.useLock(%33, Release, 0)
    }
    AIE.useLock(%30, Release, 1)
    AIE.end
  }
  %39 = AIE.mem(%29)  {
    %46 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%33, Acquire, 0)
    AIE.dmaBd(<%37 : memref<16x24xf32>, 0, 384>, 0)
    AIE.useLock(%33, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  "dataflow.memcpy"(%6, %34) {lengths = [16, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x24xf32>, memref<16x24xf32>) -> ()
  %40 = AIE.tile(1, 3)
  %41 = AIE.tile(2, 3)
  %42 = AIE.switchbox(%29)  {
    AIE.connect<East : 0, DMA : 0>
  }
  %43 = AIE.switchbox(%40)  {
    AIE.connect<East : 0, West : 0>
  }
  %44 = AIE.switchbox(%7)  {
    AIE.connect<DMA : 0, North : 0>
  }
  %45 = AIE.switchbox(%41)  {
    AIE.connect<South : 0, West : 0>
  }
}

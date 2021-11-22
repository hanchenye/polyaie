// RUN: polyaie-translate %s -export-host-kernel | FileCheck %s

// CHECK: void kernel_2mm(

module @kernel_2mm  {
  %0 = memref.alloc() : memref<i32>
  %1 = memref.alloc() : memref<i32>
  %2 = memref.alloc() : memref<16x18xi32>
  %3 = memref.alloc() : memref<16x22xi32>
  %4 = memref.alloc() : memref<22x18xi32>
  %5 = memref.alloc() : memref<18x24xi32>
  %6 = memref.alloc() : memref<16x24xi32>
  %7 = AIE.tile(15, 2)
  %8 = AIE.lock(%7, 0)
  %9 = AIE.buffer(%7) {address = 4096 : i32, sym_name = "buf0"} : memref<16x24xi32>
  "memrefext.memcpy"(%9, %6) {lengths = [16, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x24xi32>, memref<16x24xi32>) -> ()
  %10 = AIE.buffer(%7) {address = 5632 : i32, sym_name = "buf1"} : memref<i32>
  "memrefext.memcpy"(%10, %1) {lengths = [1], sourceOffsets = [0], targetOffsets = [0]} : (memref<i32>, memref<i32>) -> ()
  %11 = AIE.mem(%7)  {
    %130 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%8, Acquire, 1, 0)
    AIE.dmaBd(<%9 : memref<16x24xi32>, 0, 384>, 0)
    AIE.useLock(%8, Release, 0, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  %12 = AIE.core(%7)  {
    AIE.useLock(%8, Acquire, 0, 0)
    %130 = affine.load %10[] : memref<i32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 24 {
        %131 = affine.load %9[%arg0, %arg1] : memref<16x24xi32>
        %132 = muli %131, %130 : i32
        affine.store %132, %9[%arg0, %arg1] : memref<16x24xi32>
      }
    }
    AIE.useLock(%8, Release, 1, 0)
    AIE.end
  }
  %13 = AIE.tile(14, 2)
  %14 = AIE.lock(%13, 1)
  %15 = AIE.lock(%13, 0)
  %16 = AIE.buffer(%13) {address = 4096 : i32, sym_name = "buf2"} : memref<16x18xi32>
  "memrefext.memcpy"(%16, %2) {lengths = [16, 18], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x18xi32>, memref<16x18xi32>) -> ()
  %17 = AIE.mem(%13)  {
    %130 = AIE.dmaStart(MM2S0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%15, Acquire, 0, 0)
    AIE.useLock(%14, Acquire, 1, 0)
    AIE.dmaBd(<%16 : memref<16x18xi32>, 0, 288>, 0)
    AIE.useLock(%14, Release, 0, 0)
    AIE.useLock(%15, Release, 1, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    AIE.end
  }
  %18 = AIE.core(%13)  {
    AIE.useLock(%14, Acquire, 0, 0)
    %c0_i32 = constant 0 : i32
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        affine.store %c0_i32, %16[%arg0, %arg1] : memref<16x18xi32>
      }
    }
    AIE.useLock(%14, Release, 1, 0)
    AIE.end
  }
  %19 = AIE.tile(13, 2)
  %20 = AIE.lock(%19, 2)
  %21 = AIE.lock(%19, 1)
  %22 = AIE.lock(%19, 0)
  %23 = AIE.buffer(%19) {address = 7088 : i32, sym_name = "buf3"} : memref<16x18xi32>
  %24 = AIE.mem(%19)  {
    %130 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%22, Acquire, 0, 0)
    AIE.dmaBd(<%23 : memref<16x18xi32>, 0, 288>, 0)
    AIE.useLock(%22, Release, 1, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %131 = AIE.dmaStart(MM2S0, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%21, Acquire, 0, 0)
    AIE.useLock(%20, Acquire, 1, 0)
    AIE.dmaBd(<%23 : memref<16x18xi32>, 0, 288>, 0)
    AIE.useLock(%20, Release, 0, 0)
    AIE.useLock(%21, Release, 1, 0)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %25 = AIE.buffer(%19) {address = 4096 : i32, sym_name = "buf4"} : memref<22x18xi32>
  "memrefext.memcpy"(%25, %4) {lengths = [22, 18], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<22x18xi32>, memref<22x18xi32>) -> ()
  %26 = AIE.buffer(%19) {address = 8240 : i32, sym_name = "buf5"} : memref<i32>
  "memrefext.memcpy"(%26, %0) {lengths = [1], sourceOffsets = [0], targetOffsets = [0]} : (memref<i32>, memref<i32>) -> ()
  %27 = AIE.buffer(%19) {address = 5680 : i32, sym_name = "buf6"} : memref<16x22xi32>
  "memrefext.memcpy"(%27, %3) {lengths = [16, 22], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x22xi32>, memref<16x22xi32>) -> ()
  %28 = AIE.core(%19)  {
    AIE.useLock(%20, Acquire, 0, 0)
    AIE.useLock(%22, Acquire, 1, 0)
    AIE.useLock(%15, Acquire, 1, 0)
    %130 = affine.load %26[] : memref<i32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 22 {
        affine.for %arg2 = 0 to 18 {
          %131 = affine.load %23[%arg0, %arg2] : memref<16x18xi32>
          %132 = affine.load %27[%arg0, %arg1] : memref<16x22xi32>
          %133 = muli %130, %132 : i32
          %134 = affine.load %25[%arg1, %arg2] : memref<22x18xi32>
          %135 = muli %133, %134 : i32
          %136 = addi %131, %135 : i32
          affine.store %136, %23[%arg0, %arg2] : memref<16x18xi32>
        }
      }
    }
    AIE.useLock(%15, Release, 0, 0)
    AIE.useLock(%22, Release, 0, 0)
    AIE.useLock(%20, Release, 1, 0)
    AIE.end
  }
  %29 = AIE.tile(12, 2)
  %30 = AIE.lock(%29, 15)
  %31 = AIE.lock(%29, 1)
  %32 = AIE.lock(%29, 0)
  %33 = AIE.buffer(%29) {address = 5824 : i32, sym_name = "buf7"} : memref<16x24xi32>
  %34 = AIE.mem(%29)  {
    %130 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%32, Acquire, 0, 0)
    AIE.dmaBd(<%33 : memref<16x24xi32>, 0, 384>, 0)
    AIE.useLock(%32, Release, 1, 0)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %131 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%31, Acquire, 0, 0)
    AIE.dmaBd(<%36 : memref<16x18xi32>, 0, 288>, 0)
    AIE.useLock(%31, Release, 1, 0)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %35 = AIE.buffer(%29) {address = 4096 : i32, sym_name = "buf8"} : memref<18x24xi32>
  "memrefext.memcpy"(%35, %5) {lengths = [18, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<18x24xi32>, memref<18x24xi32>) -> ()
  %36 = AIE.buffer(%29) {address = 7360 : i32, sym_name = "buf9"} : memref<16x18xi32>
  "memrefext.memcpy"(%6, %33) {lengths = [16, 24], sourceOffsets = [0, 0], targetOffsets = [0, 0]} : (memref<16x24xi32>, memref<16x24xi32>) -> ()
  %37 = AIE.core(%29)  {
    AIE.useLock(%32, Acquire, 1, 0)
    AIE.useLock(%31, Acquire, 1, 0)
    AIE.useLock(%21, Acquire, 1, 0)
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 18 {
        affine.for %arg2 = 0 to 24 {
          %130 = affine.load %33[%arg0, %arg2] : memref<16x24xi32>
          %131 = affine.load %36[%arg0, %arg1] : memref<16x18xi32>
          %132 = affine.load %35[%arg1, %arg2] : memref<18x24xi32>
          %133 = muli %131, %132 : i32
          %134 = addi %130, %133 : i32
          affine.store %134, %33[%arg0, %arg2] : memref<16x24xi32>
        }
      }
    }
    AIE.useLock(%21, Release, 0, 0)
    AIE.useLock(%31, Release, 0, 0)
    AIE.useLock(%32, Release, 0, 0)
    AIE.useLock(%30, Release, 1, 0)
    AIE.end
  }
  %38 = AIE.tile(0, 0)
  %39 = AIE.tile(0, 1)
  %40 = AIE.tile(0, 2)
  %41 = AIE.tile(1, 0)
  %42 = AIE.tile(1, 1)
  %43 = AIE.tile(1, 2)
  %44 = AIE.tile(2, 0)
  %45 = AIE.tile(2, 1)
  %46 = AIE.tile(2, 2)
  %47 = AIE.tile(3, 0)
  %48 = AIE.tile(3, 1)
  %49 = AIE.tile(3, 2)
  %50 = AIE.tile(4, 0)
  %51 = AIE.tile(4, 1)
  %52 = AIE.tile(4, 2)
  %53 = AIE.tile(5, 0)
  %54 = AIE.tile(5, 1)
  %55 = AIE.tile(5, 2)
  %56 = AIE.tile(6, 0)
  %57 = AIE.tile(6, 1)
  %58 = AIE.tile(6, 2)
  %59 = AIE.tile(7, 0)
  %60 = AIE.tile(7, 1)
  %61 = AIE.tile(7, 2)
  %62 = AIE.tile(8, 0)
  %63 = AIE.tile(8, 1)
  %64 = AIE.tile(8, 2)
  %65 = AIE.tile(9, 0)
  %66 = AIE.tile(9, 1)
  %67 = AIE.tile(9, 2)
  %68 = AIE.tile(10, 0)
  %69 = AIE.tile(10, 1)
  %70 = AIE.tile(10, 2)
  %71 = AIE.tile(11, 0)
  %72 = AIE.tile(11, 1)
  %73 = AIE.tile(11, 2)
  %74 = AIE.tile(12, 0)
  %75 = AIE.tile(12, 1)
  %76 = AIE.tile(13, 0)
  %77 = AIE.tile(13, 1)
  %78 = AIE.tile(14, 0)
  %79 = AIE.tile(14, 1)
  %80 = AIE.tile(15, 0)
  %81 = AIE.tile(15, 1)
  %82 = AIE.switchbox(%38)  {
  }
  %83 = AIE.switchbox(%39)  {
  }
  %84 = AIE.switchbox(%40)  {
  }
  %85 = AIE.switchbox(%41)  {
  }
  %86 = AIE.switchbox(%42)  {
  }
  %87 = AIE.switchbox(%43)  {
  }
  %88 = AIE.switchbox(%44)  {
  }
  %89 = AIE.switchbox(%45)  {
  }
  %90 = AIE.switchbox(%46)  {
  }
  %91 = AIE.switchbox(%47)  {
  }
  %92 = AIE.switchbox(%48)  {
  }
  %93 = AIE.switchbox(%49)  {
  }
  %94 = AIE.switchbox(%50)  {
  }
  %95 = AIE.switchbox(%51)  {
  }
  %96 = AIE.switchbox(%52)  {
  }
  %97 = AIE.switchbox(%53)  {
  }
  %98 = AIE.switchbox(%54)  {
  }
  %99 = AIE.switchbox(%55)  {
  }
  %100 = AIE.switchbox(%56)  {
  }
  %101 = AIE.switchbox(%57)  {
  }
  %102 = AIE.switchbox(%58)  {
  }
  %103 = AIE.switchbox(%59)  {
  }
  %104 = AIE.switchbox(%60)  {
  }
  %105 = AIE.switchbox(%61)  {
  }
  %106 = AIE.switchbox(%62)  {
  }
  %107 = AIE.switchbox(%63)  {
  }
  %108 = AIE.switchbox(%64)  {
  }
  %109 = AIE.switchbox(%65)  {
  }
  %110 = AIE.switchbox(%66)  {
  }
  %111 = AIE.switchbox(%67)  {
  }
  %112 = AIE.switchbox(%68)  {
  }
  %113 = AIE.switchbox(%69)  {
  }
  %114 = AIE.switchbox(%70)  {
  }
  %115 = AIE.switchbox(%71)  {
  }
  %116 = AIE.switchbox(%72)  {
  }
  %117 = AIE.switchbox(%73)  {
  }
  %118 = AIE.switchbox(%74)  {
  }
  %119 = AIE.switchbox(%75)  {
  }
  %120 = AIE.switchbox(%29)  {
    AIE.connect<East : 0, DMA : 0>
    AIE.connect<East : 1, DMA : 1>
  }
  %121 = AIE.switchbox(%76)  {
  }
  %122 = AIE.switchbox(%77)  {
  }
  %123 = AIE.switchbox(%19)  {
    AIE.connect<East : 0, DMA : 0>
    AIE.connect<East : 1, West : 0>
    AIE.connect<DMA : 0, West : 1>
  }
  %124 = AIE.switchbox(%78)  {
  }
  %125 = AIE.switchbox(%79)  {
  }
  %126 = AIE.switchbox(%13)  {
    AIE.connect<DMA : 0, West : 0>
    AIE.connect<East : 0, West : 1>
  }
  %127 = AIE.switchbox(%80)  {
  }
  %128 = AIE.switchbox(%81)  {
  }
  %129 = AIE.switchbox(%7)  {
    AIE.connect<DMA : 0, West : 0>
  }
}

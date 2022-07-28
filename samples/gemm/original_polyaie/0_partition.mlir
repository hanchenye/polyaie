module {
  func @PE0_AIE3(%arg0: memref<32x64xf32>, %arg1: memref<64x64xf32>, %arg2: memref<32x64xf32>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %0 = affine.load %arg0[%arg3, %arg5 + 32] : memref<32x64xf32>
          %1 = affine.load %arg1[%arg5 + 32, %arg4 + 32] : memref<64x64xf32>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg2[%arg3, %arg4 + 32] : memref<32x64xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg2[%arg3, %arg4 + 32] : memref<32x64xf32>
        }
      }
    }
    return
  }
  func @PE0_AIE2(%arg0: memref<32x64xf32>, %arg1: memref<64x64xf32>, %arg2: memref<32x64xf32>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<32x64xf32>
          %1 = affine.load %arg1[%arg5, %arg4 + 32] : memref<64x64xf32>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg2[%arg3, %arg4 + 32] : memref<32x64xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg2[%arg3, %arg4 + 32] : memref<32x64xf32>
        }
      }
    }
    return
  }
  func @PE0_AIE1(%arg0: memref<32x64xf32>, %arg1: memref<64x64xf32>, %arg2: memref<32x64xf32>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %0 = affine.load %arg0[%arg3, %arg5 + 32] : memref<32x64xf32>
          %1 = affine.load %arg1[%arg5 + 32, %arg4] : memref<64x64xf32>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg2[%arg3, %arg4] : memref<32x64xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<32x64xf32>
        }
      }
    }
    return
  }
  func @PE0_AIE0(%arg0: memref<32x64xf32>, %arg1: memref<64x64xf32>, %arg2: memref<32x64xf32>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<32x64xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<64x64xf32>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg2[%arg3, %arg4] : memref<32x64xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<32x64xf32>
        }
      }
    }
    return
  }
  func @gemm(%arg0: memref<32x64xf32>, %arg1: memref<32x64xf32>, %arg2: memref<64x64xf32>) attributes {polyaie.top_func} {
    call @PE0_AIE0(%arg1, %arg2, %arg0) : (memref<32x64xf32>, memref<64x64xf32>, memref<32x64xf32>) -> ()
    call @PE0_AIE1(%arg1, %arg2, %arg0) : (memref<32x64xf32>, memref<64x64xf32>, memref<32x64xf32>) -> ()
    call @PE0_AIE2(%arg1, %arg2, %arg0) : (memref<32x64xf32>, memref<64x64xf32>, memref<32x64xf32>) -> ()
    call @PE0_AIE3(%arg1, %arg2, %arg0) : (memref<32x64xf32>, memref<64x64xf32>, memref<32x64xf32>) -> ()
    return
  }
}


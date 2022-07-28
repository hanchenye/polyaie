module {
  func @gemm(%arg0: memref<32x32xi32>, %arg1: memref<32x64xi32>, %arg2: memref<64x32xi32>) {
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 64 {
          %0 = affine.load %arg1[%arg3, %arg5] : memref<32x64xi32>
          %1 = affine.load %arg2[%arg5, %arg4] : memref<64x32xi32>
          %2 = arith.mulf %0, %1 : i32
          %3 = affine.load %arg0[%arg3, %arg4] : memref<32x32xi32>
          %4 = arith.addf %3, %2 : i32
          affine.store %4, %arg0[%arg3, %arg4] : memref<32x32xi32>
        }
      }
    }
    return
  }
}

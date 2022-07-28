#map0 = affine_map<(d0, d1) -> (d0 * 64 + d1 + 32)>
#map1 = affine_map<(d0, d1) -> (d0 * 64 + d1 + 2080)>
#map2 = affine_map<(d0, d1) -> (d0 * 64 + d1)>
#map3 = affine_map<(d0, d1) -> (d0 * 64 + d1 + 2048)>
module {
  func @PE0_AIE3(%arg0: memref<32x32xf32, #map0>, %arg1: memref<32x32xf32, #map1>, %arg2: memref<32x32xf32, #map0>) -> memref<32x32xf32, #map0> {
    %0 = memref.alloc() : memref<32x32xf32, #map0>
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        %1 = affine.load %arg2[%arg3, %arg4] : memref<32x32xf32, #map0>
        affine.store %1, %0[%arg3, %arg4] : memref<32x32xf32, #map0>
      }
    }
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %1 = affine.load %arg0[%arg3, %arg5] : memref<32x32xf32, #map0>
          %2 = affine.load %arg1[%arg5, %arg4] : memref<32x32xf32, #map1>
          %3 = arith.mulf %1, %2 : f32
          %4 = affine.load %0[%arg3, %arg4] : memref<32x32xf32, #map0>
          %5 = arith.addf %4, %3 : f32
          affine.store %5, %0[%arg3, %arg4] : memref<32x32xf32, #map0>
        }
      }
    }
    return %0 : memref<32x32xf32, #map0>
  }
  func @PE0_AIE2(%arg0: memref<32x32xf32, #map2>, %arg1: memref<32x32xf32, #map0>, %arg2: memref<32x32xf32, #map0>) -> memref<32x32xf32, #map0> {
    %0 = memref.alloc() : memref<32x32xf32, #map0>
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        %1 = affine.load %arg2[%arg3, %arg4] : memref<32x32xf32, #map0>
        affine.store %1, %0[%arg3, %arg4] : memref<32x32xf32, #map0>
      }
    }
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %1 = affine.load %arg0[%arg3, %arg5] : memref<32x32xf32, #map2>
          %2 = affine.load %arg1[%arg5, %arg4] : memref<32x32xf32, #map0>
          %3 = arith.mulf %1, %2 : f32
          %4 = affine.load %0[%arg3, %arg4] : memref<32x32xf32, #map0>
          %5 = arith.addf %4, %3 : f32
          affine.store %5, %0[%arg3, %arg4] : memref<32x32xf32, #map0>
        }
      }
    }
    return %0 : memref<32x32xf32, #map0>
  }
  func @PE0_AIE1(%arg0: memref<32x32xf32, #map0>, %arg1: memref<32x32xf32, #map3>, %arg2: memref<32x32xf32, #map2>) -> memref<32x32xf32, #map2> {
    %0 = memref.alloc() : memref<32x32xf32, #map2>
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        %1 = affine.load %arg2[%arg3, %arg4] : memref<32x32xf32, #map2>
        affine.store %1, %0[%arg3, %arg4] : memref<32x32xf32, #map2>
      }
    }
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %1 = affine.load %arg0[%arg3, %arg5] : memref<32x32xf32, #map0>
          %2 = affine.load %arg1[%arg5, %arg4] : memref<32x32xf32, #map3>
          %3 = arith.mulf %1, %2 : f32
          %4 = affine.load %0[%arg3, %arg4] : memref<32x32xf32, #map2>
          %5 = arith.addf %4, %3 : f32
          affine.store %5, %0[%arg3, %arg4] : memref<32x32xf32, #map2>
        }
      }
    }
    return %0 : memref<32x32xf32, #map2>
  }
  func @PE0_AIE0(%arg0: memref<32x32xf32, #map2>, %arg1: memref<32x32xf32, #map2>, %arg2: memref<32x32xf32, #map2>) -> memref<32x32xf32, #map2> {
    %0 = memref.alloc() : memref<32x32xf32, #map2>
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        %1 = affine.load %arg2[%arg3, %arg4] : memref<32x32xf32, #map2>
        affine.store %1, %0[%arg3, %arg4] : memref<32x32xf32, #map2>
      }
    }
    affine.for %arg3 = 0 to 32 {
      affine.for %arg4 = 0 to 32 {
        affine.for %arg5 = 0 to 32 {
          %1 = affine.load %arg0[%arg3, %arg5] : memref<32x32xf32, #map2>
          %2 = affine.load %arg1[%arg5, %arg4] : memref<32x32xf32, #map2>
          %3 = arith.mulf %1, %2 : f32
          %4 = affine.load %0[%arg3, %arg4] : memref<32x32xf32, #map2>
          %5 = arith.addf %4, %3 : f32
          affine.store %5, %0[%arg3, %arg4] : memref<32x32xf32, #map2>
        }
      }
    }
    return %0 : memref<32x32xf32, #map2>
  }
  func @gemm(%arg0: memref<32x64xf32>, %arg1: memref<32x64xf32>, %arg2: memref<64x64xf32>) attributes {polyaie.top_func} {
    %0 = memref.subview %arg2[32, 32] [32, 32] [1, 1] : memref<64x64xf32> to memref<32x32xf32, #map1>
    %1 = memref.subview %arg2[0, 32] [32, 32] [1, 1] : memref<64x64xf32> to memref<32x32xf32, #map0>
    %2 = memref.subview %arg0[0, 32] [32, 32] [1, 1] : memref<32x64xf32> to memref<32x32xf32, #map0>
    %3 = memref.subview %arg1[0, 32] [32, 32] [1, 1] : memref<32x64xf32> to memref<32x32xf32, #map0>
    %4 = memref.subview %arg2[32, 0] [32, 32] [1, 1] : memref<64x64xf32> to memref<32x32xf32, #map3>
    %5 = memref.subview %arg1[0, 0] [32, 32] [1, 1] : memref<32x64xf32> to memref<32x32xf32, #map2>
    %6 = memref.subview %arg2[0, 0] [32, 32] [1, 1] : memref<64x64xf32> to memref<32x32xf32, #map2>
    %7 = memref.subview %arg0[0, 0] [32, 32] [1, 1] : memref<32x64xf32> to memref<32x32xf32, #map2>
    %8 = call @PE0_AIE0(%5, %6, %7) : (memref<32x32xf32, #map2>, memref<32x32xf32, #map2>, memref<32x32xf32, #map2>) -> memref<32x32xf32, #map2>
    %9 = call @PE0_AIE1(%3, %4, %8) : (memref<32x32xf32, #map0>, memref<32x32xf32, #map3>, memref<32x32xf32, #map2>) -> memref<32x32xf32, #map2>
    memref.copy %9, %7 : memref<32x32xf32, #map2> to memref<32x32xf32, #map2>
    %10 = call @PE0_AIE2(%5, %1, %2) : (memref<32x32xf32, #map2>, memref<32x32xf32, #map0>, memref<32x32xf32, #map0>) -> memref<32x32xf32, #map0>
    %11 = call @PE0_AIE3(%3, %0, %10) : (memref<32x32xf32, #map0>, memref<32x32xf32, #map1>, memref<32x32xf32, #map0>) -> memref<32x32xf32, #map0>
    memref.copy %11, %2 : memref<32x32xf32, #map0> to memref<32x32xf32, #map0>
    return
  }
}


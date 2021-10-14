// RUN: polyaie-opt %s | FileCheck %s

// CHECK: module
#map0 = affine_map<()[s0] -> (s0 * 32)>
#map1 = affine_map<()[s0] -> (40, s0 * 32 + 32)>
#map2 = affine_map<()[s0] -> (50, 80, s0 * 32 + 32)>
#map3 = affine_map<()[s0] -> (80, s0 * 32 + 32)>
#map4 = affine_map<()[s0] -> (70, s0 * 32 + 32)>
#map5 = affine_map<()[s0] -> (50, s0 * 32 + 32)>
#set0 = affine_set<(d0) : (-d0 + 1 >= 0)>
#set1 = affine_set<(d0) : (-d0 + 2 >= 0, d0 - 2 >= 0)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"}  {
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00")
  llvm.mlir.global internal constant @str6("\0Aend   dump: %s\0A\00")
  llvm.mlir.global internal constant @str5("%0.2lf \00")
  llvm.mlir.global internal constant @str4("\0A\00")
  llvm.mlir.global internal constant @str3("D\00")
  llvm.mlir.global internal constant @str2("begin dump: %s\00")
  llvm.mlir.global internal constant @str1("==BEGIN DUMP_ARRAYS==\0A\00")
  llvm.mlir.global external @stderr() : !llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, ...) -> i32
  func @kernel_2mm__PE0__cloned_for__S0(%arg0: memref<40x50xf64>, %arg1: index, %arg2: index) {
    %cst = constant 0.000000e+00 : f64
    affine.for %arg3 = #map0()[%arg2] to min #map1()[%arg2] {
      affine.for %arg4 = #map0()[%arg1] to min #map2()[%arg1] {
        affine.store %cst, %arg0[%arg3, %arg4] : memref<40x50xf64>
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm__PE0__cloned_for__S2(%arg0: memref<40x80xf64>, %arg1: f64, %arg2: index, %arg3: index) {
    affine.for %arg4 = #map0()[%arg3] to min #map1()[%arg3] {
      affine.for %arg5 = #map0()[%arg2] to min #map3()[%arg2] {
        %0 = affine.load %arg0[%arg4, %arg5] : memref<40x80xf64>
        %1 = mulf %0, %arg1 : f64
        affine.store %1, %arg0[%arg4, %arg5] : memref<40x80xf64>
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm__PE1(%arg0: memref<40x80xf64>, %arg1: f64, %arg2: index, %arg3: index) {
    affine.for %arg4 = #map0()[%arg3] to min #map1()[%arg3] {
      affine.for %arg5 = #map0()[%arg2] to min #map3()[%arg2] {
        %0 = affine.load %arg0[%arg4, %arg5] : memref<40x80xf64>
        %1 = mulf %0, %arg1 : f64
        affine.store %1, %arg0[%arg4, %arg5] : memref<40x80xf64>
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm__PE2(%arg0: memref<40x50xf64>, %arg1: memref<70x50xf64>, %arg2: f64, %arg3: memref<40x70xf64>, %arg4: index, %arg5: index, %arg6: index) {
    affine.for %arg7 = #map0()[%arg6] to min #map1()[%arg6] {
      affine.for %arg8 = #map0()[%arg5] to min #map4()[%arg5] {
        affine.for %arg9 = #map0()[%arg4] to min #map5()[%arg4] {
          %0 = affine.load %arg0[%arg7, %arg9] : memref<40x50xf64>
          %1 = affine.load %arg3[%arg7, %arg8] : memref<40x70xf64>
          %2 = mulf %arg2, %1 : f64
          %3 = affine.load %arg1[%arg8, %arg9] : memref<70x50xf64>
          %4 = mulf %2, %3 : f64
          %5 = addf %0, %4 : f64
          affine.store %5, %arg0[%arg7, %arg9] : memref<40x50xf64>
        } {scop.point_loop}
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm__PE3(%arg0: memref<40x80xf64>, %arg1: memref<50x80xf64>, %arg2: memref<40x50xf64>, %arg3: index, %arg4: index, %arg5: index) {
    affine.for %arg6 = #map0()[%arg5] to min #map1()[%arg5] {
      affine.for %arg7 = #map0()[%arg4] to min #map5()[%arg4] {
        affine.for %arg8 = #map0()[%arg3] to min #map3()[%arg3] {
          %0 = affine.load %arg0[%arg6, %arg8] : memref<40x80xf64>
          %1 = affine.load %arg2[%arg6, %arg7] : memref<40x50xf64>
          %2 = affine.load %arg1[%arg7, %arg8] : memref<50x80xf64>
          %3 = mulf %1, %2 : f64
          %4 = addf %0, %3 : f64
          affine.store %4, %arg0[%arg6, %arg8] : memref<40x80xf64>
        } {scop.point_loop}
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm(%arg0: i32 {scop.constant_value = 40 : i32}, %arg1: i32 {scop.constant_value = 50 : i32}, %arg2: i32 {scop.constant_value = 70 : i32}, %arg3: i32 {scop.constant_value = 80 : i32}, %arg4: f64, %arg5: f64, %arg6: memref<40x50xf64>, %arg7: memref<40x70xf64>, %arg8: memref<70x50xf64>, %arg9: memref<50x80xf64>, %arg10: memref<40x80xf64>) {
    affine.for %arg11 = 0 to 2 {
      affine.for %arg12 = 0 to 5 {
        affine.if #set0(%arg12) {
          call @kernel_2mm__PE0__cloned_for__S2(%arg10, %arg5, %arg12, %arg11) {scop.pe} : (memref<40x80xf64>, f64, index, index) -> ()
          call @kernel_2mm__PE0__cloned_for__S0(%arg6, %arg12, %arg11) {scop.pe} : (memref<40x50xf64>, index, index) -> ()
        }
        affine.if #set1(%arg12) {
          call @kernel_2mm__PE1(%arg10, %arg5, %arg12, %arg11) {scop.pe} : (memref<40x80xf64>, f64, index, index) -> ()
        }
      }
    }
    affine.for %arg11 = 0 to 2 {
      affine.for %arg12 = 0 to 2 {
        affine.for %arg13 = 0 to 3 {
          call @kernel_2mm__PE2(%arg6, %arg8, %arg4, %arg7, %arg12, %arg13, %arg11) {scop.pe} : (memref<40x50xf64>, memref<70x50xf64>, f64, memref<40x70xf64>, index, index, index) -> ()
        }
        affine.for %arg13 = 0 to 3 {
          call @kernel_2mm__PE3(%arg10, %arg9, %arg6, %arg13, %arg12, %arg11) {scop.pe} : (memref<40x80xf64>, memref<50x80xf64>, memref<40x50xf64>, index, index, index) -> ()
        }
      }
    }
    return
  }
}


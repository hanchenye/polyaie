// RUN: polyaie-opt %s -polyaie-preprocess="top-func-name=kernel_2mm" -polyaie-convert-to-aie | FileCheck %s

// CHECK: module

#map0 = affine_map<()[s0] -> (s0 * 32)>
#map1 = affine_map<()[s0] -> (16, s0 * 32 + 32)>
#map2 = affine_map<()[s0] -> (18, 24, s0 * 32 + 32)>
#map3 = affine_map<()[s0] -> (24, s0 * 32 + 32)>
#map4 = affine_map<()[s0] -> (22, s0 * 32 + 32)>
#map5 = affine_map<()[s0] -> (18, s0 * 32 + 32)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu"}  {
  llvm.mlir.global internal constant @str6("==END   DUMP_ARRAYS==\0A\00")
  llvm.mlir.global internal constant @str5("\0Aend   dump: %s\0A\00")
  llvm.mlir.global internal constant @str4("%0.2lf \00")
  llvm.mlir.global internal constant @str3("\0A\00")
  llvm.mlir.global internal constant @str2("D\00")
  llvm.mlir.global internal constant @str1("begin dump: %s\00")
  llvm.mlir.global internal constant @str0("==BEGIN DUMP_ARRAYS==\0A\00")
  llvm.mlir.global external @stderr() : !llvm.ptr<struct<(i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<()>>, ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<()>>, ptr<struct<()>>, ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, ptr<i8>, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr<struct<(i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<()>>, ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<()>>, ptr<struct<()>>, ptr<struct<"struct._IO_FILE", (i32, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<i8>, ptr<struct<"struct._IO_marker", opaque>>, ptr<struct<"struct._IO_FILE">>, i32, i32, i64, i16, i8, array<1 x i8>, ptr<i8>, i64, ptr<struct<"struct._IO_codecvt", opaque>>, ptr<struct<"struct._IO_wide_data", opaque>>, ptr<struct<"struct._IO_FILE">>, ptr<i8>, i64, i32, array<20 x i8>)>>, ptr<i8>, i64, i32, array<20 x i8>)>>, !llvm.ptr<i8>, ...) -> i32
  func @kernel_2mm__PE0__cloned_for__S0(%arg0: memref<16x18xi32>, %arg1: index, %arg2: index) attributes {scop.pe} {
    %cst = constant 0 : i32
    affine.for %arg3 = #map0()[%arg2] to min #map1()[%arg2] {
      affine.for %arg4 = #map0()[%arg1] to min #map2()[%arg1] {
        affine.store %cst, %arg0[symbol(%arg3), symbol(%arg4)] : memref<16x18xi32>
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm__PE0__cloned_for__S2(%arg0: memref<16x24xi32>, %arg1: i32, %arg2: index, %arg3: index) attributes {scop.pe} {
    affine.for %arg4 = #map0()[%arg3] to min #map1()[%arg3] {
      affine.for %arg5 = #map0()[%arg2] to min #map3()[%arg2] {
        %0 = affine.load %arg0[symbol(%arg4), symbol(%arg5)] : memref<16x24xi32>
        %1 = muli %0, %arg1 : i32
        affine.store %1, %arg0[symbol(%arg4), symbol(%arg5)] : memref<16x24xi32>
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm__PE1(%arg0: memref<16x18xi32>, %arg1: memref<22x18xi32>, %arg2: i32, %arg3: memref<16x22xi32>, %arg4: index, %arg5: index, %arg6: index) attributes {scop.pe} {
    affine.for %arg7 = #map0()[%arg6] to min #map1()[%arg6] {
      affine.for %arg8 = #map0()[%arg5] to min #map4()[%arg5] {
        affine.for %arg9 = #map0()[%arg4] to min #map5()[%arg4] {
          %0 = affine.load %arg0[symbol(%arg7), symbol(%arg9)] : memref<16x18xi32>
          %1 = affine.load %arg3[symbol(%arg7), symbol(%arg8)] : memref<16x22xi32>
          %2 = muli %arg2, %1 : i32
          %3 = affine.load %arg1[symbol(%arg8), symbol(%arg9)] : memref<22x18xi32>
          %4 = muli %2, %3 : i32
          %5 = addi %0, %4 : i32
          affine.store %5, %arg0[symbol(%arg7), symbol(%arg9)] : memref<16x18xi32>
        } {scop.point_loop}
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm__PE2(%arg0: memref<16x24xi32>, %arg1: memref<18x24xi32>, %arg2: memref<16x18xi32>, %arg3: index, %arg4: index, %arg5: index) attributes {scop.pe} {
    affine.for %arg6 = #map0()[%arg5] to min #map1()[%arg5] {
      affine.for %arg7 = #map0()[%arg4] to min #map5()[%arg4] {
        affine.for %arg8 = #map0()[%arg3] to min #map3()[%arg3] {
          %0 = affine.load %arg0[symbol(%arg6), symbol(%arg8)] : memref<16x24xi32>
          %1 = affine.load %arg2[symbol(%arg6), symbol(%arg7)] : memref<16x18xi32>
          %2 = affine.load %arg1[symbol(%arg7), symbol(%arg8)] : memref<18x24xi32>
          %3 = muli %1, %2 : i32
          %4 = addi %0, %3 : i32
          affine.store %4, %arg0[symbol(%arg6), symbol(%arg8)] : memref<16x24xi32>
        } {scop.point_loop}
      } {scop.point_loop}
    } {scop.point_loop}
    return
  }
  func @kernel_2mm(%arg0: i32 {scop.constant_value = 16 : i32}, %arg1: i32 {scop.constant_value = 18 : i32}, %arg2: i32 {scop.constant_value = 22 : i32}, %arg3: i32 {scop.constant_value = 24 : i32}, %arg4: i32, %arg5: i32, %arg6: memref<16x18xi32>, %arg7: memref<16x22xi32>, %arg8: memref<22x18xi32>, %arg9: memref<18x24xi32>, %arg10: memref<16x24xi32>) {
    affine.for %arg11 = 0 to 1 {
      affine.for %arg12 = 0 to 2 {
        %c0 = constant 0 : index
        %c-1 = constant -1 : index
        %0 = muli %arg12, %c-1 : index
        %1 = cmpi sge, %0, %c0 : index
        call @kernel_2mm__PE0__cloned_for__S2(%arg10, %arg5, %arg12, %arg11) {scop.pe} : (memref<16x24xi32>, i32, index, index) -> ()
        call @kernel_2mm__PE0__cloned_for__S0(%arg6, %arg12, %arg11) {scop.pe} : (memref<16x18xi32>, index, index) -> ()
      }
    }
    affine.for %arg11 = 0 to 1 {
      affine.for %arg12 = 0 to 1 {
        affine.for %arg13 = 0 to 1 {
          call @kernel_2mm__PE1(%arg6, %arg8, %arg4, %arg7, %arg12, %arg13, %arg11) {scop.pe} : (memref<16x18xi32>, memref<22x18xi32>, i32, memref<16x22xi32>, index, index, index) -> ()
        }
        affine.for %arg13 = 0 to 1 {
          call @kernel_2mm__PE2(%arg10, %arg9, %arg6, %arg13, %arg12, %arg11) {scop.pe} : (memref<16x24xi32>, memref<18x24xi32>, memref<16x18xi32>, index, index, index) -> ()
        }
      }
    }
    return
  }
}

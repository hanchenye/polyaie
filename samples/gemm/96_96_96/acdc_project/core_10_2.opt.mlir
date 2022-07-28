module @gemm attributes {llvm.data_layout = "", llvm.target_triple = "aie"} {
  llvm.func @debug_i32(i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.ms(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.wms(i32, i128) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.fms(i32, f32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.ss(i32) -> i32 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.wss(i32) -> i128 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.fss(i32) -> f32 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.put.mcd(i384) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.get.scd() -> i384 attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.lock.acquire.reg(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @llvm.aie.lock.release.reg(i32, i32) attributes {sym_visibility = "private"}
  llvm.func @extern_kernel(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {sym_visibility = "private"}
  llvm.mlir.global external @buf31() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @bui32() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf33() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf37() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf38() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf39() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf40() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf27() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf28() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf29() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf30() : !llvm.array<32 x array<32 x i32>>
  llvm.func @core102() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(17 : i32) : i32
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(34 : i32) : i32
    %4 = llvm.mlir.constant(16 : i32) : i32
    %5 = llvm.mlir.addressof @buf27 : !llvm.ptr<array<32 x array<32 x i32>>>
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.getelementptr %5[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %8 = llvm.mlir.constant(31 : index) : i64
    %9 = llvm.ptrtoint %7 : !llvm.ptr<i32> to i64
    %10 = llvm.and %9, %8  : i64
    %11 = llvm.icmp "eq" %10, %6 : i64
    "llvm.intr.assume"(%11) : (i1) -> ()
    %12 = llvm.mlir.addressof @buf28 : !llvm.ptr<array<32 x array<32 x i32>>>
    %13 = llvm.getelementptr %12[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %14 = llvm.ptrtoint %13 : !llvm.ptr<i32> to i64
    %15 = llvm.and %14, %8  : i64
    %16 = llvm.icmp "eq" %15, %6 : i64
    "llvm.intr.assume"(%16) : (i1) -> ()
    %17 = llvm.mlir.addressof @buf29 : !llvm.ptr<array<32 x array<32 x i32>>>
    %18 = llvm.getelementptr %17[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<i32> to i64
    %20 = llvm.and %19, %8  : i64
    %21 = llvm.icmp "eq" %20, %6 : i64
    "llvm.intr.assume"(%21) : (i1) -> ()
    %22 = llvm.mlir.addressof @buf30 : !llvm.ptr<array<32 x array<32 x i32>>>
    %23 = llvm.getelementptr %22[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %24 = llvm.ptrtoint %23 : !llvm.ptr<i32> to i64
    %25 = llvm.and %24, %8  : i64
    %26 = llvm.icmp "eq" %25, %6 : i64
    "llvm.intr.assume"(%26) : (i1) -> ()
    %27 = llvm.mlir.addressof @buf37 : !llvm.ptr<array<32 x array<32 x i32>>>
    %28 = llvm.getelementptr %27[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %29 = llvm.ptrtoint %28 : !llvm.ptr<i32> to i64
    %30 = llvm.and %29, %8  : i64
    %31 = llvm.icmp "eq" %30, %6 : i64
    "llvm.intr.assume"(%31) : (i1) -> ()
    %32 = llvm.mlir.addressof @buf38 : !llvm.ptr<array<32 x array<32 x i32>>>
    %33 = llvm.getelementptr %32[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %34 = llvm.ptrtoint %33 : !llvm.ptr<i32> to i64
    %35 = llvm.and %34, %8  : i64
    %36 = llvm.icmp "eq" %35, %6 : i64
    "llvm.intr.assume"(%36) : (i1) -> ()
    %37 = llvm.mlir.addressof @buf39 : !llvm.ptr<array<32 x array<32 x i32>>>
    %38 = llvm.getelementptr %37[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %39 = llvm.ptrtoint %38 : !llvm.ptr<i32> to i64
    %40 = llvm.and %39, %8  : i64
    %41 = llvm.icmp "eq" %40, %6 : i64
    "llvm.intr.assume"(%41) : (i1) -> ()
    %42 = llvm.mlir.addressof @buf40 : !llvm.ptr<array<32 x array<32 x i32>>>
    %43 = llvm.getelementptr %42[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %44 = llvm.ptrtoint %43 : !llvm.ptr<i32> to i64
    %45 = llvm.and %44, %8  : i64
    %46 = llvm.icmp "eq" %45, %6 : i64
    "llvm.intr.assume"(%46) : (i1) -> ()
    %47 = llvm.mlir.addressof @buf31 : !llvm.ptr<array<32 x array<32 x i32>>>
    %48 = llvm.getelementptr %47[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %49 = llvm.ptrtoint %48 : !llvm.ptr<i32> to i64
    %50 = llvm.and %49, %8  : i64
    %51 = llvm.icmp "eq" %50, %6 : i64
    "llvm.intr.assume"(%51) : (i1) -> ()
    %52 = llvm.mlir.addressof @bui32 : !llvm.ptr<array<32 x array<32 x i32>>>
    %53 = llvm.getelementptr %52[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %54 = llvm.ptrtoint %53 : !llvm.ptr<i32> to i64
    %55 = llvm.and %54, %8  : i64
    %56 = llvm.icmp "eq" %55, %6 : i64
    "llvm.intr.assume"(%56) : (i1) -> ()
    %57 = llvm.mlir.addressof @buf33 : !llvm.ptr<array<32 x array<32 x i32>>>
    %58 = llvm.getelementptr %57[%6, %6, %6] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %59 = llvm.ptrtoint %58 : !llvm.ptr<i32> to i64
    %60 = llvm.and %59, %8  : i64
    %61 = llvm.icmp "eq" %60, %6 : i64
    "llvm.intr.assume"(%61) : (i1) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%1, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%3, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%4, %2) : (i32, i32) -> ()
    llvm.call @extern_kernel(%23, %7, %13, %18) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.call @llvm.aie.lock.release.reg(%4, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%3, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%1, %0) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core102() : () -> ()
    llvm.return
  }
}


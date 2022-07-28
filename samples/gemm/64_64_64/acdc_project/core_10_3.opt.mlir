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
  llvm.mlir.global external @buf12() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf13() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf14() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf15() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf16() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf17() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf18() : !llvm.array<32 x array<32 x i32>>
  llvm.func @core103() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(63 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(51 : i32) : i32
    %4 = llvm.mlir.constant(48 : i32) : i32
    %5 = llvm.mlir.constant(50 : i32) : i32
    %6 = llvm.mlir.constant(49 : i32) : i32
    %7 = llvm.mlir.addressof @buf16 : !llvm.ptr<array<32 x array<32 x i32>>>
    %8 = llvm.mlir.constant(0 : index) : i64
    %9 = llvm.getelementptr %7[%8, %8, %8] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %10 = llvm.mlir.constant(31 : index) : i64
    %11 = llvm.ptrtoint %9 : !llvm.ptr<i32> to i64
    %12 = llvm.and %11, %10  : i64
    %13 = llvm.icmp "eq" %12, %8 : i64
    "llvm.intr.assume"(%13) : (i1) -> ()
    %14 = llvm.mlir.addressof @buf17 : !llvm.ptr<array<32 x array<32 x i32>>>
    %15 = llvm.getelementptr %14[%8, %8, %8] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %16 = llvm.ptrtoint %15 : !llvm.ptr<i32> to i64
    %17 = llvm.and %16, %10  : i64
    %18 = llvm.icmp "eq" %17, %8 : i64
    "llvm.intr.assume"(%18) : (i1) -> ()
    %19 = llvm.mlir.addressof @buf18 : !llvm.ptr<array<32 x array<32 x i32>>>
    %20 = llvm.getelementptr %19[%8, %8, %8] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %21 = llvm.ptrtoint %20 : !llvm.ptr<i32> to i64
    %22 = llvm.and %21, %10  : i64
    %23 = llvm.icmp "eq" %22, %8 : i64
    "llvm.intr.assume"(%23) : (i1) -> ()
    %24 = llvm.mlir.addressof @buf12 : !llvm.ptr<array<32 x array<32 x i32>>>
    %25 = llvm.getelementptr %24[%8, %8, %8] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %26 = llvm.ptrtoint %25 : !llvm.ptr<i32> to i64
    %27 = llvm.and %26, %10  : i64
    %28 = llvm.icmp "eq" %27, %8 : i64
    "llvm.intr.assume"(%28) : (i1) -> ()
    %29 = llvm.mlir.addressof @buf13 : !llvm.ptr<array<32 x array<32 x i32>>>
    %30 = llvm.getelementptr %29[%8, %8, %8] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %31 = llvm.ptrtoint %30 : !llvm.ptr<i32> to i64
    %32 = llvm.and %31, %10  : i64
    %33 = llvm.icmp "eq" %32, %8 : i64
    "llvm.intr.assume"(%33) : (i1) -> ()
    %34 = llvm.mlir.addressof @buf14 : !llvm.ptr<array<32 x array<32 x i32>>>
    %35 = llvm.getelementptr %34[%8, %8, %8] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %36 = llvm.ptrtoint %35 : !llvm.ptr<i32> to i64
    %37 = llvm.and %36, %10  : i64
    %38 = llvm.icmp "eq" %37, %8 : i64
    "llvm.intr.assume"(%38) : (i1) -> ()
    %39 = llvm.mlir.addressof @buf15 : !llvm.ptr<array<32 x array<32 x i32>>>
    %40 = llvm.getelementptr %39[%8, %8, %8] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %41 = llvm.ptrtoint %40 : !llvm.ptr<i32> to i64
    %42 = llvm.and %41, %10  : i64
    %43 = llvm.icmp "eq" %42, %8 : i64
    "llvm.intr.assume"(%43) : (i1) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%3, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%4, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%5, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%6, %0) : (i32, i32) -> ()
    llvm.call @extern_kernel(%25, %9, %15, %20) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.call @llvm.aie.lock.release.reg(%6, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%5, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%4, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%3, %2) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%1, %0) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core103() : () -> ()
    llvm.return
  }
}


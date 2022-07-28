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
  llvm.mlir.global external @buf29() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf30() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf31() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @bui32() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf33() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf34() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf25() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf26() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf27() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf28() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf19() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf20() : !llvm.array<32 x array<32 x i32>>
  llvm.mlir.global external @buf21() : !llvm.array<32 x array<32 x i32>>
  llvm.func @core113() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(49 : i32) : i32
    %2 = llvm.mlir.constant(50 : i32) : i32
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(35 : i32) : i32
    %5 = llvm.mlir.constant(48 : i32) : i32
    %6 = llvm.mlir.addressof @buf19 : !llvm.ptr<array<32 x array<32 x i32>>>
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.getelementptr %6[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %9 = llvm.mlir.constant(31 : index) : i64
    %10 = llvm.ptrtoint %8 : !llvm.ptr<i32> to i64
    %11 = llvm.and %10, %9  : i64
    %12 = llvm.icmp "eq" %11, %7 : i64
    "llvm.intr.assume"(%12) : (i1) -> ()
    %13 = llvm.mlir.addressof @buf20 : !llvm.ptr<array<32 x array<32 x i32>>>
    %14 = llvm.getelementptr %13[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %15 = llvm.ptrtoint %14 : !llvm.ptr<i32> to i64
    %16 = llvm.and %15, %9  : i64
    %17 = llvm.icmp "eq" %16, %7 : i64
    "llvm.intr.assume"(%17) : (i1) -> ()
    %18 = llvm.mlir.addressof @buf21 : !llvm.ptr<array<32 x array<32 x i32>>>
    %19 = llvm.getelementptr %18[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %20 = llvm.ptrtoint %19 : !llvm.ptr<i32> to i64
    %21 = llvm.and %20, %9  : i64
    %22 = llvm.icmp "eq" %21, %7 : i64
    "llvm.intr.assume"(%22) : (i1) -> ()
    %23 = llvm.mlir.addressof @buf25 : !llvm.ptr<array<32 x array<32 x i32>>>
    %24 = llvm.getelementptr %23[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %25 = llvm.ptrtoint %24 : !llvm.ptr<i32> to i64
    %26 = llvm.and %25, %9  : i64
    %27 = llvm.icmp "eq" %26, %7 : i64
    "llvm.intr.assume"(%27) : (i1) -> ()
    %28 = llvm.mlir.addressof @buf26 : !llvm.ptr<array<32 x array<32 x i32>>>
    %29 = llvm.getelementptr %28[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %30 = llvm.ptrtoint %29 : !llvm.ptr<i32> to i64
    %31 = llvm.and %30, %9  : i64
    %32 = llvm.icmp "eq" %31, %7 : i64
    "llvm.intr.assume"(%32) : (i1) -> ()
    %33 = llvm.mlir.addressof @buf27 : !llvm.ptr<array<32 x array<32 x i32>>>
    %34 = llvm.getelementptr %33[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %35 = llvm.ptrtoint %34 : !llvm.ptr<i32> to i64
    %36 = llvm.and %35, %9  : i64
    %37 = llvm.icmp "eq" %36, %7 : i64
    "llvm.intr.assume"(%37) : (i1) -> ()
    %38 = llvm.mlir.addressof @buf28 : !llvm.ptr<array<32 x array<32 x i32>>>
    %39 = llvm.getelementptr %38[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %40 = llvm.ptrtoint %39 : !llvm.ptr<i32> to i64
    %41 = llvm.and %40, %9  : i64
    %42 = llvm.icmp "eq" %41, %7 : i64
    "llvm.intr.assume"(%42) : (i1) -> ()
    %43 = llvm.mlir.addressof @bui32 : !llvm.ptr<array<32 x array<32 x i32>>>
    %44 = llvm.getelementptr %43[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %45 = llvm.ptrtoint %44 : !llvm.ptr<i32> to i64
    %46 = llvm.and %45, %9  : i64
    %47 = llvm.icmp "eq" %46, %7 : i64
    "llvm.intr.assume"(%47) : (i1) -> ()
    %48 = llvm.mlir.addressof @buf33 : !llvm.ptr<array<32 x array<32 x i32>>>
    %49 = llvm.getelementptr %48[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %50 = llvm.ptrtoint %49 : !llvm.ptr<i32> to i64
    %51 = llvm.and %50, %9  : i64
    %52 = llvm.icmp "eq" %51, %7 : i64
    "llvm.intr.assume"(%52) : (i1) -> ()
    %53 = llvm.mlir.addressof @buf34 : !llvm.ptr<array<32 x array<32 x i32>>>
    %54 = llvm.getelementptr %53[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %55 = llvm.ptrtoint %54 : !llvm.ptr<i32> to i64
    %56 = llvm.and %55, %9  : i64
    %57 = llvm.icmp "eq" %56, %7 : i64
    "llvm.intr.assume"(%57) : (i1) -> ()
    %58 = llvm.mlir.addressof @buf29 : !llvm.ptr<array<32 x array<32 x i32>>>
    %59 = llvm.getelementptr %58[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %60 = llvm.ptrtoint %59 : !llvm.ptr<i32> to i64
    %61 = llvm.and %60, %9  : i64
    %62 = llvm.icmp "eq" %61, %7 : i64
    "llvm.intr.assume"(%62) : (i1) -> ()
    %63 = llvm.mlir.addressof @buf30 : !llvm.ptr<array<32 x array<32 x i32>>>
    %64 = llvm.getelementptr %63[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %65 = llvm.ptrtoint %64 : !llvm.ptr<i32> to i64
    %66 = llvm.and %65, %9  : i64
    %67 = llvm.icmp "eq" %66, %7 : i64
    "llvm.intr.assume"(%67) : (i1) -> ()
    %68 = llvm.mlir.addressof @buf31 : !llvm.ptr<array<32 x array<32 x i32>>>
    %69 = llvm.getelementptr %68[%7, %7, %7] : (!llvm.ptr<array<32 x array<32 x i32>>>, i64, i64, i64) -> !llvm.ptr<i32>
    %70 = llvm.ptrtoint %69 : !llvm.ptr<i32> to i64
    %71 = llvm.and %70, %9  : i64
    %72 = llvm.icmp "eq" %71, %7 : i64
    "llvm.intr.assume"(%72) : (i1) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%1, %3) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%2, %3) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%4, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.acquire.reg(%5, %3) : (i32, i32) -> ()
    llvm.call @extern_kernel(%24, %59, %64, %69) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    llvm.call @llvm.aie.lock.release.reg(%5, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%4, %3) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%2, %0) : (i32, i32) -> ()
    llvm.call @llvm.aie.lock.release.reg(%1, %0) : (i32, i32) -> ()
    llvm.return
  }
  llvm.func @_main() {
    llvm.call @core113() : () -> ()
    llvm.return
  }
}


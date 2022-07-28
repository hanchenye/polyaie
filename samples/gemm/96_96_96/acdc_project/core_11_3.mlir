module @gemm attributes {llvm.target_triple = "aie"} {
  func private @debug_i32(i32)
  func private @llvm.aie.put.ms(i32, i32)
  func private @llvm.aie.put.wms(i32, i128)
  func private @llvm.aie.put.fms(i32, f32)
  func private @llvm.aie.get.ss(i32) -> i32
  func private @llvm.aie.get.wss(i32) -> i128
  func private @llvm.aie.get.fss(i32) -> f32
  func private @llvm.aie.put.mcd(i384)
  func private @llvm.aie.get.scd() -> i384
  func private @llvm.aie.lock.acquire.reg(i32, i32)
  func private @llvm.aie.lock.release.reg(i32, i32)
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  memref.global "public" @buf31 : memref<32x32xi32>
  memref.global "public" @bui32 : memref<32x32xi32>
  memref.global "public" @buf33 : memref<32x32xi32>
  memref.global "public" @buf37 : memref<32x32xi32>
  memref.global "public" @buf38 : memref<32x32xi32>
  memref.global "public" @buf39 : memref<32x32xi32>
  memref.global "public" @buf40 : memref<32x32xi32>
  memref.global "public" @buf44 : memref<32x32xi32>
  memref.global "public" @buf45 : memref<32x32xi32>
  memref.global "public" @buf46 : memref<32x32xi32>
  memref.global "public" @buf41 : memref<32x32xi32>
  memref.global "public" @buf42 : memref<32x32xi32>
  memref.global "public" @buf43 : memref<32x32xi32>
  func @core113() {
    %0 = memref.get_global @buf41 : memref<32x32xi32>
    memref.assume_alignment %0, 32 : memref<32x32xi32>
    %1 = memref.get_global @buf42 : memref<32x32xi32>
    memref.assume_alignment %1, 32 : memref<32x32xi32>
    %2 = memref.get_global @buf43 : memref<32x32xi32>
    memref.assume_alignment %2, 32 : memref<32x32xi32>
    %3 = memref.get_global @buf44 : memref<32x32xi32>
    memref.assume_alignment %3, 32 : memref<32x32xi32>
    %4 = memref.get_global @buf45 : memref<32x32xi32>
    memref.assume_alignment %4, 32 : memref<32x32xi32>
    %5 = memref.get_global @buf46 : memref<32x32xi32>
    memref.assume_alignment %5, 32 : memref<32x32xi32>
    %6 = memref.get_global @buf37 : memref<32x32xi32>
    memref.assume_alignment %6, 32 : memref<32x32xi32>
    %7 = memref.get_global @buf38 : memref<32x32xi32>
    memref.assume_alignment %7, 32 : memref<32x32xi32>
    %8 = memref.get_global @buf39 : memref<32x32xi32>
    memref.assume_alignment %8, 32 : memref<32x32xi32>
    %9 = memref.get_global @buf40 : memref<32x32xi32>
    memref.assume_alignment %9, 32 : memref<32x32xi32>
    %10 = memref.get_global @buf31 : memref<32x32xi32>
    memref.assume_alignment %10, 32 : memref<32x32xi32>
    %11 = memref.get_global @bui32 : memref<32x32xi32>
    memref.assume_alignment %11, 32 : memref<32x32xi32>
    %12 = memref.get_global @buf33 : memref<32x32xi32>
    memref.assume_alignment %12, 32 : memref<32x32xi32>
    %c47 = arith.constant 47 : index
    %c35 = arith.constant 35 : index
    %c34 = arith.constant 34 : index
    %c33 = arith.constant 33 : index
    %c32 = arith.constant 32 : index
    %c50 = arith.constant 50 : index
    %c49 = arith.constant 49 : index
    %c48 = arith.constant 48 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c18 = arith.constant 18 : index
    %c17 = arith.constant 17 : index
    %c16 = arith.constant 16 : index
    %13 = arith.index_cast %c35 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%13, %c0_i32) : (i32, i32) -> ()
    %14 = arith.index_cast %c49 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%14, %c1_i32) : (i32, i32) -> ()
    %15 = arith.index_cast %c48 : index to i32
    %c1_i32_0 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%15, %c1_i32_0) : (i32, i32) -> ()
    %16 = arith.index_cast %c50 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%16, %c1_i32_1) : (i32, i32) -> ()
    call @extern_kernel(%6, %0, %1, %2) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    %17 = arith.index_cast %c50 : index to i32
    %c0_i32_2 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%17, %c0_i32_2) : (i32, i32) -> ()
    %18 = arith.index_cast %c48 : index to i32
    %c0_i32_3 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%18, %c0_i32_3) : (i32, i32) -> ()
    %19 = arith.index_cast %c49 : index to i32
    %c0_i32_4 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%19, %c0_i32_4) : (i32, i32) -> ()
    %20 = arith.index_cast %c35 : index to i32
    %c1_i32_5 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%20, %c1_i32_5) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core113() : () -> ()
    return
  }
}


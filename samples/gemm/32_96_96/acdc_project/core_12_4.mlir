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
  memref.global "public" @buf39 : memref<32x32xi32>
  memref.global "public" @buf40 : memref<32x32xi32>
  memref.global "public" @buf41 : memref<32x32xi32>
  memref.global "public" @buf42 : memref<32x32xi32>
  memref.global "public" @buf43 : memref<32x32xi32>
  memref.global "public" @buf44 : memref<32x32xi32>
  func @core124() {
    %0 = memref.get_global @buf42 : memref<32x32xi32>
    memref.assume_alignment %0, 32 : memref<32x32xi32>
    %1 = memref.get_global @buf43 : memref<32x32xi32>
    memref.assume_alignment %1, 32 : memref<32x32xi32>
    %2 = memref.get_global @buf44 : memref<32x32xi32>
    memref.assume_alignment %2, 32 : memref<32x32xi32>
    %3 = memref.get_global @buf39 : memref<32x32xi32>
    memref.assume_alignment %3, 32 : memref<32x32xi32>
    %4 = memref.get_global @buf40 : memref<32x32xi32>
    memref.assume_alignment %4, 32 : memref<32x32xi32>
    %5 = memref.get_global @buf41 : memref<32x32xi32>
    memref.assume_alignment %5, 32 : memref<32x32xi32>
    %c31 = arith.constant 31 : index
    %c19 = arith.constant 19 : index
    %c18 = arith.constant 18 : index
    %c17 = arith.constant 17 : index
    %c16 = arith.constant 16 : index
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %6 = arith.index_cast %c19 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%6, %c1_i32) : (i32, i32) -> ()
    %7 = arith.index_cast %c18 : index to i32
    %c1_i32_0 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%7, %c1_i32_0) : (i32, i32) -> ()
    %8 = arith.index_cast %c16 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%8, %c1_i32_1) : (i32, i32) -> ()
    %9 = arith.index_cast %c17 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%9, %c0_i32) : (i32, i32) -> ()
    call @extern_kernel(%3, %0, %1, %2) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    %10 = arith.index_cast %c17 : index to i32
    %c1_i32_2 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%10, %c1_i32_2) : (i32, i32) -> ()
    %11 = arith.index_cast %c16 : index to i32
    %c0_i32_3 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%11, %c0_i32_3) : (i32, i32) -> ()
    %12 = arith.index_cast %c18 : index to i32
    %c0_i32_4 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%12, %c0_i32_4) : (i32, i32) -> ()
    %13 = arith.index_cast %c19 : index to i32
    %c0_i32_5 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%13, %c0_i32_5) : (i32, i32) -> ()
    %14 = arith.index_cast %c31 : index to i32
    %c1_i32_6 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%14, %c1_i32_6) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core124() : () -> ()
    return
  }
}


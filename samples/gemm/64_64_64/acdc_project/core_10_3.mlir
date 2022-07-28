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
  memref.global "public" @buf12 : memref<32x32xi32>
  memref.global "public" @buf13 : memref<32x32xi32>
  memref.global "public" @buf14 : memref<32x32xi32>
  memref.global "public" @buf15 : memref<32x32xi32>
  memref.global "public" @buf16 : memref<32x32xi32>
  memref.global "public" @buf17 : memref<32x32xi32>
  memref.global "public" @buf18 : memref<32x32xi32>
  func @core103() {
    %0 = memref.get_global @buf16 : memref<32x32xi32>
    memref.assume_alignment %0, 32 : memref<32x32xi32>
    %1 = memref.get_global @buf17 : memref<32x32xi32>
    memref.assume_alignment %1, 32 : memref<32x32xi32>
    %2 = memref.get_global @buf18 : memref<32x32xi32>
    memref.assume_alignment %2, 32 : memref<32x32xi32>
    %3 = memref.get_global @buf12 : memref<32x32xi32>
    memref.assume_alignment %3, 32 : memref<32x32xi32>
    %4 = memref.get_global @buf13 : memref<32x32xi32>
    memref.assume_alignment %4, 32 : memref<32x32xi32>
    %5 = memref.get_global @buf14 : memref<32x32xi32>
    memref.assume_alignment %5, 32 : memref<32x32xi32>
    %6 = memref.get_global @buf15 : memref<32x32xi32>
    memref.assume_alignment %6, 32 : memref<32x32xi32>
    %c63 = arith.constant 63 : index
    %c51 = arith.constant 51 : index
    %c50 = arith.constant 50 : index
    %c49 = arith.constant 49 : index
    %c48 = arith.constant 48 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %7 = arith.index_cast %c51 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%7, %c1_i32) : (i32, i32) -> ()
    %8 = arith.index_cast %c48 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%8, %c0_i32) : (i32, i32) -> ()
    %9 = arith.index_cast %c50 : index to i32
    %c1_i32_0 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%9, %c1_i32_0) : (i32, i32) -> ()
    %10 = arith.index_cast %c49 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%10, %c1_i32_1) : (i32, i32) -> ()
    call @extern_kernel(%3, %0, %1, %2) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    %11 = arith.index_cast %c49 : index to i32
    %c0_i32_2 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%11, %c0_i32_2) : (i32, i32) -> ()
    %12 = arith.index_cast %c50 : index to i32
    %c0_i32_3 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%12, %c0_i32_3) : (i32, i32) -> ()
    %13 = arith.index_cast %c48 : index to i32
    %c1_i32_4 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%13, %c1_i32_4) : (i32, i32) -> ()
    %14 = arith.index_cast %c51 : index to i32
    %c0_i32_5 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%14, %c0_i32_5) : (i32, i32) -> ()
    %15 = arith.index_cast %c63 : index to i32
    %c1_i32_6 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%15, %c1_i32_6) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core103() : () -> ()
    return
  }
}


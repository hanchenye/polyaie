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
  memref.global "public" @buf35 : memref<32x32xi32>
  memref.global "public" @buf36 : memref<32x32xi32>
  memref.global "public" @buf37 : memref<32x32xi32>
  memref.global "public" @buf38 : memref<32x32xi32>
  func @core122() {
    %0 = memref.get_global @buf35 : memref<32x32xi32>
    memref.assume_alignment %0, 32 : memref<32x32xi32>
    %1 = memref.get_global @buf36 : memref<32x32xi32>
    memref.assume_alignment %1, 32 : memref<32x32xi32>
    %2 = memref.get_global @buf37 : memref<32x32xi32>
    memref.assume_alignment %2, 32 : memref<32x32xi32>
    %3 = memref.get_global @buf38 : memref<32x32xi32>
    memref.assume_alignment %3, 32 : memref<32x32xi32>
    %4 = memref.get_global @buf39 : memref<32x32xi32>
    memref.assume_alignment %4, 32 : memref<32x32xi32>
    %5 = memref.get_global @buf40 : memref<32x32xi32>
    memref.assume_alignment %5, 32 : memref<32x32xi32>
    %6 = memref.get_global @buf41 : memref<32x32xi32>
    memref.assume_alignment %6, 32 : memref<32x32xi32>
    %c34 = arith.constant 34 : index
    %c33 = arith.constant 33 : index
    %c32 = arith.constant 32 : index
    %c17 = arith.constant 17 : index
    %c16 = arith.constant 16 : index
    %7 = arith.index_cast %c17 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%7, %c1_i32) : (i32, i32) -> ()
    %8 = arith.index_cast %c16 : index to i32
    %c1_i32_0 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%8, %c1_i32_0) : (i32, i32) -> ()
    %9 = arith.index_cast %c32 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%9, %c0_i32) : (i32, i32) -> ()
    call @extern_kernel(%3, %0, %1, %2) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    %10 = arith.index_cast %c32 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%10, %c1_i32_1) : (i32, i32) -> ()
    %11 = arith.index_cast %c16 : index to i32
    %c0_i32_2 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%11, %c0_i32_2) : (i32, i32) -> ()
    %12 = arith.index_cast %c17 : index to i32
    %c0_i32_3 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%12, %c0_i32_3) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core122() : () -> ()
    return
  }
}


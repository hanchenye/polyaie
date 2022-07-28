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
  memref.global "public" @buf19 : memref<32x32xi32>
  memref.global "public" @buf20 : memref<32x32xi32>
  memref.global "public" @buf21 : memref<32x32xi32>
  memref.global "public" @buf22 : memref<32x32xi32>
  memref.global "public" @buf23 : memref<32x32xi32>
  memref.global "public" @buf24 : memref<32x32xi32>
  memref.global "public" @buf15 : memref<32x32xi32>
  memref.global "public" @buf16 : memref<32x32xi32>
  memref.global "public" @buf17 : memref<32x32xi32>
  memref.global "public" @buf18 : memref<32x32xi32>
  func @core103() {
    %0 = memref.get_global @buf15 : memref<32x32xi32>
    memref.assume_alignment %0, 32 : memref<32x32xi32>
    %1 = memref.get_global @buf16 : memref<32x32xi32>
    memref.assume_alignment %1, 32 : memref<32x32xi32>
    %2 = memref.get_global @buf17 : memref<32x32xi32>
    memref.assume_alignment %2, 32 : memref<32x32xi32>
    %3 = memref.get_global @buf18 : memref<32x32xi32>
    memref.assume_alignment %3, 32 : memref<32x32xi32>
    %4 = memref.get_global @buf22 : memref<32x32xi32>
    memref.assume_alignment %4, 32 : memref<32x32xi32>
    %5 = memref.get_global @buf23 : memref<32x32xi32>
    memref.assume_alignment %5, 32 : memref<32x32xi32>
    %6 = memref.get_global @buf24 : memref<32x32xi32>
    memref.assume_alignment %6, 32 : memref<32x32xi32>
    %7 = memref.get_global @buf19 : memref<32x32xi32>
    memref.assume_alignment %7, 32 : memref<32x32xi32>
    %8 = memref.get_global @buf20 : memref<32x32xi32>
    memref.assume_alignment %8, 32 : memref<32x32xi32>
    %9 = memref.get_global @buf21 : memref<32x32xi32>
    memref.assume_alignment %9, 32 : memref<32x32xi32>
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
    %10 = arith.index_cast %c48 : index to i32
    %c1_i32 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%10, %c1_i32) : (i32, i32) -> ()
    %11 = arith.index_cast %c35 : index to i32
    %c0_i32 = arith.constant 0 : i32
    call @llvm.aie.lock.acquire.reg(%11, %c0_i32) : (i32, i32) -> ()
    %12 = arith.index_cast %c50 : index to i32
    %c1_i32_0 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%12, %c1_i32_0) : (i32, i32) -> ()
    %13 = arith.index_cast %c49 : index to i32
    %c1_i32_1 = arith.constant 1 : i32
    call @llvm.aie.lock.acquire.reg(%13, %c1_i32_1) : (i32, i32) -> ()
    call @extern_kernel(%0, %7, %8, %9) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    %14 = arith.index_cast %c49 : index to i32
    %c0_i32_2 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%14, %c0_i32_2) : (i32, i32) -> ()
    %15 = arith.index_cast %c50 : index to i32
    %c0_i32_3 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%15, %c0_i32_3) : (i32, i32) -> ()
    %16 = arith.index_cast %c35 : index to i32
    %c1_i32_4 = arith.constant 1 : i32
    call @llvm.aie.lock.release.reg(%16, %c1_i32_4) : (i32, i32) -> ()
    %17 = arith.index_cast %c48 : index to i32
    %c0_i32_5 = arith.constant 0 : i32
    call @llvm.aie.lock.release.reg(%17, %c0_i32_5) : (i32, i32) -> ()
    return
  }
  func @_main() {
    call @core103() : () -> ()
    return
  }
}


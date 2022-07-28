module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(10, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<North : 3, DMA : 1>
    AIE.connect<DMA : 0, North : 3>
    AIE.connect<DMA : 1, North : 7>
  }
  %2 = AIE.switchbox(%0) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(South : 2, %500)
    %503 = AIE.masterset(South : 3, %501)
    %504 = AIE.masterset(North : 0, %498)
    %505 = AIE.masterset(North : 1, %499)
    %506 = AIE.masterset(East : 0, %498)
    %507 = AIE.masterset(East : 1, %499)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %501)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %501)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %501)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %501)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %500)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %500)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %500)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %499)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %498)
    }
  }
  %3 = AIE.lock(%0, 5)
  %4 = AIE.lock(%0, 4)
  %5 = AIE.lock(%0, 3)
  %6 = AIE.lock(%0, 2)
  %7 = AIE.lock(%0, 1)
  %8 = AIE.lock(%0, 0)
  %9 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xi32>
  %10 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xi32>
  %11 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xi32>
  %12 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xi32>
  %13 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<32x32xi32>
  %14 = AIE.external_buffer 36864 {sym_name = "buf5"} : memref<32x32xi32>
  %15 = AIE.external_buffer 90112 {sym_name = "buf6"} : memref<1025xi32>
  %16 = AIE.external_buffer 98304 {sym_name = "buf7"} : memref<1025xi32>
  %17 = AIE.external_buffer 106496 {sym_name = "buf8"} : memref<1025xi32>
  %18 = AIE.external_buffer 114688 {sym_name = "buf9"} : memref<1025xi32>
  %19 = AIE.external_buffer 122880 {sym_name = "buf10"} : memref<1025xi32>
  %20 = AIE.external_buffer 131072 {sym_name = "buf11"} : memref<1025xi32>
  %21 = AIE.external_buffer 139264 {sym_name = "buf12"} : memref<1025xi32>
  %22 = AIE.external_buffer 147456 {sym_name = "buf13"} : memref<1025xi32>
  %23 = AIE.shimDMA(%0) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBd(<%15 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBd(<%16 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBd(<%17 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBd(<%18 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb5:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBd(<%19 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBd(<%20 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBd(<%21 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBd(<%22 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb6
  ^bb10:  // pred: ^bb5
    %500 = AIE.dmaStart(MM2S0, ^bb11, ^bb14)
  ^bb11:  // 2 preds: ^bb10, ^bb13
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%13 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    cf.br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%11 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    cf.br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    cf.br ^bb11
  ^bb14:  // pred: ^bb10
    %501 = AIE.dmaStart(MM2S1, ^bb15, ^bb18)
  ^bb15:  // 2 preds: ^bb14, ^bb17
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%14 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    cf.br ^bb16
  ^bb16:  // pred: ^bb15
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%12 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    cf.br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    cf.br ^bb15
  ^bb18:  // pred: ^bb14
    AIE.end
  }
  %24 = AIE.tile(18, 0)
  %25 = AIE.shimmux(%24) {
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %26 = AIE.switchbox(%24) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.masterset(West : 0, %500)
    %502 = AIE.masterset(West : 1, %499)
    %503 = AIE.masterset(North : 0, %499)
    %504 = AIE.masterset(North : 1, %498)
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 0, %499)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %500)
    }
  }
  %27 = AIE.lock(%24, 5)
  %28 = AIE.lock(%24, 4)
  %29 = AIE.lock(%24, 3)
  %30 = AIE.lock(%24, 2)
  %31 = AIE.lock(%24, 1)
  %32 = AIE.lock(%24, 0)
  %33 = AIE.external_buffer 40960 {sym_name = "buf14"} : memref<32x32xi32>
  %34 = AIE.external_buffer 45056 {sym_name = "buf15"} : memref<32x32xi32>
  %35 = AIE.external_buffer 49152 {sym_name = "buf16"} : memref<32x32xi32>
  %36 = AIE.external_buffer 53248 {sym_name = "buf17"} : memref<32x32xi32>
  %37 = AIE.external_buffer 57344 {sym_name = "buf18"} : memref<32x32xi32>
  %38 = AIE.external_buffer 61440 {sym_name = "buf19"} : memref<32x32xi32>
  %39 = AIE.shimDMA(%24) {
    %498 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
  ^bb1:  // 2 preds: ^bb0, ^bb3
    AIE.useLock(%32, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%38 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 0)
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%28, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%37 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 0)
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%36 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 0)
    cf.br ^bb1
  ^bb4:  // pred: ^bb0
    %499 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
  ^bb5:  // 2 preds: ^bb4, ^bb7
    AIE.useLock(%29, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%35 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 0)
    cf.br ^bb6
  ^bb6:  // pred: ^bb5
    AIE.useLock(%27, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%34 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%27, Release, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%30, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%33 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%30, Release, 0)
    cf.br ^bb5
  ^bb8:  // pred: ^bb4
    AIE.end
  }
  %40 = AIE.tile(11, 0)
  %41 = AIE.shimmux(%40) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %42 = AIE.switchbox(%40) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<0> (3)
    %504 = AIE.masterset(South : 2, %501)
    %505 = AIE.masterset(West : 0, %500)
    %506 = AIE.masterset(North : 0, %498)
    %507 = AIE.masterset(North : 1, %499)
    %508 = AIE.masterset(East : 0, %502)
    %509 = AIE.masterset(East : 1, %498)
    %510 = AIE.masterset(East : 2, %499)
    %511 = AIE.masterset(East : 3, %503)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %501)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %500)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %503)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %499)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %498)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %502)
    }
  }
  %43 = AIE.lock(%40, 5)
  %44 = AIE.lock(%40, 4)
  %45 = AIE.lock(%40, 3)
  %46 = AIE.lock(%40, 2)
  %47 = AIE.lock(%40, 1)
  %48 = AIE.lock(%40, 0)
  %49 = AIE.external_buffer 65536 {sym_name = "buf20"} : memref<32x32xi32>
  %50 = AIE.external_buffer 69632 {sym_name = "buf21"} : memref<32x32xi32>
  %51 = AIE.external_buffer 73728 {sym_name = "buf22"} : memref<32x32xi32>
  %52 = AIE.external_buffer 77824 {sym_name = "buf23"} : memref<32x32xi32>
  %53 = AIE.external_buffer 81920 {sym_name = "buf24"} : memref<32x32xi32>
  %54 = AIE.external_buffer 86016 {sym_name = "buf25"} : memref<32x32xi32>
  %55 = AIE.external_buffer 155648 {sym_name = "buf26"} : memref<1025xi32>
  %56 = AIE.shimDMA(%40) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBd(<%55 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(MM2S0, ^bb3, ^bb6)
  ^bb3:  // 2 preds: ^bb2, ^bb5
    AIE.useLock(%43, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%54 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%43, Release, 0)
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%46, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%53 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%46, Release, 0)
    cf.br ^bb5
  ^bb5:  // pred: ^bb4
    AIE.useLock(%45, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%52 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%45, Release, 0)
    cf.br ^bb3
  ^bb6:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S1, ^bb7, ^bb10)
  ^bb7:  // 2 preds: ^bb6, ^bb9
    AIE.useLock(%47, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%51 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%47, Release, 0)
    cf.br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%48, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%50 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%48, Release, 0)
    cf.br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%44, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%49 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%44, Release, 0)
    cf.br ^bb7
  ^bb10:  // pred: ^bb6
    AIE.end
  }
  %57 = AIE.tile(0, 0)
  %58 = AIE.tile(10, 2)
  %59 = AIE.switchbox(%58) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<2> (0)
    %501 = AIE.amsel<0> (1)
    %502 = AIE.amsel<1> (1)
    %503 = AIE.amsel<2> (1)
    %504 = AIE.amsel<0> (2)
    %505 = AIE.amsel<1> (2)
    %506 = AIE.amsel<2> (2)
    %507 = AIE.amsel<0> (3)
    %508 = AIE.amsel<1> (3)
    %509 = AIE.amsel<2> (3)
    %510 = AIE.masterset(DMA : 0, %504)
    %511 = AIE.masterset(DMA : 1, %498)
    %512 = AIE.masterset(South : 0, %505)
    %513 = AIE.masterset(South : 1, %509)
    %514 = AIE.masterset(South : 2, %500)
    %515 = AIE.masterset(South : 3, %506)
    %516 = AIE.masterset(West : 0, %503)
    %517 = AIE.masterset(North : 0, %508)
    %518 = AIE.masterset(North : 1, %507)
    %519 = AIE.masterset(East : 0, %499)
    %520 = AIE.masterset(East : 1, %501)
    %521 = AIE.masterset(East : 2, %502)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %502)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %501)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %499)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %503)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %506)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %509)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %505)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %498)
      AIE.rule(31, 1, %507)
      AIE.rule(31, 2, %507)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %504)
      AIE.rule(31, 5, %508)
      AIE.rule(31, 6, %508)
    }
  }
  %60 = AIE.lock(%58, 1)
  %61 = AIE.lock(%58, 0)
  %62 = AIE.buffer(%58) {address = 4096 : i32, sym_name = "buf27"} : memref<32x32xi32>
  %63 = AIE.buffer(%58) {address = 8192 : i32, sym_name = "buf28"} : memref<32x32xi32>
  %64 = AIE.buffer(%58) {address = 12288 : i32, sym_name = "buf29"} : memref<32x32xi32>
  %65 = AIE.buffer(%58) {address = 16384 : i32, sym_name = "buf30"} : memref<32x32xi32>
  %66 = AIE.core(%58) {
    AIE.useLock(%60, Acquire, 1)
    AIE.useLock(%70, Acquire, 0)
    AIE.useLock(%61, Acquire, 1)
    call @extern_kernel(%65, %62, %63, %64) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%61, Release, 0)
    AIE.useLock(%70, Release, 1)
    AIE.useLock(%60, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %67 = AIE.mem(%58) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%61, Acquire, 0)
    AIE.dmaBd(<%64 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%61, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%60, Acquire, 0)
    AIE.dmaBd(<%63 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%60, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %68 = AIE.tile(10, 3)
  %69 = AIE.switchbox(%68) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<2> (0)
    %501 = AIE.amsel<0> (1)
    %502 = AIE.amsel<1> (1)
    %503 = AIE.amsel<2> (1)
    %504 = AIE.amsel<0> (2)
    %505 = AIE.amsel<1> (2)
    %506 = AIE.amsel<2> (2)
    %507 = AIE.amsel<0> (3)
    %508 = AIE.amsel<1> (3)
    %509 = AIE.amsel<2> (3)
    %510 = AIE.masterset(DMA : 0, %498)
    %511 = AIE.masterset(DMA : 1, %509)
    %512 = AIE.masterset(South : 0, %508)
    %513 = AIE.masterset(South : 1, %506)
    %514 = AIE.masterset(South : 2, %503)
    %515 = AIE.masterset(South : 3, %505)
    %516 = AIE.masterset(West : 0, %500)
    %517 = AIE.masterset(West : 1, %502)
    %518 = AIE.masterset(West : 2, %504)
    %519 = AIE.masterset(North : 0, %501)
    %520 = AIE.masterset(North : 1, %499)
    %521 = AIE.masterset(East : 0, %507)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %504)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %502)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %500)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %507)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %505)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %503)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %506)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %508)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %509)
      AIE.rule(31, 2, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %498)
      AIE.rule(31, 6, %501)
    }
  }
  %70 = AIE.lock(%68, 2)
  %71 = AIE.lock(%68, 1)
  %72 = AIE.lock(%68, 0)
  %73 = AIE.buffer(%68) {address = 4096 : i32, sym_name = "buf31"} : memref<32x32xi32>
  %74 = AIE.buffer(%68) {address = 8192 : i32, sym_name = "bui32"} : memref<32x32xi32>
  %75 = AIE.buffer(%68) {address = 12288 : i32, sym_name = "buf33"} : memref<32x32xi32>
  %76 = AIE.core(%68) {
    AIE.useLock(%82, Acquire, 0)
    AIE.useLock(%72, Acquire, 1)
    AIE.useLock(%70, Acquire, 1)
    AIE.useLock(%71, Acquire, 1)
    call @extern_kernel(%62, %73, %74, %75) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%71, Release, 0)
    AIE.useLock(%70, Release, 0)
    AIE.useLock(%72, Release, 0)
    AIE.useLock(%82, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %77 = AIE.mem(%68) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%71, Acquire, 0)
    AIE.dmaBd(<%75 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%71, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%72, Acquire, 0)
    AIE.dmaBd(<%74 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%72, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %78 = AIE.tile(10, 4) {polyaie.leaf}
  %79 = AIE.lock(%78, 15)
  %80 = AIE.switchbox(%78) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<1> (2)
    %504 = AIE.amsel<0> (3)
    %505 = AIE.masterset(DMA : 0, %502)
    %506 = AIE.masterset(DMA : 1, %503)
    %507 = AIE.masterset(South : 0, %498)
    %508 = AIE.masterset(South : 1, %501)
    %509 = AIE.masterset(South : 2, %504)
    %510 = AIE.masterset(South : 3, %499)
    %511 = AIE.masterset(West : 0, %500)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %500)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %499)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %504)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %501)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %498)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %502)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %503)
    }
  }
  %81 = AIE.lock(%78, 3)
  %82 = AIE.lock(%78, 2)
  %83 = AIE.lock(%78, 1)
  %84 = AIE.lock(%78, 0)
  %85 = AIE.buffer(%78) {address = 4096 : i32, sym_name = "buf34"} : memref<32x32xi32>
  %86 = AIE.buffer(%78) {address = 8192 : i32, sym_name = "buf35"} : memref<32x32xi32>
  %87 = AIE.buffer(%78) {address = 12288 : i32, sym_name = "buf36"} : memref<32x32xi32>
  %88 = AIE.core(%78) {
    AIE.useLock(%82, Acquire, 1)
    AIE.useLock(%81, Acquire, 1)
    AIE.useLock(%83, Acquire, 0)
    AIE.useLock(%84, Acquire, 1)
    call @extern_kernel(%73, %85, %86, %87) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%84, Release, 0)
    AIE.useLock(%83, Release, 1)
    AIE.useLock(%81, Release, 0)
    AIE.useLock(%82, Release, 0)
    AIE.useLock(%79, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %89 = AIE.mem(%78) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%84, Acquire, 0)
    AIE.dmaBd(<%86 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%84, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBd(<%87 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%83, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%85 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%83, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %90 = AIE.tile(11, 2)
  %91 = AIE.switchbox(%90) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<2> (0)
    %501 = AIE.amsel<0> (1)
    %502 = AIE.amsel<1> (1)
    %503 = AIE.amsel<0> (2)
    %504 = AIE.amsel<1> (2)
    %505 = AIE.amsel<0> (3)
    %506 = AIE.amsel<1> (3)
    %507 = AIE.masterset(DMA : 0, %506)
    %508 = AIE.masterset(DMA : 1, %502)
    %509 = AIE.masterset(South : 0, %504)
    %510 = AIE.masterset(South : 1, %503)
    %511 = AIE.masterset(South : 2, %499)
    %512 = AIE.masterset(South : 3, %498)
    %513 = AIE.masterset(West : 0, %501)
    %514 = AIE.masterset(North : 0, %505)
    %515 = AIE.masterset(North : 1, %500)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %498)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %499)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %503)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %504)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %501)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %502)
      AIE.rule(31, 5, %500)
      AIE.rule(31, 6, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %506)
      AIE.rule(31, 1, %505)
      AIE.rule(31, 2, %505)
    }
  }
  %92 = AIE.lock(%90, 1)
  %93 = AIE.lock(%90, 0)
  %94 = AIE.buffer(%90) {address = 4096 : i32, sym_name = "buf37"} : memref<32x32xi32>
  %95 = AIE.buffer(%90) {address = 8192 : i32, sym_name = "buf38"} : memref<32x32xi32>
  %96 = AIE.buffer(%90) {address = 12288 : i32, sym_name = "buf39"} : memref<32x32xi32>
  %97 = AIE.buffer(%90) {address = 16384 : i32, sym_name = "buf40"} : memref<32x32xi32>
  %98 = AIE.core(%90) {
    AIE.useLock(%92, Acquire, 1)
    AIE.useLock(%93, Acquire, 1)
    AIE.useLock(%104, Acquire, 0)
    call @extern_kernel(%97, %94, %95, %96) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%104, Release, 1)
    AIE.useLock(%93, Release, 0)
    AIE.useLock(%92, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %99 = AIE.mem(%90) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%93, Acquire, 0)
    AIE.dmaBd(<%95 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%93, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%92, Acquire, 0)
    AIE.dmaBd(<%96 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%92, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %100 = AIE.tile(11, 3)
  %101 = AIE.switchbox(%100) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<2> (0)
    %501 = AIE.amsel<0> (1)
    %502 = AIE.amsel<1> (1)
    %503 = AIE.amsel<0> (2)
    %504 = AIE.amsel<1> (2)
    %505 = AIE.amsel<0> (3)
    %506 = AIE.amsel<1> (3)
    %507 = AIE.masterset(DMA : 0, %505)
    %508 = AIE.masterset(DMA : 1, %500)
    %509 = AIE.masterset(South : 0, %506)
    %510 = AIE.masterset(South : 1, %504)
    %511 = AIE.masterset(West : 0, %502)
    %512 = AIE.masterset(West : 1, %498)
    %513 = AIE.masterset(West : 2, %499)
    %514 = AIE.masterset(North : 0, %501)
    %515 = AIE.masterset(North : 1, %503)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %504)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %499)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %498)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %502)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %506)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %505)
      AIE.rule(31, 6, %503)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %500)
      AIE.rule(31, 2, %501)
    }
  }
  %102 = AIE.lock(%100, 2)
  %103 = AIE.lock(%100, 1)
  %104 = AIE.lock(%100, 0)
  %105 = AIE.buffer(%100) {address = 4096 : i32, sym_name = "buf41"} : memref<32x32xi32>
  %106 = AIE.buffer(%100) {address = 8192 : i32, sym_name = "buf42"} : memref<32x32xi32>
  %107 = AIE.buffer(%100) {address = 12288 : i32, sym_name = "buf43"} : memref<32x32xi32>
  %108 = AIE.core(%100) {
    AIE.useLock(%113, Acquire, 0)
    AIE.useLock(%103, Acquire, 1)
    AIE.useLock(%104, Acquire, 1)
    AIE.useLock(%102, Acquire, 1)
    call @extern_kernel(%94, %105, %106, %107) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%102, Release, 0)
    AIE.useLock(%104, Release, 0)
    AIE.useLock(%103, Release, 0)
    AIE.useLock(%113, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %109 = AIE.mem(%100) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%102, Acquire, 0)
    AIE.dmaBd(<%107 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%102, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%103, Acquire, 0)
    AIE.dmaBd(<%106 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%103, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %110 = AIE.tile(11, 4) {polyaie.leaf}
  %111 = AIE.lock(%110, 15)
  %112 = AIE.switchbox(%110) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<1> (2)
    %504 = AIE.amsel<0> (3)
    %505 = AIE.masterset(DMA : 0, %500)
    %506 = AIE.masterset(DMA : 1, %503)
    %507 = AIE.masterset(South : 0, %504)
    %508 = AIE.masterset(West : 0, %499)
    %509 = AIE.masterset(West : 1, %501)
    %510 = AIE.masterset(West : 2, %502)
    %511 = AIE.masterset(West : 3, %498)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 1, %504)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %498)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %502)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %501)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %499)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %503)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %500)
    }
  }
  %113 = AIE.lock(%110, 3)
  %114 = AIE.lock(%110, 2)
  %115 = AIE.lock(%110, 1)
  %116 = AIE.lock(%110, 0)
  %117 = AIE.buffer(%110) {address = 4096 : i32, sym_name = "buf44"} : memref<32x32xi32>
  %118 = AIE.buffer(%110) {address = 8192 : i32, sym_name = "buf45"} : memref<32x32xi32>
  %119 = AIE.buffer(%110) {address = 12288 : i32, sym_name = "buf46"} : memref<32x32xi32>
  %120 = AIE.core(%110) {
    AIE.useLock(%114, Acquire, 1)
    AIE.useLock(%113, Acquire, 1)
    AIE.useLock(%115, Acquire, 0)
    AIE.useLock(%116, Acquire, 1)
    call @extern_kernel(%105, %117, %118, %119) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%116, Release, 0)
    AIE.useLock(%115, Release, 1)
    AIE.useLock(%113, Release, 0)
    AIE.useLock(%114, Release, 0)
    AIE.useLock(%111, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %121 = AIE.mem(%110) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%116, Acquire, 0)
    AIE.dmaBd(<%118 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%116, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%114, Acquire, 0)
    AIE.dmaBd(<%119 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%114, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%115, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%117 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%115, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %122 = AIE.tile(12, 2)
  %123 = AIE.switchbox(%122) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %501)
    %503 = AIE.masterset(DMA : 1, %498)
    %504 = AIE.masterset(North : 0, %500)
    %505 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %501)
      AIE.rule(31, 5, %499)
      AIE.rule(31, 6, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %498)
      AIE.rule(31, 1, %500)
      AIE.rule(31, 2, %500)
    }
  }
  %124 = AIE.lock(%122, 1)
  %125 = AIE.lock(%122, 0)
  %126 = AIE.buffer(%122) {address = 4096 : i32, sym_name = "buf47"} : memref<32x32xi32>
  %127 = AIE.buffer(%122) {address = 8192 : i32, sym_name = "buf48"} : memref<32x32xi32>
  %128 = AIE.buffer(%122) {address = 12288 : i32, sym_name = "buf49"} : memref<32x32xi32>
  %129 = AIE.buffer(%122) {address = 16384 : i32, sym_name = "buf50"} : memref<32x32xi32>
  %130 = AIE.core(%122) {
    AIE.useLock(%124, Acquire, 1)
    AIE.useLock(%134, Acquire, 0)
    AIE.useLock(%125, Acquire, 1)
    call @extern_kernel(%129, %126, %127, %128) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%125, Release, 0)
    AIE.useLock(%134, Release, 1)
    AIE.useLock(%124, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %131 = AIE.mem(%122) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%125, Acquire, 0)
    AIE.dmaBd(<%128 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%125, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%124, Acquire, 0)
    AIE.dmaBd(<%127 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%124, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %132 = AIE.tile(12, 3)
  %133 = AIE.switchbox(%132) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<1> (2)
    %504 = AIE.amsel<0> (3)
    %505 = AIE.masterset(DMA : 0, %504)
    %506 = AIE.masterset(DMA : 1, %498)
    %507 = AIE.masterset(West : 0, %499)
    %508 = AIE.masterset(West : 1, %500)
    %509 = AIE.masterset(West : 2, %503)
    %510 = AIE.masterset(North : 0, %502)
    %511 = AIE.masterset(North : 1, %501)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %503)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %500)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %499)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %504)
      AIE.rule(31, 6, %501)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %498)
      AIE.rule(31, 2, %502)
    }
  }
  %134 = AIE.lock(%132, 2)
  %135 = AIE.lock(%132, 1)
  %136 = AIE.lock(%132, 0)
  %137 = AIE.buffer(%132) {address = 4096 : i32, sym_name = "buf51"} : memref<32x32xi32>
  %138 = AIE.buffer(%132) {address = 8192 : i32, sym_name = "buf52"} : memref<32x32xi32>
  %139 = AIE.buffer(%132) {address = 12288 : i32, sym_name = "buf53"} : memref<32x32xi32>
  %140 = AIE.core(%132) {
    AIE.useLock(%136, Acquire, 1)
    AIE.useLock(%134, Acquire, 1)
    AIE.useLock(%135, Acquire, 1)
    AIE.useLock(%147, Acquire, 0)
    call @extern_kernel(%126, %137, %138, %139) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%147, Release, 1)
    AIE.useLock(%135, Release, 0)
    AIE.useLock(%134, Release, 0)
    AIE.useLock(%136, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %141 = AIE.mem(%132) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%135, Acquire, 0)
    AIE.dmaBd(<%139 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%135, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%136, Acquire, 0)
    AIE.dmaBd(<%138 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%136, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %142 = AIE.tile(12, 4) {polyaie.leaf}
  %143 = AIE.lock(%142, 15)
  %144 = AIE.switchbox(%142) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<1> (2)
    %504 = AIE.amsel<0> (3)
    %505 = AIE.masterset(DMA : 0, %502)
    %506 = AIE.masterset(DMA : 1, %500)
    %507 = AIE.masterset(South : 0, %499)
    %508 = AIE.masterset(West : 0, %503)
    %509 = AIE.masterset(West : 1, %501)
    %510 = AIE.masterset(West : 2, %498)
    %511 = AIE.masterset(West : 3, %504)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 2, %499)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 1, %504)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %498)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %501)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %503)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %502)
    }
  }
  %145 = AIE.lock(%142, 3)
  %146 = AIE.lock(%142, 2)
  %147 = AIE.lock(%142, 1)
  %148 = AIE.lock(%142, 0)
  %149 = AIE.buffer(%142) {address = 4096 : i32, sym_name = "buf54"} : memref<32x32xi32>
  %150 = AIE.buffer(%142) {address = 8192 : i32, sym_name = "buf55"} : memref<32x32xi32>
  %151 = AIE.buffer(%142) {address = 12288 : i32, sym_name = "buf56"} : memref<32x32xi32>
  %152 = AIE.core(%142) {
    AIE.useLock(%145, Acquire, 1)
    AIE.useLock(%147, Acquire, 1)
    AIE.useLock(%146, Acquire, 0)
    AIE.useLock(%148, Acquire, 1)
    call @extern_kernel(%137, %149, %150, %151) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%148, Release, 0)
    AIE.useLock(%146, Release, 1)
    AIE.useLock(%147, Release, 0)
    AIE.useLock(%145, Release, 0)
    AIE.useLock(%143, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %153 = AIE.mem(%142) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%148, Acquire, 0)
    AIE.dmaBd(<%150 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%148, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%145, Acquire, 0)
    AIE.dmaBd(<%151 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%145, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%146, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%149 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%146, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %154 = AIE.tile(13, 2)
  %155 = AIE.switchbox(%154) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %500)
    %503 = AIE.masterset(DMA : 1, %501)
    %504 = AIE.masterset(North : 0, %498)
    %505 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %501)
      AIE.rule(31, 1, %499)
      AIE.rule(31, 2, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %500)
      AIE.rule(31, 5, %498)
      AIE.rule(31, 6, %498)
    }
  }
  %156 = AIE.lock(%154, 1)
  %157 = AIE.lock(%154, 0)
  %158 = AIE.buffer(%154) {address = 4096 : i32, sym_name = "buf57"} : memref<32x32xi32>
  %159 = AIE.buffer(%154) {address = 8192 : i32, sym_name = "buf58"} : memref<32x32xi32>
  %160 = AIE.buffer(%154) {address = 12288 : i32, sym_name = "buf59"} : memref<32x32xi32>
  %161 = AIE.buffer(%154) {address = 16384 : i32, sym_name = "buf60"} : memref<32x32xi32>
  %162 = AIE.core(%154) {
    AIE.useLock(%167, Acquire, 0)
    AIE.useLock(%157, Acquire, 1)
    AIE.useLock(%156, Acquire, 1)
    call @extern_kernel(%161, %158, %159, %160) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%156, Release, 0)
    AIE.useLock(%157, Release, 0)
    AIE.useLock(%167, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %163 = AIE.mem(%154) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%156, Acquire, 0)
    AIE.dmaBd(<%160 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%156, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%157, Acquire, 0)
    AIE.dmaBd(<%159 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%157, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %164 = AIE.tile(13, 3)
  %165 = AIE.switchbox(%164) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<0> (3)
    %504 = AIE.masterset(DMA : 0, %498)
    %505 = AIE.masterset(DMA : 1, %503)
    %506 = AIE.masterset(West : 0, %502)
    %507 = AIE.masterset(West : 1, %501)
    %508 = AIE.masterset(North : 0, %499)
    %509 = AIE.masterset(North : 1, %500)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %501)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 3, %502)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %503)
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %498)
      AIE.rule(31, 6, %499)
    }
  }
  %166 = AIE.lock(%164, 2)
  %167 = AIE.lock(%164, 1)
  %168 = AIE.lock(%164, 0)
  %169 = AIE.buffer(%164) {address = 4096 : i32, sym_name = "buf61"} : memref<32x32xi32>
  %170 = AIE.buffer(%164) {address = 8192 : i32, sym_name = "buf62"} : memref<32x32xi32>
  %171 = AIE.buffer(%164) {address = 12288 : i32, sym_name = "buf63"} : memref<32x32xi32>
  %172 = AIE.core(%164) {
    AIE.useLock(%177, Acquire, 0)
    AIE.useLock(%167, Acquire, 1)
    AIE.useLock(%166, Acquire, 1)
    AIE.useLock(%168, Acquire, 1)
    call @extern_kernel(%158, %169, %170, %171) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%168, Release, 0)
    AIE.useLock(%166, Release, 0)
    AIE.useLock(%167, Release, 0)
    AIE.useLock(%177, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %173 = AIE.mem(%164) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%168, Acquire, 0)
    AIE.dmaBd(<%171 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%168, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%166, Acquire, 0)
    AIE.dmaBd(<%170 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%166, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %174 = AIE.tile(13, 4) {polyaie.leaf}
  %175 = AIE.lock(%174, 15)
  %176 = AIE.switchbox(%174) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<1> (2)
    %504 = AIE.amsel<0> (3)
    %505 = AIE.masterset(DMA : 0, %504)
    %506 = AIE.masterset(DMA : 1, %499)
    %507 = AIE.masterset(South : 0, %501)
    %508 = AIE.masterset(West : 0, %503)
    %509 = AIE.masterset(West : 1, %502)
    %510 = AIE.masterset(West : 2, %498)
    %511 = AIE.masterset(West : 3, %500)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 3, %501)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %498)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %502)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %503)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %504)
    }
  }
  %177 = AIE.lock(%174, 3)
  %178 = AIE.lock(%174, 2)
  %179 = AIE.lock(%174, 1)
  %180 = AIE.lock(%174, 0)
  %181 = AIE.buffer(%174) {address = 4096 : i32, sym_name = "buf64"} : memref<32x32xi32>
  %182 = AIE.buffer(%174) {address = 8192 : i32, sym_name = "buf65"} : memref<32x32xi32>
  %183 = AIE.buffer(%174) {address = 12288 : i32, sym_name = "buf66"} : memref<32x32xi32>
  %184 = AIE.core(%174) {
    AIE.useLock(%180, Acquire, 1)
    AIE.useLock(%177, Acquire, 1)
    AIE.useLock(%178, Acquire, 1)
    AIE.useLock(%179, Acquire, 0)
    call @extern_kernel(%169, %181, %182, %183) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%179, Release, 1)
    AIE.useLock(%178, Release, 0)
    AIE.useLock(%177, Release, 0)
    AIE.useLock(%180, Release, 0)
    AIE.useLock(%175, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %185 = AIE.mem(%174) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%178, Acquire, 0)
    AIE.dmaBd(<%183 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%178, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%180, Acquire, 0)
    AIE.dmaBd(<%182 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%180, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%179, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%181 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%179, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %186 = AIE.tile(14, 2)
  %187 = AIE.switchbox(%186) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %499)
    %503 = AIE.masterset(DMA : 1, %500)
    %504 = AIE.masterset(North : 0, %501)
    %505 = AIE.masterset(North : 1, %498)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %500)
      AIE.rule(31, 5, %498)
      AIE.rule(31, 6, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %499)
      AIE.rule(31, 1, %501)
      AIE.rule(31, 2, %501)
    }
  }
  %188 = AIE.lock(%186, 1)
  %189 = AIE.lock(%186, 0)
  %190 = AIE.buffer(%186) {address = 4096 : i32, sym_name = "buf67"} : memref<32x32xi32>
  %191 = AIE.buffer(%186) {address = 8192 : i32, sym_name = "buf68"} : memref<32x32xi32>
  %192 = AIE.buffer(%186) {address = 12288 : i32, sym_name = "buf69"} : memref<32x32xi32>
  %193 = AIE.buffer(%186) {address = 16384 : i32, sym_name = "buf70"} : memref<32x32xi32>
  %194 = AIE.core(%186) {
    AIE.useLock(%188, Acquire, 1)
    AIE.useLock(%198, Acquire, 0)
    AIE.useLock(%189, Acquire, 1)
    call @extern_kernel(%193, %190, %191, %192) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%189, Release, 0)
    AIE.useLock(%198, Release, 1)
    AIE.useLock(%188, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %195 = AIE.mem(%186) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%189, Acquire, 0)
    AIE.dmaBd(<%191 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%189, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%188, Acquire, 0)
    AIE.dmaBd(<%192 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%188, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %196 = AIE.tile(14, 3)
  %197 = AIE.switchbox(%196) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<0> (2)
    %502 = AIE.amsel<0> (3)
    %503 = AIE.masterset(DMA : 0, %501)
    %504 = AIE.masterset(DMA : 1, %502)
    %505 = AIE.masterset(West : 0, %499)
    %506 = AIE.masterset(North : 0, %500)
    %507 = AIE.masterset(North : 1, %498)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %499)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %501)
      AIE.rule(31, 6, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %502)
      AIE.rule(31, 2, %500)
    }
  }
  %198 = AIE.lock(%196, 2)
  %199 = AIE.lock(%196, 1)
  %200 = AIE.lock(%196, 0)
  %201 = AIE.buffer(%196) {address = 4096 : i32, sym_name = "buf71"} : memref<32x32xi32>
  %202 = AIE.buffer(%196) {address = 8192 : i32, sym_name = "buf72"} : memref<32x32xi32>
  %203 = AIE.buffer(%196) {address = 12288 : i32, sym_name = "buf73"} : memref<32x32xi32>
  %204 = AIE.core(%196) {
    AIE.useLock(%209, Acquire, 0)
    AIE.useLock(%198, Acquire, 1)
    AIE.useLock(%199, Acquire, 1)
    AIE.useLock(%200, Acquire, 1)
    call @extern_kernel(%190, %201, %202, %203) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%200, Release, 0)
    AIE.useLock(%199, Release, 0)
    AIE.useLock(%198, Release, 0)
    AIE.useLock(%209, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %205 = AIE.mem(%196) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%200, Acquire, 0)
    AIE.dmaBd(<%203 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%200, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%199, Acquire, 0)
    AIE.dmaBd(<%202 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%199, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %206 = AIE.tile(14, 4) {polyaie.leaf}
  %207 = AIE.lock(%206, 15)
  %208 = AIE.switchbox(%206) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<1> (2)
    %504 = AIE.amsel<0> (3)
    %505 = AIE.masterset(DMA : 0, %504)
    %506 = AIE.masterset(DMA : 1, %501)
    %507 = AIE.masterset(South : 0, %498)
    %508 = AIE.masterset(West : 0, %500)
    %509 = AIE.masterset(West : 1, %499)
    %510 = AIE.masterset(West : 2, %503)
    %511 = AIE.masterset(West : 3, %502)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %498)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %502)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %503)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %499)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %500)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %501)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %504)
    }
  }
  %209 = AIE.lock(%206, 3)
  %210 = AIE.lock(%206, 2)
  %211 = AIE.lock(%206, 1)
  %212 = AIE.lock(%206, 0)
  %213 = AIE.buffer(%206) {address = 4096 : i32, sym_name = "buf74"} : memref<32x32xi32>
  %214 = AIE.buffer(%206) {address = 8192 : i32, sym_name = "buf75"} : memref<32x32xi32>
  %215 = AIE.buffer(%206) {address = 12288 : i32, sym_name = "buf76"} : memref<32x32xi32>
  %216 = AIE.core(%206) {
    AIE.useLock(%211, Acquire, 1)
    AIE.useLock(%212, Acquire, 1)
    AIE.useLock(%210, Acquire, 0)
    AIE.useLock(%209, Acquire, 1)
    call @extern_kernel(%201, %213, %214, %215) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%209, Release, 0)
    AIE.useLock(%210, Release, 1)
    AIE.useLock(%212, Release, 0)
    AIE.useLock(%211, Release, 0)
    AIE.useLock(%207, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %217 = AIE.mem(%206) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%212, Acquire, 0)
    AIE.dmaBd(<%214 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%212, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%211, Acquire, 0)
    AIE.dmaBd(<%215 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%211, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%210, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%213 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%210, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %218 = AIE.tile(15, 2)
  %219 = AIE.switchbox(%218) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %499)
    %503 = AIE.masterset(DMA : 1, %501)
    %504 = AIE.masterset(North : 0, %500)
    %505 = AIE.masterset(North : 1, %498)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %499)
      AIE.rule(31, 5, %498)
      AIE.rule(31, 6, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %501)
      AIE.rule(31, 1, %500)
      AIE.rule(31, 2, %500)
    }
  }
  %220 = AIE.lock(%218, 1)
  %221 = AIE.lock(%218, 0)
  %222 = AIE.buffer(%218) {address = 4096 : i32, sym_name = "buf77"} : memref<32x32xi32>
  %223 = AIE.buffer(%218) {address = 8192 : i32, sym_name = "buf78"} : memref<32x32xi32>
  %224 = AIE.buffer(%218) {address = 12288 : i32, sym_name = "buf79"} : memref<32x32xi32>
  %225 = AIE.buffer(%218) {address = 16384 : i32, sym_name = "buf80"} : memref<32x32xi32>
  %226 = AIE.core(%218) {
    AIE.useLock(%230, Acquire, 0)
    AIE.useLock(%221, Acquire, 1)
    AIE.useLock(%220, Acquire, 1)
    call @extern_kernel(%225, %222, %223, %224) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%220, Release, 0)
    AIE.useLock(%221, Release, 0)
    AIE.useLock(%230, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %227 = AIE.mem(%218) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%220, Acquire, 0)
    AIE.dmaBd(<%224 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%220, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%221, Acquire, 0)
    AIE.dmaBd(<%223 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%221, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %228 = AIE.tile(15, 3)
  %229 = AIE.switchbox(%228) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %501)
    %503 = AIE.masterset(DMA : 1, %500)
    %504 = AIE.masterset(North : 0, %498)
    %505 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %501)
      AIE.rule(31, 6, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %500)
      AIE.rule(31, 2, %498)
    }
  }
  %230 = AIE.lock(%228, 2)
  %231 = AIE.lock(%228, 1)
  %232 = AIE.lock(%228, 0)
  %233 = AIE.buffer(%228) {address = 4096 : i32, sym_name = "buf81"} : memref<32x32xi32>
  %234 = AIE.buffer(%228) {address = 8192 : i32, sym_name = "buf82"} : memref<32x32xi32>
  %235 = AIE.buffer(%228) {address = 12288 : i32, sym_name = "buf83"} : memref<32x32xi32>
  %236 = AIE.core(%228) {
    AIE.useLock(%230, Acquire, 1)
    AIE.useLock(%231, Acquire, 1)
    AIE.useLock(%232, Acquire, 1)
    AIE.useLock(%243, Acquire, 0)
    call @extern_kernel(%222, %233, %234, %235) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%243, Release, 1)
    AIE.useLock(%232, Release, 0)
    AIE.useLock(%231, Release, 0)
    AIE.useLock(%230, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %237 = AIE.mem(%228) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%232, Acquire, 0)
    AIE.dmaBd(<%235 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%232, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%231, Acquire, 0)
    AIE.dmaBd(<%234 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%231, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %238 = AIE.tile(15, 4) {polyaie.leaf}
  %239 = AIE.lock(%238, 15)
  %240 = AIE.switchbox(%238) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<0> (3)
    %504 = AIE.masterset(DMA : 0, %503)
    %505 = AIE.masterset(DMA : 1, %501)
    %506 = AIE.masterset(West : 0, %502)
    %507 = AIE.masterset(West : 1, %498)
    %508 = AIE.masterset(West : 2, %499)
    %509 = AIE.masterset(West : 3, %500)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %500)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %499)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %498)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %502)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %503)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %501)
    }
  }
  %241 = AIE.lock(%238, 3)
  %242 = AIE.lock(%238, 2)
  %243 = AIE.lock(%238, 1)
  %244 = AIE.lock(%238, 0)
  %245 = AIE.buffer(%238) {address = 4096 : i32, sym_name = "buf84"} : memref<32x32xi32>
  %246 = AIE.buffer(%238) {address = 8192 : i32, sym_name = "buf85"} : memref<32x32xi32>
  %247 = AIE.buffer(%238) {address = 12288 : i32, sym_name = "buf86"} : memref<32x32xi32>
  %248 = AIE.core(%238) {
    AIE.useLock(%244, Acquire, 1)
    AIE.useLock(%241, Acquire, 1)
    AIE.useLock(%242, Acquire, 0)
    AIE.useLock(%243, Acquire, 1)
    call @extern_kernel(%233, %245, %246, %247) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%243, Release, 0)
    AIE.useLock(%242, Release, 1)
    AIE.useLock(%241, Release, 0)
    AIE.useLock(%244, Release, 0)
    AIE.useLock(%239, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %249 = AIE.mem(%238) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%241, Acquire, 0)
    AIE.dmaBd(<%247 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%241, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%244, Acquire, 0)
    AIE.dmaBd(<%246 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%244, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%242, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%245 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%242, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %250 = AIE.tile(16, 2)
  %251 = AIE.switchbox(%250) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %501)
    %503 = AIE.masterset(DMA : 1, %499)
    %504 = AIE.masterset(North : 0, %498)
    %505 = AIE.masterset(North : 1, %500)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %499)
      AIE.rule(31, 1, %500)
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %501)
      AIE.rule(31, 5, %498)
      AIE.rule(31, 6, %498)
    }
  }
  %252 = AIE.lock(%250, 1)
  %253 = AIE.lock(%250, 0)
  %254 = AIE.buffer(%250) {address = 4096 : i32, sym_name = "buf87"} : memref<32x32xi32>
  %255 = AIE.buffer(%250) {address = 8192 : i32, sym_name = "buf88"} : memref<32x32xi32>
  %256 = AIE.buffer(%250) {address = 12288 : i32, sym_name = "buf89"} : memref<32x32xi32>
  %257 = AIE.buffer(%250) {address = 16384 : i32, sym_name = "buf90"} : memref<32x32xi32>
  %258 = AIE.core(%250) {
    AIE.useLock(%253, Acquire, 1)
    AIE.useLock(%263, Acquire, 0)
    AIE.useLock(%252, Acquire, 1)
    call @extern_kernel(%257, %254, %255, %256) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%252, Release, 0)
    AIE.useLock(%263, Release, 1)
    AIE.useLock(%253, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %259 = AIE.mem(%250) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%252, Acquire, 0)
    AIE.dmaBd(<%256 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%252, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%253, Acquire, 0)
    AIE.dmaBd(<%255 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%253, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %260 = AIE.tile(16, 3)
  %261 = AIE.switchbox(%260) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %501)
    %503 = AIE.masterset(DMA : 1, %499)
    %504 = AIE.masterset(North : 0, %498)
    %505 = AIE.masterset(North : 1, %500)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %501)
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %499)
      AIE.rule(31, 6, %498)
    }
  }
  %262 = AIE.lock(%260, 2)
  %263 = AIE.lock(%260, 1)
  %264 = AIE.lock(%260, 0)
  %265 = AIE.buffer(%260) {address = 4096 : i32, sym_name = "buf91"} : memref<32x32xi32>
  %266 = AIE.buffer(%260) {address = 8192 : i32, sym_name = "buf92"} : memref<32x32xi32>
  %267 = AIE.buffer(%260) {address = 12288 : i32, sym_name = "buf93"} : memref<32x32xi32>
  %268 = AIE.core(%260) {
    AIE.useLock(%263, Acquire, 1)
    AIE.useLock(%276, Acquire, 0)
    AIE.useLock(%264, Acquire, 1)
    AIE.useLock(%262, Acquire, 1)
    call @extern_kernel(%254, %265, %266, %267) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%262, Release, 0)
    AIE.useLock(%264, Release, 0)
    AIE.useLock(%276, Release, 1)
    AIE.useLock(%263, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %269 = AIE.mem(%260) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%262, Acquire, 0)
    AIE.dmaBd(<%266 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%262, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%264, Acquire, 0)
    AIE.dmaBd(<%267 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%264, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %270 = AIE.tile(16, 4) {polyaie.leaf}
  %271 = AIE.lock(%270, 15)
  %272 = AIE.switchbox(%270) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<0> (2)
    %502 = AIE.amsel<0> (3)
    %503 = AIE.masterset(DMA : 0, %500)
    %504 = AIE.masterset(DMA : 1, %499)
    %505 = AIE.masterset(West : 0, %501)
    %506 = AIE.masterset(West : 1, %498)
    %507 = AIE.masterset(West : 2, %502)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %502)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %498)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %501)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %499)
    }
  }
  %273 = AIE.lock(%270, 3)
  %274 = AIE.lock(%270, 2)
  %275 = AIE.lock(%270, 1)
  %276 = AIE.lock(%270, 0)
  %277 = AIE.buffer(%270) {address = 4096 : i32, sym_name = "buf94"} : memref<32x32xi32>
  %278 = AIE.buffer(%270) {address = 8192 : i32, sym_name = "buf95"} : memref<32x32xi32>
  %279 = AIE.buffer(%270) {address = 12288 : i32, sym_name = "buf96"} : memref<32x32xi32>
  %280 = AIE.core(%270) {
    AIE.useLock(%274, Acquire, 1)
    AIE.useLock(%275, Acquire, 1)
    AIE.useLock(%276, Acquire, 1)
    AIE.useLock(%273, Acquire, 0)
    call @extern_kernel(%265, %277, %278, %279) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%273, Release, 1)
    AIE.useLock(%276, Release, 0)
    AIE.useLock(%275, Release, 0)
    AIE.useLock(%274, Release, 0)
    AIE.useLock(%271, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %281 = AIE.mem(%270) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%275, Acquire, 0)
    AIE.dmaBd(<%278 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%274, Acquire, 0)
    AIE.dmaBd(<%279 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%274, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%273, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%277 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%273, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %282 = AIE.tile(17, 2)
  %283 = AIE.switchbox(%282) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %498)
    %503 = AIE.masterset(DMA : 1, %501)
    %504 = AIE.masterset(North : 0, %500)
    %505 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %501)
      AIE.rule(31, 5, %499)
      AIE.rule(31, 6, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %498)
      AIE.rule(31, 1, %500)
      AIE.rule(31, 2, %500)
    }
  }
  %284 = AIE.lock(%282, 1)
  %285 = AIE.lock(%282, 0)
  %286 = AIE.buffer(%282) {address = 4096 : i32, sym_name = "buf97"} : memref<32x32xi32>
  %287 = AIE.buffer(%282) {address = 8192 : i32, sym_name = "buf98"} : memref<32x32xi32>
  %288 = AIE.buffer(%282) {address = 12288 : i32, sym_name = "buf99"} : memref<32x32xi32>
  %289 = AIE.buffer(%282) {address = 16384 : i32, sym_name = "buf100"} : memref<32x32xi32>
  %290 = AIE.core(%282) {
    AIE.useLock(%284, Acquire, 1)
    AIE.useLock(%285, Acquire, 1)
    AIE.useLock(%296, Acquire, 0)
    call @extern_kernel(%289, %286, %287, %288) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%296, Release, 1)
    AIE.useLock(%285, Release, 0)
    AIE.useLock(%284, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %291 = AIE.mem(%282) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%285, Acquire, 0)
    AIE.dmaBd(<%287 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%285, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%284, Acquire, 0)
    AIE.dmaBd(<%288 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%284, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %292 = AIE.tile(17, 3)
  %293 = AIE.switchbox(%292) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %499)
    %503 = AIE.masterset(DMA : 1, %498)
    %504 = AIE.masterset(North : 0, %501)
    %505 = AIE.masterset(North : 1, %500)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %498)
      AIE.rule(31, 6, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %499)
      AIE.rule(31, 2, %501)
    }
  }
  %294 = AIE.lock(%292, 2)
  %295 = AIE.lock(%292, 1)
  %296 = AIE.lock(%292, 0)
  %297 = AIE.buffer(%292) {address = 4096 : i32, sym_name = "buf101"} : memref<32x32xi32>
  %298 = AIE.buffer(%292) {address = 8192 : i32, sym_name = "buf102"} : memref<32x32xi32>
  %299 = AIE.buffer(%292) {address = 12288 : i32, sym_name = "buf103"} : memref<32x32xi32>
  %300 = AIE.core(%292) {
    AIE.useLock(%296, Acquire, 1)
    AIE.useLock(%295, Acquire, 1)
    AIE.useLock(%307, Acquire, 0)
    AIE.useLock(%294, Acquire, 1)
    call @extern_kernel(%286, %297, %298, %299) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%294, Release, 0)
    AIE.useLock(%307, Release, 1)
    AIE.useLock(%295, Release, 0)
    AIE.useLock(%296, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %301 = AIE.mem(%292) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%294, Acquire, 0)
    AIE.dmaBd(<%298 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%294, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%295, Acquire, 0)
    AIE.dmaBd(<%299 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%295, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %302 = AIE.tile(17, 4) {polyaie.leaf}
  %303 = AIE.lock(%302, 15)
  %304 = AIE.switchbox(%302) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %500)
    %503 = AIE.masterset(DMA : 1, %498)
    %504 = AIE.masterset(West : 0, %499)
    %505 = AIE.masterset(West : 1, %501)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %501)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %499)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %500)
    }
  }
  %305 = AIE.lock(%302, 3)
  %306 = AIE.lock(%302, 2)
  %307 = AIE.lock(%302, 1)
  %308 = AIE.lock(%302, 0)
  %309 = AIE.buffer(%302) {address = 4096 : i32, sym_name = "buf104"} : memref<32x32xi32>
  %310 = AIE.buffer(%302) {address = 8192 : i32, sym_name = "buf105"} : memref<32x32xi32>
  %311 = AIE.buffer(%302) {address = 12288 : i32, sym_name = "buf106"} : memref<32x32xi32>
  %312 = AIE.core(%302) {
    AIE.useLock(%306, Acquire, 1)
    AIE.useLock(%308, Acquire, 1)
    AIE.useLock(%305, Acquire, 0)
    AIE.useLock(%307, Acquire, 1)
    call @extern_kernel(%297, %309, %310, %311) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%307, Release, 0)
    AIE.useLock(%305, Release, 1)
    AIE.useLock(%308, Release, 0)
    AIE.useLock(%306, Release, 0)
    AIE.useLock(%303, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %313 = AIE.mem(%302) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%308, Acquire, 0)
    AIE.dmaBd(<%310 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%308, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%306, Acquire, 0)
    AIE.dmaBd(<%311 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%306, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%305, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%309 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%305, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %314 = AIE.tile(18, 2)
  %315 = AIE.switchbox(%314) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %498)
    %503 = AIE.masterset(DMA : 1, %501)
    %504 = AIE.masterset(North : 0, %499)
    %505 = AIE.masterset(North : 1, %500)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %498)
      AIE.rule(31, 5, %500)
      AIE.rule(31, 6, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %501)
      AIE.rule(31, 1, %499)
      AIE.rule(31, 2, %499)
    }
  }
  %316 = AIE.lock(%314, 1)
  %317 = AIE.lock(%314, 0)
  %318 = AIE.buffer(%314) {address = 4096 : i32, sym_name = "buf107"} : memref<32x32xi32>
  %319 = AIE.buffer(%314) {address = 8192 : i32, sym_name = "buf108"} : memref<32x32xi32>
  %320 = AIE.buffer(%314) {address = 12288 : i32, sym_name = "buf109"} : memref<32x32xi32>
  %321 = AIE.buffer(%314) {address = 16384 : i32, sym_name = "buf110"} : memref<32x32xi32>
  %322 = AIE.core(%314) {
    AIE.useLock(%317, Acquire, 1)
    AIE.useLock(%327, Acquire, 0)
    AIE.useLock(%316, Acquire, 1)
    call @extern_kernel(%321, %318, %319, %320) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%316, Release, 0)
    AIE.useLock(%327, Release, 1)
    AIE.useLock(%317, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %323 = AIE.mem(%314) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%316, Acquire, 0)
    AIE.dmaBd(<%320 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%316, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%317, Acquire, 0)
    AIE.dmaBd(<%319 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%317, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %324 = AIE.tile(18, 3)
  %325 = AIE.switchbox(%324) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(DMA : 0, %498)
    %503 = AIE.masterset(DMA : 1, %501)
    %504 = AIE.masterset(North : 0, %500)
    %505 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %501)
      AIE.rule(31, 6, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %498)
      AIE.rule(31, 2, %500)
    }
  }
  %326 = AIE.lock(%324, 2)
  %327 = AIE.lock(%324, 1)
  %328 = AIE.lock(%324, 0)
  %329 = AIE.buffer(%324) {address = 4096 : i32, sym_name = "buf111"} : memref<32x32xi32>
  %330 = AIE.buffer(%324) {address = 8192 : i32, sym_name = "buf112"} : memref<32x32xi32>
  %331 = AIE.buffer(%324) {address = 12288 : i32, sym_name = "buf113"} : memref<32x32xi32>
  %332 = AIE.core(%324) {
    AIE.useLock(%327, Acquire, 1)
    AIE.useLock(%339, Acquire, 0)
    AIE.useLock(%328, Acquire, 1)
    AIE.useLock(%326, Acquire, 1)
    call @extern_kernel(%318, %329, %330, %331) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%326, Release, 0)
    AIE.useLock(%328, Release, 0)
    AIE.useLock(%339, Release, 1)
    AIE.useLock(%327, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %333 = AIE.mem(%324) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%326, Acquire, 0)
    AIE.dmaBd(<%330 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%326, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%328, Acquire, 0)
    AIE.dmaBd(<%331 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%328, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %334 = AIE.tile(18, 4) {polyaie.leaf}
  %335 = AIE.lock(%334, 15)
  %336 = AIE.switchbox(%334) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.masterset(DMA : 0, %500)
    %502 = AIE.masterset(DMA : 1, %499)
    %503 = AIE.masterset(West : 0, %498)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %498)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %500)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %499)
    }
  }
  %337 = AIE.lock(%334, 3)
  %338 = AIE.lock(%334, 2)
  %339 = AIE.lock(%334, 1)
  %340 = AIE.lock(%334, 0)
  %341 = AIE.buffer(%334) {address = 4096 : i32, sym_name = "buf114"} : memref<32x32xi32>
  %342 = AIE.buffer(%334) {address = 8192 : i32, sym_name = "buf115"} : memref<32x32xi32>
  %343 = AIE.buffer(%334) {address = 12288 : i32, sym_name = "buf116"} : memref<32x32xi32>
  %344 = AIE.core(%334) {
    AIE.useLock(%340, Acquire, 1)
    AIE.useLock(%339, Acquire, 1)
    AIE.useLock(%338, Acquire, 1)
    AIE.useLock(%337, Acquire, 0)
    call @extern_kernel(%329, %341, %342, %343) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%337, Release, 1)
    AIE.useLock(%338, Release, 0)
    AIE.useLock(%339, Release, 0)
    AIE.useLock(%340, Release, 0)
    AIE.useLock(%335, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %345 = AIE.mem(%334) {
    %498 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%338, Acquire, 0)
    AIE.dmaBd(<%343 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%338, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %499 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%340, Acquire, 0)
    AIE.dmaBd(<%342 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%340, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %500 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%337, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%341 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%337, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %346 = AIE.tile(12, 0)
  %347 = AIE.switchbox(%346) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(North : 0, %500)
    %503 = AIE.masterset(North : 1, %498)
    %504 = AIE.masterset(East : 0, %501)
    %505 = AIE.masterset(East : 1, %499)
    %506 = AIE.masterset(East : 2, %498)
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %499)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %500)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %501)
    }
  }
  %348 = AIE.tile(13, 0)
  %349 = AIE.switchbox(%348) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(North : 0, %501)
    %503 = AIE.masterset(North : 1, %500)
    %504 = AIE.masterset(East : 0, %501)
    %505 = AIE.masterset(East : 1, %498)
    %506 = AIE.masterset(East : 2, %499)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %499)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %500)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %501)
    }
  }
  %350 = AIE.tile(16, 0)
  %351 = AIE.switchbox(%350) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<0> (2)
    %502 = AIE.amsel<0> (3)
    %503 = AIE.masterset(West : 0, %498)
    %504 = AIE.masterset(North : 0, %501)
    %505 = AIE.masterset(North : 1, %500)
    %506 = AIE.masterset(East : 0, %499)
    %507 = AIE.masterset(East : 1, %502)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %502)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %499)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %500)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %498)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %501)
    }
  }
  %352 = AIE.tile(9, 2)
  %353 = AIE.switchbox(%352) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(South : 0, %498)
    %503 = AIE.masterset(East : 0, %499)
    %504 = AIE.masterset(East : 1, %500)
    %505 = AIE.masterset(East : 2, %501)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %501)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %499)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %498)
    }
  }
  %354 = AIE.tile(9, 4)
  %355 = AIE.switchbox(%354) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.masterset(South : 0, %498)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %498)
    }
  }
  %356 = AIE.tile(16, 1)
  %357 = AIE.switchbox(%356) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.masterset(North : 0, %498)
    %501 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %498)
    }
  }
  %358 = AIE.tile(15, 1)
  %359 = AIE.switchbox(%358) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.masterset(North : 0, %499)
    %501 = AIE.masterset(North : 1, %498)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %499)
    }
  }
  %360 = AIE.tile(9, 1)
  %361 = AIE.switchbox(%360) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(South : 0, %500)
    %503 = AIE.masterset(South : 1, %501)
    %504 = AIE.masterset(South : 2, %499)
    %505 = AIE.masterset(East : 0, %498)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %499)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %501)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %500)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %498)
    }
  }
  %362 = AIE.tile(17, 1)
  %363 = AIE.switchbox(%362) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.masterset(North : 0, %499)
    %501 = AIE.masterset(North : 1, %498)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %499)
    }
  }
  %364 = AIE.tile(17, 0)
  %365 = AIE.switchbox(%364) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(West : 0, %498)
    %503 = AIE.masterset(West : 1, %499)
    %504 = AIE.masterset(North : 0, %499)
    %505 = AIE.masterset(North : 1, %501)
    %506 = AIE.masterset(East : 0, %500)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %500)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %501)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %499)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %498)
    }
  }
  %366 = AIE.tile(9, 0)
  %367 = AIE.switchbox(%366) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.masterset(East : 0, %500)
    %502 = AIE.masterset(East : 1, %498)
    %503 = AIE.masterset(East : 2, %499)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %499)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %498)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %500)
    }
  }
  %368 = AIE.tile(14, 0)
  %369 = AIE.switchbox(%368) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(West : 0, %501)
    %503 = AIE.masterset(North : 0, %501)
    %504 = AIE.masterset(North : 1, %498)
    %505 = AIE.masterset(East : 0, %500)
    %506 = AIE.masterset(East : 1, %498)
    %507 = AIE.masterset(East : 2, %499)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %499)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %501)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %500)
    }
  }
  %370 = AIE.tile(12, 1)
  %371 = AIE.switchbox(%370) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.masterset(North : 0, %499)
    %501 = AIE.masterset(North : 1, %498)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %499)
    }
  }
  %372 = AIE.tile(15, 0)
  %373 = AIE.switchbox(%372) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(West : 0, %499)
    %503 = AIE.masterset(North : 0, %499)
    %504 = AIE.masterset(North : 1, %498)
    %505 = AIE.masterset(East : 0, %500)
    %506 = AIE.masterset(East : 1, %501)
    %507 = AIE.masterset(East : 2, %498)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %501)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %499)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %500)
    }
  }
  %374 = AIE.tile(11, 1)
  %375 = AIE.switchbox(%374) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<0> (1)
    %501 = AIE.amsel<1> (1)
    %502 = AIE.amsel<0> (2)
    %503 = AIE.amsel<1> (2)
    %504 = AIE.amsel<0> (3)
    %505 = AIE.masterset(South : 0, %503)
    %506 = AIE.masterset(South : 1, %501)
    %507 = AIE.masterset(West : 0, %502)
    %508 = AIE.masterset(West : 1, %499)
    %509 = AIE.masterset(West : 2, %504)
    %510 = AIE.masterset(North : 0, %500)
    %511 = AIE.masterset(North : 1, %498)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 0, %501)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %504)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %499)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %502)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %503)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %498)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %500)
    }
  }
  %376 = AIE.tile(14, 1)
  %377 = AIE.switchbox(%376) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.masterset(North : 0, %498)
    %501 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %498)
    }
  }
  %378 = AIE.tile(13, 1)
  %379 = AIE.switchbox(%378) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.masterset(North : 0, %498)
    %501 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %498)
    }
  }
  %380 = AIE.tile(18, 1)
  %381 = AIE.switchbox(%380) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.masterset(North : 0, %498)
    %501 = AIE.masterset(North : 1, %499)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %499)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %498)
    }
  }
  %382 = AIE.tile(9, 3)
  %383 = AIE.switchbox(%382) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<0> (1)
    %500 = AIE.amsel<0> (2)
    %501 = AIE.amsel<0> (3)
    %502 = AIE.masterset(South : 0, %499)
    %503 = AIE.masterset(South : 1, %501)
    %504 = AIE.masterset(South : 2, %500)
    %505 = AIE.masterset(East : 0, %498)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %500)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %501)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %499)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %498)
    }
  }
  %384 = AIE.tile(10, 1)
  %385 = AIE.switchbox(%384) {
    %498 = AIE.amsel<0> (0)
    %499 = AIE.amsel<1> (0)
    %500 = AIE.amsel<2> (0)
    %501 = AIE.amsel<0> (1)
    %502 = AIE.amsel<1> (1)
    %503 = AIE.amsel<2> (1)
    %504 = AIE.amsel<0> (2)
    %505 = AIE.amsel<1> (2)
    %506 = AIE.amsel<0> (3)
    %507 = AIE.amsel<1> (3)
    %508 = AIE.masterset(South : 0, %503)
    %509 = AIE.masterset(South : 1, %498)
    %510 = AIE.masterset(South : 2, %499)
    %511 = AIE.masterset(South : 3, %501)
    %512 = AIE.masterset(West : 0, %502)
    %513 = AIE.masterset(West : 1, %500)
    %514 = AIE.masterset(West : 2, %507)
    %515 = AIE.masterset(North : 0, %504)
    %516 = AIE.masterset(North : 1, %506)
    %517 = AIE.masterset(East : 0, %505)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %507)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %500)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %502)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %505)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %501)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %499)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %498)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %503)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %506)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %504)
    }
  }
  %386 = AIE.tile(0, 1)
  %387 = AIE.tile(0, 2)
  %388 = AIE.tile(0, 3)
  %389 = AIE.tile(0, 4)
  %390 = AIE.tile(1, 0)
  %391 = AIE.tile(1, 1)
  %392 = AIE.tile(1, 2)
  %393 = AIE.tile(1, 3)
  %394 = AIE.tile(1, 4)
  %395 = AIE.tile(2, 0)
  %396 = AIE.tile(2, 1)
  %397 = AIE.tile(2, 2)
  %398 = AIE.tile(2, 3)
  %399 = AIE.tile(2, 4)
  %400 = AIE.tile(3, 0)
  %401 = AIE.tile(3, 1)
  %402 = AIE.tile(3, 2)
  %403 = AIE.tile(3, 3)
  %404 = AIE.tile(3, 4)
  %405 = AIE.tile(4, 0)
  %406 = AIE.tile(4, 1)
  %407 = AIE.tile(4, 2)
  %408 = AIE.tile(4, 3)
  %409 = AIE.tile(4, 4)
  %410 = AIE.tile(5, 0)
  %411 = AIE.tile(5, 1)
  %412 = AIE.tile(5, 2)
  %413 = AIE.tile(5, 3)
  %414 = AIE.tile(5, 4)
  %415 = AIE.tile(6, 0)
  %416 = AIE.tile(6, 1)
  %417 = AIE.tile(6, 2)
  %418 = AIE.tile(6, 3)
  %419 = AIE.tile(6, 4)
  %420 = AIE.tile(7, 0)
  %421 = AIE.tile(7, 1)
  %422 = AIE.tile(7, 2)
  %423 = AIE.tile(7, 3)
  %424 = AIE.tile(7, 4)
  %425 = AIE.tile(8, 0)
  %426 = AIE.tile(8, 1)
  %427 = AIE.tile(8, 2)
  %428 = AIE.tile(8, 3)
  %429 = AIE.tile(8, 4)
  %430 = AIE.switchbox(%57) {
  }
  %431 = AIE.switchbox(%386) {
  }
  %432 = AIE.switchbox(%387) {
  }
  %433 = AIE.switchbox(%388) {
  }
  %434 = AIE.switchbox(%389) {
  }
  %435 = AIE.switchbox(%390) {
  }
  %436 = AIE.switchbox(%391) {
  }
  %437 = AIE.switchbox(%392) {
  }
  %438 = AIE.switchbox(%393) {
  }
  %439 = AIE.switchbox(%394) {
  }
  %440 = AIE.switchbox(%395) {
  }
  %441 = AIE.switchbox(%396) {
  }
  %442 = AIE.switchbox(%397) {
  }
  %443 = AIE.switchbox(%398) {
  }
  %444 = AIE.switchbox(%399) {
  }
  %445 = AIE.switchbox(%400) {
  }
  %446 = AIE.switchbox(%401) {
  }
  %447 = AIE.switchbox(%402) {
  }
  %448 = AIE.switchbox(%403) {
  }
  %449 = AIE.switchbox(%404) {
  }
  %450 = AIE.switchbox(%405) {
  }
  %451 = AIE.switchbox(%406) {
  }
  %452 = AIE.switchbox(%407) {
  }
  %453 = AIE.switchbox(%408) {
  }
  %454 = AIE.switchbox(%409) {
  }
  %455 = AIE.switchbox(%410) {
  }
  %456 = AIE.switchbox(%411) {
  }
  %457 = AIE.switchbox(%412) {
  }
  %458 = AIE.switchbox(%413) {
  }
  %459 = AIE.switchbox(%414) {
  }
  %460 = AIE.switchbox(%415) {
  }
  %461 = AIE.switchbox(%416) {
  }
  %462 = AIE.switchbox(%417) {
  }
  %463 = AIE.switchbox(%418) {
  }
  %464 = AIE.switchbox(%419) {
  }
  %465 = AIE.switchbox(%420) {
  }
  %466 = AIE.switchbox(%421) {
  }
  %467 = AIE.switchbox(%422) {
  }
  %468 = AIE.switchbox(%423) {
  }
  %469 = AIE.switchbox(%424) {
  }
  %470 = AIE.switchbox(%425) {
  }
  %471 = AIE.switchbox(%426) {
  }
  %472 = AIE.switchbox(%427) {
  }
  %473 = AIE.switchbox(%428) {
  }
  %474 = AIE.switchbox(%429) {
  }
  %475 = AIE.plio(0)
  %476 = AIE.plio(1)
  %477 = AIE.plio(2)
  %478 = AIE.plio(3)
  %479 = AIE.plio(4)
  %480 = AIE.plio(5)
  %481 = AIE.plio(6)
  %482 = AIE.plio(7)
  %483 = AIE.plio(8)
  %484 = AIE.plio(9)
  %485 = AIE.plio(10)
  %486 = AIE.plio(11)
  %487 = AIE.plio(12)
  %488 = AIE.plio(13)
  %489 = AIE.plio(14)
  %490 = AIE.plio(15)
  %491 = AIE.plio(16)
  %492 = AIE.plio(17)
  %493 = AIE.plio(18)
  AIE.wire(%386 : Core, %431 : Core)
  AIE.wire(%386 : DMA, %431 : DMA)
  AIE.wire(%430 : North, %431 : South)
  AIE.wire(%387 : Core, %432 : Core)
  AIE.wire(%387 : DMA, %432 : DMA)
  AIE.wire(%431 : North, %432 : South)
  AIE.wire(%388 : Core, %433 : Core)
  AIE.wire(%388 : DMA, %433 : DMA)
  AIE.wire(%432 : North, %433 : South)
  AIE.wire(%389 : Core, %434 : Core)
  AIE.wire(%389 : DMA, %434 : DMA)
  AIE.wire(%433 : North, %434 : South)
  AIE.wire(%430 : East, %435 : West)
  AIE.wire(%476 : North, %435 : South)
  AIE.wire(%431 : East, %436 : West)
  AIE.wire(%391 : Core, %436 : Core)
  AIE.wire(%391 : DMA, %436 : DMA)
  AIE.wire(%435 : North, %436 : South)
  AIE.wire(%432 : East, %437 : West)
  AIE.wire(%392 : Core, %437 : Core)
  AIE.wire(%392 : DMA, %437 : DMA)
  AIE.wire(%436 : North, %437 : South)
  AIE.wire(%433 : East, %438 : West)
  AIE.wire(%393 : Core, %438 : Core)
  AIE.wire(%393 : DMA, %438 : DMA)
  AIE.wire(%437 : North, %438 : South)
  AIE.wire(%434 : East, %439 : West)
  AIE.wire(%394 : Core, %439 : Core)
  AIE.wire(%394 : DMA, %439 : DMA)
  AIE.wire(%438 : North, %439 : South)
  AIE.wire(%435 : East, %440 : West)
  %494 = AIE.shimmux(%395) {
  }
  AIE.wire(%494 : North, %440 : South)
  AIE.wire(%477 : North, %494 : South)
  AIE.wire(%395 : DMA, %494 : DMA)
  AIE.wire(%436 : East, %441 : West)
  AIE.wire(%396 : Core, %441 : Core)
  AIE.wire(%396 : DMA, %441 : DMA)
  AIE.wire(%440 : North, %441 : South)
  AIE.wire(%437 : East, %442 : West)
  AIE.wire(%397 : Core, %442 : Core)
  AIE.wire(%397 : DMA, %442 : DMA)
  AIE.wire(%441 : North, %442 : South)
  AIE.wire(%438 : East, %443 : West)
  AIE.wire(%398 : Core, %443 : Core)
  AIE.wire(%398 : DMA, %443 : DMA)
  AIE.wire(%442 : North, %443 : South)
  AIE.wire(%439 : East, %444 : West)
  AIE.wire(%399 : Core, %444 : Core)
  AIE.wire(%399 : DMA, %444 : DMA)
  AIE.wire(%443 : North, %444 : South)
  AIE.wire(%440 : East, %445 : West)
  %495 = AIE.shimmux(%400) {
  }
  AIE.wire(%495 : North, %445 : South)
  AIE.wire(%478 : North, %495 : South)
  AIE.wire(%400 : DMA, %495 : DMA)
  AIE.wire(%441 : East, %446 : West)
  AIE.wire(%401 : Core, %446 : Core)
  AIE.wire(%401 : DMA, %446 : DMA)
  AIE.wire(%445 : North, %446 : South)
  AIE.wire(%442 : East, %447 : West)
  AIE.wire(%402 : Core, %447 : Core)
  AIE.wire(%402 : DMA, %447 : DMA)
  AIE.wire(%446 : North, %447 : South)
  AIE.wire(%443 : East, %448 : West)
  AIE.wire(%403 : Core, %448 : Core)
  AIE.wire(%403 : DMA, %448 : DMA)
  AIE.wire(%447 : North, %448 : South)
  AIE.wire(%444 : East, %449 : West)
  AIE.wire(%404 : Core, %449 : Core)
  AIE.wire(%404 : DMA, %449 : DMA)
  AIE.wire(%448 : North, %449 : South)
  AIE.wire(%445 : East, %450 : West)
  AIE.wire(%479 : North, %450 : South)
  AIE.wire(%446 : East, %451 : West)
  AIE.wire(%406 : Core, %451 : Core)
  AIE.wire(%406 : DMA, %451 : DMA)
  AIE.wire(%450 : North, %451 : South)
  AIE.wire(%447 : East, %452 : West)
  AIE.wire(%407 : Core, %452 : Core)
  AIE.wire(%407 : DMA, %452 : DMA)
  AIE.wire(%451 : North, %452 : South)
  AIE.wire(%448 : East, %453 : West)
  AIE.wire(%408 : Core, %453 : Core)
  AIE.wire(%408 : DMA, %453 : DMA)
  AIE.wire(%452 : North, %453 : South)
  AIE.wire(%449 : East, %454 : West)
  AIE.wire(%409 : Core, %454 : Core)
  AIE.wire(%409 : DMA, %454 : DMA)
  AIE.wire(%453 : North, %454 : South)
  AIE.wire(%450 : East, %455 : West)
  AIE.wire(%480 : North, %455 : South)
  AIE.wire(%451 : East, %456 : West)
  AIE.wire(%411 : Core, %456 : Core)
  AIE.wire(%411 : DMA, %456 : DMA)
  AIE.wire(%455 : North, %456 : South)
  AIE.wire(%452 : East, %457 : West)
  AIE.wire(%412 : Core, %457 : Core)
  AIE.wire(%412 : DMA, %457 : DMA)
  AIE.wire(%456 : North, %457 : South)
  AIE.wire(%453 : East, %458 : West)
  AIE.wire(%413 : Core, %458 : Core)
  AIE.wire(%413 : DMA, %458 : DMA)
  AIE.wire(%457 : North, %458 : South)
  AIE.wire(%454 : East, %459 : West)
  AIE.wire(%414 : Core, %459 : Core)
  AIE.wire(%414 : DMA, %459 : DMA)
  AIE.wire(%458 : North, %459 : South)
  AIE.wire(%455 : East, %460 : West)
  %496 = AIE.shimmux(%415) {
  }
  AIE.wire(%496 : North, %460 : South)
  AIE.wire(%481 : North, %496 : South)
  AIE.wire(%415 : DMA, %496 : DMA)
  AIE.wire(%456 : East, %461 : West)
  AIE.wire(%416 : Core, %461 : Core)
  AIE.wire(%416 : DMA, %461 : DMA)
  AIE.wire(%460 : North, %461 : South)
  AIE.wire(%457 : East, %462 : West)
  AIE.wire(%417 : Core, %462 : Core)
  AIE.wire(%417 : DMA, %462 : DMA)
  AIE.wire(%461 : North, %462 : South)
  AIE.wire(%458 : East, %463 : West)
  AIE.wire(%418 : Core, %463 : Core)
  AIE.wire(%418 : DMA, %463 : DMA)
  AIE.wire(%462 : North, %463 : South)
  AIE.wire(%459 : East, %464 : West)
  AIE.wire(%419 : Core, %464 : Core)
  AIE.wire(%419 : DMA, %464 : DMA)
  AIE.wire(%463 : North, %464 : South)
  AIE.wire(%460 : East, %465 : West)
  %497 = AIE.shimmux(%420) {
  }
  AIE.wire(%497 : North, %465 : South)
  AIE.wire(%482 : North, %497 : South)
  AIE.wire(%420 : DMA, %497 : DMA)
  AIE.wire(%461 : East, %466 : West)
  AIE.wire(%421 : Core, %466 : Core)
  AIE.wire(%421 : DMA, %466 : DMA)
  AIE.wire(%465 : North, %466 : South)
  AIE.wire(%462 : East, %467 : West)
  AIE.wire(%422 : Core, %467 : Core)
  AIE.wire(%422 : DMA, %467 : DMA)
  AIE.wire(%466 : North, %467 : South)
  AIE.wire(%463 : East, %468 : West)
  AIE.wire(%423 : Core, %468 : Core)
  AIE.wire(%423 : DMA, %468 : DMA)
  AIE.wire(%467 : North, %468 : South)
  AIE.wire(%464 : East, %469 : West)
  AIE.wire(%424 : Core, %469 : Core)
  AIE.wire(%424 : DMA, %469 : DMA)
  AIE.wire(%468 : North, %469 : South)
  AIE.wire(%465 : East, %470 : West)
  AIE.wire(%483 : North, %470 : South)
  AIE.wire(%466 : East, %471 : West)
  AIE.wire(%426 : Core, %471 : Core)
  AIE.wire(%426 : DMA, %471 : DMA)
  AIE.wire(%470 : North, %471 : South)
  AIE.wire(%467 : East, %472 : West)
  AIE.wire(%427 : Core, %472 : Core)
  AIE.wire(%427 : DMA, %472 : DMA)
  AIE.wire(%471 : North, %472 : South)
  AIE.wire(%468 : East, %473 : West)
  AIE.wire(%428 : Core, %473 : Core)
  AIE.wire(%428 : DMA, %473 : DMA)
  AIE.wire(%472 : North, %473 : South)
  AIE.wire(%469 : East, %474 : West)
  AIE.wire(%429 : Core, %474 : Core)
  AIE.wire(%429 : DMA, %474 : DMA)
  AIE.wire(%473 : North, %474 : South)
  AIE.wire(%470 : East, %367 : West)
  AIE.wire(%484 : North, %367 : South)
  AIE.wire(%471 : East, %361 : West)
  AIE.wire(%360 : Core, %361 : Core)
  AIE.wire(%360 : DMA, %361 : DMA)
  AIE.wire(%367 : North, %361 : South)
  AIE.wire(%472 : East, %353 : West)
  AIE.wire(%352 : Core, %353 : Core)
  AIE.wire(%352 : DMA, %353 : DMA)
  AIE.wire(%361 : North, %353 : South)
  AIE.wire(%473 : East, %383 : West)
  AIE.wire(%382 : Core, %383 : Core)
  AIE.wire(%382 : DMA, %383 : DMA)
  AIE.wire(%353 : North, %383 : South)
  AIE.wire(%474 : East, %355 : West)
  AIE.wire(%354 : Core, %355 : Core)
  AIE.wire(%354 : DMA, %355 : DMA)
  AIE.wire(%383 : North, %355 : South)
  AIE.wire(%367 : East, %2 : West)
  AIE.wire(%1 : North, %2 : South)
  AIE.wire(%485 : North, %1 : South)
  AIE.wire(%0 : DMA, %1 : DMA)
  AIE.wire(%361 : East, %385 : West)
  AIE.wire(%384 : Core, %385 : Core)
  AIE.wire(%384 : DMA, %385 : DMA)
  AIE.wire(%2 : North, %385 : South)
  AIE.wire(%353 : East, %59 : West)
  AIE.wire(%58 : Core, %59 : Core)
  AIE.wire(%58 : DMA, %59 : DMA)
  AIE.wire(%385 : North, %59 : South)
  AIE.wire(%383 : East, %69 : West)
  AIE.wire(%68 : Core, %69 : Core)
  AIE.wire(%68 : DMA, %69 : DMA)
  AIE.wire(%59 : North, %69 : South)
  AIE.wire(%355 : East, %80 : West)
  AIE.wire(%78 : Core, %80 : Core)
  AIE.wire(%78 : DMA, %80 : DMA)
  AIE.wire(%69 : North, %80 : South)
  AIE.wire(%2 : East, %42 : West)
  AIE.wire(%41 : North, %42 : South)
  AIE.wire(%486 : North, %41 : South)
  AIE.wire(%40 : DMA, %41 : DMA)
  AIE.wire(%385 : East, %375 : West)
  AIE.wire(%374 : Core, %375 : Core)
  AIE.wire(%374 : DMA, %375 : DMA)
  AIE.wire(%42 : North, %375 : South)
  AIE.wire(%59 : East, %91 : West)
  AIE.wire(%90 : Core, %91 : Core)
  AIE.wire(%90 : DMA, %91 : DMA)
  AIE.wire(%375 : North, %91 : South)
  AIE.wire(%69 : East, %101 : West)
  AIE.wire(%100 : Core, %101 : Core)
  AIE.wire(%100 : DMA, %101 : DMA)
  AIE.wire(%91 : North, %101 : South)
  AIE.wire(%80 : East, %112 : West)
  AIE.wire(%110 : Core, %112 : Core)
  AIE.wire(%110 : DMA, %112 : DMA)
  AIE.wire(%101 : North, %112 : South)
  AIE.wire(%42 : East, %347 : West)
  AIE.wire(%487 : North, %347 : South)
  AIE.wire(%375 : East, %371 : West)
  AIE.wire(%370 : Core, %371 : Core)
  AIE.wire(%370 : DMA, %371 : DMA)
  AIE.wire(%347 : North, %371 : South)
  AIE.wire(%91 : East, %123 : West)
  AIE.wire(%122 : Core, %123 : Core)
  AIE.wire(%122 : DMA, %123 : DMA)
  AIE.wire(%371 : North, %123 : South)
  AIE.wire(%101 : East, %133 : West)
  AIE.wire(%132 : Core, %133 : Core)
  AIE.wire(%132 : DMA, %133 : DMA)
  AIE.wire(%123 : North, %133 : South)
  AIE.wire(%112 : East, %144 : West)
  AIE.wire(%142 : Core, %144 : Core)
  AIE.wire(%142 : DMA, %144 : DMA)
  AIE.wire(%133 : North, %144 : South)
  AIE.wire(%347 : East, %349 : West)
  AIE.wire(%488 : North, %349 : South)
  AIE.wire(%371 : East, %379 : West)
  AIE.wire(%378 : Core, %379 : Core)
  AIE.wire(%378 : DMA, %379 : DMA)
  AIE.wire(%349 : North, %379 : South)
  AIE.wire(%123 : East, %155 : West)
  AIE.wire(%154 : Core, %155 : Core)
  AIE.wire(%154 : DMA, %155 : DMA)
  AIE.wire(%379 : North, %155 : South)
  AIE.wire(%133 : East, %165 : West)
  AIE.wire(%164 : Core, %165 : Core)
  AIE.wire(%164 : DMA, %165 : DMA)
  AIE.wire(%155 : North, %165 : South)
  AIE.wire(%144 : East, %176 : West)
  AIE.wire(%174 : Core, %176 : Core)
  AIE.wire(%174 : DMA, %176 : DMA)
  AIE.wire(%165 : North, %176 : South)
  AIE.wire(%349 : East, %369 : West)
  AIE.wire(%489 : North, %369 : South)
  AIE.wire(%379 : East, %377 : West)
  AIE.wire(%376 : Core, %377 : Core)
  AIE.wire(%376 : DMA, %377 : DMA)
  AIE.wire(%369 : North, %377 : South)
  AIE.wire(%155 : East, %187 : West)
  AIE.wire(%186 : Core, %187 : Core)
  AIE.wire(%186 : DMA, %187 : DMA)
  AIE.wire(%377 : North, %187 : South)
  AIE.wire(%165 : East, %197 : West)
  AIE.wire(%196 : Core, %197 : Core)
  AIE.wire(%196 : DMA, %197 : DMA)
  AIE.wire(%187 : North, %197 : South)
  AIE.wire(%176 : East, %208 : West)
  AIE.wire(%206 : Core, %208 : Core)
  AIE.wire(%206 : DMA, %208 : DMA)
  AIE.wire(%197 : North, %208 : South)
  AIE.wire(%369 : East, %373 : West)
  AIE.wire(%490 : North, %373 : South)
  AIE.wire(%377 : East, %359 : West)
  AIE.wire(%358 : Core, %359 : Core)
  AIE.wire(%358 : DMA, %359 : DMA)
  AIE.wire(%373 : North, %359 : South)
  AIE.wire(%187 : East, %219 : West)
  AIE.wire(%218 : Core, %219 : Core)
  AIE.wire(%218 : DMA, %219 : DMA)
  AIE.wire(%359 : North, %219 : South)
  AIE.wire(%197 : East, %229 : West)
  AIE.wire(%228 : Core, %229 : Core)
  AIE.wire(%228 : DMA, %229 : DMA)
  AIE.wire(%219 : North, %229 : South)
  AIE.wire(%208 : East, %240 : West)
  AIE.wire(%238 : Core, %240 : Core)
  AIE.wire(%238 : DMA, %240 : DMA)
  AIE.wire(%229 : North, %240 : South)
  AIE.wire(%373 : East, %351 : West)
  AIE.wire(%491 : North, %351 : South)
  AIE.wire(%359 : East, %357 : West)
  AIE.wire(%356 : Core, %357 : Core)
  AIE.wire(%356 : DMA, %357 : DMA)
  AIE.wire(%351 : North, %357 : South)
  AIE.wire(%219 : East, %251 : West)
  AIE.wire(%250 : Core, %251 : Core)
  AIE.wire(%250 : DMA, %251 : DMA)
  AIE.wire(%357 : North, %251 : South)
  AIE.wire(%229 : East, %261 : West)
  AIE.wire(%260 : Core, %261 : Core)
  AIE.wire(%260 : DMA, %261 : DMA)
  AIE.wire(%251 : North, %261 : South)
  AIE.wire(%240 : East, %272 : West)
  AIE.wire(%270 : Core, %272 : Core)
  AIE.wire(%270 : DMA, %272 : DMA)
  AIE.wire(%261 : North, %272 : South)
  AIE.wire(%351 : East, %365 : West)
  AIE.wire(%492 : North, %365 : South)
  AIE.wire(%357 : East, %363 : West)
  AIE.wire(%362 : Core, %363 : Core)
  AIE.wire(%362 : DMA, %363 : DMA)
  AIE.wire(%365 : North, %363 : South)
  AIE.wire(%251 : East, %283 : West)
  AIE.wire(%282 : Core, %283 : Core)
  AIE.wire(%282 : DMA, %283 : DMA)
  AIE.wire(%363 : North, %283 : South)
  AIE.wire(%261 : East, %293 : West)
  AIE.wire(%292 : Core, %293 : Core)
  AIE.wire(%292 : DMA, %293 : DMA)
  AIE.wire(%283 : North, %293 : South)
  AIE.wire(%272 : East, %304 : West)
  AIE.wire(%302 : Core, %304 : Core)
  AIE.wire(%302 : DMA, %304 : DMA)
  AIE.wire(%293 : North, %304 : South)
  AIE.wire(%365 : East, %26 : West)
  AIE.wire(%25 : North, %26 : South)
  AIE.wire(%493 : North, %25 : South)
  AIE.wire(%24 : DMA, %25 : DMA)
  AIE.wire(%363 : East, %381 : West)
  AIE.wire(%380 : Core, %381 : Core)
  AIE.wire(%380 : DMA, %381 : DMA)
  AIE.wire(%26 : North, %381 : South)
  AIE.wire(%283 : East, %315 : West)
  AIE.wire(%314 : Core, %315 : Core)
  AIE.wire(%314 : DMA, %315 : DMA)
  AIE.wire(%381 : North, %315 : South)
  AIE.wire(%293 : East, %325 : West)
  AIE.wire(%324 : Core, %325 : Core)
  AIE.wire(%324 : DMA, %325 : DMA)
  AIE.wire(%315 : North, %325 : South)
  AIE.wire(%304 : East, %336 : West)
  AIE.wire(%334 : Core, %336 : Core)
  AIE.wire(%334 : DMA, %336 : DMA)
  AIE.wire(%325 : North, %336 : South)
}


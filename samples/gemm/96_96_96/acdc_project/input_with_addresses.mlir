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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(South : 2, %388)
    %391 = AIE.masterset(South : 3, %389)
    %392 = AIE.masterset(North : 0, %386)
    %393 = AIE.masterset(North : 1, %387)
    %394 = AIE.masterset(East : 0, %386)
    %395 = AIE.masterset(East : 1, %387)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %389)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %388)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %386)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
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
    %387 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
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
    %388 = AIE.dmaStart(MM2S0, ^bb11, ^bb14)
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
    %389 = AIE.dmaStart(MM2S1, ^bb15, ^bb18)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.masterset(West : 0, %388)
    %390 = AIE.masterset(West : 1, %387)
    %391 = AIE.masterset(North : 0, %387)
    %392 = AIE.masterset(North : 1, %386)
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 0, %388)
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
    %386 = AIE.dmaStart(MM2S0, ^bb1, ^bb4)
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
    %387 = AIE.dmaStart(MM2S1, ^bb5, ^bb8)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(South : 2, %389)
    %393 = AIE.masterset(West : 0, %388)
    %394 = AIE.masterset(North : 0, %386)
    %395 = AIE.masterset(North : 1, %387)
    %396 = AIE.masterset(East : 0, %390)
    %397 = AIE.masterset(East : 1, %386)
    %398 = AIE.masterset(East : 2, %387)
    %399 = AIE.masterset(East : 3, %391)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(28, 4, %391)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %390)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBd(<%55 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(MM2S0, ^bb3, ^bb6)
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
    %388 = AIE.dmaStart(MM2S1, ^bb7, ^bb10)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<2> (0)
    %389 = AIE.amsel<0> (1)
    %390 = AIE.amsel<1> (1)
    %391 = AIE.amsel<2> (1)
    %392 = AIE.amsel<0> (2)
    %393 = AIE.amsel<1> (2)
    %394 = AIE.amsel<2> (2)
    %395 = AIE.amsel<0> (3)
    %396 = AIE.amsel<1> (3)
    %397 = AIE.amsel<2> (3)
    %398 = AIE.masterset(DMA : 0, %392)
    %399 = AIE.masterset(DMA : 1, %386)
    %400 = AIE.masterset(South : 0, %393)
    %401 = AIE.masterset(South : 1, %397)
    %402 = AIE.masterset(South : 2, %388)
    %403 = AIE.masterset(South : 3, %394)
    %404 = AIE.masterset(West : 0, %391)
    %405 = AIE.masterset(North : 0, %396)
    %406 = AIE.masterset(North : 1, %395)
    %407 = AIE.masterset(East : 0, %387)
    %408 = AIE.masterset(East : 1, %389)
    %409 = AIE.masterset(East : 2, %390)
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %390)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %391)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %394)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %397)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %386)
      AIE.rule(31, 1, %395)
      AIE.rule(31, 2, %395)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %392)
      AIE.rule(31, 5, %396)
      AIE.rule(31, 6, %396)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%61, Acquire, 0)
    AIE.dmaBd(<%64 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%61, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<2> (0)
    %389 = AIE.amsel<0> (1)
    %390 = AIE.amsel<1> (1)
    %391 = AIE.amsel<2> (1)
    %392 = AIE.amsel<0> (2)
    %393 = AIE.amsel<1> (2)
    %394 = AIE.amsel<2> (2)
    %395 = AIE.amsel<0> (3)
    %396 = AIE.amsel<1> (3)
    %397 = AIE.amsel<2> (3)
    %398 = AIE.masterset(DMA : 0, %386)
    %399 = AIE.masterset(DMA : 1, %397)
    %400 = AIE.masterset(South : 0, %396)
    %401 = AIE.masterset(South : 1, %394)
    %402 = AIE.masterset(South : 2, %391)
    %403 = AIE.masterset(South : 3, %393)
    %404 = AIE.masterset(West : 0, %388)
    %405 = AIE.masterset(West : 1, %390)
    %406 = AIE.masterset(West : 2, %392)
    %407 = AIE.masterset(North : 0, %389)
    %408 = AIE.masterset(North : 1, %387)
    %409 = AIE.masterset(East : 0, %395)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %392)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %390)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %388)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %395)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %393)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %391)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %394)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %396)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %397)
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %389)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%71, Acquire, 0)
    AIE.dmaBd(<%75 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%71, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.masterset(DMA : 0, %390)
    %394 = AIE.masterset(DMA : 1, %391)
    %395 = AIE.masterset(South : 0, %386)
    %396 = AIE.masterset(South : 1, %389)
    %397 = AIE.masterset(South : 2, %392)
    %398 = AIE.masterset(South : 3, %387)
    %399 = AIE.masterset(West : 0, %388)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %392)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %389)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %386)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %390)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %391)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%84, Acquire, 0)
    AIE.dmaBd(<%86 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%84, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%81, Acquire, 0)
    AIE.dmaBd(<%87 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<2> (0)
    %389 = AIE.amsel<0> (1)
    %390 = AIE.amsel<1> (1)
    %391 = AIE.amsel<0> (2)
    %392 = AIE.amsel<1> (2)
    %393 = AIE.amsel<0> (3)
    %394 = AIE.amsel<1> (3)
    %395 = AIE.masterset(DMA : 0, %394)
    %396 = AIE.masterset(DMA : 1, %390)
    %397 = AIE.masterset(South : 0, %392)
    %398 = AIE.masterset(South : 1, %391)
    %399 = AIE.masterset(South : 2, %387)
    %400 = AIE.masterset(South : 3, %386)
    %401 = AIE.masterset(West : 0, %389)
    %402 = AIE.masterset(North : 0, %393)
    %403 = AIE.masterset(North : 1, %388)
    AIE.packetrules(North : 1) {
      AIE.rule(31, 0, %386)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(31, 2, %391)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 1, %392)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %390)
      AIE.rule(31, 5, %388)
      AIE.rule(31, 6, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %394)
      AIE.rule(31, 1, %393)
      AIE.rule(31, 2, %393)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%93, Acquire, 0)
    AIE.dmaBd(<%95 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%93, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<2> (0)
    %389 = AIE.amsel<0> (1)
    %390 = AIE.amsel<1> (1)
    %391 = AIE.amsel<0> (2)
    %392 = AIE.amsel<1> (2)
    %393 = AIE.amsel<0> (3)
    %394 = AIE.amsel<1> (3)
    %395 = AIE.masterset(DMA : 0, %393)
    %396 = AIE.masterset(DMA : 1, %388)
    %397 = AIE.masterset(South : 0, %394)
    %398 = AIE.masterset(South : 1, %392)
    %399 = AIE.masterset(West : 0, %390)
    %400 = AIE.masterset(West : 1, %386)
    %401 = AIE.masterset(West : 2, %387)
    %402 = AIE.masterset(North : 0, %389)
    %403 = AIE.masterset(North : 1, %391)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %392)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %390)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %394)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %393)
      AIE.rule(31, 6, %391)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %388)
      AIE.rule(31, 2, %389)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%102, Acquire, 0)
    AIE.dmaBd(<%107 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%102, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.masterset(DMA : 0, %388)
    %394 = AIE.masterset(DMA : 1, %391)
    %395 = AIE.masterset(South : 0, %392)
    %396 = AIE.masterset(West : 0, %387)
    %397 = AIE.masterset(West : 1, %389)
    %398 = AIE.masterset(West : 2, %390)
    %399 = AIE.masterset(West : 3, %386)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 1, %392)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %386)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %390)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %391)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %388)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%116, Acquire, 0)
    AIE.dmaBd(<%118 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%116, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%114, Acquire, 0)
    AIE.dmaBd(<%119 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%114, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %389)
    %391 = AIE.masterset(DMA : 1, %386)
    %392 = AIE.masterset(North : 0, %388)
    %393 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %389)
      AIE.rule(31, 5, %387)
      AIE.rule(31, 6, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %386)
      AIE.rule(31, 1, %388)
      AIE.rule(31, 2, %388)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%125, Acquire, 0)
    AIE.dmaBd(<%128 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%125, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.masterset(DMA : 0, %392)
    %394 = AIE.masterset(DMA : 1, %386)
    %395 = AIE.masterset(West : 0, %387)
    %396 = AIE.masterset(West : 1, %388)
    %397 = AIE.masterset(West : 2, %391)
    %398 = AIE.masterset(North : 0, %390)
    %399 = AIE.masterset(North : 1, %389)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %391)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %392)
      AIE.rule(31, 6, %389)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %386)
      AIE.rule(31, 2, %390)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%135, Acquire, 0)
    AIE.dmaBd(<%139 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%135, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.masterset(DMA : 0, %390)
    %394 = AIE.masterset(DMA : 1, %388)
    %395 = AIE.masterset(South : 0, %387)
    %396 = AIE.masterset(West : 0, %391)
    %397 = AIE.masterset(West : 1, %389)
    %398 = AIE.masterset(West : 2, %386)
    %399 = AIE.masterset(West : 3, %392)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 1, %392)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %391)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %390)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%148, Acquire, 0)
    AIE.dmaBd(<%150 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%148, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%145, Acquire, 0)
    AIE.dmaBd(<%151 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%145, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %388)
    %391 = AIE.masterset(DMA : 1, %389)
    %392 = AIE.masterset(North : 0, %386)
    %393 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %389)
      AIE.rule(31, 1, %387)
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %388)
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %386)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%156, Acquire, 0)
    AIE.dmaBd(<%160 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%156, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %386)
    %393 = AIE.masterset(DMA : 1, %391)
    %394 = AIE.masterset(West : 0, %390)
    %395 = AIE.masterset(West : 1, %389)
    %396 = AIE.masterset(North : 0, %387)
    %397 = AIE.masterset(North : 1, %388)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 3, %390)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %391)
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %387)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%168, Acquire, 0)
    AIE.dmaBd(<%171 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%168, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.masterset(DMA : 0, %392)
    %394 = AIE.masterset(DMA : 1, %387)
    %395 = AIE.masterset(South : 0, %389)
    %396 = AIE.masterset(West : 0, %391)
    %397 = AIE.masterset(West : 1, %390)
    %398 = AIE.masterset(West : 2, %386)
    %399 = AIE.masterset(West : 3, %388)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 1, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %390)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %391)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %392)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%178, Acquire, 0)
    AIE.dmaBd(<%183 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%178, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%180, Acquire, 0)
    AIE.dmaBd(<%182 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%180, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %387)
    %391 = AIE.masterset(DMA : 1, %388)
    %392 = AIE.masterset(North : 0, %389)
    %393 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %388)
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %387)
      AIE.rule(31, 1, %389)
      AIE.rule(31, 2, %389)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%189, Acquire, 0)
    AIE.dmaBd(<%191 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%189, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<0> (3)
    %391 = AIE.masterset(DMA : 0, %389)
    %392 = AIE.masterset(DMA : 1, %390)
    %393 = AIE.masterset(West : 0, %387)
    %394 = AIE.masterset(North : 0, %388)
    %395 = AIE.masterset(North : 1, %386)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %387)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %389)
      AIE.rule(31, 6, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %390)
      AIE.rule(31, 2, %388)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%200, Acquire, 0)
    AIE.dmaBd(<%203 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%200, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.masterset(DMA : 0, %392)
    %394 = AIE.masterset(DMA : 1, %389)
    %395 = AIE.masterset(South : 0, %386)
    %396 = AIE.masterset(West : 0, %388)
    %397 = AIE.masterset(West : 1, %387)
    %398 = AIE.masterset(West : 2, %391)
    %399 = AIE.masterset(West : 3, %390)
    AIE.packetrules(East : 3) {
      AIE.rule(31, 0, %386)
    }
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %390)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %391)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %389)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %392)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%212, Acquire, 0)
    AIE.dmaBd(<%214 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%212, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%211, Acquire, 0)
    AIE.dmaBd(<%215 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%211, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %387)
    %391 = AIE.masterset(DMA : 1, %389)
    %392 = AIE.masterset(North : 0, %388)
    %393 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %387)
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %389)
      AIE.rule(31, 1, %388)
      AIE.rule(31, 2, %388)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%220, Acquire, 0)
    AIE.dmaBd(<%224 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%220, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %389)
    %391 = AIE.masterset(DMA : 1, %388)
    %392 = AIE.masterset(North : 0, %386)
    %393 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %389)
      AIE.rule(31, 6, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %388)
      AIE.rule(31, 2, %386)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%232, Acquire, 0)
    AIE.dmaBd(<%235 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%232, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<0> (3)
    %392 = AIE.masterset(DMA : 0, %391)
    %393 = AIE.masterset(DMA : 1, %389)
    %394 = AIE.masterset(West : 0, %390)
    %395 = AIE.masterset(West : 1, %386)
    %396 = AIE.masterset(West : 2, %387)
    %397 = AIE.masterset(West : 3, %388)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 0, %388)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 1, %390)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %391)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %389)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%241, Acquire, 0)
    AIE.dmaBd(<%247 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%241, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%244, Acquire, 0)
    AIE.dmaBd(<%246 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%244, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %389)
    %391 = AIE.masterset(DMA : 1, %387)
    %392 = AIE.masterset(North : 0, %386)
    %393 = AIE.masterset(North : 1, %388)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 0, %387)
      AIE.rule(31, 1, %388)
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %389)
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %386)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%252, Acquire, 0)
    AIE.dmaBd(<%256 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%252, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %389)
    %391 = AIE.masterset(DMA : 1, %387)
    %392 = AIE.masterset(North : 0, %386)
    %393 = AIE.masterset(North : 1, %388)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 1, %389)
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %387)
      AIE.rule(31, 6, %386)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%262, Acquire, 0)
    AIE.dmaBd(<%266 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%262, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<0> (3)
    %391 = AIE.masterset(DMA : 0, %388)
    %392 = AIE.masterset(DMA : 1, %387)
    %393 = AIE.masterset(West : 0, %389)
    %394 = AIE.masterset(West : 1, %386)
    %395 = AIE.masterset(West : 2, %390)
    AIE.packetrules(East : 1) {
      AIE.rule(31, 0, %390)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 3, %386)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 6, %387)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%275, Acquire, 0)
    AIE.dmaBd(<%278 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%274, Acquire, 0)
    AIE.dmaBd(<%279 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%274, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %386)
    %391 = AIE.masterset(DMA : 1, %389)
    %392 = AIE.masterset(North : 0, %388)
    %393 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %389)
      AIE.rule(31, 5, %387)
      AIE.rule(31, 6, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %386)
      AIE.rule(31, 1, %388)
      AIE.rule(31, 2, %388)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%285, Acquire, 0)
    AIE.dmaBd(<%287 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%285, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %387)
    %391 = AIE.masterset(DMA : 1, %386)
    %392 = AIE.masterset(North : 0, %389)
    %393 = AIE.masterset(North : 1, %388)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %386)
      AIE.rule(31, 6, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %387)
      AIE.rule(31, 2, %389)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%294, Acquire, 0)
    AIE.dmaBd(<%298 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%294, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %388)
    %391 = AIE.masterset(DMA : 1, %386)
    %392 = AIE.masterset(West : 0, %387)
    %393 = AIE.masterset(West : 1, %389)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %388)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%308, Acquire, 0)
    AIE.dmaBd(<%310 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%308, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%306, Acquire, 0)
    AIE.dmaBd(<%311 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%306, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %386)
    %391 = AIE.masterset(DMA : 1, %389)
    %392 = AIE.masterset(North : 0, %387)
    %393 = AIE.masterset(North : 1, %388)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 4, %386)
      AIE.rule(31, 5, %388)
      AIE.rule(31, 6, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 0, %389)
      AIE.rule(31, 1, %387)
      AIE.rule(31, 2, %387)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%316, Acquire, 0)
    AIE.dmaBd(<%320 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%316, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(DMA : 0, %386)
    %391 = AIE.masterset(DMA : 1, %389)
    %392 = AIE.masterset(North : 0, %388)
    %393 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(31, 5, %389)
      AIE.rule(31, 6, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 1, %386)
      AIE.rule(31, 2, %388)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%326, Acquire, 0)
    AIE.dmaBd(<%330 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%326, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.masterset(DMA : 0, %388)
    %390 = AIE.masterset(DMA : 1, %387)
    %391 = AIE.masterset(West : 0, %386)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %386)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(31, 6, %388)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 2, %387)
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
    %386 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%338, Acquire, 0)
    AIE.dmaBd(<%343 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%338, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %387 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%340, Acquire, 0)
    AIE.dmaBd(<%342 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%340, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %388 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
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
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(North : 0, %388)
    %391 = AIE.masterset(North : 1, %386)
    %392 = AIE.masterset(East : 0, %389)
    %393 = AIE.masterset(East : 1, %387)
    %394 = AIE.masterset(East : 2, %386)
    AIE.packetrules(West : 3) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 0, %388)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %389)
    }
  }
  %348 = AIE.tile(13, 0)
  %349 = AIE.switchbox(%348) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(North : 0, %389)
    %391 = AIE.masterset(North : 1, %388)
    %392 = AIE.masterset(East : 0, %389)
    %393 = AIE.masterset(East : 1, %386)
    %394 = AIE.masterset(East : 2, %387)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %388)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %389)
    }
  }
  %350 = AIE.tile(16, 0)
  %351 = AIE.switchbox(%350) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<0> (2)
    %390 = AIE.amsel<0> (3)
    %391 = AIE.masterset(West : 0, %386)
    %392 = AIE.masterset(North : 0, %389)
    %393 = AIE.masterset(North : 1, %388)
    %394 = AIE.masterset(East : 0, %387)
    %395 = AIE.masterset(East : 1, %390)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %390)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %388)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %386)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %389)
    }
  }
  %352 = AIE.tile(9, 2)
  %353 = AIE.switchbox(%352) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(South : 0, %386)
    %391 = AIE.masterset(East : 0, %387)
    %392 = AIE.masterset(East : 1, %388)
    %393 = AIE.masterset(East : 2, %389)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %386)
    }
  }
  %354 = AIE.tile(9, 4)
  %355 = AIE.switchbox(%354) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.masterset(South : 0, %386)
    AIE.packetrules(East : 0) {
      AIE.rule(31, 0, %386)
    }
  }
  %356 = AIE.tile(16, 1)
  %357 = AIE.switchbox(%356) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.masterset(North : 0, %386)
    %389 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %386)
    }
  }
  %358 = AIE.tile(15, 1)
  %359 = AIE.switchbox(%358) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.masterset(North : 0, %387)
    %389 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %387)
    }
  }
  %360 = AIE.tile(9, 1)
  %361 = AIE.switchbox(%360) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(South : 0, %388)
    %391 = AIE.masterset(South : 1, %389)
    %392 = AIE.masterset(South : 2, %387)
    %393 = AIE.masterset(East : 0, %386)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %388)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %386)
    }
  }
  %362 = AIE.tile(17, 1)
  %363 = AIE.switchbox(%362) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.masterset(North : 0, %387)
    %389 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %387)
    }
  }
  %364 = AIE.tile(17, 0)
  %365 = AIE.switchbox(%364) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(West : 0, %386)
    %391 = AIE.masterset(West : 1, %387)
    %392 = AIE.masterset(North : 0, %387)
    %393 = AIE.masterset(North : 1, %389)
    %394 = AIE.masterset(East : 0, %388)
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %388)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %389)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %386)
    }
  }
  %366 = AIE.tile(9, 0)
  %367 = AIE.switchbox(%366) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.masterset(East : 0, %388)
    %390 = AIE.masterset(East : 1, %386)
    %391 = AIE.masterset(East : 2, %387)
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %387)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %386)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %388)
    }
  }
  %368 = AIE.tile(14, 0)
  %369 = AIE.switchbox(%368) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(West : 0, %389)
    %391 = AIE.masterset(North : 0, %389)
    %392 = AIE.masterset(North : 1, %386)
    %393 = AIE.masterset(East : 0, %388)
    %394 = AIE.masterset(East : 1, %386)
    %395 = AIE.masterset(East : 2, %387)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %389)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %388)
    }
  }
  %370 = AIE.tile(12, 1)
  %371 = AIE.switchbox(%370) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.masterset(North : 0, %387)
    %389 = AIE.masterset(North : 1, %386)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %387)
    }
  }
  %372 = AIE.tile(15, 0)
  %373 = AIE.switchbox(%372) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(West : 0, %387)
    %391 = AIE.masterset(North : 0, %387)
    %392 = AIE.masterset(North : 1, %386)
    %393 = AIE.masterset(East : 0, %388)
    %394 = AIE.masterset(East : 1, %389)
    %395 = AIE.masterset(East : 2, %386)
    AIE.packetrules(West : 2) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(West : 1) {
      AIE.rule(28, 4, %389)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(28, 4, %388)
    }
  }
  %374 = AIE.tile(11, 1)
  %375 = AIE.switchbox(%374) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<0> (1)
    %389 = AIE.amsel<1> (1)
    %390 = AIE.amsel<0> (2)
    %391 = AIE.amsel<1> (2)
    %392 = AIE.amsel<0> (3)
    %393 = AIE.masterset(South : 0, %391)
    %394 = AIE.masterset(South : 1, %389)
    %395 = AIE.masterset(West : 0, %390)
    %396 = AIE.masterset(West : 1, %387)
    %397 = AIE.masterset(West : 2, %392)
    %398 = AIE.masterset(North : 0, %388)
    %399 = AIE.masterset(North : 1, %386)
    AIE.packetrules(North : 3) {
      AIE.rule(31, 0, %389)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 3, %392)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 1, %390)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %391)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %386)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %388)
    }
  }
  %376 = AIE.tile(14, 1)
  %377 = AIE.switchbox(%376) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.masterset(North : 0, %386)
    %389 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %386)
    }
  }
  %378 = AIE.tile(13, 1)
  %379 = AIE.switchbox(%378) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.masterset(North : 0, %386)
    %389 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %386)
    }
  }
  %380 = AIE.tile(18, 1)
  %381 = AIE.switchbox(%380) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.masterset(North : 0, %386)
    %389 = AIE.masterset(North : 1, %387)
    AIE.packetrules(South : 1) {
      AIE.rule(28, 4, %387)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 0, %386)
    }
  }
  %382 = AIE.tile(9, 3)
  %383 = AIE.switchbox(%382) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<0> (1)
    %388 = AIE.amsel<0> (2)
    %389 = AIE.amsel<0> (3)
    %390 = AIE.masterset(South : 0, %387)
    %391 = AIE.masterset(South : 1, %389)
    %392 = AIE.masterset(South : 2, %388)
    %393 = AIE.masterset(East : 0, %386)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %388)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %389)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %387)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %386)
    }
  }
  %384 = AIE.tile(10, 1)
  %385 = AIE.switchbox(%384) {
    %386 = AIE.amsel<0> (0)
    %387 = AIE.amsel<1> (0)
    %388 = AIE.amsel<2> (0)
    %389 = AIE.amsel<0> (1)
    %390 = AIE.amsel<1> (1)
    %391 = AIE.amsel<2> (1)
    %392 = AIE.amsel<0> (2)
    %393 = AIE.amsel<1> (2)
    %394 = AIE.amsel<0> (3)
    %395 = AIE.amsel<1> (3)
    %396 = AIE.masterset(South : 0, %391)
    %397 = AIE.masterset(South : 1, %386)
    %398 = AIE.masterset(South : 2, %387)
    %399 = AIE.masterset(South : 3, %389)
    %400 = AIE.masterset(West : 0, %390)
    %401 = AIE.masterset(West : 1, %388)
    %402 = AIE.masterset(West : 2, %395)
    %403 = AIE.masterset(North : 0, %392)
    %404 = AIE.masterset(North : 1, %394)
    %405 = AIE.masterset(East : 0, %393)
    AIE.packetrules(East : 2) {
      AIE.rule(31, 3, %395)
    }
    AIE.packetrules(East : 1) {
      AIE.rule(31, 2, %388)
    }
    AIE.packetrules(East : 0) {
      AIE.rule(31, 1, %390)
    }
    AIE.packetrules(West : 0) {
      AIE.rule(31, 0, %393)
    }
    AIE.packetrules(North : 3) {
      AIE.rule(31, 3, %389)
    }
    AIE.packetrules(North : 2) {
      AIE.rule(31, 2, %387)
    }
    AIE.packetrules(North : 1) {
      AIE.rule(31, 1, %386)
    }
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %391)
    }
    AIE.packetrules(South : 1) {
      AIE.rule(28, 0, %394)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(28, 4, %392)
    }
  }
}


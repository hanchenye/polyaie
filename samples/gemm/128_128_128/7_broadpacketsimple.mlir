module @gemm {
  AIE.token(0) {sym_name = "token95"}
  AIE.token(0) {sym_name = "token94"}
  AIE.token(0) {sym_name = "token93"}
  AIE.token(0) {sym_name = "token92"}
  AIE.token(0) {sym_name = "token91"}
  AIE.token(0) {sym_name = "token90"}
  AIE.token(0) {sym_name = "token89"}
  AIE.token(0) {sym_name = "token88"}
  AIE.token(0) {sym_name = "token87"}
  AIE.token(0) {sym_name = "token86"}
  AIE.token(0) {sym_name = "token85"}
  AIE.token(0) {sym_name = "token84"}
  AIE.token(0) {sym_name = "token83"}
  AIE.token(0) {sym_name = "token82"}
  AIE.token(0) {sym_name = "token81"}
  AIE.token(0) {sym_name = "token80"}
  AIE.token(0) {sym_name = "token79"}
  AIE.token(0) {sym_name = "token78"}
  AIE.token(0) {sym_name = "token77"}
  AIE.token(0) {sym_name = "token76"}
  AIE.token(0) {sym_name = "token75"}
  AIE.token(0) {sym_name = "token74"}
  AIE.token(0) {sym_name = "token73"}
  AIE.token(0) {sym_name = "token72"}
  AIE.token(0) {sym_name = "token71"}
  AIE.token(0) {sym_name = "token70"}
  AIE.token(0) {sym_name = "token69"}
  AIE.token(0) {sym_name = "token68"}
  AIE.token(0) {sym_name = "token67"}
  AIE.token(0) {sym_name = "token66"}
  AIE.token(0) {sym_name = "token65"}
  AIE.token(0) {sym_name = "token64"}
  AIE.token(0) {sym_name = "token63"}
  AIE.token(0) {sym_name = "token62"}
  AIE.token(0) {sym_name = "token61"}
  AIE.token(0) {sym_name = "token60"}
  AIE.token(0) {sym_name = "token59"}
  AIE.token(0) {sym_name = "token58"}
  AIE.token(0) {sym_name = "token57"}
  AIE.token(0) {sym_name = "token56"}
  AIE.token(0) {sym_name = "token55"}
  AIE.token(0) {sym_name = "token54"}
  AIE.token(0) {sym_name = "token53"}
  AIE.token(0) {sym_name = "token52"}
  AIE.token(0) {sym_name = "token51"}
  AIE.token(0) {sym_name = "token50"}
  AIE.token(0) {sym_name = "token49"}
  AIE.token(0) {sym_name = "token48"}
  AIE.token(0) {sym_name = "token47"}
  AIE.token(0) {sym_name = "token46"}
  AIE.token(0) {sym_name = "token45"}
  AIE.token(0) {sym_name = "token44"}
  AIE.token(0) {sym_name = "token43"}
  AIE.token(0) {sym_name = "token42"}
  AIE.token(0) {sym_name = "token41"}
  AIE.token(0) {sym_name = "token40"}
  AIE.token(0) {sym_name = "token39"}
  AIE.token(0) {sym_name = "token38"}
  AIE.token(0) {sym_name = "token37"}
  AIE.token(0) {sym_name = "token36"}
  AIE.token(0) {sym_name = "token35"}
  AIE.token(0) {sym_name = "token34"}
  AIE.token(0) {sym_name = "token33"}
  AIE.token(0) {sym_name = "token32"}
  AIE.token(0) {sym_name = "token31"}
  AIE.token(0) {sym_name = "token30"}
  AIE.token(0) {sym_name = "token29"}
  AIE.token(0) {sym_name = "token28"}
  AIE.token(0) {sym_name = "token27"}
  AIE.token(0) {sym_name = "token26"}
  AIE.token(0) {sym_name = "token25"}
  AIE.token(0) {sym_name = "token24"}
  AIE.token(0) {sym_name = "token23"}
  AIE.token(0) {sym_name = "token22"}
  AIE.token(0) {sym_name = "token21"}
  AIE.token(0) {sym_name = "token20"}
  AIE.token(0) {sym_name = "token19"}
  AIE.token(0) {sym_name = "token18"}
  AIE.token(0) {sym_name = "token17"}
  AIE.token(0) {sym_name = "token16"}
  AIE.token(0) {sym_name = "token15"}
  AIE.token(0) {sym_name = "token14"}
  AIE.token(0) {sym_name = "token13"}
  AIE.token(0) {sym_name = "token12"}
  AIE.token(0) {sym_name = "token11"}
  AIE.token(0) {sym_name = "token10"}
  AIE.token(0) {sym_name = "token9"}
  AIE.token(0) {sym_name = "token8"}
  AIE.token(0) {sym_name = "token7"}
  AIE.token(0) {sym_name = "token6"}
  AIE.token(0) {sym_name = "token5"}
  AIE.token(0) {sym_name = "token4"}
  AIE.token(0) {sym_name = "token3"}
  AIE.token(0) {sym_name = "token2"}
  AIE.token(0) {sym_name = "token1"}
  AIE.token(0) {sym_name = "token0"}
  func private @extern_kernel(memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>)
  %0 = memref.alloc() : memref<128x128xf32>
  %1 = memref.alloc() : memref<128x128xf32>
  %2 = memref.alloc() : memref<128x128xf32>
  %3 = AIE.tile(19, 0)
  %4 = AIE.lock(%3, 7)
  %5 = AIE.lock(%3, 6)
  %6 = AIE.lock(%3, 5)
  %7 = AIE.lock(%3, 4)
  %8 = AIE.lock(%3, 3)
  %9 = AIE.lock(%3, 2)
  %10 = AIE.lock(%3, 1)
  %11 = AIE.lock(%3, 0)
  %12 = AIE.external_buffer 16384 : memref<32x32xf32>
  %13 = AIE.external_buffer 20480 : memref<32x32xf32>
  %14 = AIE.external_buffer 24576 : memref<32x32xf32>
  %15 = AIE.external_buffer 28672 : memref<32x32xf32>
  %16 = AIE.external_buffer 32768 : memref<32x32xf32>
  %17 = AIE.external_buffer 36864 : memref<32x32xf32>
  %18 = AIE.external_buffer 40960 : memref<32x32xf32>
  %19 = AIE.external_buffer 45056 : memref<32x32xf32>
  %20 = AIE.external_buffer 147456 : memref<1025xf32>
  %21 = AIE.external_buffer 151556 : memref<1025xf32>
  %22 = AIE.external_buffer 155656 : memref<1025xf32>
  %23 = AIE.external_buffer 159756 : memref<1025xf32>
  %24 = AIE.external_buffer 163856 : memref<1025xf32>
  %25 = AIE.external_buffer 167956 : memref<1025xf32>
  %26 = AIE.external_buffer 172056 : memref<1025xf32>
  %27 = AIE.external_buffer 176156 : memref<1025xf32>
  %28 = AIE.core(%3) {
    AIE.useLock(%11, Acquire, 0)
    AIE.useLock(%5, Acquire, 0)
    AIE.useLock(%8, Acquire, 0)
    AIE.useLock(%4, Acquire, 0)
    AIE.useLock(%9, Acquire, 0)
    AIE.useLock(%10, Acquire, 0)
    AIE.useLock(%6, Acquire, 0)
    AIE.useLock(%7, Acquire, 0)
    AIE.useLock(%7, Release, 1)
    AIE.useLock(%6, Release, 1)
    AIE.useLock(%10, Release, 1)
    AIE.useLock(%9, Release, 1)
    AIE.useLock(%4, Release, 1)
    AIE.useLock(%8, Release, 1)
    AIE.useLock(%5, Release, 1)
    AIE.useLock(%11, Release, 1)
    AIE.end
  }
  %29 = AIE.shimDMA(%3) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%20 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%21 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%22 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%23 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%24 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%25 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%26 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%27 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %691 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%19 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%8, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%18 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%8, Release, 0)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%9, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%17 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%9, Release, 0)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useLock(%7, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%16 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%7, Release, 0)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %692 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%15 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%10, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%14 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%10, Release, 0)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useLock(%11, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%13 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%11, Release, 0)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%12 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%568, DMA : 0>
    AIE.packet_dest<%605, DMA : 0>
    AIE.packet_dest<%642, DMA : 0>
    AIE.packet_dest<%679, DMA : 0>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%559, DMA : 1>
    AIE.packet_dest<%596, DMA : 1>
    AIE.packet_dest<%633, DMA : 1>
    AIE.packet_dest<%670, DMA : 1>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%550, DMA : 0>
    AIE.packet_dest<%587, DMA : 1>
    AIE.packet_dest<%624, DMA : 0>
    AIE.packet_dest<%661, DMA : 0>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%3, DMA : 1>
    AIE.packet_dest<%541, DMA : 1>
    AIE.packet_dest<%578, DMA : 1>
    AIE.packet_dest<%615, DMA : 0>
    AIE.packet_dest<%652, DMA : 1>
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%420, DMA : 0>
    AIE.packet_dest<%457, DMA : 0>
    AIE.packet_dest<%494, DMA : 0>
    AIE.packet_dest<%531, DMA : 0>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%411, DMA : 1>
    AIE.packet_dest<%448, DMA : 0>
    AIE.packet_dest<%485, DMA : 1>
    AIE.packet_dest<%522, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%402, DMA : 1>
    AIE.packet_dest<%439, DMA : 1>
    AIE.packet_dest<%476, DMA : 1>
    AIE.packet_dest<%513, DMA : 1>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%3, DMA : 0>
    AIE.packet_dest<%393, DMA : 1>
    AIE.packet_dest<%430, DMA : 1>
    AIE.packet_dest<%467, DMA : 1>
    AIE.packet_dest<%504, DMA : 1>
  }
  %30 = AIE.tile(10, 0)
  %31 = AIE.lock(%30, 7)
  %32 = AIE.lock(%30, 6)
  %33 = AIE.lock(%30, 5)
  %34 = AIE.lock(%30, 4)
  %35 = AIE.lock(%30, 3)
  %36 = AIE.lock(%30, 2)
  %37 = AIE.lock(%30, 1)
  %38 = AIE.lock(%30, 0)
  %39 = AIE.external_buffer 49152 : memref<32x32xf32>
  %40 = AIE.external_buffer 53248 : memref<32x32xf32>
  %41 = AIE.external_buffer 57344 : memref<32x32xf32>
  %42 = AIE.external_buffer 61440 : memref<32x32xf32>
  %43 = AIE.external_buffer 65536 : memref<32x32xf32>
  %44 = AIE.external_buffer 69632 : memref<32x32xf32>
  %45 = AIE.external_buffer 73728 : memref<32x32xf32>
  %46 = AIE.external_buffer 77824 : memref<32x32xf32>
  %47 = AIE.core(%30) {
    AIE.useLock(%33, Acquire, 0)
    AIE.useLock(%34, Acquire, 0)
    AIE.useLock(%35, Acquire, 0)
    AIE.useLock(%38, Acquire, 0)
    AIE.useLock(%37, Acquire, 0)
    AIE.useLock(%36, Acquire, 0)
    AIE.useLock(%31, Acquire, 0)
    AIE.useLock(%32, Acquire, 0)
    AIE.useLock(%32, Release, 1)
    AIE.useLock(%31, Release, 1)
    AIE.useLock(%36, Release, 1)
    AIE.useLock(%37, Release, 1)
    AIE.useLock(%38, Release, 1)
    AIE.useLock(%35, Release, 1)
    AIE.useLock(%34, Release, 1)
    AIE.useLock(%33, Release, 1)
    AIE.end
  }
  %48 = AIE.shimDMA(%30) {
    %689 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%33, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%45 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%33, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%34, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%43 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%34, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%35, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%41 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%35, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%31, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%39 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%31, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %690 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%36, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%46 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%36, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%38, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%44 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%38, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%32, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%42 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%32, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%37, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%40 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%37, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%30, DMA : 0>
    AIE.packet_dest<%124, DMA : 0>
    AIE.packet_dest<%161, DMA : 0>
    AIE.packet_dest<%198, DMA : 1>
    AIE.packet_dest<%235, DMA : 0>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%30, DMA : 0>
    AIE.packet_dest<%115, DMA : 1>
    AIE.packet_dest<%152, DMA : 0>
    AIE.packet_dest<%189, DMA : 1>
    AIE.packet_dest<%226, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%30, DMA : 0>
    AIE.packet_dest<%106, DMA : 1>
    AIE.packet_dest<%143, DMA : 1>
    AIE.packet_dest<%180, DMA : 1>
    AIE.packet_dest<%217, DMA : 1>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%30, DMA : 0>
    AIE.packet_dest<%97, DMA : 1>
    AIE.packet_dest<%134, DMA : 1>
    AIE.packet_dest<%171, DMA : 1>
    AIE.packet_dest<%208, DMA : 1>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%30, DMA : 1>
    AIE.packet_dest<%124, DMA : 1>
    AIE.packet_dest<%272, DMA : 1>
    AIE.packet_dest<%420, DMA : 1>
    AIE.packet_dest<%568, DMA : 1>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%30, DMA : 1>
    AIE.packet_dest<%115, DMA : 0>
    AIE.packet_dest<%263, DMA : 1>
    AIE.packet_dest<%411, DMA : 0>
    AIE.packet_dest<%559, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%30, DMA : 1>
    AIE.packet_dest<%106, DMA : 0>
    AIE.packet_dest<%254, DMA : 1>
    AIE.packet_dest<%402, DMA : 0>
    AIE.packet_dest<%550, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%30, DMA : 1>
    AIE.packet_dest<%97, DMA : 0>
    AIE.packet_dest<%245, DMA : 0>
    AIE.packet_dest<%393, DMA : 0>
    AIE.packet_dest<%541, DMA : 0>
  }
  %49 = AIE.tile(18, 0)
  %50 = AIE.lock(%49, 7)
  %51 = AIE.lock(%49, 6)
  %52 = AIE.lock(%49, 5)
  %53 = AIE.lock(%49, 4)
  %54 = AIE.lock(%49, 3)
  %55 = AIE.lock(%49, 2)
  %56 = AIE.lock(%49, 1)
  %57 = AIE.lock(%49, 0)
  %58 = AIE.external_buffer 81920 : memref<32x32xf32>
  %59 = AIE.external_buffer 86016 : memref<32x32xf32>
  %60 = AIE.external_buffer 90112 : memref<32x32xf32>
  %61 = AIE.external_buffer 94208 : memref<32x32xf32>
  %62 = AIE.external_buffer 98304 : memref<32x32xf32>
  %63 = AIE.external_buffer 102400 : memref<32x32xf32>
  %64 = AIE.external_buffer 106496 : memref<32x32xf32>
  %65 = AIE.external_buffer 110592 : memref<32x32xf32>
  %66 = AIE.external_buffer 180256 : memref<1025xf32>
  %67 = AIE.external_buffer 184356 : memref<1025xf32>
  %68 = AIE.external_buffer 188456 : memref<1025xf32>
  %69 = AIE.external_buffer 192556 : memref<1025xf32>
  %70 = AIE.external_buffer 196656 : memref<1025xf32>
  %71 = AIE.external_buffer 200756 : memref<1025xf32>
  %72 = AIE.external_buffer 204856 : memref<1025xf32>
  %73 = AIE.external_buffer 208956 : memref<1025xf32>
  %74 = AIE.core(%49) {
    AIE.useLock(%54, Acquire, 0)
    AIE.useLock(%56, Acquire, 0)
    AIE.useLock(%53, Acquire, 0)
    AIE.useLock(%50, Acquire, 0)
    AIE.useLock(%51, Acquire, 0)
    AIE.useLock(%52, Acquire, 0)
    AIE.useLock(%57, Acquire, 0)
    AIE.useLock(%55, Acquire, 0)
    AIE.useLock(%55, Release, 1)
    AIE.useLock(%57, Release, 1)
    AIE.useLock(%52, Release, 1)
    AIE.useLock(%51, Release, 1)
    AIE.useLock(%50, Release, 1)
    AIE.useLock(%53, Release, 1)
    AIE.useLock(%56, Release, 1)
    AIE.useLock(%54, Release, 1)
    AIE.end
  }
  %75 = AIE.shimDMA(%49) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%66 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%67 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%68 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%69 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%70 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%71 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%72 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%73 : memref<1025xf32>, 0, 1025>, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    %691 = AIE.dmaStart(MM2S0, ^bb11, ^bb15)
  ^bb11:  // 2 preds: ^bb10, ^bb14
    AIE.useLock(%51, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%65 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%51, Release, 0)
    br ^bb12
  ^bb12:  // pred: ^bb11
    AIE.useLock(%50, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%64 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%50, Release, 0)
    br ^bb13
  ^bb13:  // pred: ^bb12
    AIE.useLock(%54, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%63 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%54, Release, 0)
    br ^bb14
  ^bb14:  // pred: ^bb13
    AIE.useLock(%56, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%62 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%56, Release, 0)
    br ^bb11
  ^bb15:  // pred: ^bb10
    %692 = AIE.dmaStart(MM2S1, ^bb16, ^bb20)
  ^bb16:  // 2 preds: ^bb15, ^bb19
    AIE.useLock(%53, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%61 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%53, Release, 0)
    br ^bb17
  ^bb17:  // pred: ^bb16
    AIE.useLock(%55, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%60 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%55, Release, 0)
    br ^bb18
  ^bb18:  // pred: ^bb17
    AIE.useLock(%52, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%59 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%52, Release, 0)
    br ^bb19
  ^bb19:  // pred: ^bb18
    AIE.useLock(%57, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%58 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%57, Release, 0)
    br ^bb16
  ^bb20:  // pred: ^bb15
    AIE.end
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%49, DMA : 0>
    AIE.packet_dest<%235, DMA : 1>
    AIE.packet_dest<%383, DMA : 1>
    AIE.packet_dest<%531, DMA : 1>
    AIE.packet_dest<%679, DMA : 1>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%49, DMA : 0>
    AIE.packet_dest<%226, DMA : 1>
    AIE.packet_dest<%374, DMA : 1>
    AIE.packet_dest<%522, DMA : 1>
    AIE.packet_dest<%670, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%49, DMA : 0>
    AIE.packet_dest<%217, DMA : 0>
    AIE.packet_dest<%365, DMA : 1>
    AIE.packet_dest<%513, DMA : 0>
    AIE.packet_dest<%661, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%49, DMA : 0>
    AIE.packet_dest<%208, DMA : 0>
    AIE.packet_dest<%356, DMA : 0>
    AIE.packet_dest<%504, DMA : 0>
    AIE.packet_dest<%652, DMA : 0>
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%49, DMA : 1>
    AIE.packet_dest<%272, DMA : 0>
    AIE.packet_dest<%309, DMA : 0>
    AIE.packet_dest<%346, DMA : 0>
    AIE.packet_dest<%383, DMA : 0>
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%49, DMA : 1>
    AIE.packet_dest<%263, DMA : 0>
    AIE.packet_dest<%300, DMA : 0>
    AIE.packet_dest<%337, DMA : 0>
    AIE.packet_dest<%374, DMA : 0>
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%49, DMA : 1>
    AIE.packet_dest<%254, DMA : 0>
    AIE.packet_dest<%291, DMA : 0>
    AIE.packet_dest<%328, DMA : 0>
    AIE.packet_dest<%365, DMA : 0>
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%49, DMA : 1>
    AIE.packet_dest<%245, DMA : 1>
    AIE.packet_dest<%282, DMA : 1>
    AIE.packet_dest<%319, DMA : 0>
    AIE.packet_dest<%356, DMA : 1>
  }
  %76 = AIE.tile(11, 0)
  %77 = AIE.lock(%76, 7)
  %78 = AIE.lock(%76, 6)
  %79 = AIE.lock(%76, 5)
  %80 = AIE.lock(%76, 4)
  %81 = AIE.lock(%76, 3)
  %82 = AIE.lock(%76, 2)
  %83 = AIE.lock(%76, 1)
  %84 = AIE.lock(%76, 0)
  %85 = AIE.external_buffer 114688 : memref<32x32xf32>
  %86 = AIE.external_buffer 118784 : memref<32x32xf32>
  %87 = AIE.external_buffer 122880 : memref<32x32xf32>
  %88 = AIE.external_buffer 126976 : memref<32x32xf32>
  %89 = AIE.external_buffer 131072 : memref<32x32xf32>
  %90 = AIE.external_buffer 135168 : memref<32x32xf32>
  %91 = AIE.external_buffer 139264 : memref<32x32xf32>
  %92 = AIE.external_buffer 143360 : memref<32x32xf32>
  %93 = AIE.core(%76) {
    AIE.useLock(%82, Acquire, 0)
    AIE.useLock(%80, Acquire, 0)
    AIE.useLock(%83, Acquire, 0)
    AIE.useLock(%84, Acquire, 0)
    AIE.useLock(%81, Acquire, 0)
    AIE.useLock(%77, Acquire, 0)
    AIE.useLock(%79, Acquire, 0)
    AIE.useLock(%78, Acquire, 0)
    AIE.useLock(%78, Release, 1)
    AIE.useLock(%79, Release, 1)
    AIE.useLock(%77, Release, 1)
    AIE.useLock(%81, Release, 1)
    AIE.useLock(%84, Release, 1)
    AIE.useLock(%83, Release, 1)
    AIE.useLock(%80, Release, 1)
    AIE.useLock(%82, Release, 1)
    AIE.end
  }
  %94 = AIE.shimDMA(%76) {
    %689 = AIE.dmaStart(MM2S0, ^bb1, ^bb5)
  ^bb1:  // 2 preds: ^bb0, ^bb4
    AIE.useLock(%84, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%92 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%84, Release, 0)
    br ^bb2
  ^bb2:  // pred: ^bb1
    AIE.useLock(%79, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%91 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%79, Release, 0)
    br ^bb3
  ^bb3:  // pred: ^bb2
    AIE.useLock(%82, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%90 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%82, Release, 0)
    br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%83, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%89 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%83, Release, 0)
    br ^bb1
  ^bb5:  // pred: ^bb0
    %690 = AIE.dmaStart(MM2S1, ^bb6, ^bb10)
  ^bb6:  // 2 preds: ^bb5, ^bb9
    AIE.useLock(%80, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%88 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%80, Release, 0)
    br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%81, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%87 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%81, Release, 0)
    br ^bb8
  ^bb8:  // pred: ^bb7
    AIE.useLock(%78, Acquire, 1)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%86 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%78, Release, 0)
    br ^bb9
  ^bb9:  // pred: ^bb8
    AIE.useLock(%77, Acquire, 1)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%85 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%77, Release, 0)
    br ^bb6
  ^bb10:  // pred: ^bb5
    AIE.end
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%76, DMA : 0>
    AIE.packet_dest<%161, DMA : 1>
    AIE.packet_dest<%309, DMA : 1>
    AIE.packet_dest<%457, DMA : 1>
    AIE.packet_dest<%605, DMA : 1>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%76, DMA : 0>
    AIE.packet_dest<%152, DMA : 1>
    AIE.packet_dest<%300, DMA : 1>
    AIE.packet_dest<%448, DMA : 1>
    AIE.packet_dest<%596, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%76, DMA : 0>
    AIE.packet_dest<%143, DMA : 0>
    AIE.packet_dest<%291, DMA : 1>
    AIE.packet_dest<%439, DMA : 0>
    AIE.packet_dest<%587, DMA : 0>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%76, DMA : 0>
    AIE.packet_dest<%134, DMA : 0>
    AIE.packet_dest<%282, DMA : 0>
    AIE.packet_dest<%430, DMA : 0>
    AIE.packet_dest<%578, DMA : 0>
  }
  AIE.packet_flow(7) {
    AIE.packet_source<%76, DMA : 1>
    AIE.packet_dest<%198, DMA : 0>
    AIE.packet_dest<%346, DMA : 1>
    AIE.packet_dest<%494, DMA : 1>
    AIE.packet_dest<%642, DMA : 1>
  }
  AIE.packet_flow(6) {
    AIE.packet_source<%76, DMA : 1>
    AIE.packet_dest<%189, DMA : 0>
    AIE.packet_dest<%337, DMA : 1>
    AIE.packet_dest<%485, DMA : 0>
    AIE.packet_dest<%633, DMA : 0>
  }
  AIE.packet_flow(5) {
    AIE.packet_source<%76, DMA : 1>
    AIE.packet_dest<%180, DMA : 0>
    AIE.packet_dest<%328, DMA : 1>
    AIE.packet_dest<%476, DMA : 0>
    AIE.packet_dest<%624, DMA : 1>
  }
  AIE.packet_flow(4) {
    AIE.packet_source<%76, DMA : 1>
    AIE.packet_dest<%171, DMA : 0>
    AIE.packet_dest<%319, DMA : 1>
    AIE.packet_dest<%467, DMA : 0>
    AIE.packet_dest<%615, DMA : 1>
  }
  %95 = AIE.tile(0, 0)
  %96 = AIE.core(%95) {
    AIE.end
  }
  %97 = AIE.tile(10, 2)
  %98 = AIE.lock(%97, 1)
  %99 = AIE.lock(%97, 0)
  %100 = AIE.buffer(%97) : memref<32x32xf32>
  %101 = AIE.buffer(%97) : memref<32x32xf32>
  %102 = AIE.buffer(%97) : memref<32x32xf32>
  %103 = AIE.buffer(%97) : memref<32x32xf32>
  %104 = AIE.core(%97) {
    AIE.useLock(%98, Acquire, 1)
    AIE.useLock(%99, Acquire, 1)
    AIE.useLock(%107, Acquire, 0)
    call @extern_kernel(%103, %100, %101, %102) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%107, Release, 1)
    AIE.useLock(%99, Release, 0)
    AIE.useLock(%98, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %105 = AIE.mem(%97) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%99, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%102 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%99, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%98, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%101 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%98, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %106 = AIE.tile(10, 3)
  %107 = AIE.lock(%106, 2)
  %108 = AIE.lock(%106, 1)
  %109 = AIE.lock(%106, 0)
  %110 = AIE.buffer(%106) : memref<32x32xf32>
  %111 = AIE.buffer(%106) : memref<32x32xf32>
  %112 = AIE.buffer(%106) : memref<32x32xf32>
  %113 = AIE.core(%106) {
    AIE.useLock(%118, Acquire, 0)
    AIE.useLock(%108, Acquire, 1)
    AIE.useLock(%109, Acquire, 1)
    AIE.useLock(%107, Acquire, 1)
    call @extern_kernel(%100, %110, %111, %112) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%107, Release, 0)
    AIE.useLock(%109, Release, 0)
    AIE.useLock(%108, Release, 0)
    AIE.useLock(%118, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %114 = AIE.mem(%106) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%109, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%112 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%109, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%108, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%111 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%108, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %115 = AIE.tile(10, 4)
  %116 = AIE.lock(%115, 2)
  %117 = AIE.lock(%115, 1)
  %118 = AIE.lock(%115, 0)
  %119 = AIE.buffer(%115) : memref<32x32xf32>
  %120 = AIE.buffer(%115) : memref<32x32xf32>
  %121 = AIE.buffer(%115) : memref<32x32xf32>
  %122 = AIE.core(%115) {
    AIE.useLock(%118, Acquire, 1)
    AIE.useLock(%117, Acquire, 1)
    AIE.useLock(%116, Acquire, 1)
    AIE.useLock(%126, Acquire, 0)
    call @extern_kernel(%110, %119, %120, %121) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%126, Release, 1)
    AIE.useLock(%116, Release, 0)
    AIE.useLock(%117, Release, 0)
    AIE.useLock(%118, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %123 = AIE.mem(%115) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%116, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%121 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%116, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%117, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%120 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%117, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %124 = AIE.tile(10, 5) {polyaie.leaf}
  %125 = AIE.lock(%124, 3)
  %126 = AIE.lock(%124, 2)
  %127 = AIE.lock(%124, 1)
  %128 = AIE.lock(%124, 0)
  %129 = AIE.buffer(%124) : memref<32x32xf32>
  %130 = AIE.buffer(%124) : memref<32x32xf32>
  %131 = AIE.buffer(%124) : memref<32x32xf32>
  %132 = AIE.core(%124) {
    AIE.useLock(%127, Acquire, 0)
    AIE.useLock(%128, Acquire, 1)
    AIE.useLock(%125, Acquire, 1)
    AIE.useLock(%126, Acquire, 1)
    call @extern_kernel(%119, %129, %130, %131) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%126, Release, 0)
    AIE.useLock(%125, Release, 0)
    AIE.useLock(%128, Release, 0)
    AIE.useLock(%127, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %133 = AIE.mem(%124) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%125, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%130 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%125, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%128, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%131 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%128, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%127, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%129 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%127, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%124, DMA : 0>
    AIE.packet_dest<%49, DMA : 0>
  }
  %134 = AIE.tile(11, 2)
  %135 = AIE.lock(%134, 1)
  %136 = AIE.lock(%134, 0)
  %137 = AIE.buffer(%134) : memref<32x32xf32>
  %138 = AIE.buffer(%134) : memref<32x32xf32>
  %139 = AIE.buffer(%134) : memref<32x32xf32>
  %140 = AIE.buffer(%134) : memref<32x32xf32>
  %141 = AIE.core(%134) {
    AIE.useLock(%135, Acquire, 1)
    AIE.useLock(%146, Acquire, 0)
    AIE.useLock(%136, Acquire, 1)
    call @extern_kernel(%140, %137, %138, %139) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%136, Release, 0)
    AIE.useLock(%146, Release, 1)
    AIE.useLock(%135, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %142 = AIE.mem(%134) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%136, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%139 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%136, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%135, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%138 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%135, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %143 = AIE.tile(11, 3)
  %144 = AIE.lock(%143, 2)
  %145 = AIE.lock(%143, 1)
  %146 = AIE.lock(%143, 0)
  %147 = AIE.buffer(%143) : memref<32x32xf32>
  %148 = AIE.buffer(%143) : memref<32x32xf32>
  %149 = AIE.buffer(%143) : memref<32x32xf32>
  %150 = AIE.core(%143) {
    AIE.useLock(%155, Acquire, 0)
    AIE.useLock(%146, Acquire, 1)
    AIE.useLock(%145, Acquire, 1)
    AIE.useLock(%144, Acquire, 1)
    call @extern_kernel(%137, %147, %148, %149) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%144, Release, 0)
    AIE.useLock(%145, Release, 0)
    AIE.useLock(%146, Release, 0)
    AIE.useLock(%155, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %151 = AIE.mem(%143) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%144, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%149 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%144, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%145, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%148 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%145, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %152 = AIE.tile(11, 4)
  %153 = AIE.lock(%152, 2)
  %154 = AIE.lock(%152, 1)
  %155 = AIE.lock(%152, 0)
  %156 = AIE.buffer(%152) : memref<32x32xf32>
  %157 = AIE.buffer(%152) : memref<32x32xf32>
  %158 = AIE.buffer(%152) : memref<32x32xf32>
  %159 = AIE.core(%152) {
    AIE.useLock(%153, Acquire, 1)
    AIE.useLock(%155, Acquire, 1)
    AIE.useLock(%154, Acquire, 1)
    AIE.useLock(%163, Acquire, 0)
    call @extern_kernel(%147, %156, %157, %158) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%163, Release, 1)
    AIE.useLock(%154, Release, 0)
    AIE.useLock(%155, Release, 0)
    AIE.useLock(%153, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %160 = AIE.mem(%152) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%154, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%157 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%154, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%153, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%158 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%153, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %161 = AIE.tile(11, 5) {polyaie.leaf}
  %162 = AIE.lock(%161, 3)
  %163 = AIE.lock(%161, 2)
  %164 = AIE.lock(%161, 1)
  %165 = AIE.lock(%161, 0)
  %166 = AIE.buffer(%161) : memref<32x32xf32>
  %167 = AIE.buffer(%161) : memref<32x32xf32>
  %168 = AIE.buffer(%161) : memref<32x32xf32>
  %169 = AIE.core(%161) {
    AIE.useLock(%163, Acquire, 1)
    AIE.useLock(%164, Acquire, 1)
    AIE.useLock(%165, Acquire, 0)
    AIE.useLock(%162, Acquire, 1)
    call @extern_kernel(%156, %166, %167, %168) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%162, Release, 0)
    AIE.useLock(%165, Release, 1)
    AIE.useLock(%164, Release, 0)
    AIE.useLock(%163, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %170 = AIE.mem(%161) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%162, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%167 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%162, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%164, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%168 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%164, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%165, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%166 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%165, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%161, DMA : 0>
    AIE.packet_dest<%49, DMA : 0>
  }
  %171 = AIE.tile(12, 2)
  %172 = AIE.lock(%171, 1)
  %173 = AIE.lock(%171, 0)
  %174 = AIE.buffer(%171) : memref<32x32xf32>
  %175 = AIE.buffer(%171) : memref<32x32xf32>
  %176 = AIE.buffer(%171) : memref<32x32xf32>
  %177 = AIE.buffer(%171) : memref<32x32xf32>
  %178 = AIE.core(%171) {
    AIE.useLock(%173, Acquire, 1)
    AIE.useLock(%172, Acquire, 1)
    AIE.useLock(%182, Acquire, 0)
    call @extern_kernel(%177, %174, %175, %176) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%182, Release, 1)
    AIE.useLock(%172, Release, 0)
    AIE.useLock(%173, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %179 = AIE.mem(%171) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%172, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%176 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%172, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%173, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%175 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%173, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %180 = AIE.tile(12, 3)
  %181 = AIE.lock(%180, 2)
  %182 = AIE.lock(%180, 1)
  %183 = AIE.lock(%180, 0)
  %184 = AIE.buffer(%180) : memref<32x32xf32>
  %185 = AIE.buffer(%180) : memref<32x32xf32>
  %186 = AIE.buffer(%180) : memref<32x32xf32>
  %187 = AIE.core(%180) {
    AIE.useLock(%191, Acquire, 0)
    AIE.useLock(%183, Acquire, 1)
    AIE.useLock(%181, Acquire, 1)
    AIE.useLock(%182, Acquire, 1)
    call @extern_kernel(%174, %184, %185, %186) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%182, Release, 0)
    AIE.useLock(%181, Release, 0)
    AIE.useLock(%183, Release, 0)
    AIE.useLock(%191, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %188 = AIE.mem(%180) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%181, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%186 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%181, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%183, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%185 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%183, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %189 = AIE.tile(12, 4)
  %190 = AIE.lock(%189, 2)
  %191 = AIE.lock(%189, 1)
  %192 = AIE.lock(%189, 0)
  %193 = AIE.buffer(%189) : memref<32x32xf32>
  %194 = AIE.buffer(%189) : memref<32x32xf32>
  %195 = AIE.buffer(%189) : memref<32x32xf32>
  %196 = AIE.core(%189) {
    AIE.useLock(%191, Acquire, 1)
    AIE.useLock(%192, Acquire, 1)
    AIE.useLock(%201, Acquire, 0)
    AIE.useLock(%190, Acquire, 1)
    call @extern_kernel(%184, %193, %194, %195) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%190, Release, 0)
    AIE.useLock(%201, Release, 1)
    AIE.useLock(%192, Release, 0)
    AIE.useLock(%191, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %197 = AIE.mem(%189) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%190, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%195 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%190, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%192, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%194 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%192, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %198 = AIE.tile(12, 5) {polyaie.leaf}
  %199 = AIE.lock(%198, 3)
  %200 = AIE.lock(%198, 2)
  %201 = AIE.lock(%198, 1)
  %202 = AIE.lock(%198, 0)
  %203 = AIE.buffer(%198) : memref<32x32xf32>
  %204 = AIE.buffer(%198) : memref<32x32xf32>
  %205 = AIE.buffer(%198) : memref<32x32xf32>
  %206 = AIE.core(%198) {
    AIE.useLock(%201, Acquire, 1)
    AIE.useLock(%200, Acquire, 1)
    AIE.useLock(%199, Acquire, 1)
    AIE.useLock(%202, Acquire, 0)
    call @extern_kernel(%193, %203, %204, %205) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%202, Release, 1)
    AIE.useLock(%199, Release, 0)
    AIE.useLock(%200, Release, 0)
    AIE.useLock(%201, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %207 = AIE.mem(%198) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%199, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%205 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%199, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%200, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%204 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%200, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%202, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%203 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%202, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%198, DMA : 0>
    AIE.packet_dest<%49, DMA : 0>
  }
  %208 = AIE.tile(13, 2)
  %209 = AIE.lock(%208, 1)
  %210 = AIE.lock(%208, 0)
  %211 = AIE.buffer(%208) : memref<32x32xf32>
  %212 = AIE.buffer(%208) : memref<32x32xf32>
  %213 = AIE.buffer(%208) : memref<32x32xf32>
  %214 = AIE.buffer(%208) : memref<32x32xf32>
  %215 = AIE.core(%208) {
    AIE.useLock(%210, Acquire, 1)
    AIE.useLock(%219, Acquire, 0)
    AIE.useLock(%209, Acquire, 1)
    call @extern_kernel(%214, %211, %212, %213) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%209, Release, 0)
    AIE.useLock(%219, Release, 1)
    AIE.useLock(%210, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %216 = AIE.mem(%208) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%209, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%213 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%209, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%210, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%212 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%210, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %217 = AIE.tile(13, 3)
  %218 = AIE.lock(%217, 2)
  %219 = AIE.lock(%217, 1)
  %220 = AIE.lock(%217, 0)
  %221 = AIE.buffer(%217) : memref<32x32xf32>
  %222 = AIE.buffer(%217) : memref<32x32xf32>
  %223 = AIE.buffer(%217) : memref<32x32xf32>
  %224 = AIE.core(%217) {
    AIE.useLock(%219, Acquire, 1)
    AIE.useLock(%220, Acquire, 1)
    AIE.useLock(%218, Acquire, 1)
    AIE.useLock(%227, Acquire, 0)
    call @extern_kernel(%211, %221, %222, %223) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%227, Release, 1)
    AIE.useLock(%218, Release, 0)
    AIE.useLock(%220, Release, 0)
    AIE.useLock(%219, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %225 = AIE.mem(%217) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%218, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%223 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%218, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%220, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%222 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%220, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %226 = AIE.tile(13, 4)
  %227 = AIE.lock(%226, 2)
  %228 = AIE.lock(%226, 1)
  %229 = AIE.lock(%226, 0)
  %230 = AIE.buffer(%226) : memref<32x32xf32>
  %231 = AIE.buffer(%226) : memref<32x32xf32>
  %232 = AIE.buffer(%226) : memref<32x32xf32>
  %233 = AIE.core(%226) {
    AIE.useLock(%229, Acquire, 1)
    AIE.useLock(%228, Acquire, 1)
    AIE.useLock(%237, Acquire, 0)
    AIE.useLock(%227, Acquire, 1)
    call @extern_kernel(%221, %230, %231, %232) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%227, Release, 0)
    AIE.useLock(%237, Release, 1)
    AIE.useLock(%228, Release, 0)
    AIE.useLock(%229, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %234 = AIE.mem(%226) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%228, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%231 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%228, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%229, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%232 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%229, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %235 = AIE.tile(13, 5) {polyaie.leaf}
  %236 = AIE.lock(%235, 3)
  %237 = AIE.lock(%235, 2)
  %238 = AIE.lock(%235, 1)
  %239 = AIE.lock(%235, 0)
  %240 = AIE.buffer(%235) : memref<32x32xf32>
  %241 = AIE.buffer(%235) : memref<32x32xf32>
  %242 = AIE.buffer(%235) : memref<32x32xf32>
  %243 = AIE.core(%235) {
    AIE.useLock(%238, Acquire, 0)
    AIE.useLock(%239, Acquire, 1)
    AIE.useLock(%236, Acquire, 1)
    AIE.useLock(%237, Acquire, 1)
    call @extern_kernel(%230, %240, %241, %242) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%237, Release, 0)
    AIE.useLock(%236, Release, 0)
    AIE.useLock(%239, Release, 0)
    AIE.useLock(%238, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %244 = AIE.mem(%235) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%236, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%241 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%236, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%239, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%242 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%239, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%238, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%240 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%238, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%235, DMA : 0>
    AIE.packet_dest<%49, DMA : 0>
  }
  %245 = AIE.tile(14, 2)
  %246 = AIE.lock(%245, 1)
  %247 = AIE.lock(%245, 0)
  %248 = AIE.buffer(%245) : memref<32x32xf32>
  %249 = AIE.buffer(%245) : memref<32x32xf32>
  %250 = AIE.buffer(%245) : memref<32x32xf32>
  %251 = AIE.buffer(%245) : memref<32x32xf32>
  %252 = AIE.core(%245) {
    AIE.useLock(%246, Acquire, 1)
    AIE.useLock(%247, Acquire, 1)
    AIE.useLock(%256, Acquire, 0)
    call @extern_kernel(%251, %248, %249, %250) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%256, Release, 1)
    AIE.useLock(%247, Release, 0)
    AIE.useLock(%246, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %253 = AIE.mem(%245) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%247, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%250 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%247, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%246, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%249 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%246, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %254 = AIE.tile(14, 3)
  %255 = AIE.lock(%254, 2)
  %256 = AIE.lock(%254, 1)
  %257 = AIE.lock(%254, 0)
  %258 = AIE.buffer(%254) : memref<32x32xf32>
  %259 = AIE.buffer(%254) : memref<32x32xf32>
  %260 = AIE.buffer(%254) : memref<32x32xf32>
  %261 = AIE.core(%254) {
    AIE.useLock(%257, Acquire, 1)
    AIE.useLock(%266, Acquire, 0)
    AIE.useLock(%256, Acquire, 1)
    AIE.useLock(%255, Acquire, 1)
    call @extern_kernel(%248, %258, %259, %260) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%255, Release, 0)
    AIE.useLock(%256, Release, 0)
    AIE.useLock(%266, Release, 1)
    AIE.useLock(%257, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %262 = AIE.mem(%254) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%255, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%259 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%255, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%257, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%260 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%257, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %263 = AIE.tile(14, 4)
  %264 = AIE.lock(%263, 2)
  %265 = AIE.lock(%263, 1)
  %266 = AIE.lock(%263, 0)
  %267 = AIE.buffer(%263) : memref<32x32xf32>
  %268 = AIE.buffer(%263) : memref<32x32xf32>
  %269 = AIE.buffer(%263) : memref<32x32xf32>
  %270 = AIE.core(%263) {
    AIE.useLock(%274, Acquire, 0)
    AIE.useLock(%264, Acquire, 1)
    AIE.useLock(%266, Acquire, 1)
    AIE.useLock(%265, Acquire, 1)
    call @extern_kernel(%258, %267, %268, %269) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%265, Release, 0)
    AIE.useLock(%266, Release, 0)
    AIE.useLock(%264, Release, 0)
    AIE.useLock(%274, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %271 = AIE.mem(%263) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%265, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%268 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%265, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%264, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%269 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%264, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %272 = AIE.tile(14, 5) {polyaie.leaf}
  %273 = AIE.lock(%272, 3)
  %274 = AIE.lock(%272, 2)
  %275 = AIE.lock(%272, 1)
  %276 = AIE.lock(%272, 0)
  %277 = AIE.buffer(%272) : memref<32x32xf32>
  %278 = AIE.buffer(%272) : memref<32x32xf32>
  %279 = AIE.buffer(%272) : memref<32x32xf32>
  %280 = AIE.core(%272) {
    AIE.useLock(%273, Acquire, 0)
    AIE.useLock(%274, Acquire, 1)
    AIE.useLock(%276, Acquire, 1)
    AIE.useLock(%275, Acquire, 1)
    call @extern_kernel(%267, %277, %278, %279) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%275, Release, 0)
    AIE.useLock(%276, Release, 0)
    AIE.useLock(%274, Release, 0)
    AIE.useLock(%273, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %281 = AIE.mem(%272) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%275, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%278 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%275, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%276, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%279 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%276, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%273, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%277 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%273, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%272, DMA : 0>
    AIE.packet_dest<%49, DMA : 1>
  }
  %282 = AIE.tile(15, 2)
  %283 = AIE.lock(%282, 1)
  %284 = AIE.lock(%282, 0)
  %285 = AIE.buffer(%282) : memref<32x32xf32>
  %286 = AIE.buffer(%282) : memref<32x32xf32>
  %287 = AIE.buffer(%282) : memref<32x32xf32>
  %288 = AIE.buffer(%282) : memref<32x32xf32>
  %289 = AIE.core(%282) {
    AIE.useLock(%293, Acquire, 0)
    AIE.useLock(%283, Acquire, 1)
    AIE.useLock(%284, Acquire, 1)
    call @extern_kernel(%288, %285, %286, %287) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%284, Release, 0)
    AIE.useLock(%283, Release, 0)
    AIE.useLock(%293, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %290 = AIE.mem(%282) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%284, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%287 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%284, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%283, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%286 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%283, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %291 = AIE.tile(15, 3)
  %292 = AIE.lock(%291, 2)
  %293 = AIE.lock(%291, 1)
  %294 = AIE.lock(%291, 0)
  %295 = AIE.buffer(%291) : memref<32x32xf32>
  %296 = AIE.buffer(%291) : memref<32x32xf32>
  %297 = AIE.buffer(%291) : memref<32x32xf32>
  %298 = AIE.core(%291) {
    AIE.useLock(%293, Acquire, 1)
    AIE.useLock(%303, Acquire, 0)
    AIE.useLock(%292, Acquire, 1)
    AIE.useLock(%294, Acquire, 1)
    call @extern_kernel(%285, %295, %296, %297) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%294, Release, 0)
    AIE.useLock(%292, Release, 0)
    AIE.useLock(%303, Release, 1)
    AIE.useLock(%293, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %299 = AIE.mem(%291) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%294, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%296 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%294, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%292, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%297 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%292, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %300 = AIE.tile(15, 4)
  %301 = AIE.lock(%300, 2)
  %302 = AIE.lock(%300, 1)
  %303 = AIE.lock(%300, 0)
  %304 = AIE.buffer(%300) : memref<32x32xf32>
  %305 = AIE.buffer(%300) : memref<32x32xf32>
  %306 = AIE.buffer(%300) : memref<32x32xf32>
  %307 = AIE.core(%300) {
    AIE.useLock(%302, Acquire, 1)
    AIE.useLock(%313, Acquire, 0)
    AIE.useLock(%303, Acquire, 1)
    AIE.useLock(%301, Acquire, 1)
    call @extern_kernel(%295, %304, %305, %306) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%301, Release, 0)
    AIE.useLock(%303, Release, 0)
    AIE.useLock(%313, Release, 1)
    AIE.useLock(%302, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %308 = AIE.mem(%300) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%301, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%305 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%301, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%302, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%306 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%302, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %309 = AIE.tile(15, 5) {polyaie.leaf}
  %310 = AIE.lock(%309, 3)
  %311 = AIE.lock(%309, 2)
  %312 = AIE.lock(%309, 1)
  %313 = AIE.lock(%309, 0)
  %314 = AIE.buffer(%309) : memref<32x32xf32>
  %315 = AIE.buffer(%309) : memref<32x32xf32>
  %316 = AIE.buffer(%309) : memref<32x32xf32>
  %317 = AIE.core(%309) {
    AIE.useLock(%313, Acquire, 1)
    AIE.useLock(%310, Acquire, 0)
    AIE.useLock(%311, Acquire, 1)
    AIE.useLock(%312, Acquire, 1)
    call @extern_kernel(%304, %314, %315, %316) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%312, Release, 0)
    AIE.useLock(%311, Release, 0)
    AIE.useLock(%310, Release, 1)
    AIE.useLock(%313, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %318 = AIE.mem(%309) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%312, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%315 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%312, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%311, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%316 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%311, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%310, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%314 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%310, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%309, DMA : 0>
    AIE.packet_dest<%49, DMA : 1>
  }
  %319 = AIE.tile(16, 2)
  %320 = AIE.lock(%319, 1)
  %321 = AIE.lock(%319, 0)
  %322 = AIE.buffer(%319) : memref<32x32xf32>
  %323 = AIE.buffer(%319) : memref<32x32xf32>
  %324 = AIE.buffer(%319) : memref<32x32xf32>
  %325 = AIE.buffer(%319) : memref<32x32xf32>
  %326 = AIE.core(%319) {
    AIE.useLock(%320, Acquire, 1)
    AIE.useLock(%330, Acquire, 0)
    AIE.useLock(%321, Acquire, 1)
    call @extern_kernel(%325, %322, %323, %324) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%321, Release, 0)
    AIE.useLock(%330, Release, 1)
    AIE.useLock(%320, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %327 = AIE.mem(%319) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%321, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%323 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%321, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%320, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%324 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%320, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %328 = AIE.tile(16, 3)
  %329 = AIE.lock(%328, 2)
  %330 = AIE.lock(%328, 1)
  %331 = AIE.lock(%328, 0)
  %332 = AIE.buffer(%328) : memref<32x32xf32>
  %333 = AIE.buffer(%328) : memref<32x32xf32>
  %334 = AIE.buffer(%328) : memref<32x32xf32>
  %335 = AIE.core(%328) {
    AIE.useLock(%340, Acquire, 0)
    AIE.useLock(%330, Acquire, 1)
    AIE.useLock(%329, Acquire, 1)
    AIE.useLock(%331, Acquire, 1)
    call @extern_kernel(%322, %332, %333, %334) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%331, Release, 0)
    AIE.useLock(%329, Release, 0)
    AIE.useLock(%330, Release, 0)
    AIE.useLock(%340, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %336 = AIE.mem(%328) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%331, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%333 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%331, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%329, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%334 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%329, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %337 = AIE.tile(16, 4)
  %338 = AIE.lock(%337, 2)
  %339 = AIE.lock(%337, 1)
  %340 = AIE.lock(%337, 0)
  %341 = AIE.buffer(%337) : memref<32x32xf32>
  %342 = AIE.buffer(%337) : memref<32x32xf32>
  %343 = AIE.buffer(%337) : memref<32x32xf32>
  %344 = AIE.core(%337) {
    AIE.useLock(%340, Acquire, 1)
    AIE.useLock(%349, Acquire, 0)
    AIE.useLock(%338, Acquire, 1)
    AIE.useLock(%339, Acquire, 1)
    call @extern_kernel(%332, %341, %342, %343) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%339, Release, 0)
    AIE.useLock(%338, Release, 0)
    AIE.useLock(%349, Release, 1)
    AIE.useLock(%340, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %345 = AIE.mem(%337) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%339, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%342 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%339, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%338, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%343 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%338, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %346 = AIE.tile(16, 5) {polyaie.leaf}
  %347 = AIE.lock(%346, 3)
  %348 = AIE.lock(%346, 2)
  %349 = AIE.lock(%346, 1)
  %350 = AIE.lock(%346, 0)
  %351 = AIE.buffer(%346) : memref<32x32xf32>
  %352 = AIE.buffer(%346) : memref<32x32xf32>
  %353 = AIE.buffer(%346) : memref<32x32xf32>
  %354 = AIE.core(%346) {
    AIE.useLock(%349, Acquire, 1)
    AIE.useLock(%348, Acquire, 0)
    AIE.useLock(%347, Acquire, 1)
    AIE.useLock(%350, Acquire, 1)
    call @extern_kernel(%341, %351, %352, %353) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%350, Release, 0)
    AIE.useLock(%347, Release, 0)
    AIE.useLock(%348, Release, 1)
    AIE.useLock(%349, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %355 = AIE.mem(%346) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%350, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%352 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%350, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%347, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%353 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%347, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%348, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%351 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%348, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%346, DMA : 0>
    AIE.packet_dest<%49, DMA : 1>
  }
  %356 = AIE.tile(17, 2)
  %357 = AIE.lock(%356, 1)
  %358 = AIE.lock(%356, 0)
  %359 = AIE.buffer(%356) : memref<32x32xf32>
  %360 = AIE.buffer(%356) : memref<32x32xf32>
  %361 = AIE.buffer(%356) : memref<32x32xf32>
  %362 = AIE.buffer(%356) : memref<32x32xf32>
  %363 = AIE.core(%356) {
    AIE.useLock(%367, Acquire, 0)
    AIE.useLock(%358, Acquire, 1)
    AIE.useLock(%357, Acquire, 1)
    call @extern_kernel(%362, %359, %360, %361) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%357, Release, 0)
    AIE.useLock(%358, Release, 0)
    AIE.useLock(%367, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %364 = AIE.mem(%356) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%357, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%361 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%357, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%358, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%360 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%358, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %365 = AIE.tile(17, 3)
  %366 = AIE.lock(%365, 2)
  %367 = AIE.lock(%365, 1)
  %368 = AIE.lock(%365, 0)
  %369 = AIE.buffer(%365) : memref<32x32xf32>
  %370 = AIE.buffer(%365) : memref<32x32xf32>
  %371 = AIE.buffer(%365) : memref<32x32xf32>
  %372 = AIE.core(%365) {
    AIE.useLock(%367, Acquire, 1)
    AIE.useLock(%376, Acquire, 0)
    AIE.useLock(%366, Acquire, 1)
    AIE.useLock(%368, Acquire, 1)
    call @extern_kernel(%359, %369, %370, %371) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%368, Release, 0)
    AIE.useLock(%366, Release, 0)
    AIE.useLock(%376, Release, 1)
    AIE.useLock(%367, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %373 = AIE.mem(%365) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%368, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%370 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%368, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%366, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%371 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%366, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %374 = AIE.tile(17, 4)
  %375 = AIE.lock(%374, 2)
  %376 = AIE.lock(%374, 1)
  %377 = AIE.lock(%374, 0)
  %378 = AIE.buffer(%374) : memref<32x32xf32>
  %379 = AIE.buffer(%374) : memref<32x32xf32>
  %380 = AIE.buffer(%374) : memref<32x32xf32>
  %381 = AIE.core(%374) {
    AIE.useLock(%377, Acquire, 1)
    AIE.useLock(%376, Acquire, 1)
    AIE.useLock(%384, Acquire, 0)
    AIE.useLock(%375, Acquire, 1)
    call @extern_kernel(%369, %378, %379, %380) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%375, Release, 0)
    AIE.useLock(%384, Release, 1)
    AIE.useLock(%376, Release, 0)
    AIE.useLock(%377, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %382 = AIE.mem(%374) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%375, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%379 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%375, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%377, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%380 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%377, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %383 = AIE.tile(17, 5) {polyaie.leaf}
  %384 = AIE.lock(%383, 3)
  %385 = AIE.lock(%383, 2)
  %386 = AIE.lock(%383, 1)
  %387 = AIE.lock(%383, 0)
  %388 = AIE.buffer(%383) : memref<32x32xf32>
  %389 = AIE.buffer(%383) : memref<32x32xf32>
  %390 = AIE.buffer(%383) : memref<32x32xf32>
  %391 = AIE.core(%383) {
    AIE.useLock(%386, Acquire, 1)
    AIE.useLock(%384, Acquire, 1)
    AIE.useLock(%385, Acquire, 0)
    AIE.useLock(%387, Acquire, 1)
    call @extern_kernel(%378, %388, %389, %390) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%387, Release, 0)
    AIE.useLock(%385, Release, 1)
    AIE.useLock(%384, Release, 0)
    AIE.useLock(%386, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %392 = AIE.mem(%383) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%387, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%389 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%387, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%386, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%390 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%386, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%385, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%388 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%385, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%383, DMA : 0>
    AIE.packet_dest<%49, DMA : 1>
  }
  %393 = AIE.tile(18, 2)
  %394 = AIE.lock(%393, 1)
  %395 = AIE.lock(%393, 0)
  %396 = AIE.buffer(%393) : memref<32x32xf32>
  %397 = AIE.buffer(%393) : memref<32x32xf32>
  %398 = AIE.buffer(%393) : memref<32x32xf32>
  %399 = AIE.buffer(%393) : memref<32x32xf32>
  %400 = AIE.core(%393) {
    AIE.useLock(%394, Acquire, 1)
    AIE.useLock(%404, Acquire, 0)
    AIE.useLock(%395, Acquire, 1)
    call @extern_kernel(%399, %396, %397, %398) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%395, Release, 0)
    AIE.useLock(%404, Release, 1)
    AIE.useLock(%394, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %401 = AIE.mem(%393) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%395, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%398 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%395, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%394, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%397 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%394, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %402 = AIE.tile(18, 3)
  %403 = AIE.lock(%402, 2)
  %404 = AIE.lock(%402, 1)
  %405 = AIE.lock(%402, 0)
  %406 = AIE.buffer(%402) : memref<32x32xf32>
  %407 = AIE.buffer(%402) : memref<32x32xf32>
  %408 = AIE.buffer(%402) : memref<32x32xf32>
  %409 = AIE.core(%402) {
    AIE.useLock(%413, Acquire, 0)
    AIE.useLock(%403, Acquire, 1)
    AIE.useLock(%404, Acquire, 1)
    AIE.useLock(%405, Acquire, 1)
    call @extern_kernel(%396, %406, %407, %408) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%405, Release, 0)
    AIE.useLock(%404, Release, 0)
    AIE.useLock(%403, Release, 0)
    AIE.useLock(%413, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %410 = AIE.mem(%402) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%405, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%408 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%405, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%403, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%407 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%403, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %411 = AIE.tile(18, 4)
  %412 = AIE.lock(%411, 2)
  %413 = AIE.lock(%411, 1)
  %414 = AIE.lock(%411, 0)
  %415 = AIE.buffer(%411) : memref<32x32xf32>
  %416 = AIE.buffer(%411) : memref<32x32xf32>
  %417 = AIE.buffer(%411) : memref<32x32xf32>
  %418 = AIE.core(%411) {
    AIE.useLock(%413, Acquire, 1)
    AIE.useLock(%414, Acquire, 1)
    AIE.useLock(%421, Acquire, 0)
    AIE.useLock(%412, Acquire, 1)
    call @extern_kernel(%406, %415, %416, %417) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%412, Release, 0)
    AIE.useLock(%421, Release, 1)
    AIE.useLock(%414, Release, 0)
    AIE.useLock(%413, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %419 = AIE.mem(%411) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%412, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%417 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%412, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%414, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%416 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%414, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %420 = AIE.tile(18, 5) {polyaie.leaf}
  %421 = AIE.lock(%420, 3)
  %422 = AIE.lock(%420, 2)
  %423 = AIE.lock(%420, 1)
  %424 = AIE.lock(%420, 0)
  %425 = AIE.buffer(%420) : memref<32x32xf32>
  %426 = AIE.buffer(%420) : memref<32x32xf32>
  %427 = AIE.buffer(%420) : memref<32x32xf32>
  %428 = AIE.core(%420) {
    AIE.useLock(%424, Acquire, 1)
    AIE.useLock(%421, Acquire, 1)
    AIE.useLock(%423, Acquire, 0)
    AIE.useLock(%422, Acquire, 1)
    call @extern_kernel(%415, %425, %426, %427) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%422, Release, 0)
    AIE.useLock(%423, Release, 1)
    AIE.useLock(%421, Release, 0)
    AIE.useLock(%424, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %429 = AIE.mem(%420) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%422, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%426 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%422, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%424, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%427 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%424, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%423, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%425 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%423, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%420, DMA : 0>
    AIE.packet_dest<%3, DMA : 0>
  }
  %430 = AIE.tile(19, 2)
  %431 = AIE.lock(%430, 1)
  %432 = AIE.lock(%430, 0)
  %433 = AIE.buffer(%430) : memref<32x32xf32>
  %434 = AIE.buffer(%430) : memref<32x32xf32>
  %435 = AIE.buffer(%430) : memref<32x32xf32>
  %436 = AIE.buffer(%430) : memref<32x32xf32>
  %437 = AIE.core(%430) {
    AIE.useLock(%431, Acquire, 1)
    AIE.useLock(%432, Acquire, 1)
    AIE.useLock(%442, Acquire, 0)
    call @extern_kernel(%436, %433, %434, %435) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%442, Release, 1)
    AIE.useLock(%432, Release, 0)
    AIE.useLock(%431, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %438 = AIE.mem(%430) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%432, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%435 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%432, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%431, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%434 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%431, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %439 = AIE.tile(19, 3)
  %440 = AIE.lock(%439, 2)
  %441 = AIE.lock(%439, 1)
  %442 = AIE.lock(%439, 0)
  %443 = AIE.buffer(%439) : memref<32x32xf32>
  %444 = AIE.buffer(%439) : memref<32x32xf32>
  %445 = AIE.buffer(%439) : memref<32x32xf32>
  %446 = AIE.core(%439) {
    AIE.useLock(%441, Acquire, 1)
    AIE.useLock(%442, Acquire, 1)
    AIE.useLock(%440, Acquire, 1)
    AIE.useLock(%450, Acquire, 0)
    call @extern_kernel(%433, %443, %444, %445) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%450, Release, 1)
    AIE.useLock(%440, Release, 0)
    AIE.useLock(%442, Release, 0)
    AIE.useLock(%441, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %447 = AIE.mem(%439) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%440, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%445 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%440, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%441, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%444 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%441, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %448 = AIE.tile(19, 4)
  %449 = AIE.lock(%448, 2)
  %450 = AIE.lock(%448, 1)
  %451 = AIE.lock(%448, 0)
  %452 = AIE.buffer(%448) : memref<32x32xf32>
  %453 = AIE.buffer(%448) : memref<32x32xf32>
  %454 = AIE.buffer(%448) : memref<32x32xf32>
  %455 = AIE.core(%448) {
    AIE.useLock(%461, Acquire, 0)
    AIE.useLock(%449, Acquire, 1)
    AIE.useLock(%451, Acquire, 1)
    AIE.useLock(%450, Acquire, 1)
    call @extern_kernel(%443, %452, %453, %454) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%450, Release, 0)
    AIE.useLock(%451, Release, 0)
    AIE.useLock(%449, Release, 0)
    AIE.useLock(%461, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %456 = AIE.mem(%448) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%451, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%453 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%451, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%449, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%454 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%449, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %457 = AIE.tile(19, 5) {polyaie.leaf}
  %458 = AIE.lock(%457, 3)
  %459 = AIE.lock(%457, 2)
  %460 = AIE.lock(%457, 1)
  %461 = AIE.lock(%457, 0)
  %462 = AIE.buffer(%457) : memref<32x32xf32>
  %463 = AIE.buffer(%457) : memref<32x32xf32>
  %464 = AIE.buffer(%457) : memref<32x32xf32>
  %465 = AIE.core(%457) {
    AIE.useLock(%461, Acquire, 1)
    AIE.useLock(%458, Acquire, 0)
    AIE.useLock(%460, Acquire, 1)
    AIE.useLock(%459, Acquire, 1)
    call @extern_kernel(%452, %462, %463, %464) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%459, Release, 0)
    AIE.useLock(%460, Release, 0)
    AIE.useLock(%458, Release, 1)
    AIE.useLock(%461, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %466 = AIE.mem(%457) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%459, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%463 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%459, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%460, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%464 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%460, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%458, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%462 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%458, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%457, DMA : 0>
    AIE.packet_dest<%3, DMA : 0>
  }
  %467 = AIE.tile(20, 2)
  %468 = AIE.lock(%467, 1)
  %469 = AIE.lock(%467, 0)
  %470 = AIE.buffer(%467) : memref<32x32xf32>
  %471 = AIE.buffer(%467) : memref<32x32xf32>
  %472 = AIE.buffer(%467) : memref<32x32xf32>
  %473 = AIE.buffer(%467) : memref<32x32xf32>
  %474 = AIE.core(%467) {
    AIE.useLock(%469, Acquire, 1)
    AIE.useLock(%468, Acquire, 1)
    AIE.useLock(%478, Acquire, 0)
    call @extern_kernel(%473, %470, %471, %472) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%478, Release, 1)
    AIE.useLock(%468, Release, 0)
    AIE.useLock(%469, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %475 = AIE.mem(%467) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%468, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%472 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%468, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%469, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%471 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%469, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %476 = AIE.tile(20, 3)
  %477 = AIE.lock(%476, 2)
  %478 = AIE.lock(%476, 1)
  %479 = AIE.lock(%476, 0)
  %480 = AIE.buffer(%476) : memref<32x32xf32>
  %481 = AIE.buffer(%476) : memref<32x32xf32>
  %482 = AIE.buffer(%476) : memref<32x32xf32>
  %483 = AIE.core(%476) {
    AIE.useLock(%479, Acquire, 1)
    AIE.useLock(%487, Acquire, 0)
    AIE.useLock(%478, Acquire, 1)
    AIE.useLock(%477, Acquire, 1)
    call @extern_kernel(%470, %480, %481, %482) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%477, Release, 0)
    AIE.useLock(%478, Release, 0)
    AIE.useLock(%487, Release, 1)
    AIE.useLock(%479, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %484 = AIE.mem(%476) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%477, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%482 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%477, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%479, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%481 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%479, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %485 = AIE.tile(20, 4)
  %486 = AIE.lock(%485, 2)
  %487 = AIE.lock(%485, 1)
  %488 = AIE.lock(%485, 0)
  %489 = AIE.buffer(%485) : memref<32x32xf32>
  %490 = AIE.buffer(%485) : memref<32x32xf32>
  %491 = AIE.buffer(%485) : memref<32x32xf32>
  %492 = AIE.core(%485) {
    AIE.useLock(%498, Acquire, 0)
    AIE.useLock(%487, Acquire, 1)
    AIE.useLock(%488, Acquire, 1)
    AIE.useLock(%486, Acquire, 1)
    call @extern_kernel(%480, %489, %490, %491) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%486, Release, 0)
    AIE.useLock(%488, Release, 0)
    AIE.useLock(%487, Release, 0)
    AIE.useLock(%498, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %493 = AIE.mem(%485) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%486, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%491 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%486, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%488, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%490 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%488, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %494 = AIE.tile(20, 5) {polyaie.leaf}
  %495 = AIE.lock(%494, 3)
  %496 = AIE.lock(%494, 2)
  %497 = AIE.lock(%494, 1)
  %498 = AIE.lock(%494, 0)
  %499 = AIE.buffer(%494) : memref<32x32xf32>
  %500 = AIE.buffer(%494) : memref<32x32xf32>
  %501 = AIE.buffer(%494) : memref<32x32xf32>
  %502 = AIE.core(%494) {
    AIE.useLock(%498, Acquire, 1)
    AIE.useLock(%497, Acquire, 0)
    AIE.useLock(%495, Acquire, 1)
    AIE.useLock(%496, Acquire, 1)
    call @extern_kernel(%489, %499, %500, %501) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%496, Release, 0)
    AIE.useLock(%495, Release, 0)
    AIE.useLock(%497, Release, 1)
    AIE.useLock(%498, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %503 = AIE.mem(%494) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%496, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%500 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%496, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%495, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%501 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%495, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%497, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%499 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%497, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%494, DMA : 0>
    AIE.packet_dest<%3, DMA : 0>
  }
  %504 = AIE.tile(21, 2)
  %505 = AIE.lock(%504, 1)
  %506 = AIE.lock(%504, 0)
  %507 = AIE.buffer(%504) : memref<32x32xf32>
  %508 = AIE.buffer(%504) : memref<32x32xf32>
  %509 = AIE.buffer(%504) : memref<32x32xf32>
  %510 = AIE.buffer(%504) : memref<32x32xf32>
  %511 = AIE.core(%504) {
    AIE.useLock(%505, Acquire, 1)
    AIE.useLock(%516, Acquire, 0)
    AIE.useLock(%506, Acquire, 1)
    call @extern_kernel(%510, %507, %508, %509) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%506, Release, 0)
    AIE.useLock(%516, Release, 1)
    AIE.useLock(%505, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %512 = AIE.mem(%504) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%506, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%509 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%506, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%505, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%508 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%505, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %513 = AIE.tile(21, 3)
  %514 = AIE.lock(%513, 2)
  %515 = AIE.lock(%513, 1)
  %516 = AIE.lock(%513, 0)
  %517 = AIE.buffer(%513) : memref<32x32xf32>
  %518 = AIE.buffer(%513) : memref<32x32xf32>
  %519 = AIE.buffer(%513) : memref<32x32xf32>
  %520 = AIE.core(%513) {
    AIE.useLock(%515, Acquire, 1)
    AIE.useLock(%524, Acquire, 0)
    AIE.useLock(%514, Acquire, 1)
    AIE.useLock(%516, Acquire, 1)
    call @extern_kernel(%507, %517, %518, %519) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%516, Release, 0)
    AIE.useLock(%514, Release, 0)
    AIE.useLock(%524, Release, 1)
    AIE.useLock(%515, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %521 = AIE.mem(%513) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%514, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%519 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%514, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%515, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%518 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%515, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %522 = AIE.tile(21, 4)
  %523 = AIE.lock(%522, 2)
  %524 = AIE.lock(%522, 1)
  %525 = AIE.lock(%522, 0)
  %526 = AIE.buffer(%522) : memref<32x32xf32>
  %527 = AIE.buffer(%522) : memref<32x32xf32>
  %528 = AIE.buffer(%522) : memref<32x32xf32>
  %529 = AIE.core(%522) {
    AIE.useLock(%533, Acquire, 0)
    AIE.useLock(%524, Acquire, 1)
    AIE.useLock(%523, Acquire, 1)
    AIE.useLock(%525, Acquire, 1)
    call @extern_kernel(%517, %526, %527, %528) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%525, Release, 0)
    AIE.useLock(%523, Release, 0)
    AIE.useLock(%524, Release, 0)
    AIE.useLock(%533, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %530 = AIE.mem(%522) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%525, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%527 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%525, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%523, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%528 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%523, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %531 = AIE.tile(21, 5) {polyaie.leaf}
  %532 = AIE.lock(%531, 3)
  %533 = AIE.lock(%531, 2)
  %534 = AIE.lock(%531, 1)
  %535 = AIE.lock(%531, 0)
  %536 = AIE.buffer(%531) : memref<32x32xf32>
  %537 = AIE.buffer(%531) : memref<32x32xf32>
  %538 = AIE.buffer(%531) : memref<32x32xf32>
  %539 = AIE.core(%531) {
    AIE.useLock(%533, Acquire, 1)
    AIE.useLock(%535, Acquire, 1)
    AIE.useLock(%532, Acquire, 0)
    AIE.useLock(%534, Acquire, 1)
    call @extern_kernel(%526, %536, %537, %538) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%534, Release, 0)
    AIE.useLock(%532, Release, 1)
    AIE.useLock(%535, Release, 0)
    AIE.useLock(%533, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %540 = AIE.mem(%531) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%534, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%537 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%534, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%535, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%538 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%535, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%532, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%536 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%532, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%531, DMA : 0>
    AIE.packet_dest<%3, DMA : 0>
  }
  %541 = AIE.tile(22, 2)
  %542 = AIE.lock(%541, 1)
  %543 = AIE.lock(%541, 0)
  %544 = AIE.buffer(%541) : memref<32x32xf32>
  %545 = AIE.buffer(%541) : memref<32x32xf32>
  %546 = AIE.buffer(%541) : memref<32x32xf32>
  %547 = AIE.buffer(%541) : memref<32x32xf32>
  %548 = AIE.core(%541) {
    AIE.useLock(%542, Acquire, 1)
    AIE.useLock(%551, Acquire, 0)
    AIE.useLock(%543, Acquire, 1)
    call @extern_kernel(%547, %544, %545, %546) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%543, Release, 0)
    AIE.useLock(%551, Release, 1)
    AIE.useLock(%542, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %549 = AIE.mem(%541) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%543, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%546 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%543, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%542, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%545 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%542, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %550 = AIE.tile(22, 3)
  %551 = AIE.lock(%550, 2)
  %552 = AIE.lock(%550, 1)
  %553 = AIE.lock(%550, 0)
  %554 = AIE.buffer(%550) : memref<32x32xf32>
  %555 = AIE.buffer(%550) : memref<32x32xf32>
  %556 = AIE.buffer(%550) : memref<32x32xf32>
  %557 = AIE.core(%550) {
    AIE.useLock(%552, Acquire, 1)
    AIE.useLock(%551, Acquire, 1)
    AIE.useLock(%561, Acquire, 0)
    AIE.useLock(%553, Acquire, 1)
    call @extern_kernel(%544, %554, %555, %556) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%553, Release, 0)
    AIE.useLock(%561, Release, 1)
    AIE.useLock(%551, Release, 0)
    AIE.useLock(%552, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %558 = AIE.mem(%550) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%553, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%555 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%553, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%552, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%556 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%552, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %559 = AIE.tile(22, 4)
  %560 = AIE.lock(%559, 2)
  %561 = AIE.lock(%559, 1)
  %562 = AIE.lock(%559, 0)
  %563 = AIE.buffer(%559) : memref<32x32xf32>
  %564 = AIE.buffer(%559) : memref<32x32xf32>
  %565 = AIE.buffer(%559) : memref<32x32xf32>
  %566 = AIE.core(%559) {
    AIE.useLock(%562, Acquire, 1)
    AIE.useLock(%561, Acquire, 1)
    AIE.useLock(%560, Acquire, 1)
    AIE.useLock(%571, Acquire, 0)
    call @extern_kernel(%554, %563, %564, %565) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%571, Release, 1)
    AIE.useLock(%560, Release, 0)
    AIE.useLock(%561, Release, 0)
    AIE.useLock(%562, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %567 = AIE.mem(%559) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%560, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%565 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%560, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%562, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%564 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%562, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %568 = AIE.tile(22, 5) {polyaie.leaf}
  %569 = AIE.lock(%568, 3)
  %570 = AIE.lock(%568, 2)
  %571 = AIE.lock(%568, 1)
  %572 = AIE.lock(%568, 0)
  %573 = AIE.buffer(%568) : memref<32x32xf32>
  %574 = AIE.buffer(%568) : memref<32x32xf32>
  %575 = AIE.buffer(%568) : memref<32x32xf32>
  %576 = AIE.core(%568) {
    AIE.useLock(%570, Acquire, 0)
    AIE.useLock(%572, Acquire, 1)
    AIE.useLock(%571, Acquire, 1)
    AIE.useLock(%569, Acquire, 1)
    call @extern_kernel(%563, %573, %574, %575) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%569, Release, 0)
    AIE.useLock(%571, Release, 0)
    AIE.useLock(%572, Release, 0)
    AIE.useLock(%570, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %577 = AIE.mem(%568) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%569, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%574 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%569, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%572, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%575 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%572, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%570, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%573 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%570, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(0) {
    AIE.packet_source<%568, DMA : 0>
    AIE.packet_dest<%3, DMA : 1>
  }
  %578 = AIE.tile(23, 2)
  %579 = AIE.lock(%578, 1)
  %580 = AIE.lock(%578, 0)
  %581 = AIE.buffer(%578) : memref<32x32xf32>
  %582 = AIE.buffer(%578) : memref<32x32xf32>
  %583 = AIE.buffer(%578) : memref<32x32xf32>
  %584 = AIE.buffer(%578) : memref<32x32xf32>
  %585 = AIE.core(%578) {
    AIE.useLock(%589, Acquire, 0)
    AIE.useLock(%579, Acquire, 1)
    AIE.useLock(%580, Acquire, 1)
    call @extern_kernel(%584, %581, %582, %583) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%580, Release, 0)
    AIE.useLock(%579, Release, 0)
    AIE.useLock(%589, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %586 = AIE.mem(%578) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%580, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%583 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%580, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%579, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%582 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%579, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %587 = AIE.tile(23, 3)
  %588 = AIE.lock(%587, 2)
  %589 = AIE.lock(%587, 1)
  %590 = AIE.lock(%587, 0)
  %591 = AIE.buffer(%587) : memref<32x32xf32>
  %592 = AIE.buffer(%587) : memref<32x32xf32>
  %593 = AIE.buffer(%587) : memref<32x32xf32>
  %594 = AIE.core(%587) {
    AIE.useLock(%589, Acquire, 1)
    AIE.useLock(%590, Acquire, 1)
    AIE.useLock(%588, Acquire, 1)
    AIE.useLock(%597, Acquire, 0)
    call @extern_kernel(%581, %591, %592, %593) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%597, Release, 1)
    AIE.useLock(%588, Release, 0)
    AIE.useLock(%590, Release, 0)
    AIE.useLock(%589, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %595 = AIE.mem(%587) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%588, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%593 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%588, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%590, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%592 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%590, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %596 = AIE.tile(23, 4)
  %597 = AIE.lock(%596, 2)
  %598 = AIE.lock(%596, 1)
  %599 = AIE.lock(%596, 0)
  %600 = AIE.buffer(%596) : memref<32x32xf32>
  %601 = AIE.buffer(%596) : memref<32x32xf32>
  %602 = AIE.buffer(%596) : memref<32x32xf32>
  %603 = AIE.core(%596) {
    AIE.useLock(%599, Acquire, 1)
    AIE.useLock(%598, Acquire, 1)
    AIE.useLock(%608, Acquire, 0)
    AIE.useLock(%597, Acquire, 1)
    call @extern_kernel(%591, %600, %601, %602) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%597, Release, 0)
    AIE.useLock(%608, Release, 1)
    AIE.useLock(%598, Release, 0)
    AIE.useLock(%599, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %604 = AIE.mem(%596) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%598, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%602 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%598, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%599, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%601 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%599, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %605 = AIE.tile(23, 5) {polyaie.leaf}
  %606 = AIE.lock(%605, 3)
  %607 = AIE.lock(%605, 2)
  %608 = AIE.lock(%605, 1)
  %609 = AIE.lock(%605, 0)
  %610 = AIE.buffer(%605) : memref<32x32xf32>
  %611 = AIE.buffer(%605) : memref<32x32xf32>
  %612 = AIE.buffer(%605) : memref<32x32xf32>
  %613 = AIE.core(%605) {
    AIE.useLock(%606, Acquire, 0)
    AIE.useLock(%608, Acquire, 1)
    AIE.useLock(%609, Acquire, 1)
    AIE.useLock(%607, Acquire, 1)
    call @extern_kernel(%600, %610, %611, %612) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%607, Release, 0)
    AIE.useLock(%609, Release, 0)
    AIE.useLock(%608, Release, 0)
    AIE.useLock(%606, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %614 = AIE.mem(%605) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%607, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%611 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%607, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%609, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%612 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%609, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%606, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%610 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%606, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(1) {
    AIE.packet_source<%605, DMA : 0>
    AIE.packet_dest<%3, DMA : 1>
  }
  %615 = AIE.tile(24, 2)
  %616 = AIE.lock(%615, 1)
  %617 = AIE.lock(%615, 0)
  %618 = AIE.buffer(%615) : memref<32x32xf32>
  %619 = AIE.buffer(%615) : memref<32x32xf32>
  %620 = AIE.buffer(%615) : memref<32x32xf32>
  %621 = AIE.buffer(%615) : memref<32x32xf32>
  %622 = AIE.core(%615) {
    AIE.useLock(%617, Acquire, 1)
    AIE.useLock(%616, Acquire, 1)
    AIE.useLock(%627, Acquire, 0)
    call @extern_kernel(%621, %618, %619, %620) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%627, Release, 1)
    AIE.useLock(%616, Release, 0)
    AIE.useLock(%617, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %623 = AIE.mem(%615) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%616, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%619 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%616, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%617, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%620 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%617, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %624 = AIE.tile(24, 3)
  %625 = AIE.lock(%624, 2)
  %626 = AIE.lock(%624, 1)
  %627 = AIE.lock(%624, 0)
  %628 = AIE.buffer(%624) : memref<32x32xf32>
  %629 = AIE.buffer(%624) : memref<32x32xf32>
  %630 = AIE.buffer(%624) : memref<32x32xf32>
  %631 = AIE.core(%624) {
    AIE.useLock(%635, Acquire, 0)
    AIE.useLock(%625, Acquire, 1)
    AIE.useLock(%626, Acquire, 1)
    AIE.useLock(%627, Acquire, 1)
    call @extern_kernel(%618, %628, %629, %630) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%627, Release, 0)
    AIE.useLock(%626, Release, 0)
    AIE.useLock(%625, Release, 0)
    AIE.useLock(%635, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %632 = AIE.mem(%624) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%626, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%629 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%626, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%625, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%630 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%625, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %633 = AIE.tile(24, 4)
  %634 = AIE.lock(%633, 2)
  %635 = AIE.lock(%633, 1)
  %636 = AIE.lock(%633, 0)
  %637 = AIE.buffer(%633) : memref<32x32xf32>
  %638 = AIE.buffer(%633) : memref<32x32xf32>
  %639 = AIE.buffer(%633) : memref<32x32xf32>
  %640 = AIE.core(%633) {
    AIE.useLock(%636, Acquire, 1)
    AIE.useLock(%646, Acquire, 0)
    AIE.useLock(%635, Acquire, 1)
    AIE.useLock(%634, Acquire, 1)
    call @extern_kernel(%628, %637, %638, %639) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%634, Release, 0)
    AIE.useLock(%635, Release, 0)
    AIE.useLock(%646, Release, 1)
    AIE.useLock(%636, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %641 = AIE.mem(%633) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%634, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%639 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%634, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%636, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%638 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%636, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %642 = AIE.tile(24, 5) {polyaie.leaf}
  %643 = AIE.lock(%642, 3)
  %644 = AIE.lock(%642, 2)
  %645 = AIE.lock(%642, 1)
  %646 = AIE.lock(%642, 0)
  %647 = AIE.buffer(%642) : memref<32x32xf32>
  %648 = AIE.buffer(%642) : memref<32x32xf32>
  %649 = AIE.buffer(%642) : memref<32x32xf32>
  %650 = AIE.core(%642) {
    AIE.useLock(%646, Acquire, 1)
    AIE.useLock(%645, Acquire, 0)
    AIE.useLock(%643, Acquire, 1)
    AIE.useLock(%644, Acquire, 1)
    call @extern_kernel(%637, %647, %648, %649) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%644, Release, 0)
    AIE.useLock(%643, Release, 0)
    AIE.useLock(%645, Release, 1)
    AIE.useLock(%646, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %651 = AIE.mem(%642) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%644, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%648 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%644, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%643, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%649 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%643, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%645, Acquire, 1)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%647 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%645, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(2) {
    AIE.packet_source<%642, DMA : 0>
    AIE.packet_dest<%3, DMA : 1>
  }
  %652 = AIE.tile(25, 2)
  %653 = AIE.lock(%652, 1)
  %654 = AIE.lock(%652, 0)
  %655 = AIE.buffer(%652) : memref<32x32xf32>
  %656 = AIE.buffer(%652) : memref<32x32xf32>
  %657 = AIE.buffer(%652) : memref<32x32xf32>
  %658 = AIE.buffer(%652) : memref<32x32xf32>
  %659 = AIE.core(%652) {
    AIE.useLock(%653, Acquire, 1)
    AIE.useLock(%663, Acquire, 0)
    AIE.useLock(%654, Acquire, 1)
    call @extern_kernel(%658, %655, %656, %657) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%654, Release, 0)
    AIE.useLock(%663, Release, 1)
    AIE.useLock(%653, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %660 = AIE.mem(%652) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%654, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%657 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%654, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%653, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%656 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%653, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %661 = AIE.tile(25, 3)
  %662 = AIE.lock(%661, 2)
  %663 = AIE.lock(%661, 1)
  %664 = AIE.lock(%661, 0)
  %665 = AIE.buffer(%661) : memref<32x32xf32>
  %666 = AIE.buffer(%661) : memref<32x32xf32>
  %667 = AIE.buffer(%661) : memref<32x32xf32>
  %668 = AIE.core(%661) {
    AIE.useLock(%672, Acquire, 0)
    AIE.useLock(%663, Acquire, 1)
    AIE.useLock(%662, Acquire, 1)
    AIE.useLock(%664, Acquire, 1)
    call @extern_kernel(%655, %665, %666, %667) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%664, Release, 0)
    AIE.useLock(%662, Release, 0)
    AIE.useLock(%663, Release, 0)
    AIE.useLock(%672, Release, 1)
    AIE.end
  } {link_with = "kernel.o"}
  %669 = AIE.mem(%661) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%664, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%666 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%664, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%662, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%667 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%662, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %670 = AIE.tile(25, 4)
  %671 = AIE.lock(%670, 2)
  %672 = AIE.lock(%670, 1)
  %673 = AIE.lock(%670, 0)
  %674 = AIE.buffer(%670) : memref<32x32xf32>
  %675 = AIE.buffer(%670) : memref<32x32xf32>
  %676 = AIE.buffer(%670) : memref<32x32xf32>
  %677 = AIE.core(%670) {
    AIE.useLock(%673, Acquire, 1)
    AIE.useLock(%671, Acquire, 1)
    AIE.useLock(%672, Acquire, 1)
    AIE.useLock(%682, Acquire, 0)
    call @extern_kernel(%665, %674, %675, %676) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%682, Release, 1)
    AIE.useLock(%672, Release, 0)
    AIE.useLock(%671, Release, 0)
    AIE.useLock(%673, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %678 = AIE.mem(%670) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%671, Acquire, 0)
    AIE.dmaBdPacket(0, 6)
    AIE.dmaBd(<%676 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%671, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%673, Acquire, 0)
    AIE.dmaBdPacket(0, 2)
    AIE.dmaBd(<%675 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%673, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %679 = AIE.tile(25, 5) {polyaie.leaf}
  %680 = AIE.lock(%679, 3)
  %681 = AIE.lock(%679, 2)
  %682 = AIE.lock(%679, 1)
  %683 = AIE.lock(%679, 0)
  %684 = AIE.buffer(%679) : memref<32x32xf32>
  %685 = AIE.buffer(%679) : memref<32x32xf32>
  %686 = AIE.buffer(%679) : memref<32x32xf32>
  %687 = AIE.core(%679) {
    AIE.useLock(%683, Acquire, 1)
    AIE.useLock(%680, Acquire, 0)
    AIE.useLock(%681, Acquire, 1)
    AIE.useLock(%682, Acquire, 1)
    call @extern_kernel(%674, %684, %685, %686) : (memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>, memref<32x32xf32>) -> ()
    AIE.useLock(%682, Release, 0)
    AIE.useLock(%681, Release, 0)
    AIE.useLock(%680, Release, 1)
    AIE.useLock(%683, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %688 = AIE.mem(%679) {
    %689 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%681, Acquire, 0)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%685 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%681, Release, 1)
    br ^bb1
  ^bb2:  // pred: ^bb0
    %690 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%683, Acquire, 0)
    AIE.dmaBdPacket(0, 7)
    AIE.dmaBd(<%686 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%683, Release, 1)
    br ^bb3
  ^bb4:  // pred: ^bb2
    %691 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%680, Acquire, 1)
    AIE.dmaBdPacket(0, 3)
    AIE.dmaBd(<%684 : memref<32x32xf32>, 0, 1024>, 0)
    AIE.useLock(%680, Release, 0)
    br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  AIE.packet_flow(3) {
    AIE.packet_source<%679, DMA : 0>
    AIE.packet_dest<%3, DMA : 1>
  }
}


module @gemm {
  func private @extern_kernel(memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>)
  %0 = AIE.tile(26, 0)
  %1 = AIE.shimmux(%0) {
    AIE.connect<North : 2, DMA : 0>
    AIE.connect<DMA : 1, North : 7>
    AIE.connect<DMA : 0, North : 3>
  }
  %2 = AIE.switchbox(%0) {
    %280 = AIE.amsel<0> (0)
    %281 = AIE.amsel<0> (1)
    %282 = AIE.masterset(South : 2, %281)
    %283 = AIE.masterset(North : 0, %280)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %281)
    }
    AIE.packetrules(South : 7) {
      AIE.rule(30, 4, %280)
    }
    AIE.packetrules(South : 3) {
      AIE.rule(30, 0, %280)
    }
  }
  %3 = AIE.lock(%0, 3)
  %4 = AIE.lock(%0, 2)
  %5 = AIE.lock(%0, 1)
  %6 = AIE.lock(%0, 0)
  %7 = AIE.external_buffer 16384 {sym_name = "buf0"} : memref<32x32xi32>
  %8 = AIE.external_buffer 20480 {sym_name = "buf1"} : memref<32x32xi32>
  %9 = AIE.external_buffer 24576 {sym_name = "buf2"} : memref<32x32xi32>
  %10 = AIE.external_buffer 28672 {sym_name = "buf3"} : memref<32x32xi32>
  %11 = AIE.external_buffer 32768 {sym_name = "buf4"} : memref<1025xi32>
  %12 = AIE.shimDMA(%0) {
    %280 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%11 : memref<1025xi32>, 0, 1025>, 0)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %281 = AIE.dmaStart(MM2S0, ^bb3, ^bb5)
  ^bb3:  // 2 preds: ^bb2, ^bb4
    AIE.useLock(%3, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%9 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%3, Release, 0)
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    AIE.useLock(%5, Acquire, 1)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%7 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%5, Release, 0)
    cf.br ^bb3
  ^bb5:  // pred: ^bb2
    %282 = AIE.dmaStart(MM2S1, ^bb6, ^bb8)
  ^bb6:  // 2 preds: ^bb5, ^bb7
    AIE.useLock(%4, Acquire, 1)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%10 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%4, Release, 0)
    cf.br ^bb7
  ^bb7:  // pred: ^bb6
    AIE.useLock(%6, Acquire, 1)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%8 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%6, Release, 0)
    cf.br ^bb6
  ^bb8:  // pred: ^bb5
    AIE.end
  }
  %13 = AIE.tile(26, 2)
  %14 = AIE.switchbox(%13) {
    %280 = AIE.amsel<0> (0)
    %281 = AIE.amsel<0> (1)
    %282 = AIE.amsel<0> (2)
    %283 = AIE.amsel<0> (3)
    %284 = AIE.masterset(DMA : 0, %282)
    %285 = AIE.masterset(DMA : 1, %283)
    %286 = AIE.masterset(South : 0, %281)
    %287 = AIE.masterset(North : 0, %280)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %281)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 4, %282)
      AIE.rule(27, 1, %280)
      AIE.rule(31, 0, %283)
    }
  }
  %15 = AIE.lock(%13, 1)
  %16 = AIE.lock(%13, 0)
  %17 = AIE.buffer(%13) {address = 4096 : i32, sym_name = "buf5"} : memref<32x32xi32>
  %18 = AIE.buffer(%13) {address = 8192 : i32, sym_name = "buf6"} : memref<32x32xi32>
  %19 = AIE.buffer(%13) {address = 12288 : i32, sym_name = "buf7"} : memref<32x32xi32>
  %20 = AIE.buffer(%13) {address = 16384 : i32, sym_name = "buf8"} : memref<32x32xi32>
  %21 = AIE.core(%13) {
    AIE.useLock(%15, Acquire, 1)
    AIE.useLock(%16, Acquire, 1)
    AIE.useLock(%27, Acquire, 0)
    call @extern_kernel(%20, %17, %18, %19) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%27, Release, 1)
    AIE.useLock(%16, Release, 0)
    AIE.useLock(%15, Release, 0)
    AIE.end
  } {link_with = "kernel.o"}
  %22 = AIE.mem(%13) {
    %280 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%16, Acquire, 0)
    AIE.dmaBdPacket(0, 4)
    AIE.dmaBd(<%19 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%16, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %281 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%15, Acquire, 0)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%18 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%15, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    AIE.end
  }
  %23 = AIE.tile(26, 3) {polyaie.leaf}
  %24 = AIE.lock(%23, 15)
  %25 = AIE.switchbox(%23) {
    %280 = AIE.amsel<0> (0)
    %281 = AIE.amsel<0> (1)
    %282 = AIE.amsel<0> (2)
    %283 = AIE.masterset(DMA : 0, %282)
    %284 = AIE.masterset(DMA : 1, %280)
    %285 = AIE.masterset(South : 0, %281)
    AIE.packetrules(DMA : 0) {
      AIE.rule(31, 0, %281)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(31, 5, %282)
      AIE.rule(31, 1, %280)
    }
  }
  %26 = AIE.lock(%23, 3)
  %27 = AIE.lock(%23, 2)
  %28 = AIE.lock(%23, 1)
  %29 = AIE.lock(%23, 0)
  %30 = AIE.buffer(%23) {address = 4096 : i32, sym_name = "buf9"} : memref<32x32xi32>
  %31 = AIE.buffer(%23) {address = 8192 : i32, sym_name = "buf10"} : memref<32x32xi32>
  %32 = AIE.buffer(%23) {address = 12288 : i32, sym_name = "buf11"} : memref<32x32xi32>
  %33 = AIE.core(%23) {
    AIE.useLock(%28, Acquire, 1)
    AIE.useLock(%26, Acquire, 0)
    AIE.useLock(%29, Acquire, 1)
    AIE.useLock(%27, Acquire, 1)
    call @extern_kernel(%17, %30, %31, %32) : (memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>, memref<32x32xi32>) -> ()
    AIE.useLock(%27, Release, 0)
    AIE.useLock(%29, Release, 0)
    AIE.useLock(%26, Release, 1)
    AIE.useLock(%28, Release, 0)
    AIE.useLock(%24, Release, 1) {polyaie.runtime}
    AIE.end
  } {link_with = "kernel.o"}
  %34 = AIE.mem(%23) {
    %280 = AIE.dmaStart(S2MM0, ^bb1, ^bb2)
  ^bb1:  // 2 preds: ^bb0, ^bb1
    AIE.useLock(%29, Acquire, 0)
    AIE.dmaBdPacket(0, 5)
    AIE.dmaBd(<%32 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%29, Release, 1)
    cf.br ^bb1
  ^bb2:  // pred: ^bb0
    %281 = AIE.dmaStart(S2MM1, ^bb3, ^bb4)
  ^bb3:  // 2 preds: ^bb2, ^bb3
    AIE.useLock(%28, Acquire, 0)
    AIE.dmaBdPacket(0, 1)
    AIE.dmaBd(<%31 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%28, Release, 1)
    cf.br ^bb3
  ^bb4:  // pred: ^bb2
    %282 = AIE.dmaStart(MM2S0, ^bb5, ^bb6)
  ^bb5:  // 2 preds: ^bb4, ^bb5
    AIE.useLock(%26, Acquire, 1)
    AIE.dmaBdPacket(0, 0)
    AIE.dmaBd(<%30 : memref<32x32xi32>, 0, 1024>, 0)
    AIE.useLock(%26, Release, 0)
    cf.br ^bb5
  ^bb6:  // pred: ^bb4
    AIE.end
  }
  %35 = AIE.tile(26, 1)
  %36 = AIE.switchbox(%35) {
    %280 = AIE.amsel<0> (0)
    %281 = AIE.amsel<0> (1)
    %282 = AIE.masterset(South : 0, %280)
    %283 = AIE.masterset(North : 0, %281)
    AIE.packetrules(North : 0) {
      AIE.rule(31, 0, %280)
    }
    AIE.packetrules(South : 0) {
      AIE.rule(26, 0, %281)
    }
  }
  %37 = AIE.tile(0, 0)
  %38 = AIE.tile(0, 1)
  %39 = AIE.tile(0, 2)
  %40 = AIE.tile(0, 3)
  %41 = AIE.tile(1, 0)
  %42 = AIE.tile(1, 1)
  %43 = AIE.tile(1, 2)
  %44 = AIE.tile(1, 3)
  %45 = AIE.tile(2, 0)
  %46 = AIE.tile(2, 1)
  %47 = AIE.tile(2, 2)
  %48 = AIE.tile(2, 3)
  %49 = AIE.tile(3, 0)
  %50 = AIE.tile(3, 1)
  %51 = AIE.tile(3, 2)
  %52 = AIE.tile(3, 3)
  %53 = AIE.tile(4, 0)
  %54 = AIE.tile(4, 1)
  %55 = AIE.tile(4, 2)
  %56 = AIE.tile(4, 3)
  %57 = AIE.tile(5, 0)
  %58 = AIE.tile(5, 1)
  %59 = AIE.tile(5, 2)
  %60 = AIE.tile(5, 3)
  %61 = AIE.tile(6, 0)
  %62 = AIE.tile(6, 1)
  %63 = AIE.tile(6, 2)
  %64 = AIE.tile(6, 3)
  %65 = AIE.tile(7, 0)
  %66 = AIE.tile(7, 1)
  %67 = AIE.tile(7, 2)
  %68 = AIE.tile(7, 3)
  %69 = AIE.tile(8, 0)
  %70 = AIE.tile(8, 1)
  %71 = AIE.tile(8, 2)
  %72 = AIE.tile(8, 3)
  %73 = AIE.tile(9, 0)
  %74 = AIE.tile(9, 1)
  %75 = AIE.tile(9, 2)
  %76 = AIE.tile(9, 3)
  %77 = AIE.tile(10, 0)
  %78 = AIE.tile(10, 1)
  %79 = AIE.tile(10, 2)
  %80 = AIE.tile(10, 3)
  %81 = AIE.tile(11, 0)
  %82 = AIE.tile(11, 1)
  %83 = AIE.tile(11, 2)
  %84 = AIE.tile(11, 3)
  %85 = AIE.tile(12, 0)
  %86 = AIE.tile(12, 1)
  %87 = AIE.tile(12, 2)
  %88 = AIE.tile(12, 3)
  %89 = AIE.tile(13, 0)
  %90 = AIE.tile(13, 1)
  %91 = AIE.tile(13, 2)
  %92 = AIE.tile(13, 3)
  %93 = AIE.tile(14, 0)
  %94 = AIE.tile(14, 1)
  %95 = AIE.tile(14, 2)
  %96 = AIE.tile(14, 3)
  %97 = AIE.tile(15, 0)
  %98 = AIE.tile(15, 1)
  %99 = AIE.tile(15, 2)
  %100 = AIE.tile(15, 3)
  %101 = AIE.tile(16, 0)
  %102 = AIE.tile(16, 1)
  %103 = AIE.tile(16, 2)
  %104 = AIE.tile(16, 3)
  %105 = AIE.tile(17, 0)
  %106 = AIE.tile(17, 1)
  %107 = AIE.tile(17, 2)
  %108 = AIE.tile(17, 3)
  %109 = AIE.tile(18, 0)
  %110 = AIE.tile(18, 1)
  %111 = AIE.tile(18, 2)
  %112 = AIE.tile(18, 3)
  %113 = AIE.tile(19, 0)
  %114 = AIE.tile(19, 1)
  %115 = AIE.tile(19, 2)
  %116 = AIE.tile(19, 3)
  %117 = AIE.tile(20, 0)
  %118 = AIE.tile(20, 1)
  %119 = AIE.tile(20, 2)
  %120 = AIE.tile(20, 3)
  %121 = AIE.tile(21, 0)
  %122 = AIE.tile(21, 1)
  %123 = AIE.tile(21, 2)
  %124 = AIE.tile(21, 3)
  %125 = AIE.tile(22, 0)
  %126 = AIE.tile(22, 1)
  %127 = AIE.tile(22, 2)
  %128 = AIE.tile(22, 3)
  %129 = AIE.tile(23, 0)
  %130 = AIE.tile(23, 1)
  %131 = AIE.tile(23, 2)
  %132 = AIE.tile(23, 3)
  %133 = AIE.tile(24, 0)
  %134 = AIE.tile(24, 1)
  %135 = AIE.tile(24, 2)
  %136 = AIE.tile(24, 3)
  %137 = AIE.tile(25, 0)
  %138 = AIE.tile(25, 1)
  %139 = AIE.tile(25, 2)
  %140 = AIE.tile(25, 3)
  %141 = AIE.switchbox(%37) {
  }
  %142 = AIE.switchbox(%38) {
  }
  %143 = AIE.switchbox(%39) {
  }
  %144 = AIE.switchbox(%40) {
  }
  %145 = AIE.switchbox(%41) {
  }
  %146 = AIE.switchbox(%42) {
  }
  %147 = AIE.switchbox(%43) {
  }
  %148 = AIE.switchbox(%44) {
  }
  %149 = AIE.switchbox(%45) {
  }
  %150 = AIE.switchbox(%46) {
  }
  %151 = AIE.switchbox(%47) {
  }
  %152 = AIE.switchbox(%48) {
  }
  %153 = AIE.switchbox(%49) {
  }
  %154 = AIE.switchbox(%50) {
  }
  %155 = AIE.switchbox(%51) {
  }
  %156 = AIE.switchbox(%52) {
  }
  %157 = AIE.switchbox(%53) {
  }
  %158 = AIE.switchbox(%54) {
  }
  %159 = AIE.switchbox(%55) {
  }
  %160 = AIE.switchbox(%56) {
  }
  %161 = AIE.switchbox(%57) {
  }
  %162 = AIE.switchbox(%58) {
  }
  %163 = AIE.switchbox(%59) {
  }
  %164 = AIE.switchbox(%60) {
  }
  %165 = AIE.switchbox(%61) {
  }
  %166 = AIE.switchbox(%62) {
  }
  %167 = AIE.switchbox(%63) {
  }
  %168 = AIE.switchbox(%64) {
  }
  %169 = AIE.switchbox(%65) {
  }
  %170 = AIE.switchbox(%66) {
  }
  %171 = AIE.switchbox(%67) {
  }
  %172 = AIE.switchbox(%68) {
  }
  %173 = AIE.switchbox(%69) {
  }
  %174 = AIE.switchbox(%70) {
  }
  %175 = AIE.switchbox(%71) {
  }
  %176 = AIE.switchbox(%72) {
  }
  %177 = AIE.switchbox(%73) {
  }
  %178 = AIE.switchbox(%74) {
  }
  %179 = AIE.switchbox(%75) {
  }
  %180 = AIE.switchbox(%76) {
  }
  %181 = AIE.switchbox(%77) {
  }
  %182 = AIE.switchbox(%78) {
  }
  %183 = AIE.switchbox(%79) {
  }
  %184 = AIE.switchbox(%80) {
  }
  %185 = AIE.switchbox(%81) {
  }
  %186 = AIE.switchbox(%82) {
  }
  %187 = AIE.switchbox(%83) {
  }
  %188 = AIE.switchbox(%84) {
  }
  %189 = AIE.switchbox(%85) {
  }
  %190 = AIE.switchbox(%86) {
  }
  %191 = AIE.switchbox(%87) {
  }
  %192 = AIE.switchbox(%88) {
  }
  %193 = AIE.switchbox(%89) {
  }
  %194 = AIE.switchbox(%90) {
  }
  %195 = AIE.switchbox(%91) {
  }
  %196 = AIE.switchbox(%92) {
  }
  %197 = AIE.switchbox(%93) {
  }
  %198 = AIE.switchbox(%94) {
  }
  %199 = AIE.switchbox(%95) {
  }
  %200 = AIE.switchbox(%96) {
  }
  %201 = AIE.switchbox(%97) {
  }
  %202 = AIE.switchbox(%98) {
  }
  %203 = AIE.switchbox(%99) {
  }
  %204 = AIE.switchbox(%100) {
  }
  %205 = AIE.switchbox(%101) {
  }
  %206 = AIE.switchbox(%102) {
  }
  %207 = AIE.switchbox(%103) {
  }
  %208 = AIE.switchbox(%104) {
  }
  %209 = AIE.switchbox(%105) {
  }
  %210 = AIE.switchbox(%106) {
  }
  %211 = AIE.switchbox(%107) {
  }
  %212 = AIE.switchbox(%108) {
  }
  %213 = AIE.switchbox(%109) {
  }
  %214 = AIE.switchbox(%110) {
  }
  %215 = AIE.switchbox(%111) {
  }
  %216 = AIE.switchbox(%112) {
  }
  %217 = AIE.switchbox(%113) {
  }
  %218 = AIE.switchbox(%114) {
  }
  %219 = AIE.switchbox(%115) {
  }
  %220 = AIE.switchbox(%116) {
  }
  %221 = AIE.switchbox(%117) {
  }
  %222 = AIE.switchbox(%118) {
  }
  %223 = AIE.switchbox(%119) {
  }
  %224 = AIE.switchbox(%120) {
  }
  %225 = AIE.switchbox(%121) {
  }
  %226 = AIE.switchbox(%122) {
  }
  %227 = AIE.switchbox(%123) {
  }
  %228 = AIE.switchbox(%124) {
  }
  %229 = AIE.switchbox(%125) {
  }
  %230 = AIE.switchbox(%126) {
  }
  %231 = AIE.switchbox(%127) {
  }
  %232 = AIE.switchbox(%128) {
  }
  %233 = AIE.switchbox(%129) {
  }
  %234 = AIE.switchbox(%130) {
  }
  %235 = AIE.switchbox(%131) {
  }
  %236 = AIE.switchbox(%132) {
  }
  %237 = AIE.switchbox(%133) {
  }
  %238 = AIE.switchbox(%134) {
  }
  %239 = AIE.switchbox(%135) {
  }
  %240 = AIE.switchbox(%136) {
  }
  %241 = AIE.switchbox(%137) {
  }
  %242 = AIE.switchbox(%138) {
  }
  %243 = AIE.switchbox(%139) {
  }
  %244 = AIE.switchbox(%140) {
  }
  %245 = AIE.plio(0)
  %246 = AIE.plio(1)
  %247 = AIE.plio(2)
  %248 = AIE.plio(3)
  %249 = AIE.plio(4)
  %250 = AIE.plio(5)
  %251 = AIE.plio(6)
  %252 = AIE.plio(7)
  %253 = AIE.plio(8)
  %254 = AIE.plio(9)
  %255 = AIE.plio(10)
  %256 = AIE.plio(11)
  %257 = AIE.plio(12)
  %258 = AIE.plio(13)
  %259 = AIE.plio(14)
  %260 = AIE.plio(15)
  %261 = AIE.plio(16)
  %262 = AIE.plio(17)
  %263 = AIE.plio(18)
  %264 = AIE.plio(19)
  %265 = AIE.plio(20)
  %266 = AIE.plio(21)
  %267 = AIE.plio(22)
  %268 = AIE.plio(23)
  %269 = AIE.plio(24)
  %270 = AIE.plio(25)
  %271 = AIE.plio(26)
  AIE.wire(%38 : Core, %142 : Core)
  AIE.wire(%38 : DMA, %142 : DMA)
  AIE.wire(%141 : North, %142 : South)
  AIE.wire(%39 : Core, %143 : Core)
  AIE.wire(%39 : DMA, %143 : DMA)
  AIE.wire(%142 : North, %143 : South)
  AIE.wire(%40 : Core, %144 : Core)
  AIE.wire(%40 : DMA, %144 : DMA)
  AIE.wire(%143 : North, %144 : South)
  AIE.wire(%141 : East, %145 : West)
  AIE.wire(%246 : North, %145 : South)
  AIE.wire(%142 : East, %146 : West)
  AIE.wire(%42 : Core, %146 : Core)
  AIE.wire(%42 : DMA, %146 : DMA)
  AIE.wire(%145 : North, %146 : South)
  AIE.wire(%143 : East, %147 : West)
  AIE.wire(%43 : Core, %147 : Core)
  AIE.wire(%43 : DMA, %147 : DMA)
  AIE.wire(%146 : North, %147 : South)
  AIE.wire(%144 : East, %148 : West)
  AIE.wire(%44 : Core, %148 : Core)
  AIE.wire(%44 : DMA, %148 : DMA)
  AIE.wire(%147 : North, %148 : South)
  AIE.wire(%145 : East, %149 : West)
  %272 = AIE.shimmux(%45) {
  }
  AIE.wire(%272 : North, %149 : South)
  AIE.wire(%247 : North, %272 : South)
  AIE.wire(%45 : DMA, %272 : DMA)
  AIE.wire(%146 : East, %150 : West)
  AIE.wire(%46 : Core, %150 : Core)
  AIE.wire(%46 : DMA, %150 : DMA)
  AIE.wire(%149 : North, %150 : South)
  AIE.wire(%147 : East, %151 : West)
  AIE.wire(%47 : Core, %151 : Core)
  AIE.wire(%47 : DMA, %151 : DMA)
  AIE.wire(%150 : North, %151 : South)
  AIE.wire(%148 : East, %152 : West)
  AIE.wire(%48 : Core, %152 : Core)
  AIE.wire(%48 : DMA, %152 : DMA)
  AIE.wire(%151 : North, %152 : South)
  AIE.wire(%149 : East, %153 : West)
  %273 = AIE.shimmux(%49) {
  }
  AIE.wire(%273 : North, %153 : South)
  AIE.wire(%248 : North, %273 : South)
  AIE.wire(%49 : DMA, %273 : DMA)
  AIE.wire(%150 : East, %154 : West)
  AIE.wire(%50 : Core, %154 : Core)
  AIE.wire(%50 : DMA, %154 : DMA)
  AIE.wire(%153 : North, %154 : South)
  AIE.wire(%151 : East, %155 : West)
  AIE.wire(%51 : Core, %155 : Core)
  AIE.wire(%51 : DMA, %155 : DMA)
  AIE.wire(%154 : North, %155 : South)
  AIE.wire(%152 : East, %156 : West)
  AIE.wire(%52 : Core, %156 : Core)
  AIE.wire(%52 : DMA, %156 : DMA)
  AIE.wire(%155 : North, %156 : South)
  AIE.wire(%153 : East, %157 : West)
  AIE.wire(%249 : North, %157 : South)
  AIE.wire(%154 : East, %158 : West)
  AIE.wire(%54 : Core, %158 : Core)
  AIE.wire(%54 : DMA, %158 : DMA)
  AIE.wire(%157 : North, %158 : South)
  AIE.wire(%155 : East, %159 : West)
  AIE.wire(%55 : Core, %159 : Core)
  AIE.wire(%55 : DMA, %159 : DMA)
  AIE.wire(%158 : North, %159 : South)
  AIE.wire(%156 : East, %160 : West)
  AIE.wire(%56 : Core, %160 : Core)
  AIE.wire(%56 : DMA, %160 : DMA)
  AIE.wire(%159 : North, %160 : South)
  AIE.wire(%157 : East, %161 : West)
  AIE.wire(%250 : North, %161 : South)
  AIE.wire(%158 : East, %162 : West)
  AIE.wire(%58 : Core, %162 : Core)
  AIE.wire(%58 : DMA, %162 : DMA)
  AIE.wire(%161 : North, %162 : South)
  AIE.wire(%159 : East, %163 : West)
  AIE.wire(%59 : Core, %163 : Core)
  AIE.wire(%59 : DMA, %163 : DMA)
  AIE.wire(%162 : North, %163 : South)
  AIE.wire(%160 : East, %164 : West)
  AIE.wire(%60 : Core, %164 : Core)
  AIE.wire(%60 : DMA, %164 : DMA)
  AIE.wire(%163 : North, %164 : South)
  AIE.wire(%161 : East, %165 : West)
  %274 = AIE.shimmux(%61) {
  }
  AIE.wire(%274 : North, %165 : South)
  AIE.wire(%251 : North, %274 : South)
  AIE.wire(%61 : DMA, %274 : DMA)
  AIE.wire(%162 : East, %166 : West)
  AIE.wire(%62 : Core, %166 : Core)
  AIE.wire(%62 : DMA, %166 : DMA)
  AIE.wire(%165 : North, %166 : South)
  AIE.wire(%163 : East, %167 : West)
  AIE.wire(%63 : Core, %167 : Core)
  AIE.wire(%63 : DMA, %167 : DMA)
  AIE.wire(%166 : North, %167 : South)
  AIE.wire(%164 : East, %168 : West)
  AIE.wire(%64 : Core, %168 : Core)
  AIE.wire(%64 : DMA, %168 : DMA)
  AIE.wire(%167 : North, %168 : South)
  AIE.wire(%165 : East, %169 : West)
  %275 = AIE.shimmux(%65) {
  }
  AIE.wire(%275 : North, %169 : South)
  AIE.wire(%252 : North, %275 : South)
  AIE.wire(%65 : DMA, %275 : DMA)
  AIE.wire(%166 : East, %170 : West)
  AIE.wire(%66 : Core, %170 : Core)
  AIE.wire(%66 : DMA, %170 : DMA)
  AIE.wire(%169 : North, %170 : South)
  AIE.wire(%167 : East, %171 : West)
  AIE.wire(%67 : Core, %171 : Core)
  AIE.wire(%67 : DMA, %171 : DMA)
  AIE.wire(%170 : North, %171 : South)
  AIE.wire(%168 : East, %172 : West)
  AIE.wire(%68 : Core, %172 : Core)
  AIE.wire(%68 : DMA, %172 : DMA)
  AIE.wire(%171 : North, %172 : South)
  AIE.wire(%169 : East, %173 : West)
  AIE.wire(%253 : North, %173 : South)
  AIE.wire(%170 : East, %174 : West)
  AIE.wire(%70 : Core, %174 : Core)
  AIE.wire(%70 : DMA, %174 : DMA)
  AIE.wire(%173 : North, %174 : South)
  AIE.wire(%171 : East, %175 : West)
  AIE.wire(%71 : Core, %175 : Core)
  AIE.wire(%71 : DMA, %175 : DMA)
  AIE.wire(%174 : North, %175 : South)
  AIE.wire(%172 : East, %176 : West)
  AIE.wire(%72 : Core, %176 : Core)
  AIE.wire(%72 : DMA, %176 : DMA)
  AIE.wire(%175 : North, %176 : South)
  AIE.wire(%173 : East, %177 : West)
  AIE.wire(%254 : North, %177 : South)
  AIE.wire(%174 : East, %178 : West)
  AIE.wire(%74 : Core, %178 : Core)
  AIE.wire(%74 : DMA, %178 : DMA)
  AIE.wire(%177 : North, %178 : South)
  AIE.wire(%175 : East, %179 : West)
  AIE.wire(%75 : Core, %179 : Core)
  AIE.wire(%75 : DMA, %179 : DMA)
  AIE.wire(%178 : North, %179 : South)
  AIE.wire(%176 : East, %180 : West)
  AIE.wire(%76 : Core, %180 : Core)
  AIE.wire(%76 : DMA, %180 : DMA)
  AIE.wire(%179 : North, %180 : South)
  AIE.wire(%177 : East, %181 : West)
  %276 = AIE.shimmux(%77) {
  }
  AIE.wire(%276 : North, %181 : South)
  AIE.wire(%255 : North, %276 : South)
  AIE.wire(%77 : DMA, %276 : DMA)
  AIE.wire(%178 : East, %182 : West)
  AIE.wire(%78 : Core, %182 : Core)
  AIE.wire(%78 : DMA, %182 : DMA)
  AIE.wire(%181 : North, %182 : South)
  AIE.wire(%179 : East, %183 : West)
  AIE.wire(%79 : Core, %183 : Core)
  AIE.wire(%79 : DMA, %183 : DMA)
  AIE.wire(%182 : North, %183 : South)
  AIE.wire(%180 : East, %184 : West)
  AIE.wire(%80 : Core, %184 : Core)
  AIE.wire(%80 : DMA, %184 : DMA)
  AIE.wire(%183 : North, %184 : South)
  AIE.wire(%181 : East, %185 : West)
  %277 = AIE.shimmux(%81) {
  }
  AIE.wire(%277 : North, %185 : South)
  AIE.wire(%256 : North, %277 : South)
  AIE.wire(%81 : DMA, %277 : DMA)
  AIE.wire(%182 : East, %186 : West)
  AIE.wire(%82 : Core, %186 : Core)
  AIE.wire(%82 : DMA, %186 : DMA)
  AIE.wire(%185 : North, %186 : South)
  AIE.wire(%183 : East, %187 : West)
  AIE.wire(%83 : Core, %187 : Core)
  AIE.wire(%83 : DMA, %187 : DMA)
  AIE.wire(%186 : North, %187 : South)
  AIE.wire(%184 : East, %188 : West)
  AIE.wire(%84 : Core, %188 : Core)
  AIE.wire(%84 : DMA, %188 : DMA)
  AIE.wire(%187 : North, %188 : South)
  AIE.wire(%185 : East, %189 : West)
  AIE.wire(%257 : North, %189 : South)
  AIE.wire(%186 : East, %190 : West)
  AIE.wire(%86 : Core, %190 : Core)
  AIE.wire(%86 : DMA, %190 : DMA)
  AIE.wire(%189 : North, %190 : South)
  AIE.wire(%187 : East, %191 : West)
  AIE.wire(%87 : Core, %191 : Core)
  AIE.wire(%87 : DMA, %191 : DMA)
  AIE.wire(%190 : North, %191 : South)
  AIE.wire(%188 : East, %192 : West)
  AIE.wire(%88 : Core, %192 : Core)
  AIE.wire(%88 : DMA, %192 : DMA)
  AIE.wire(%191 : North, %192 : South)
  AIE.wire(%189 : East, %193 : West)
  AIE.wire(%258 : North, %193 : South)
  AIE.wire(%190 : East, %194 : West)
  AIE.wire(%90 : Core, %194 : Core)
  AIE.wire(%90 : DMA, %194 : DMA)
  AIE.wire(%193 : North, %194 : South)
  AIE.wire(%191 : East, %195 : West)
  AIE.wire(%91 : Core, %195 : Core)
  AIE.wire(%91 : DMA, %195 : DMA)
  AIE.wire(%194 : North, %195 : South)
  AIE.wire(%192 : East, %196 : West)
  AIE.wire(%92 : Core, %196 : Core)
  AIE.wire(%92 : DMA, %196 : DMA)
  AIE.wire(%195 : North, %196 : South)
  AIE.wire(%193 : East, %197 : West)
  AIE.wire(%259 : North, %197 : South)
  AIE.wire(%194 : East, %198 : West)
  AIE.wire(%94 : Core, %198 : Core)
  AIE.wire(%94 : DMA, %198 : DMA)
  AIE.wire(%197 : North, %198 : South)
  AIE.wire(%195 : East, %199 : West)
  AIE.wire(%95 : Core, %199 : Core)
  AIE.wire(%95 : DMA, %199 : DMA)
  AIE.wire(%198 : North, %199 : South)
  AIE.wire(%196 : East, %200 : West)
  AIE.wire(%96 : Core, %200 : Core)
  AIE.wire(%96 : DMA, %200 : DMA)
  AIE.wire(%199 : North, %200 : South)
  AIE.wire(%197 : East, %201 : West)
  AIE.wire(%260 : North, %201 : South)
  AIE.wire(%198 : East, %202 : West)
  AIE.wire(%98 : Core, %202 : Core)
  AIE.wire(%98 : DMA, %202 : DMA)
  AIE.wire(%201 : North, %202 : South)
  AIE.wire(%199 : East, %203 : West)
  AIE.wire(%99 : Core, %203 : Core)
  AIE.wire(%99 : DMA, %203 : DMA)
  AIE.wire(%202 : North, %203 : South)
  AIE.wire(%200 : East, %204 : West)
  AIE.wire(%100 : Core, %204 : Core)
  AIE.wire(%100 : DMA, %204 : DMA)
  AIE.wire(%203 : North, %204 : South)
  AIE.wire(%201 : East, %205 : West)
  AIE.wire(%261 : North, %205 : South)
  AIE.wire(%202 : East, %206 : West)
  AIE.wire(%102 : Core, %206 : Core)
  AIE.wire(%102 : DMA, %206 : DMA)
  AIE.wire(%205 : North, %206 : South)
  AIE.wire(%203 : East, %207 : West)
  AIE.wire(%103 : Core, %207 : Core)
  AIE.wire(%103 : DMA, %207 : DMA)
  AIE.wire(%206 : North, %207 : South)
  AIE.wire(%204 : East, %208 : West)
  AIE.wire(%104 : Core, %208 : Core)
  AIE.wire(%104 : DMA, %208 : DMA)
  AIE.wire(%207 : North, %208 : South)
  AIE.wire(%205 : East, %209 : West)
  AIE.wire(%262 : North, %209 : South)
  AIE.wire(%206 : East, %210 : West)
  AIE.wire(%106 : Core, %210 : Core)
  AIE.wire(%106 : DMA, %210 : DMA)
  AIE.wire(%209 : North, %210 : South)
  AIE.wire(%207 : East, %211 : West)
  AIE.wire(%107 : Core, %211 : Core)
  AIE.wire(%107 : DMA, %211 : DMA)
  AIE.wire(%210 : North, %211 : South)
  AIE.wire(%208 : East, %212 : West)
  AIE.wire(%108 : Core, %212 : Core)
  AIE.wire(%108 : DMA, %212 : DMA)
  AIE.wire(%211 : North, %212 : South)
  AIE.wire(%209 : East, %213 : West)
  %278 = AIE.shimmux(%109) {
  }
  AIE.wire(%278 : North, %213 : South)
  AIE.wire(%263 : North, %278 : South)
  AIE.wire(%109 : DMA, %278 : DMA)
  AIE.wire(%210 : East, %214 : West)
  AIE.wire(%110 : Core, %214 : Core)
  AIE.wire(%110 : DMA, %214 : DMA)
  AIE.wire(%213 : North, %214 : South)
  AIE.wire(%211 : East, %215 : West)
  AIE.wire(%111 : Core, %215 : Core)
  AIE.wire(%111 : DMA, %215 : DMA)
  AIE.wire(%214 : North, %215 : South)
  AIE.wire(%212 : East, %216 : West)
  AIE.wire(%112 : Core, %216 : Core)
  AIE.wire(%112 : DMA, %216 : DMA)
  AIE.wire(%215 : North, %216 : South)
  AIE.wire(%213 : East, %217 : West)
  %279 = AIE.shimmux(%113) {
  }
  AIE.wire(%279 : North, %217 : South)
  AIE.wire(%264 : North, %279 : South)
  AIE.wire(%113 : DMA, %279 : DMA)
  AIE.wire(%214 : East, %218 : West)
  AIE.wire(%114 : Core, %218 : Core)
  AIE.wire(%114 : DMA, %218 : DMA)
  AIE.wire(%217 : North, %218 : South)
  AIE.wire(%215 : East, %219 : West)
  AIE.wire(%115 : Core, %219 : Core)
  AIE.wire(%115 : DMA, %219 : DMA)
  AIE.wire(%218 : North, %219 : South)
  AIE.wire(%216 : East, %220 : West)
  AIE.wire(%116 : Core, %220 : Core)
  AIE.wire(%116 : DMA, %220 : DMA)
  AIE.wire(%219 : North, %220 : South)
  AIE.wire(%217 : East, %221 : West)
  AIE.wire(%265 : North, %221 : South)
  AIE.wire(%218 : East, %222 : West)
  AIE.wire(%118 : Core, %222 : Core)
  AIE.wire(%118 : DMA, %222 : DMA)
  AIE.wire(%221 : North, %222 : South)
  AIE.wire(%219 : East, %223 : West)
  AIE.wire(%119 : Core, %223 : Core)
  AIE.wire(%119 : DMA, %223 : DMA)
  AIE.wire(%222 : North, %223 : South)
  AIE.wire(%220 : East, %224 : West)
  AIE.wire(%120 : Core, %224 : Core)
  AIE.wire(%120 : DMA, %224 : DMA)
  AIE.wire(%223 : North, %224 : South)
  AIE.wire(%221 : East, %225 : West)
  AIE.wire(%266 : North, %225 : South)
  AIE.wire(%222 : East, %226 : West)
  AIE.wire(%122 : Core, %226 : Core)
  AIE.wire(%122 : DMA, %226 : DMA)
  AIE.wire(%225 : North, %226 : South)
  AIE.wire(%223 : East, %227 : West)
  AIE.wire(%123 : Core, %227 : Core)
  AIE.wire(%123 : DMA, %227 : DMA)
  AIE.wire(%226 : North, %227 : South)
  AIE.wire(%224 : East, %228 : West)
  AIE.wire(%124 : Core, %228 : Core)
  AIE.wire(%124 : DMA, %228 : DMA)
  AIE.wire(%227 : North, %228 : South)
  AIE.wire(%225 : East, %229 : West)
  AIE.wire(%267 : North, %229 : South)
  AIE.wire(%226 : East, %230 : West)
  AIE.wire(%126 : Core, %230 : Core)
  AIE.wire(%126 : DMA, %230 : DMA)
  AIE.wire(%229 : North, %230 : South)
  AIE.wire(%227 : East, %231 : West)
  AIE.wire(%127 : Core, %231 : Core)
  AIE.wire(%127 : DMA, %231 : DMA)
  AIE.wire(%230 : North, %231 : South)
  AIE.wire(%228 : East, %232 : West)
  AIE.wire(%128 : Core, %232 : Core)
  AIE.wire(%128 : DMA, %232 : DMA)
  AIE.wire(%231 : North, %232 : South)
  AIE.wire(%229 : East, %233 : West)
  AIE.wire(%268 : North, %233 : South)
  AIE.wire(%230 : East, %234 : West)
  AIE.wire(%130 : Core, %234 : Core)
  AIE.wire(%130 : DMA, %234 : DMA)
  AIE.wire(%233 : North, %234 : South)
  AIE.wire(%231 : East, %235 : West)
  AIE.wire(%131 : Core, %235 : Core)
  AIE.wire(%131 : DMA, %235 : DMA)
  AIE.wire(%234 : North, %235 : South)
  AIE.wire(%232 : East, %236 : West)
  AIE.wire(%132 : Core, %236 : Core)
  AIE.wire(%132 : DMA, %236 : DMA)
  AIE.wire(%235 : North, %236 : South)
  AIE.wire(%233 : East, %237 : West)
  AIE.wire(%269 : North, %237 : South)
  AIE.wire(%234 : East, %238 : West)
  AIE.wire(%134 : Core, %238 : Core)
  AIE.wire(%134 : DMA, %238 : DMA)
  AIE.wire(%237 : North, %238 : South)
  AIE.wire(%235 : East, %239 : West)
  AIE.wire(%135 : Core, %239 : Core)
  AIE.wire(%135 : DMA, %239 : DMA)
  AIE.wire(%238 : North, %239 : South)
  AIE.wire(%236 : East, %240 : West)
  AIE.wire(%136 : Core, %240 : Core)
  AIE.wire(%136 : DMA, %240 : DMA)
  AIE.wire(%239 : North, %240 : South)
  AIE.wire(%237 : East, %241 : West)
  AIE.wire(%270 : North, %241 : South)
  AIE.wire(%238 : East, %242 : West)
  AIE.wire(%138 : Core, %242 : Core)
  AIE.wire(%138 : DMA, %242 : DMA)
  AIE.wire(%241 : North, %242 : South)
  AIE.wire(%239 : East, %243 : West)
  AIE.wire(%139 : Core, %243 : Core)
  AIE.wire(%139 : DMA, %243 : DMA)
  AIE.wire(%242 : North, %243 : South)
  AIE.wire(%240 : East, %244 : West)
  AIE.wire(%140 : Core, %244 : Core)
  AIE.wire(%140 : DMA, %244 : DMA)
  AIE.wire(%243 : North, %244 : South)
  AIE.wire(%241 : East, %2 : West)
  AIE.wire(%1 : North, %2 : South)
  AIE.wire(%271 : North, %1 : South)
  AIE.wire(%0 : DMA, %1 : DMA)
  AIE.wire(%242 : East, %36 : West)
  AIE.wire(%35 : Core, %36 : Core)
  AIE.wire(%35 : DMA, %36 : DMA)
  AIE.wire(%2 : North, %36 : South)
  AIE.wire(%243 : East, %14 : West)
  AIE.wire(%13 : Core, %14 : Core)
  AIE.wire(%13 : DMA, %14 : DMA)
  AIE.wire(%36 : North, %14 : South)
  AIE.wire(%244 : East, %25 : West)
  AIE.wire(%23 : Core, %25 : Core)
  AIE.wire(%23 : DMA, %25 : DMA)
  AIE.wire(%14 : North, %25 : South)
}


; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf8 = external global [32 x [32 x i32]]
@buf9 = external global [32 x [32 x i32]]
@buf10 = external global [32 x [32 x i32]]
@buf11 = external global [32 x [32 x i32]]
@buf12 = external global [32 x [32 x i32]]
@buf13 = external global [32 x [32 x i32]]
@buf14 = external global [32 x [32 x i32]]

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @debug_i32(i32)

declare void @llvm.aie.put.ms(i32, i32)

declare void @llvm.aie.put.wms(i32, i128)

declare void @llvm.aie.put.fms(i32, float)

declare i32 @llvm.aie.get.ss(i32)

declare i128 @llvm.aie.get.wss(i32)

declare float @llvm.aie.get.fss(i32)

declare void @llvm.aie.put.mcd(i384)

declare i384 @llvm.aie.get.scd()

declare void @llvm.aie.lock.acquire.reg(i32, i32)

declare void @llvm.aie.lock.release.reg(i32, i32)

declare void @extern_kernel(i32*, i32*, i32*, i32*)

define void @core263() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf12 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf13 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf14 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf8 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf9 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf10 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf11 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.aie.lock.acquire.reg(i32 48, i32 1), !dbg !15
  call void @llvm.aie.lock.acquire.reg(i32 49, i32 1), !dbg !16
  call void @llvm.aie.lock.acquire.reg(i32 51, i32 1), !dbg !17
  call void @llvm.aie.lock.acquire.reg(i32 50, i32 0), !dbg !18
  call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf8, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf12, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf13, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf14, i64 0, i64 0, i64 0)), !dbg !19
  call void @llvm.aie.lock.release.reg(i32 50, i32 1), !dbg !20
  call void @llvm.aie.lock.release.reg(i32 51, i32 0), !dbg !21
  call void @llvm.aie.lock.release.reg(i32 49, i32 0), !dbg !22
  call void @llvm.aie.lock.release.reg(i32 48, i32 0), !dbg !23
  call void @llvm.aie.lock.release.reg(i32 63, i32 1), !dbg !24
  ret void, !dbg !25
}

define void @_main() !dbg !26 {
  call void @core263(), !dbg !27
  ret void, !dbg !29
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core263", linkageName: "core263", scope: null, file: !4, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_26_3.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/polyaie/samples/gemm/32_64_64")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 36, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 42, column: 5, scope: !8)
!10 = !DILocation(line: 48, column: 5, scope: !8)
!11 = !DILocation(line: 54, column: 5, scope: !8)
!12 = !DILocation(line: 60, column: 5, scope: !8)
!13 = !DILocation(line: 66, column: 5, scope: !8)
!14 = !DILocation(line: 72, column: 5, scope: !8)
!15 = !DILocation(line: 73, column: 5, scope: !8)
!16 = !DILocation(line: 74, column: 5, scope: !8)
!17 = !DILocation(line: 75, column: 5, scope: !8)
!18 = !DILocation(line: 76, column: 5, scope: !8)
!19 = !DILocation(line: 77, column: 5, scope: !8)
!20 = !DILocation(line: 78, column: 5, scope: !8)
!21 = !DILocation(line: 79, column: 5, scope: !8)
!22 = !DILocation(line: 80, column: 5, scope: !8)
!23 = !DILocation(line: 81, column: 5, scope: !8)
!24 = !DILocation(line: 82, column: 5, scope: !8)
!25 = !DILocation(line: 83, column: 5, scope: !8)
!26 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 85, type: !5, scopeLine: 85, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!27 = !DILocation(line: 86, column: 5, scope: !28)
!28 = !DILexicalBlockFile(scope: !26, file: !4, discriminator: 0)
!29 = !DILocation(line: 87, column: 5, scope: !28)

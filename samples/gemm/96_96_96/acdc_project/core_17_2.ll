; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf101 = external global [32 x [32 x i32]]
@buf102 = external global [32 x [32 x i32]]
@buf103 = external global [32 x [32 x i32]]
@buf107 = external global [32 x [32 x i32]]
@buf108 = external global [32 x [32 x i32]]
@buf109 = external global [32 x [32 x i32]]
@buf110 = external global [32 x [32 x i32]]
@buf97 = external global [32 x [32 x i32]]
@buf98 = external global [32 x [32 x i32]]
@buf99 = external global [32 x [32 x i32]]
@buf100 = external global [32 x [32 x i32]]

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

define void @core172() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf97 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf98 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf99 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf100 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf107 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf108 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf109 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf110 to i64), i64 31), i64 0)), !dbg !15
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf101 to i64), i64 31), i64 0)), !dbg !16
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf102 to i64), i64 31), i64 0)), !dbg !17
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf103 to i64), i64 31), i64 0)), !dbg !18
  call void @llvm.aie.lock.acquire.reg(i32 17, i32 1), !dbg !19
  call void @llvm.aie.lock.acquire.reg(i32 16, i32 1), !dbg !20
  call void @llvm.aie.lock.acquire.reg(i32 32, i32 0), !dbg !21
  call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf100, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf97, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf98, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf99, i64 0, i64 0, i64 0)), !dbg !22
  call void @llvm.aie.lock.release.reg(i32 32, i32 1), !dbg !23
  call void @llvm.aie.lock.release.reg(i32 16, i32 0), !dbg !24
  call void @llvm.aie.lock.release.reg(i32 17, i32 0), !dbg !25
  ret void, !dbg !26
}

define void @_main() !dbg !27 {
  call void @core172(), !dbg !28
  ret void, !dbg !30
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core172", linkageName: "core172", scope: null, file: !4, line: 25, type: !5, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_17_2.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/polyaie/samples/gemm/96_96_96")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 38, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 44, column: 5, scope: !8)
!10 = !DILocation(line: 50, column: 5, scope: !8)
!11 = !DILocation(line: 56, column: 5, scope: !8)
!12 = !DILocation(line: 62, column: 5, scope: !8)
!13 = !DILocation(line: 68, column: 5, scope: !8)
!14 = !DILocation(line: 74, column: 5, scope: !8)
!15 = !DILocation(line: 80, column: 5, scope: !8)
!16 = !DILocation(line: 86, column: 5, scope: !8)
!17 = !DILocation(line: 92, column: 5, scope: !8)
!18 = !DILocation(line: 98, column: 5, scope: !8)
!19 = !DILocation(line: 99, column: 5, scope: !8)
!20 = !DILocation(line: 100, column: 5, scope: !8)
!21 = !DILocation(line: 101, column: 5, scope: !8)
!22 = !DILocation(line: 102, column: 5, scope: !8)
!23 = !DILocation(line: 103, column: 5, scope: !8)
!24 = !DILocation(line: 104, column: 5, scope: !8)
!25 = !DILocation(line: 105, column: 5, scope: !8)
!26 = !DILocation(line: 106, column: 5, scope: !8)
!27 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 108, type: !5, scopeLine: 108, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!28 = !DILocation(line: 109, column: 5, scope: !29)
!29 = !DILexicalBlockFile(scope: !27, file: !4, discriminator: 0)
!30 = !DILocation(line: 110, column: 5, scope: !29)

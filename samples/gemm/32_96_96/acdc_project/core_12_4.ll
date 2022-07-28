; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf39 = external global [32 x [32 x i32]]
@buf40 = external global [32 x [32 x i32]]
@buf41 = external global [32 x [32 x i32]]
@buf42 = external global [32 x [32 x i32]]
@buf43 = external global [32 x [32 x i32]]
@buf44 = external global [32 x [32 x i32]]

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

define void @core124() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf42 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf43 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf44 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf39 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf40 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf41 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.aie.lock.acquire.reg(i32 19, i32 1), !dbg !14
  call void @llvm.aie.lock.acquire.reg(i32 18, i32 1), !dbg !15
  call void @llvm.aie.lock.acquire.reg(i32 16, i32 1), !dbg !16
  call void @llvm.aie.lock.acquire.reg(i32 17, i32 0), !dbg !17
  call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf39, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf42, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf43, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf44, i64 0, i64 0, i64 0)), !dbg !18
  call void @llvm.aie.lock.release.reg(i32 17, i32 1), !dbg !19
  call void @llvm.aie.lock.release.reg(i32 16, i32 0), !dbg !20
  call void @llvm.aie.lock.release.reg(i32 18, i32 0), !dbg !21
  call void @llvm.aie.lock.release.reg(i32 19, i32 0), !dbg !22
  call void @llvm.aie.lock.release.reg(i32 31, i32 1), !dbg !23
  ret void, !dbg !24
}

define void @_main() !dbg !25 {
  call void @core124(), !dbg !26
  ret void, !dbg !28
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core124", linkageName: "core124", scope: null, file: !4, line: 20, type: !5, scopeLine: 20, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_12_4.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/polyaie/samples/gemm/32_96_96")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 35, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 41, column: 5, scope: !8)
!10 = !DILocation(line: 47, column: 5, scope: !8)
!11 = !DILocation(line: 53, column: 5, scope: !8)
!12 = !DILocation(line: 59, column: 5, scope: !8)
!13 = !DILocation(line: 65, column: 5, scope: !8)
!14 = !DILocation(line: 66, column: 5, scope: !8)
!15 = !DILocation(line: 67, column: 5, scope: !8)
!16 = !DILocation(line: 68, column: 5, scope: !8)
!17 = !DILocation(line: 69, column: 5, scope: !8)
!18 = !DILocation(line: 70, column: 5, scope: !8)
!19 = !DILocation(line: 71, column: 5, scope: !8)
!20 = !DILocation(line: 72, column: 5, scope: !8)
!21 = !DILocation(line: 73, column: 5, scope: !8)
!22 = !DILocation(line: 74, column: 5, scope: !8)
!23 = !DILocation(line: 75, column: 5, scope: !8)
!24 = !DILocation(line: 76, column: 5, scope: !8)
!25 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 78, type: !5, scopeLine: 78, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!26 = !DILocation(line: 79, column: 5, scope: !27)
!27 = !DILexicalBlockFile(scope: !25, file: !4, discriminator: 0)
!28 = !DILocation(line: 80, column: 5, scope: !27)

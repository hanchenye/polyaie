; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf31 = external global [32 x [32 x i32]]
@bui32 = external global [32 x [32 x i32]]
@buf33 = external global [32 x [32 x i32]]
@buf27 = external global [32 x [32 x i32]]
@buf28 = external global [32 x [32 x i32]]
@buf29 = external global [32 x [32 x i32]]
@buf30 = external global [32 x [32 x i32]]
@buf34 = external global [32 x [32 x i32]]
@buf35 = external global [32 x [32 x i32]]
@buf36 = external global [32 x [32 x i32]]

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

define void @core103() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf34 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf35 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf36 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf27 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf28 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf29 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf30 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf31 to i64), i64 31), i64 0)), !dbg !15
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @bui32 to i64), i64 31), i64 0)), !dbg !16
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf33 to i64), i64 31), i64 0)), !dbg !17
  call void @llvm.aie.lock.acquire.reg(i32 34, i32 0), !dbg !18
  call void @llvm.aie.lock.acquire.reg(i32 48, i32 1), !dbg !19
  call void @llvm.aie.lock.acquire.reg(i32 50, i32 1), !dbg !20
  call void @llvm.aie.lock.acquire.reg(i32 49, i32 1), !dbg !21
  call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf27, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf31, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @bui32, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf33, i64 0, i64 0, i64 0)), !dbg !22
  call void @llvm.aie.lock.release.reg(i32 49, i32 0), !dbg !23
  call void @llvm.aie.lock.release.reg(i32 50, i32 0), !dbg !24
  call void @llvm.aie.lock.release.reg(i32 48, i32 0), !dbg !25
  call void @llvm.aie.lock.release.reg(i32 34, i32 1), !dbg !26
  ret void, !dbg !27
}

define void @_main() !dbg !28 {
  call void @core103(), !dbg !29
  ret void, !dbg !31
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core103", linkageName: "core103", scope: null, file: !4, line: 24, type: !5, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_10_3.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/polyaie/samples/gemm/96_96_96")
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
!18 = !DILocation(line: 93, column: 5, scope: !8)
!19 = !DILocation(line: 94, column: 5, scope: !8)
!20 = !DILocation(line: 95, column: 5, scope: !8)
!21 = !DILocation(line: 96, column: 5, scope: !8)
!22 = !DILocation(line: 97, column: 5, scope: !8)
!23 = !DILocation(line: 98, column: 5, scope: !8)
!24 = !DILocation(line: 99, column: 5, scope: !8)
!25 = !DILocation(line: 100, column: 5, scope: !8)
!26 = !DILocation(line: 101, column: 5, scope: !8)
!27 = !DILocation(line: 102, column: 5, scope: !8)
!28 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 104, type: !5, scopeLine: 104, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!29 = !DILocation(line: 105, column: 5, scope: !30)
!30 = !DILexicalBlockFile(scope: !28, file: !4, discriminator: 0)
!31 = !DILocation(line: 106, column: 5, scope: !30)

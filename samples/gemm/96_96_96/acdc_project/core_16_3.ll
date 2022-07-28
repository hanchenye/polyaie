; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf81 = external global [32 x [32 x i32]]
@buf82 = external global [32 x [32 x i32]]
@buf83 = external global [32 x [32 x i32]]
@buf94 = external global [32 x [32 x i32]]
@buf95 = external global [32 x [32 x i32]]
@buf96 = external global [32 x [32 x i32]]
@buf91 = external global [32 x [32 x i32]]
@buf92 = external global [32 x [32 x i32]]
@buf93 = external global [32 x [32 x i32]]
@buf87 = external global [32 x [32 x i32]]
@buf88 = external global [32 x [32 x i32]]
@buf89 = external global [32 x [32 x i32]]
@buf90 = external global [32 x [32 x i32]]

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

define void @core163() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf87 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf88 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf89 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf90 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf91 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf92 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf93 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf94 to i64), i64 31), i64 0)), !dbg !15
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf95 to i64), i64 31), i64 0)), !dbg !16
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf96 to i64), i64 31), i64 0)), !dbg !17
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf81 to i64), i64 31), i64 0)), !dbg !18
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf82 to i64), i64 31), i64 0)), !dbg !19
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf83 to i64), i64 31), i64 0)), !dbg !20
  call void @llvm.aie.lock.acquire.reg(i32 49, i32 1), !dbg !21
  call void @llvm.aie.lock.acquire.reg(i32 32, i32 0), !dbg !22
  call void @llvm.aie.lock.acquire.reg(i32 48, i32 1), !dbg !23
  call void @llvm.aie.lock.acquire.reg(i32 50, i32 1), !dbg !24
  call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf87, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf91, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf92, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf93, i64 0, i64 0, i64 0)), !dbg !25
  call void @llvm.aie.lock.release.reg(i32 50, i32 0), !dbg !26
  call void @llvm.aie.lock.release.reg(i32 48, i32 0), !dbg !27
  call void @llvm.aie.lock.release.reg(i32 32, i32 1), !dbg !28
  call void @llvm.aie.lock.release.reg(i32 49, i32 0), !dbg !29
  ret void, !dbg !30
}

define void @_main() !dbg !31 {
  call void @core163(), !dbg !32
  ret void, !dbg !34
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core163", linkageName: "core163", scope: null, file: !4, line: 27, type: !5, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_16_3.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/polyaie/samples/gemm/96_96_96")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 41, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 47, column: 5, scope: !8)
!10 = !DILocation(line: 53, column: 5, scope: !8)
!11 = !DILocation(line: 59, column: 5, scope: !8)
!12 = !DILocation(line: 65, column: 5, scope: !8)
!13 = !DILocation(line: 71, column: 5, scope: !8)
!14 = !DILocation(line: 77, column: 5, scope: !8)
!15 = !DILocation(line: 83, column: 5, scope: !8)
!16 = !DILocation(line: 89, column: 5, scope: !8)
!17 = !DILocation(line: 95, column: 5, scope: !8)
!18 = !DILocation(line: 101, column: 5, scope: !8)
!19 = !DILocation(line: 107, column: 5, scope: !8)
!20 = !DILocation(line: 113, column: 5, scope: !8)
!21 = !DILocation(line: 114, column: 5, scope: !8)
!22 = !DILocation(line: 115, column: 5, scope: !8)
!23 = !DILocation(line: 116, column: 5, scope: !8)
!24 = !DILocation(line: 117, column: 5, scope: !8)
!25 = !DILocation(line: 118, column: 5, scope: !8)
!26 = !DILocation(line: 119, column: 5, scope: !8)
!27 = !DILocation(line: 120, column: 5, scope: !8)
!28 = !DILocation(line: 121, column: 5, scope: !8)
!29 = !DILocation(line: 122, column: 5, scope: !8)
!30 = !DILocation(line: 123, column: 5, scope: !8)
!31 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 125, type: !5, scopeLine: 125, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!32 = !DILocation(line: 126, column: 5, scope: !33)
!33 = !DILexicalBlockFile(scope: !31, file: !4, discriminator: 0)
!34 = !DILocation(line: 127, column: 5, scope: !33)

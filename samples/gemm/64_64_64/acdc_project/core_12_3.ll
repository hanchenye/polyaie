; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf30 = external global [32 x [32 x i32]]
@buf31 = external global [32 x [32 x i32]]
@bui32 = external global [32 x [32 x i32]]
@buf26 = external global [32 x [32 x i32]]
@buf27 = external global [32 x [32 x i32]]
@buf28 = external global [32 x [32 x i32]]
@buf29 = external global [32 x [32 x i32]]
@buf23 = external global [32 x [32 x i32]]
@buf24 = external global [32 x [32 x i32]]
@buf25 = external global [32 x [32 x i32]]

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

define void @core123() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf23 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf24 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf25 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf26 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf27 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf28 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf29 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf30 to i64), i64 31), i64 0)), !dbg !15
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf31 to i64), i64 31), i64 0)), !dbg !16
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @bui32 to i64), i64 31), i64 0)), !dbg !17
  call void @llvm.aie.lock.acquire.reg(i32 51, i32 1), !dbg !18
  call void @llvm.aie.lock.acquire.reg(i32 50, i32 1), !dbg !19
  call void @llvm.aie.lock.acquire.reg(i32 49, i32 0), !dbg !20
  call void @llvm.aie.lock.acquire.reg(i32 48, i32 1), !dbg !21
  call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf26, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf30, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf31, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @bui32, i64 0, i64 0, i64 0)), !dbg !22
  call void @llvm.aie.lock.release.reg(i32 48, i32 0), !dbg !23
  call void @llvm.aie.lock.release.reg(i32 49, i32 1), !dbg !24
  call void @llvm.aie.lock.release.reg(i32 50, i32 0), !dbg !25
  call void @llvm.aie.lock.release.reg(i32 51, i32 0), !dbg !26
  call void @llvm.aie.lock.release.reg(i32 63, i32 1), !dbg !27
  ret void, !dbg !28
}

define void @_main() !dbg !29 {
  call void @core123(), !dbg !30
  ret void, !dbg !32
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core123", linkageName: "core123", scope: null, file: !4, line: 24, type: !5, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_12_3.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/polyaie/samples/gemm/64_64_64")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 39, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 45, column: 5, scope: !8)
!10 = !DILocation(line: 51, column: 5, scope: !8)
!11 = !DILocation(line: 57, column: 5, scope: !8)
!12 = !DILocation(line: 63, column: 5, scope: !8)
!13 = !DILocation(line: 69, column: 5, scope: !8)
!14 = !DILocation(line: 75, column: 5, scope: !8)
!15 = !DILocation(line: 81, column: 5, scope: !8)
!16 = !DILocation(line: 87, column: 5, scope: !8)
!17 = !DILocation(line: 93, column: 5, scope: !8)
!18 = !DILocation(line: 94, column: 5, scope: !8)
!19 = !DILocation(line: 95, column: 5, scope: !8)
!20 = !DILocation(line: 96, column: 5, scope: !8)
!21 = !DILocation(line: 97, column: 5, scope: !8)
!22 = !DILocation(line: 98, column: 5, scope: !8)
!23 = !DILocation(line: 99, column: 5, scope: !8)
!24 = !DILocation(line: 100, column: 5, scope: !8)
!25 = !DILocation(line: 101, column: 5, scope: !8)
!26 = !DILocation(line: 102, column: 5, scope: !8)
!27 = !DILocation(line: 103, column: 5, scope: !8)
!28 = !DILocation(line: 104, column: 5, scope: !8)
!29 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 106, type: !5, scopeLine: 106, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!30 = !DILocation(line: 107, column: 5, scope: !31)
!31 = !DILexicalBlockFile(scope: !29, file: !4, discriminator: 0)
!32 = !DILocation(line: 108, column: 5, scope: !31)

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf5 = external global [32 x [32 x i32]]
@buf6 = external global [32 x [32 x i32]]
@buf7 = external global [32 x [32 x i32]]
@buf8 = external global [32 x [32 x i32]]
@buf9 = external global [32 x [32 x i32]]
@buf10 = external global [32 x [32 x i32]]
@buf11 = external global [32 x [32 x i32]]

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

define void @core262() !dbg !3 {
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf9 to i64), i64 31), i64 0)), !dbg !7
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf10 to i64), i64 31), i64 0)), !dbg !9
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf11 to i64), i64 31), i64 0)), !dbg !10
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf5 to i64), i64 31), i64 0)), !dbg !11
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf6 to i64), i64 31), i64 0)), !dbg !12
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf7 to i64), i64 31), i64 0)), !dbg !13
  call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf8 to i64), i64 31), i64 0)), !dbg !14
  call void @llvm.aie.lock.acquire.reg(i32 32, i32 0), !dbg !15
  call void @llvm.aie.lock.acquire.reg(i32 17, i32 1), !dbg !16
  call void @llvm.aie.lock.acquire.reg(i32 16, i32 1), !dbg !17
  call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf8, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf5, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf6, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf7, i64 0, i64 0, i64 0)), !dbg !18
  call void @llvm.aie.lock.release.reg(i32 16, i32 0), !dbg !19
  call void @llvm.aie.lock.release.reg(i32 17, i32 0), !dbg !20
  call void @llvm.aie.lock.release.reg(i32 32, i32 1), !dbg !21
  ret void, !dbg !22
}

define void @_main() !dbg !23 {
  call void @core262(), !dbg !24
  ret void, !dbg !26
}

; Function Attrs: inaccessiblememonly nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #0

attributes #0 = { inaccessiblememonly nocallback nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "core262", linkageName: "core262", scope: null, file: !4, line: 21, type: !5, scopeLine: 21, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "acdc_project/core_26_2.opt.mlir", directory: "/proj/rdi/staff/jinmingz/nobkup/polyaie/samples/gemm/32_64_32")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 34, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 40, column: 5, scope: !8)
!10 = !DILocation(line: 46, column: 5, scope: !8)
!11 = !DILocation(line: 52, column: 5, scope: !8)
!12 = !DILocation(line: 58, column: 5, scope: !8)
!13 = !DILocation(line: 64, column: 5, scope: !8)
!14 = !DILocation(line: 70, column: 5, scope: !8)
!15 = !DILocation(line: 71, column: 5, scope: !8)
!16 = !DILocation(line: 72, column: 5, scope: !8)
!17 = !DILocation(line: 73, column: 5, scope: !8)
!18 = !DILocation(line: 74, column: 5, scope: !8)
!19 = !DILocation(line: 75, column: 5, scope: !8)
!20 = !DILocation(line: 76, column: 5, scope: !8)
!21 = !DILocation(line: 77, column: 5, scope: !8)
!22 = !DILocation(line: 78, column: 5, scope: !8)
!23 = distinct !DISubprogram(name: "_main", linkageName: "_main", scope: null, file: !4, line: 80, type: !5, scopeLine: 80, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!24 = !DILocation(line: 81, column: 5, scope: !25)
!25 = !DILexicalBlockFile(scope: !23, file: !4, discriminator: 0)
!26 = !DILocation(line: 82, column: 5, scope: !25)

; ModuleID = 'acdc_project/core_12_3.ll'
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

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @extern_kernel(i32*, i32*, i32*, i32*) local_unnamed_addr

define void @core123() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf23 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf24 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf25 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf26 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf27 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf28 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf29 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf30 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf31 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @bui32 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 50, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 0)
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 1)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf26, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf30, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf31, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @bui32, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 48, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 50, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 63, i32 1)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf23 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf24 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf25 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf26 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf27 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf28 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf29 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf30 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf31 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @bui32 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 50, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 0)
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 1)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf26, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf30, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf31, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @bui32, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 48, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 50, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 63, i32 1)
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

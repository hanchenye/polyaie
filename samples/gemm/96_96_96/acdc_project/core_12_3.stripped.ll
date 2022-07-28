; ModuleID = 'acdc_project/core_12_3.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf47 = external global [32 x [32 x i32]]
@buf48 = external global [32 x [32 x i32]]
@buf49 = external global [32 x [32 x i32]]
@buf50 = external global [32 x [32 x i32]]
@buf54 = external global [32 x [32 x i32]]
@buf55 = external global [32 x [32 x i32]]
@buf56 = external global [32 x [32 x i32]]
@buf41 = external global [32 x [32 x i32]]
@buf42 = external global [32 x [32 x i32]]
@buf43 = external global [32 x [32 x i32]]
@buf51 = external global [32 x [32 x i32]]
@buf52 = external global [32 x [32 x i32]]
@buf53 = external global [32 x [32 x i32]]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @extern_kernel(i32*, i32*, i32*, i32*) local_unnamed_addr

define void @core123() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf51 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf52 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf53 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf41 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf42 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf43 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf54 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf55 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf56 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf47 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf48 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf49 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf50 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 50, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 33, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf47, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf51, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf52, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf53, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 33, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 49, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 50, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 48, i32 0)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf51 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf52 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf53 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf41 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf42 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf43 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf54 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf55 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf56 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf47 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf48 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf49 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf50 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 50, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 33, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf47, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf51, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf52, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf53, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 33, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 49, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 50, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 48, i32 0)
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

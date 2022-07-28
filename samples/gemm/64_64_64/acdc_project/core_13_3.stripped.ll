; ModuleID = 'acdc_project/core_13_3.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf33 = external global [32 x [32 x i32]]
@buf34 = external global [32 x [32 x i32]]
@buf35 = external global [32 x [32 x i32]]
@buf36 = external global [32 x [32 x i32]]
@buf37 = external global [32 x [32 x i32]]
@buf38 = external global [32 x [32 x i32]]
@buf39 = external global [32 x [32 x i32]]
@buf30 = external global [32 x [32 x i32]]
@buf31 = external global [32 x [32 x i32]]
@bui32 = external global [32 x [32 x i32]]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @extern_kernel(i32*, i32*, i32*, i32*) local_unnamed_addr

define void @core133() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf30 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf31 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @bui32 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf37 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf38 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf39 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf33 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf34 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf35 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf36 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 50, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf33, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf37, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf38, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf39, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 48, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 49, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 50, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 51, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 63, i32 1)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf30 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf31 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @bui32 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf37 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf38 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf39 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf33 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf34 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf35 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf36 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 51, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 50, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 49, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 48, i32 0)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf33, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf37, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf38, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf39, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 48, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 49, i32 0)
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

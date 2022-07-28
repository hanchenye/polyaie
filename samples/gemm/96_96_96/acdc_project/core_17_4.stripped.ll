; ModuleID = 'acdc_project/core_17_4.ll'
source_filename = "LLVMDialectModule"
target triple = "aie"

@buf101 = external global [32 x [32 x i32]]
@buf102 = external global [32 x [32 x i32]]
@buf103 = external global [32 x [32 x i32]]
@buf114 = external global [32 x [32 x i32]]
@buf115 = external global [32 x [32 x i32]]
@buf116 = external global [32 x [32 x i32]]
@buf104 = external global [32 x [32 x i32]]
@buf105 = external global [32 x [32 x i32]]
@buf106 = external global [32 x [32 x i32]]

; Function Attrs: nounwind
declare void @llvm.aie.lock.acquire.reg(i32, i32) #0

; Function Attrs: nounwind
declare void @llvm.aie.lock.release.reg(i32, i32) #0

declare void @extern_kernel(i32*, i32*, i32*, i32*) local_unnamed_addr

define void @core174() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf104 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf105 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf106 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf114 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf115 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf116 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf101 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf102 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf103 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 18, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 16, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 19, i32 0)
  tail call void @llvm.aie.lock.acquire.reg(i32 17, i32 1)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf101, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf104, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf105, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf106, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 17, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 19, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 16, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 18, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 31, i32 1)
  ret void
}

define void @_main() local_unnamed_addr {
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf104 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf105 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf106 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf114 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf115 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf116 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf101 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf102 to i64), i64 31), i64 0))
  tail call void @llvm.assume(i1 icmp eq (i64 and (i64 ptrtoint ([32 x [32 x i32]]* @buf103 to i64), i64 31), i64 0))
  tail call void @llvm.aie.lock.acquire.reg(i32 18, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 16, i32 1)
  tail call void @llvm.aie.lock.acquire.reg(i32 19, i32 0)
  tail call void @llvm.aie.lock.acquire.reg(i32 17, i32 1)
  tail call void @extern_kernel(i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf101, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf104, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf105, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([32 x [32 x i32]], [32 x [32 x i32]]* @buf106, i64 0, i64 0, i64 0))
  tail call void @llvm.aie.lock.release.reg(i32 17, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 19, i32 1)
  tail call void @llvm.aie.lock.release.reg(i32 16, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 18, i32 0)
  tail call void @llvm.aie.lock.release.reg(i32 31, i32 1)
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nounwind }
attributes #1 = { inaccessiblememonly mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

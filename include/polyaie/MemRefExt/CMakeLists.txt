add_mlir_dialect(MemRefExt memrefext)

set(LLVM_TARGET_DEFINITIONS MemRefExt.td)
mlir_tablegen(MemRefExtEnums.h.inc -gen-enum-decls)
mlir_tablegen(MemRefExtEnums.cpp.inc -gen-enum-defs)
add_public_tablegen_target(MLIRMemRefExtEnumsIncGen)

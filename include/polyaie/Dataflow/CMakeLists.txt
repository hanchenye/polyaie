add_mlir_dialect(Dataflow dataflow)

set(LLVM_TARGET_DEFINITIONS Dataflow.td)
mlir_tablegen(DataflowEnums.h.inc -gen-enum-decls)
mlir_tablegen(DataflowEnums.cpp.inc -gen-enum-defs)
add_public_tablegen_target(MLIRDataflowEnumsIncGen)

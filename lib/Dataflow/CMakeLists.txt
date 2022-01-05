add_mlir_dialect_library(MLIRDataflow
  Dataflow.cpp

  DEPENDS
  MLIRDataflowIncGen
  MLIRDataflowEnumsIncGen
  )

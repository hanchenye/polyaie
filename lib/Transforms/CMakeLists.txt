add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  CreateDataflow.cpp
  PrintDataflow.cpp
  ConvertToAIE.cpp
  Passes.cpp

  DEPENDS
  MLIRMemRefExt
  MLIRPolyAIEPassesIncGen
  )

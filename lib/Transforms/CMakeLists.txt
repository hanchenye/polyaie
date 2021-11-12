add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  CreateDataflow.cpp
  ConvertToAIE.cpp
  Passes.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

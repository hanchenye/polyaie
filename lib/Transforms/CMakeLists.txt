add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  CreateDataflow.cpp
  PrintDataflow.cpp
  Placement.cpp
  ConvertToAIE.cpp
  Passes.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

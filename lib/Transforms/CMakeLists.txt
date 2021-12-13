add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  ReduceBufferSize.cpp
  CreateDataflow.cpp
  DetectReduction.cpp
  Placement.cpp
  PrintDataflow.cpp
  ConvertToAIE.cpp
  Postprocess.cpp
  Passes.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

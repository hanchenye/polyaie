add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  ReduceBufferSize.cpp
  CreateDataflow.cpp
  Placement.cpp
  PrintDataflow.cpp
  ConvertToAIE.cpp
  SimplifyTokens.cpp
  Postprocess.cpp
  Passes.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

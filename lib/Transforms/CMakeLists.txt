add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  BufferExtraction.cpp
  CreateDataflow.cpp
  LinkExternKernel.cpp
  DetectReduction.cpp
  Placement.cpp
  PrintDataflow.cpp
  ConvertToAIE.cpp
  DoubleBuffer.cpp
  Postprocess.cpp
  Passes.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

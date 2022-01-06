add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  CreateSubView.cpp
  ConvertToDataflow.cpp
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

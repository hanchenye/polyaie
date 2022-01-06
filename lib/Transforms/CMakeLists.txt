add_mlir_library(MLIRPolyAIEPasses
  Preprocess.cpp
  CreateSubView.cpp
  DetectReduction.cpp
  HoistSubView.cpp
  ExplicitizeDependency.cpp
  ConvertToDataflow.cpp
  LinkExternKernel.cpp
  Placement.cpp
  PrintDataflow.cpp
  ConvertToAIE.cpp
  DoubleBuffer.cpp
  Postprocess.cpp
  Passes.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

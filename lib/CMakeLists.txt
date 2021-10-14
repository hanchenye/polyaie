add_mlir_library(MLIRPolyAIEPasses
  AffinePreprocess.cpp
  ConvertToAIE.cpp
  Passes.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

add_mlir_library(MLIRPolyAIEPasses
  Passes.cpp
  AffinePreprocess.cpp

  DEPENDS
  MLIRPolyAIEPassesIncGen
  )

add_mlir_library(MLIRPolyAIEConversion
  Passes.cpp
  ConvertAffineToAIE.cpp

  DEPENDS
  MLIRPolyAIEConversionIncGen
  )

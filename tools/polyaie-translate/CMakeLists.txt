get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(translation_libs GLOBAL PROPERTY MLIR_TRANSLATION_LIBS)

set(LLVM_LINK_COMPONENTS
  Support
  )

add_llvm_tool(polyaie-translate
  polyaie-translate.cpp
  )

llvm_update_compile_flags(polyaie-translate)

target_link_libraries(polyaie-translate
  PRIVATE
  ${dialect_libs}
  ${translation_libs}
  AIE
  MLIRAIEVec
  CIRCTHandshake
  MLIRDataflow
  MLIRTargetAIEVecCpp
  MLIRPolyAIEExporters
  MLIRPolyAIESupport
  )

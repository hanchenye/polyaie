get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
get_property(all_libs GLOBAL PROPERTY MLIR_ALL_LIBS)

add_llvm_tool(polyaie-opt
  polyaie-opt.cpp
  )

llvm_update_compile_flags(polyaie-opt)

target_link_libraries(polyaie-opt
  PRIVATE
  ${all_libs}
  AIE
  MLIRPolyAIEConversion
  )

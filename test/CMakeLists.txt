configure_lit_site_cfg(
  ${CMAKE_CURRENT_SOURCE_DIR}/lit.site.cfg.py.in
  ${CMAKE_CURRENT_BINARY_DIR}/lit.site.cfg.py
  MAIN_CONFIG
  ${CMAKE_CURRENT_SOURCE_DIR}/lit.cfg.py
  )

set(POLYAIE_TEST_DEPENDS
  FileCheck count not
  polyaie-opt
  )

add_lit_testsuite(check-polyaie "Running the polyaie regression tests"
  ${CMAKE_CURRENT_BINARY_DIR}
  DEPENDS ${POLYAIE_TEST_DEPENDS}
  )
set_target_properties(check-polyaie PROPERTIES FOLDER "Tests")

add_lit_testsuites(POLYAIE
  ${CMAKE_CURRENT_SOURCE_DIR}
  DEPENDS ${POLYAIE_TEST_DEPENDS}
  )

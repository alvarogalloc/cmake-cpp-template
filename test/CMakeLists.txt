message("Testing Enabled")

enable_testing()

add_executable(tests
    test_main.cpp
)

#exclude test_main.cpp from the list of source files
file(GLOB_RECURSE TEST_MODULES
  *.cpp
)

list(REMOVE_ITEM TEST_MODULES ${CMAKE_CURRENT_SOURCE_DIR}/test_main.cpp)

target_sources(tests PUBLIC 
  FILE_SET CXX_MODULES FILES
  ${TEST_MODULES}
)

target_link_libraries(tests
  PRIVATE
  stdmodule
  exe_lib
  boostut
)

add_test(NAME tests COMMAND tests)

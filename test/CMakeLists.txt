message("Testing Enabled")

enable_testing()

add_library(ut)
target_sources(ut PUBLIC
  FILE_SET CXX_MODULES FILES
  misc/ut.cpp
)

#exclude test_main.cpp from the list of source files
file(GLOB_RECURSE TEST_MODULES
  modules/*.cppm
)
file(GLOB_RECURSE TEST_SOURCES
  src/*.cpp
)

add_executable(tests
  ${TEST_SOURCES}
)

target_sources(tests PUBLIC 
  FILE_SET CXX_MODULES FILES
  ${TEST_MODULES}
)

target_link_libraries(tests
  PRIVATE
  exe_lib
  ut
)

add_test(NAME tests COMMAND tests)

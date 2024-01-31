include(FetchContent)
if(CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
  cmake_policy(SET CMP0135 NEW)
endif()
set(PROJECT_OPTIONS_VERSION "v0.33.1")
FetchContent_Declare(
  _project_options
  URL https://github.com/aminya/project_options/archive/refs/tags/${PROJECT_OPTIONS_VERSION}.zip
)
FetchContent_MakeAvailable(_project_options)
include(${_project_options_SOURCE_DIR}/Index.cmake)

option(RUN_VCPKG "Run vcpkg to install the packages through vcpkg.json" ON)
option(USE_SANITIZERS "Enable address sanitizer" OFF)
option(USE_CPPCHECK "ENABLE_CPPCHECK" OFF)
option(USE_LLD "Enable a better linker" ON)

if(RUN_VCPKG)
  run_vcpkg()
endif()

if(USE_SANITIZERS)
  set(ENABLE_SANITIZER_ADDRESS "ENABLE_SANITIZER_ADDRESS")
  set(ENABLE_SANITIZER_UNDEFINED_BEHAVIOR "ENABLE_SANITIZER_UNDEFINED_BEHAVIOR")
endif()
if(USE_CPPCHECK)
  set(ENABLE_CPPCHECK "ENABLE_CPPCHECK")
endif()
if(USE_LLD)
  set(ENABLE_LLD "LINKER \"lld\"")
endif()

project_options(
  PREFIX
  "rooster"
  ENABLE_CACHE
  WARNINGS_AS_ERRORS
  ${ENABLE_CPPCHECK}
  ${ENABLE_SANITIZER_ADDRESS}
  ${ENABLE_SANITIZER_UNDEFINED_BEHAVIOR}
  ${ENABLE_LLD})

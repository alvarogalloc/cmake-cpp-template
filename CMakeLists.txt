cmake_minimum_required(VERSION 3.30)
set(CMAKE_CXX_STANDARD 23)
# disable c++ 20 modules
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)

project(rooster CXX)

include(cmake/setup.cmake)

# if clang, push ignore for deprecated declarations
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wno-deprecated-declarations)
endif()

add_library(stdmodule)
target_sources(stdmodule PUBLIC
  FILE_SET CXX_MODULES FILES
  misc/stdmodule.cpp
)

add_library(boostut)
target_sources(boostut PUBLIC
  FILE_SET CXX_MODULES FILES
  misc/boostut.cpp
)
target_link_libraries(boostut PUBLIC stdmodule)

add_executable(exe src/main.cpp)

file(GLOB_RECURSE EXE_MODULES CONFIGURE_DEPENDS src/mymodule.cpp)

add_library(exe_lib)

target_link_libraries(exe_lib PUBLIC stdmodule)
target_link_libraries(exe_lib PUBLIC rooster_project_options)
target_link_libraries(exe_lib PRIVATE rooster_project_warnings)

target_sources(exe_lib PUBLIC
  FILE_SET CXX_MODULES FILES
  ${EXE_MODULES}
)

target_include_directories(exe PRIVATE include)
target_link_libraries(exe PUBLIC exe_lib)
target_link_libraries(exe_lib PRIVATE rooster_project_warnings)


if(APP_BUILD_TESTING)
  add_subdirectory(test)
endif()

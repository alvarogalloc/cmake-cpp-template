cmake_minimum_required(VERSION 3.30)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "0e5b6991-d74f-4b3d-a41c-cf096e0b2508")
set(CMAKE_CXX_MODULE_STD ON)

project(rooster CXX)



include(cmake/setup.cmake)

# if clang, push ignore for deprecated declarations
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wno-deprecated-declarations)
endif()

add_library(boostut)
target_sources(boostut PUBLIC
  FILE_SET CXX_MODULES FILES
  misc/ut.cpp
)

add_executable(exe src/main.cpp)

file(GLOB_RECURSE EXE_MODULES CONFIGURE_DEPENDS src/mymodule.cpp)

add_library(exe_lib)

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

cmake_minimum_required(VERSION 3.28)
set(CMAKE_CXX_STANDARD 23)
# disable c++ 20 modules
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)

project(rooster CXX)

include(cmake/setup.cmake)


add_executable(exe src/main.cpp)
target_sources(exe PUBLIC
  FILE_SET CXX_MODULES FILES
  src/mymodule.cpp
)
target_include_directories(exe PRIVATE include)
target_link_libraries(exe PRIVATE rooster_project_options rooster_project_warnings)

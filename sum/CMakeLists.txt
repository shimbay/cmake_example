cmake_minimum_required(VERSION 3.10)

set(THIS "sum")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(${THIS})

set(CMAKE_CURRENT_BINARY_DIR ${CMAKE_BINARY_DIR}/sum)

print_variable(PROJECT_NAME)
print_variable(CMAKE_PROJECT_NAME)
print_variable(CMAKE_CURRENT_BINARY_DIR)

file(GLOB_RECURSE ${THIS}_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc")

add_library(${THIS} STATIC ${${THIS}_SRCS})
target_include_directories(${THIS} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)


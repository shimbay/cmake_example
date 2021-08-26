cmake_minimum_required(VERSION 3.10)

set(THIS "cmake_example")

project(${THIS})

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/module")
set(FETCHCONTENT_QUIET OFF CACHE BOOL "" FORCE)

file(GLOB_RECURSE ${THIS}_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc")
# file(REMOVE_RECURSE ${THIS}_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/sum/*.cc")

include(cmake/print.cmake)
include(cmake/variables.cmake)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/sum ${CMAKE_BINARY_DIR}/sum)
print_target_properties(sum)

find_package(gtest REQUIRED)
print_target_properties(gtest)

# header only
find_package(json REQUIRED)
print_target_properties(json)

add_executable(${THIS} ${${THIS}_SRCS})
target_link_libraries(${THIS} PRIVATE 
	sum
	gtest
	json
)

if(EXISTS "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json")
    execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json
        ${CMAKE_CURRENT_SOURCE_DIR}/compile_commands.json
    )
endif()


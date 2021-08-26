include(FetchContent)

FetchContent_Declare(
	gtest
	GIT_REPOSITORY	https://github.com/google/googletest.git
	GIT_TAG			703bd9caab50b139428cea1aaff9974ebee5742e # release-1.10.0
	SOURCE_DIR		${CMAKE_SOURCE_DIR}/third_party/gtest
)

if(NOT gtest_POPULATED)
	FetchContent_Populate(gtest)
	add_subdirectory(${gtest_SOURCE_DIR} ${CMAKE_BINARY_DIR}/gtest)
endif()

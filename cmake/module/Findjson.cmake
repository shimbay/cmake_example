include(FetchContent)

FetchContent_Declare(
	json_fc
	GIT_REPOSITORY	https://github.com/nlohmann/json.git
	GIT_TAG			9dfd91695cc66f9f90b97b4fd72d55f57adeccff # master
	SOURCE_DIR		${CMAKE_SOURCE_DIR}/third_party/json
)

if(NOT json_fc_POPULATED)
	FetchContent_Populate(json_fc)
endif()

message(${json_fc_SOURCE_DIR}/single_include/nlohmann)
include_directories(
	${json_fc_SOURCE_DIR}/single_include/nlohmann
)

## https://stackoverflow.com/questions/32183975/how-to-print-all-the-properties-of-a-target-in-cmake/56738858#56738858
## https://stackoverflow.com/a/56738858/3743145

## Get all properties that cmake supports
execute_process(COMMAND cmake --help-property-list OUTPUT_VARIABLE CMAKE_PROPERTY_LIST)
## Convert command output into a CMake list
STRING(REGEX REPLACE ";" "\\\\;" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
STRING(REGEX REPLACE "\n" ";" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")

list(REMOVE_DUPLICATES CMAKE_PROPERTY_LIST)

function(print_target_properties target)
    if(NOT TARGET ${target})
    	message(STATUS "There is no target named '${target}'")
    	return()
    endif()

	message("=== Properties of <${target}> begin ===")
    foreach(property ${CMAKE_PROPERTY_LIST})
        string(REPLACE "<CONFIG>" "${CMAKE_BUILD_TYPE}" property ${property})

        # Fix https://stackoverflow.com/questions/32197663/how-can-i-remove-the-the-location-property-may-not-be-read-from-target-error-i
        if(property STREQUAL "LOCATION" OR property MATCHES "^LOCATION_" OR property MATCHES "_LOCATION$")
            continue()
        endif()

        get_property(was_set TARGET ${target} PROPERTY ${property} SET)
        if(was_set)
            get_target_property(value ${target} ${property})
            message("${target} ${property} = ${value}")
        endif()
    endforeach()
	message("=== Properties of <${target}> end ===")
endfunction(print_target_properties)

function(print_variable var)
	# get_filename_component(<VAR> <FileName> <COMP> [BASE_DIR <BASE_DIR>] [CACHE])
	file(RELATIVE_PATH RL_PATH ${CMAKE_SOURCE_DIR} ${CMAKE_CURRENT_LIST_FILE})
	message("${var}:${PROJECT_NAME}@${RL_PATH} is ${${var}}")
endfunction()

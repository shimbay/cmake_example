# project name of current scope
print_variable(PROJECT_NAME)

# project name of top level scope
print_variable(CMAKE_PROJECT_NAME)

print_variable(CMAKE_MODULE_PATH)

# cmake source code dir
print_variable(CMAKE_SOURCE_DIR)

# cmake execute dir
print_variable(CMAKE_BINARY_DIR)

print_variable(CMAKE_CURRENT_SOURCE_DIR)

print_variable(CMAKE_CURRENT_BINARY_DIR)

print_variable(CMAKE_INSTALL_PREFIX)
print_variable(CMAKE_INSTALL_LIBDIR)
print_variable(CMAKE_INSTALL_BINDIR)

message("${CMAKE_CURRENT_LIST_DIR}")
message("${CMAKE_CURRENT_LIST_FILE}")
print_variable(CMAKE_CURRENT_LIST_DIR)

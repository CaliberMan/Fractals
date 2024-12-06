cmake_minimum_required(VERSION 3.15)
project(Fractals)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the executable
add_executable(Fractals main.cc)

# Include directories for dependencies (if any)
# include_directories(${CMAKE_SOURCE_DIR}/path/to/dependencies)

# Link libraries (if any)
# target_link_libraries(Fractals PRIVATE library_name)
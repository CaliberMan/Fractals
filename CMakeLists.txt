cmake_minimum_required(VERSION 3.15)
project(Fractals)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add ImGui
add_subdirectory(libs/imgui)
include_directories(${CMAKE_SOURCE_DIR}/libs/imgui)

find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIRS})

find_package(glfw3 3.3 REQUIRED)
include_directories(${GLFW_INCLUDE_DIRS})

# Add the executable
add_executable(Fractals main.cc)

# Link ImGui
target_link_libraries(Fractals PRIVATE imgui glfw OpenGL::GL)
cmake_minimum_required(VERSION 3.29.2)

project(Parashu LANGUAGES CXX)

message("PROJECT: ${PROJECT_NAME}")

find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS} onnxruntime)

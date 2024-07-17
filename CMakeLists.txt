cmake_minimum_required(VERSION 3.28.2)

project(Parashu)

message("PROJECT: ${PROJECT_NAME}")

find_package(OpenCV REQUIRED)

add_subdirectory(include)
add_subdirectory(src)

option(BUILD_EXAMPLES "Whether or not to build examples" ON)

if (BUILD_EXAMPLES)
    message("Building examples ...")
    add_subdirectory(example)
endif()

option(BUILD_MAIN "Whether or not to build main.cpp" OFF)

if (BUILD_MAIN)
    add_executable(${PROJECT_NAME} ${SOURCES} main.cpp)

    target_include_directories(${PROJECT_NAME} PUBLIC ${OpenCV_INCLUDE_DIRS})

    target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS} onnxruntime)
endif()

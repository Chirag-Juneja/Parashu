project(Parashu)

add_executable(videoStitch videoStitch.cpp)

target_link_libraries(
    videoStitch
    PRIVATE
    parashu
)

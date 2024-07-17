project(Parashu)
file(GLOB SOURCES "*.cpp")
add_library(parashu SHARED ${SOURCES})

target_include_directories(
    parashu 
    PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/../include
)
target_link_libraries(parashu ${OpenCV_LIBS})

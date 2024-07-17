#include <iostream>
#include <parashu/frameselector.hpp>

int main(int argc, char** argv){
    FrameSelector fs(10);
    fs.load("./assets/sample.mp4");
}

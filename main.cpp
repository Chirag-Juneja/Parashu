#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

int main(){
    std::string image_path = cv::samples::findFile("./assets/test.jpg");
    cv::Mat img = cv::imread(image_path,cv::IMREAD_COLOR);
    std::cout << image_path <<std::endl;        
}

#include <iostream>
#include <parashu/frameselector.hpp>

FrameSelector::FrameSelector(int batchSize){
    this->batchSize = batchSize;
}

std::vector<cv::Mat> FrameSelector::load(std::string videoPath){
    std::vector<cv::Mat> frames;
    cv::VideoCapture videoCapture(videoPath);

    while (videoCapture.isOpened()){
        cv::Mat frame;
        if(videoCapture.read(frame)) frames.push_back(frame);
        else break;
    }

    std::cout << "Frames captured: " << frames.size() << std::endl;  
    return frames; 
}

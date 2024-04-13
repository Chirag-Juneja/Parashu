#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <onnxruntime/core/session/onnxruntime_cxx_api.h>
//#include <onnxruntime_cxx_api.h>

int main(){
    // Initalize OpenCV
    
    std::string image_path = cv::samples::findFile("./assets/test.jpg");
    cv::Mat img = cv::imread(image_path,cv::IMREAD_COLOR);
    
    std::cout << image_path << "Is Empty? "<< img.empty() <<std::endl;        
    
    // Initialize OnnxRuntime
    std::string modelPath = "./assets/mnist.onnx";

    Ort::Env env;
    Ort::SessionOptions sessionOptions{nullptr};
    Ort::Session session{env, modelPath.c_str(), sessionOptions};

    Ort::MemoryInfo memoryInfo = Ort::MemoryInfo::CreateCpu(
            OrtAllocatorType::OrtArenaAllocator,
            OrtMemType::OrtMemTypeDefault);

    auto allocator = new Ort::Allocator(session,memoryInfo);

    std::cout<< session.GetInputNameAllocated(0,*allocator).get() << std::endl;    
    std::cout<< session.GetOutputNameAllocated(0,*allocator).get() << std::endl;    
}

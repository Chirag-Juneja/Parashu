#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

class FrameSelector{
    private:
        int batchSize;

    public:
        FrameSelector(int batchSize);
        std::vector<cv::Mat> load(std::string videoPath);
};

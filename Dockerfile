FROM ubuntu:22.04

ARG JOBS=8
ARG ONNXRUNTIME_VERSION=1.12.1
ARG OPENCV_VERSION=4.8.0

# Install Dependencies
RUN apt-get update 
RUN apt-get install -y \
    git \
    g++ \
    wget \
    unzip \
    python3.6 \
    python3-pip \
    pkg-config \
    libgtest-dev \
    libgl1-mesa-glx \
    ffmpeg \
    libavformat-dev \
    libavcodec-dev \
    libswscale-dev \
    gdb

RUN python3 -m pip install cmake pandas scikit-learn opencv-python PyYAML openpyxl

# Install onnxruntime
RUN cd /tmp && \
    git clone --depth 1 --branch v${ONNXRUNTIME_VERSION} --recursive https://github.com/Microsoft/onnxruntime.git 

RUN cd tmp/onnxruntime && \
    ./build.sh --config RelWithDebInfo --build_shared_lib --parallel ${JOBS} && \
    cd build/Linux/RelWithDebInfo/ && \
    make install && \
    rm -rf /tmp/onnxruntime

# Install OpenCV
RUN cd /tmp && \
    wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip && \
    wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.x.zip && \
    unzip opencv.zip && \
    unzip opencv_contrib.zip && \
    mkdir -p build && cd build && \
    cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.x/modules ../opencv-4.x && \
    cmake --build . -j ${JOBS} && \
    make install  

RUN cd /tmp && rm -r opencv-4.x opencv_contrib-4.x build opencv.zip opencv_contrib.zip

RUN cp /usr/local/include/onnxruntime/core/session/* /usr/local/include


FROM ubuntu:latest

ARG JOBS=8
ARG ONNXRUNTIME_VERSION=1.12.1
ARG OPENCV_VERSION=4.8.0

# Install Dependencies
RUN apt-get update && apt-get install -y git \
    python3.6 \
    python3-pip \
    pkg-config \
    libgtest-dev 
RUN python3 -m pip install cmake

# Install onnxruntime
RUN cd /tmp && \
    git clone --depth 1 --branch v${ONNXRUNTIME_VERSION} https://github.com/Microsoft/onnxruntime.git && \
    cd onnxruntime && \
    ./build.sh --config RelWithDebInfo --build_shared_lib --parallel ${JOBS} && \
    cd build/Linux/RelWithDebInfo/ && \
    make install && \
    rm -rf /tmp/onnxruntime

# Install OpenCV
RUN cd /tmp && \
    git clone --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv && \
    git clone --depth 1 --branch ${OPENCV_VERSION} https://github.com/opencv/opencv_contrib && \
    mkdir -p build && cd build && \
    cmake -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        ../opencv && \
    cmake --build . -j ${JOBS} && \
    make install && \
    cd .. && rm -r opencv opencv_contrib



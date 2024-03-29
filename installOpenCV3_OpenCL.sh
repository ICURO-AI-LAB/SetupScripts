sudo apt-get update

sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool \
                           build-essential cmake-qt-gui \
                           make cmake cmake-curses-gui g++ \
                           libglew-dev libtiff-dev zlib1g-dev libjpeg-dev libpng-dev \
                           libjasper-dev libavcodec-dev libavformat-dev libavutil-dev \
                           libpostproc-dev libswscale-dev libeigen3-dev libtbb-dev \
                           libgtk2.0-dev \
                           cmake \
                           pkg-config

sudo apt-get install -y python-dev python-numpy python-py python-pytest \
                           python3-dev python3-numpy python3-py python3-pytest \
                           libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
   
git clone https://github.com/opencv/opencv.git
   
cd opencv
git checkout -b v3.3.1 3.3.1
cd ~/opencv
mkdir build
cd build
   
cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_PNG=OFF \
    -DBUILD_TIFF=OFF \
    -DBUILD_TBB=OFF \
    -DBUILD_JPEG=OFF \
    -DBUILD_JASPER=OFF \
    -DBUILD_ZLIB=OFF \
    -DBUILD_opencv_java=OFF \
    -DBUILD_opencv_python2=ON \
    -DBUILD_opencv_python3=ON \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DWITH_OPENCL=ON \
    -DWITH_OPENMP=OFF \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=ON \
    -DWITH_GSTREAMER_0_10=OFF \
    -DWITH_CUDA=OFF \
    -DWITH_GTK=ON \
    -DWITH_VTK=OFF \
    -DWITH_OPENVX=ON \
    -DWITH_TBB=ON \
    -DWITH_1394=OFF \
    -DWITH_OPENEXR=OFF \
    ../
   
make -j$(nproc)
sudo make install
sudo ldconfig

echo "export CMAKE_PREFIX_PATH=/usr/local:$CMAKE_PREFIX_PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> ~/.bashrc

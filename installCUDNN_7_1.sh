#!/bin/bash

# Make a directory for downloading CUDNN
cd $HOME
mkdir cudnn
cd cudnn

# Download CUDNN from this Dropbox link
wget -o cudnn-9.0-linux-x64-v7.1.tgz https://www.dropbox.com/s/6e42w8sg1q7n873/cudnn-9.0-linux-x64-v7.1.tgz?dl=1

# Expand the .tar file
tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz

# Copy the following files into the CUDA Toolkit directory
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h

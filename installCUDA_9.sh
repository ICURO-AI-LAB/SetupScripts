#!/bin/bash

# Download CUDA 9.0 from NVIDIA
cd ~
mkdir cuda-9.0
cd cuda-9.0
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb

# Rename the file from *-deb to *.deb
mv cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb

# Unpack and install CUDA 9.0
sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

# Add these lines to ~/.bashrc
echo "# Fix CUDA Path and Links" >> ~/.bashrc
echo "export PATH=/usr/local/cuda-9.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"  >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:" >> ~/.bashrc

echo "CUDA 9.0 Installed!"

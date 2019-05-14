#!/bin/bash

#This shell script is written based on the instructions given in the ROS website.
#Visit http://wiki.ros.org/kinetic/Installation/Ubuntu to read more

# Install some pre-requisites
sudo apt-get update
sudo apt-get install software-properties-common lsb-release

# Configure your Ubuntu repositories
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted


# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Installation
sudo apt-get update

# Desktop-Full Install: (Recommended) : ROS, rqt, rviz, robot-generic libraries, 
# 2D/3D simulators, navigation and 2D/3D perception
yes | sudo apt-get install ros-kinetic-desktop-full

# Desktop Install: ROS, rqt, rviz, and robot-generic libraries
# yes | sudo apt-get install ros-kinetic-desktop

# ROS-Base: (Bare Bones) ROS package, build, and communication libraries. No GUI tools.
# yes | sudo apt-get install ros-kinetic-ros-base

# Individual Package: You can also install a specific ROS package 
# (replace underscores with dashes of the package name):
# sudo apt-get install ros-kinetic-PACKAGE
# Example: sudo apt-get install ros-kinetic-slam-gmapping
# To find available packages, use:
# apt-cache search ros-kinetic

# Initialize rosdep
sudo rosdep init
rosdep update

# Environment setup
# It's convenient if the ROS environment variables are automatically added to your 
#bash session every time a new shell is launched:

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# If you just want to change the environment of your current shell, instead of the above you can type:
# source /opt/ros/kinetic/setup.bash

# Dependencies for building packages
yes | sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

#In case permission to ~/.ros are not set up
sudo rosdep fix-permissions

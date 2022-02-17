#!/bin/bash

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update

sudo apt install -y ros-noetic-desktop-full

source /opt/ros/noetic/setup.bash
echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc
echo 'alias cm="cd ~/catkin_ws; catkin_make"' >> ~/.bashrc
source ~/.bashrc


sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

sudo apt install python3-rosdep

sudo rosdep init
rosdep update

echo 'mkdir -p ~/catkin_ws/src && cd ~/catkin_ws/src;'
mkdir -p ~/catkin_ws/src && cd ~/catkin_ws/src;
catkin_init_workspace
cd ~/catkin_ws/ && catkin_make
cm
source 'devel/setup.bash'


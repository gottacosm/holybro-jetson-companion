#!/bin/bash

set -e
LOGFILE="setup_mavsdk.log"

exec > >(tee -i $LOGFILE)
exec 2>&1

echo "Installing MAVSDK..."
pip3 install mavsdk

echo "Setting up PX4 ROS2 workspace..."
mkdir -p ~/ws_sensor_combined/src/
cd ~/ws_sensor_combined/src/
git clone https://github.com/PX4/px4_msgs.git
git clone https://github.com/PX4/px4_ros_com.git
cd ..
source /opt/ros/humble/setup.bash
colcon build

echo "MAVSDK and ROS2 workspace setup completed."
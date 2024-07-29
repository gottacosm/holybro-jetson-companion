
# Holybro Pixhawk and Jetson Orin Setup Guide

This repository contains bash scripts to help you set up a Holybro Pixhawk with a Jetson Orin carrier board on PX4.

## Prerequisites

- Ubuntu 22.04
- SSH access
- Required hardware components

## Usage

1. **Clone this repository:**

   ```bash
   git clone https://github.com/yourusername/holybro_pixhawk_jetson_setup.git
   cd holybro_pixhawk_jetson_setup
   ```

2. **Run the setup scripts:**

   ```bash
   ./setup_environment.sh
   ./flash_jetson.sh
   ./install_px4.sh
   ./install_ros2.sh
   ./setup_mavsdk.sh
   ./setup_xrce_dds.sh
   ```

## Scripts Overview

- `setup_environment.sh`: Sets up the environment and installs necessary packages.
- `flash_jetson.sh`: Flashes the Jetson board.
- `install_px4.sh`: Installs PX4.
- `install_ros2.sh`: Installs ROS2.
- `setup_mavsdk.sh`: Sets up MAVSDK and ROS2 workspace.
- `setup_xrce_dds.sh`: Installs and sets up XRCE-DDS agent.

## Logs

Each script logs its output to a file in the current directory, named after the script (e.g., `setup_environment.log`).

## License

MIT License

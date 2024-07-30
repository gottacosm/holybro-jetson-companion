#!/bin/bash

# This script sets up the Micro XRCE Agent as a systemd service on a Jetson device.
# It supports both serial and ethernet configurations.
#
# Usage:
#   ./setup_microxrceagent.sh {serial|ethernet}
#
# Arguments:
#   serial   - Sets up the service for serial communication
#   ethernet - Sets up the service for ethernet communication
#
# The script performs the following steps:
# 1. Creates a systemd service file with the appropriate configuration
# 2. Reloads the systemd daemon to recognize the new service
# 3. Enables the service to start at boot
# 4. Starts the service immediately and shows its status
#
# For serial configuration, the following parameters are used:
#   Device: /dev/ttyTHS1
#   Baudrate: 921600
#
# For ethernet configuration, the following parameters are used:
#   Transport: udp4
#   Port: 8888

# Define variables
SERVICE_FILE="/etc/systemd/system/microxrceagent.service"
SERVICE_NAME="microxrceagent.service"
USER_BIN_PATH="/usr/bin/MicroXRCEAgent"
TRANSPORT="udp4"
PORT=8888
DEVICE="/dev/ttyTHS1"
BAUDRATE=921600

# Function to create the service file
create_service_file() {
    echo "Creating systemd service file..."
    sudo bash -c "cat > $SERVICE_FILE <<EOF
[Unit]
Description=Micro XRCE Agent Service
After=network.target

[Service]
ExecStart=$USER_BIN_PATH $1 $2
Restart=always
User=root
Group=root

[Install]
WantedBy=multi-user.target
EOF"
}

# Check for arguments to determine the transport type
if [[ $1 == "serial" ]]; then
    create_service_file "serial --dev $DEVICE -b $BAUDRATE"
elif [[ $1 == "ethernet" ]]; then
    create_service_file "udp4 -p $PORT"
else
    echo "Usage: $0 {serial|ethernet}"
    exit 1
fi

# Reload systemd, enable and start the service
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Enabling $SERVICE_NAME..."
sudo systemctl enable $SERVICE_NAME

echo "Starting $SERVICE_NAME..."
sudo systemctl start $SERVICE_NAME

echo "Service status:"
sudo systemctl status $SERVICE_NAME

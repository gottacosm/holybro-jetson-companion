#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
LOGFILE="setup_environment.log"

exec > >(tee -i $LOGFILE)
exec 2>&1

echo "Updating package list and installing required packages..."
sudo apt update && sudo apt install -y sshpass abootimg

echo "Environment setup completed."
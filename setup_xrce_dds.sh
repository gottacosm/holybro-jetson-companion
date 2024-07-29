#!/bin/bash

set -e
LOGFILE="setup_xrce_dds.log"

exec > >(tee -i $LOGFILE)
exec 2>&1

echo "Installing XRCE-DDS agent..."
git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build && cd build
cmake ..
make -j4

echo "Built target uagent"

sudo make install
sudo ldconfig /usr/local/lib/

echo "Setting up XRCE-DDS agent..."
sudo MicroXRCEAgent udp4 -p 8888

echo "XRCE-DDS setup completed."
#!/bin/bash

set -e
LOGFILE="flash_jetson.log"

exec > >(tee -i $LOGFILE)
exec 2>&1

echo "Flashing the Jetson board..."
# Your flashing commands go here
# For example:
# sdkmanager --cli install --targetos Linux --target JETSON_XAVIER_NX_TARGETS --flash

echo "Jetson board flashed successfully."
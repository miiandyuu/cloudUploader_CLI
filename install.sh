#!/bin/bash

# Specify the installation directory (change this as needed)
INSTALL_DIR="/usr/local/bin"

# Ensure the installation directory exists
sudo mkdir -p $INSTALL_DIR

# Copy the main script to the installation directory
sudo cp azureuploader.sh $INSTALL_DIR

# Make the script executable
sudo chmod +x $INSTALL_DIR/azureuploader.sh

echo "Azure Blob Storage Upload Tool has been installed to $INSTALL_DIR."
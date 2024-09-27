#!/bin/bash

echo "Enabling 32-bit architecture..."
sudo dpkg --add-architecture i386

echo "Adding the WineHQ repository..."
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources

echo "Updating package lists..."
sudo apt update

echo "Attempting to fix broken dependencies..."
sudo apt --fix-broken install

echo "Installing missing dependencies..."
sudo apt install libgd3:i386

echo "Installing Wine and required packages..."
sudo apt install --install-recommends winehq-stable

echo "Verifying Wine installation..."
wine --version

echo "Wine installation complete. To run a .exe file, use: wine filename.exe"

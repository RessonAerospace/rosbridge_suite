#!/bin/bash

# Check if python3-vcstool is installed; If not, attempt installing it
if ! (grep -q "python3-vcstool" <(dpkg -l)) ; then
    echo "Installing python3-vcstool"
    sudo apt install -y python3-vcstool
else
    echo "python3-vcstool already installed."
fi

# Attempt to clone dependency repos as specified by deps.repos file
echo "Importing dependency repos"
vcs import --input deps.repos .
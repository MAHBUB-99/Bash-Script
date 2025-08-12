#!/bin/bash

read -p "Enter filename to check if it exists or not: " fn

if [ -s "$(pwd)/$fn" ]; then
    echo "File exists and is not empty."
else
    echo "File does not exist or is empty."
fi
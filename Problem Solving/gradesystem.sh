#!/bin/bash

read -p "Enter your score: " score

if [ $score -ge 80 ]; then
    echo "A+"
elif [ $score -ge 70 ]; then
    echo "A"
elif [ $score -ge 60 ]; then
    echo "B"
else
    echo "Failed"
fi
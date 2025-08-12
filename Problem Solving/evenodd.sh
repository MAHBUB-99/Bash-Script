!#/bin/bash
# evenodd.sh - A script to check if a number is even or odd

read -p "Enter a number to Check even or Odd: " num

if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid integer."
    exit 1
fi

if (( num % 2 == 0 )); then
    echo "$num is even"
else
    echo "$num is odd"
fi
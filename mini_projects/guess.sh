#!/bin/bash

secret=$((RANDOM % 20 +1))
max_attempts=5


echo "Welcome to the Guessing Game!"
echo "You have $max_attempts attempts to guess the number."
echo "Guess a number between 1 to 20"

for ((i=1;i<=$max_attempts;i++));do
    read -p "Attempt $i: guess the number: " guess

    if ! [[ $guess =~ ^[0-9]+$ ]];then
        echo "Please enter a valid number between 1 and 20."
        ((i--))  # Do not count this as a valid attempt
        continue
    fi

    if [[ $guess -eq $secret ]]; then
        echo "🎉 Congratulations! You guessed the Correct Number!"
        exit 0 

    elif [[ $guess -lt $secret ]]; then
        echo "Your guess is too low 🔽. Try again!"

    else
        echo "Your guess is too high 🔼 . Try again!"

    fi
done

echo "😢 Out of tries! The number was: $secret"
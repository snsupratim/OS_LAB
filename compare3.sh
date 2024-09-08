#!/bin/bash

# Prompt the user to enter three numbers separated by spaces
echo "Enter three numbers separated by spaces: "
read num1 num2 num3

# Check if any of the inputs are not numbers
if ! [[ "$num1" =~ ^[0-9]+$ ]] || ! [[ "$num2" =~ ^[0-9]+$ ]] || ! [[ "$num3" =~ ^[0-9]+$ ]]; then
    echo "Please enter valid numbers."
    exit 1
fi

# Find the second highest number
if [ "$num1" -gt "$num2" ] && [ "$num1" -gt "$num3" ]; then
    if [ "$num2" -gt "$num3" ]; then
        second_highest="$num2"
    else
        second_highest="$num3"
    fi
elif [ "$num2" -gt "$num1" ] && [ "$num2" -gt "$num3" ]; then
    if [ "$num1" -gt "$num3" ]; then
        second_highest="$num1"
    else
        second_highest="$num3"
    fi
else
    if [ "$num1" -gt "$num2" ]; then
        second_highest="$num1"
    else
        second_highest="$num2"
    fi
fi

echo "The second highest number is: $second_highest"

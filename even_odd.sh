#!/bin/bash

# Function to check if a number is even or odd
check_even_odd() {
    if [ $(($1 % 2)) -eq 0 ]; then
        echo "$1 is even"
    else
        echo "$1 is odd"
    fi
}

# Prompt the user to enter the first value
echo "Enter the first value: "
read num1

# Prompt the user to enter the second value
echo "Enter the second value: "
read num2

# Check if the first value is even or odd
check_even_odd $num1

# Check if the second value is even or odd
check_even_odd $num2

#!/bin/bash

# Check if a command line argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Initialize the sum variable
sum=0

# Read the number from the command line argument
number=$1

# Loop through each digit of the number
while [ $number -gt 0 ]; do
    # Get the last digit of the number
    digit=$(( number % 10 ))
    # Add the digit to the sum
    sum=$(( sum + digit ))
    # Remove the last digit from the number
    number=$(( number / 10 ))
done

# Print the sum of the digits
echo "The sum of the digits is: $sum"

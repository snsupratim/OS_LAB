#!/bin/bash

# Function to calculate factorial
factorial() {
    num=$1
    result=1
    counter=1
    
    while [ $counter -le $num ]; do
        result=$((result * counter))
        counter=$((counter + 1))
    done
    
    echo "Factorial of $num is $result"
}

# Prompt user for input
read -p "Enter a number: " number

# Check if the input is a non-negative integer
if [[ $number =~ ^[0-9]+$ ]]; then
    factorial $number
else
    echo "Please enter a non-negative integer."
fi

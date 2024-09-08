#!/bin/bash

# Prompt the user to enter the first value
echo "Enter the first value (a): "
read a

# Prompt the user to enter the second value
echo "Enter the second value (b): "
read b

# Compare the values
if [ "$a" -gt "$b" ]; then
    echo "$a is greater than $b"
elif [ "$b" -gt "$a" ]; then
    echo "$b is greater than $a"
else
    echo "Both values are equal"
fi

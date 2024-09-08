#!/bin/bash

# Initialize the array
arr=(10 8 20 100 12)

# Print the original array
echo "Original array: ${arr[*]}"

# Perform bubble sort
for ((i = 0; i < 5; i++)); do
    for ((j = 0; j < 5 - i - 1; j++)); do
        if [[ ${arr[$j]} -gt ${arr[$((j + 1))]} ]]; then
            # Swap elements
            temp=${arr[$j]}
            arr[$j]=${arr[$((j + 1))]}
            arr[$((j + 1))]=$temp
        fi
    done
done

# Print the sorted array
echo "Sorted array: ${arr[*]}"

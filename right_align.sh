#!/bin/bash

# Function to print right-aligned pyramid
right_aligned_pyramid() {
    rows=$1
    
    for ((i=1; i<=rows; i++)); do
        # Print spaces for alignment
        for ((k=i; k<rows; k++)); do
            echo -n " "
        done
        
        # Print asterisks
        for ((j=1; j<=i; j++)); do
            echo -n "*"
        done
        echo ""
    done
}

# Usage
right_aligned_pyramid 4

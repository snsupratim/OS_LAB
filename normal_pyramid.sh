#!/bin/bash

# Function to print normal pyramid
normal_pyramid() {
    rows=$1
    
    for ((i=1; i<=rows; i++)); do
        # Print spaces for alignment
        for ((k=i; k<rows; k++)); do
            echo -n " "
        done
        
        # Print asterisks
        for ((j=1; j<=(2*i-1); j++)); do
            echo -n "*"
        done
        echo ""
    done
}

# Usage
normal_pyramid 4

#!/bin/bash

# Function to print left-aligned pyramid
left_aligned_pyramid() {
    rows=$1
    
    for ((i=1; i<=rows; i++)); do
        for ((j=1; j<=i; j++)); do
            echo -n "* "
        done
        echo ""
    done
}

# Usage
left_aligned_pyramid 4

#!/bin/bash

while true; do
    echo "Menu:"
    echo "1) Copy a file"
    echo "2) Remove a file"
    echo "3) Move a file"
    echo "4) Rename a file"
    echo "5) Exit"
    read -p "Please choose an option [1-5]: " choice

    case $choice in
        1)
            read -p "Enter the source file: " src_file
            read -p "Enter the target directory: " target_dir
            if [ -e "$src_file" ]; then
                if [ -d "$target_dir" ]; then
                    cp "$src_file" "$target_dir"
                    echo "File copied successfully."
                else
                    echo "Target directory does not exist."
                fi
            else
                echo "Source file does not exist."
            fi
            ;;
        2)
            read -p "Enter the file to remove: " file_to_remove
            if [ -e "$file_to_remove" ]; then
                rm "$file_to_remove"
                echo "File removed successfully."
            else
                echo "File does not exist."
            fi
            ;;
        3)
            read -p "Enter the file to move: " file_to_move
            read -p "Enter the target location: " target_location
            if [ -e "$file_to_move" ]; then
                mv "$file_to_move" "$target_location"
                echo "File moved successfully."
            else
                echo "File does not exist."
            fi
            ;;
        4)
            read -p "Enter the current filename: " current_filename
            read -p "Enter the new filename: " new_filename
            if [ -e "$current_filename" ]; then
                mv "$current_filename" "$new_filename"
                echo "File renamed successfully."
            else
                echo "File does not exist."
            fi
            ;;
        5)
            echo "Exiting."
            break
            ;;
        *)
            echo "Invalid option. Please choose again."
            ;;
    esac
done

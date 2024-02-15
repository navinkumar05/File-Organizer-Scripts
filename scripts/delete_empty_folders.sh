#!/bin/bash

# Function to delete all empty folders recursively
delete_empty_folders() {
    local directory="$1"

    # Iterate over directories in the current directory
    for dir in "$directory"/*/; do
        # Check if the directory is empty
        if [ -z "$(ls -A "$dir")" ]; then
            # Delete the empty directory
            rmdir "$dir" >/dev/null 2>&1
            echo "Deleted empty folder: $dir"
        else
            # Recursively delete empty folders inside this directory
            delete_empty_folders "$dir"
        fi
    done
}

# Main script
main() {
    local parent_dir="$(pwd)"  # Use current directory as the parent directory
	# parent_dir="Enter your path to run this script"
    # example,
	# parent_dir="/c/Users/navin/Downloads/New folder"

    # Call the function to delete empty folders recursively
    delete_empty_folders "$parent_dir"
    echo "All empty folders deleted in: $parent_dir"
}

# Call the main function
main
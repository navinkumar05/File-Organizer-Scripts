#!/bin/bash

# Function to move files from subdirectories to their parent directory
move_files_to_parent() {
    local directory="$1"
    # Move files to parent directory
    find "$directory" -mindepth 2 -type f -exec mv -i -t "$directory" {} +
}

# Main script
main() {
    local parent_dir="$(pwd)"  # Use current directory as the parent directory
	# parent_dir="Enter your path to run this script"
    # example,
	# parent_dir="/c/Users/navin/Downloads/New folder"

    # Move files to parent directory
    move_files_to_parent "$parent_dir"
    echo "Files moved successfully to $parent_dir"
}

# Call the main function
main
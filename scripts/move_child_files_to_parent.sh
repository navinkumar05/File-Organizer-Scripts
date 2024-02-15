#!/bin/bash

# Function to move files from immediate child directories to their parent directory
move_files_to_parent() {
    local directory="$1"
    # Move files to parent directory
    find "$directory"/* -mindepth 1 -maxdepth 1 -type f -exec mv -i -t "$directory" {} +
}

# Main script
main() {
    local parent_dir="$(pwd)"  # Use current directory as the parent directory
    # local parent_dir="Enter your path to run this script"
    # example,
    # local parent_dir="/c/Users/navin/Downloads/New folder"

    # Move files from immediate child directories to parent directory
    move_files_to_parent "$parent_dir"
    echo "Files moved successfully to $parent_dir"
}

# Call the main function
main
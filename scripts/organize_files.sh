#!/bin/bash

# Function to organize files in the directory based on their extensions
fileOrganise() {
    local directory="$1"

    # Iterate over files in the directory
    for element in "$directory"/*; do
        # Check if it's a file
        if [ -f "$element" ]; then
            # Get the file extension
            file_extension="${element##*.}"
            # Create directory if not exists
            destDir="$directory/$file_extension"
            mkdir -p "$destDir"
            # Move the file to the corresponding directory
            mv "$element" "$destDir"
        fi
    done
}

# Main script
main() {
    local parent_dir="$(pwd)"  # Use current directory as the parent directory
	# parent_dir="Enter your path to run this script"
    # example,
	# parent_dir="/c/Users/navin/Downloads/New folder"
    
    # Call the function to organize files
    fileOrganise "$parent_dir"
    echo "Files organized successfully in $parent_dir"
}

# Call the main function
main

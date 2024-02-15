import os
import shutil

def fileOrganise(directory):
    # Iterate over files in the directory
    for element in os.listdir(directory):
        # Get the full path of the element
        full_path = os.path.join(directory, element)
        # Check if it's a file
        if os.path.isfile(full_path):
            # Split the file name based on the '.' delimiter and extract the last part
            parts = element.split(".")
            file_extension = parts[-1]
            # Create directory if not exists
            destDir = os.path.join(directory, file_extension)
            os.makedirs(destDir, exist_ok=True)
            # Move the file to the corresponding directory
            shutil.move(full_path, destDir)

if __name__ == '__main__':
    directory = os.getcwd()
    # directory = r"Enter your path to run this script"
    # example,
    # directory = r"C:\Users\navin\Downloads\New folder"
    fileOrganise(directory)
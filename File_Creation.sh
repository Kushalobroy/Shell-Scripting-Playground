#!/bin/bash

# Asking for the file name
echo "Enter the name of the file to create (without extension):"
read filename

# Creating the file and adding content
echo "Enter the content you want to add to the file:"
read content

# Create the file and write content into it
echo "$content" > "${filename}.txt"

# Confirm the file is created
echo "File '${filename}.txt' created successfully with the following content:"
cat "${filename}.txt"

# Listing all files to confirm creation
echo "Here is the list of all files in the current directory:"
ls

# Pause before exit
echo "Press Enter to exit..."
read

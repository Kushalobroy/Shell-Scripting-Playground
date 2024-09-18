#!/bin/bash

# A simple shell script to demonstrate basic functionalities

# Printing a welcome message
echo "Welcome to your first shell script!"

# Asking for user input
echo "Please enter your name:"
read user_name

# Greeting the user
echo "Hello, $user_name! Let's explore some basic shell script functionalities."

# Displaying the current date and time
echo "Current date and time: $(date)"

# Checking if a directory exists
echo "Checking if a directory exists:"
directory_name="test_directory"

if [ -d "$directory_name" ]; then
  echo "Directory '$directory_name' exists."
else
  echo "Directory '$directory_name' does not exist. Creating it now."
  mkdir "$directory_name"
  echo "Directory '$directory_name' created."
fi

# Listing the contents of the current directory
echo "Here are the contents of your current directory:"
ls -l



# Ending the script
echo "This was a simple demonstration of shell scripting. Goodbye!"

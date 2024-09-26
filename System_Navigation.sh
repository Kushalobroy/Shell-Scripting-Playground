#!/bin/bash

echo "Welcome to the System Navigation Automation Script!"
echo "Choose an option:"
echo "1. List current directory contents (ls)"
echo "2. Display current directory path (pwd)"
echo "3. Change directory (cd)"
echo "4. Create a new directory (mkdir)"
echo "5. Delete a directory (rmdir)"
echo "6. Create a new file (touch)"
echo "7. Delete a file (rm)"
echo "8. Display file contents (cat)"
echo "9. Exit"

while true; do
    read -p "Enter your choice: " choice
    case $choice in
        1) 
            echo "Listing directory contents..."
            ls -la
            ;;
        2) 
            echo "Current directory path:"
            pwd
            ;;
        3) 
            read -p "Enter the directory you want to change to: " dir
            if cd "$dir" 2>/dev/null; then
                echo "Changed to directory: $dir"
            else
                echo "Directory does not exist!"
            fi
            ;;
        4) 
            read -p "Enter the name of the directory you want to create: " newdir
            mkdir "$newdir"
            echo "Directory '$newdir' created!"
            ;;
        5) 
            read -p "Enter the name of the directory you want to delete: " deldir
            if rmdir "$deldir" 2>/dev/null; then
                echo "Directory '$deldir' deleted!"
            else
                echo "Directory could not be deleted or does not exist!"
            fi
            ;;
        6) 
            read -p "Enter the name of the file you want to create: " newfile
            touch "$newfile"
            echo "File '$newfile' created!"
            ;;
        7) 
            read -p "Enter the name of the file you want to delete: " delfile
            if rm "$delfile" 2>/dev/null; then
                echo "File '$delfile' deleted!"
            else
                echo "File does not exist!"
            fi
            ;;
        8) 
            read -p "Enter the file name to display contents: " filename
            if [ -f "$filename" ]; then
                cat "$filename"
            else
                echo "File does not exist!"
            fi
            ;;
        9) 
            echo "Exiting the script. Goodbye!"
            break
            ;;
        *) 
            echo "Invalid option, please try again!"
            ;;
    esac
done

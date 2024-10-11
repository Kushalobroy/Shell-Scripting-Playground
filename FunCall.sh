#!/usr/bin/env bash

function Hello() {
  local LNAME=$1
  echo "Hello $LNAME"
}

Goodbye() {
  echo "Goodbye $1"
}

echo "Calling the Hello function"
Hello Bob

echo "Calling the Goodbye function"
Goodbye Robert
# Pause the script before exit
echo "Press Enter to exit..."
read  # This will keep the terminal open until you press Enter
exit 0

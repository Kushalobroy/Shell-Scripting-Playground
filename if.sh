#!/usr/bin/env bash
echo "Enter Color :"
read COLOR
if [ $COLOR = "blue" ]
then
  echo "The color is blue"
else
  echo "The color is NOT blue"
fi

echo "Enter a Number :"
read USER_GUESS
COMPUTER=50

if [ $USER_GUESS -lt $COMPUTER ]
then
  echo "You're too low"
else
  echo “You’re equal or too high”
fi

# Pause the script before exit
echo "Press Enter to exit..."
read  # This will keep the terminal open until you press Enter


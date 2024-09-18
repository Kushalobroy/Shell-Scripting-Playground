#!/bin/bash
echo "Date"
date
echo "Uptime"
uptime
echo "Memory Usage"
free -m
echo "Network Usage"
ip a

# Pause the script before exit
echo "Press Enter to exit..."
read  # This will keep the terminal open until you press Enter
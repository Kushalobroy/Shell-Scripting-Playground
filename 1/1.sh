#!/bin/bash

awk 'BEGIN { FS="\\|" } { if ($3 > 50) print }' data.txt

echo "Press Enter to exit..."
read

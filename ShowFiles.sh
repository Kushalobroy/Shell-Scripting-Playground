#!/usr/bin/env bash
function GetFiles() {
  FILES=`ls -1 | sort | head -15`
}

function ShowFiles(){
  local COUNT=1
  for FILE in $@
  do
    echo "FILE #$COUNT = $FILE"
    ((COUNT++))
  done
}

GetFiles
ShowFiles $FILES
# Pause the script before exit
echo "Press Enter to exit..."
read  # This will keep the terminal open until you press Enter
exit 0

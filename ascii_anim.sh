#!/bin/bash

file=datboi.txt
speed=0.1
repeat=false
num='^[0-9]+([.][0-9]+)?$'

while getopts ":rs:f:" opt; do
  case $opt in
    r)
      repeat=true
      ;;
    s)
      speed=$OPTARG
      ;;
    f)
      file=$OPTARG
      ;;
    \?)
      echo -e "Invalid option -$OPTARG. Allowed options are as follows: \n\t-f which is required to pass in the file to animate (requires parameter)\n\t-r for repeating\n\t-s for changing speed (requires parameter)"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done

if [[ ! $speed =~ $num ]]; then
  echo "$speed is not a valid speed."
  exit 1
fi

if [ ! -f $file ]; then
  echo "$file does not exist!"
  exit 1
fi

# Get number of lines in file
line_num=$(wc -l $file | awk {'print $1'})
# Read first line of file to get page size
page_lines=$(head -n 1 $file)
# Get length of longest line
long_line=$(awk '{print length, $0}' $file | sort -nr | head -1 |  awk {'print $1'})
# Set the width for shell
let screen_w=long_line+2
# Set the height for shell
let screen_h=page_lines+1
# Resize shell to screen_w x screen_h
printf "\e[8;${screen_h};${screen_w}t"

# Reposition terminal
#printf '\e[3;500;100t'

clear

if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

while (true)
do
  # Set variables for range of lines to print
  start_line=2  # Numbered starting from 1, Line 1 is page_lines #
  let end_line=page_lines+1
  buffer=0

  # While loop runs until the first line to print exceeds the number of file lines
  while [ $start_line -lt $line_num ]
  do
    keypress="`cat`"
    if [ "x$keypress" != "xq" ]
    then
      # If the last line to print exceeds the number of lines in the file, calculates the overflow and stores it in buffer var. Also sets end_line var to number of file lines
      if [ $end_line -ge $line_num ]
      then
        let buffer=end_line-line_num
        let end_line=line_num
      fi

      # Prints every 0.1 seconds
      sleep $speed
      # Prints a range of lines. Lines are numbered from 1 onward, with sed printing [i, j)
      sed -n "${start_line},${end_line}p" $file
      # If buffer is not 0, then we reached end of file and there wasn't enough to fill the screen, print new lines
      while [ $buffer -gt 0 ]
      do
        printf "\n"
        let buffer=buffer-1
      done

      # Increment start and end line ranges
      let start_line=start_line+page_lines
      let end_line=end_line+page_lines
    else
      break
    fi
  done

  if [ "x$keypress" == "xq" ]; then break
  elif [ "$repeat" == true ]; then continue
  else break
  fi

done


# The stty -echo option makes the shell stop displaying what you type with -echo
stty echo

#!/bin/bash

file=$1

# Get number of liens in file
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

clear

# Set variables for range of lines to print
start_line=2  # Numbered starting from 1, Line 1 is page_lines #
let end_line=page_lines+1
buffer=0

# While loop runs until the first line to print exceeds the number of file lines
while [ $start_line -lt $line_num ]
do
  # If the last line to print exceeds the number of lines in the file, calculates the overflow and stores it in buffer var. Also sets end_line var to number of file lines
  if [ $end_line -ge $line_num ]
  then
    let buffer=end_line-line_num
    end_line=line_num
  fi

  # Prints every 0.1 seconds
  sleep 0.1
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
done

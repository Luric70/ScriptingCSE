#!/bin/bash

#Checks for CLI args: src dest
if [ ! -d $1 ]; then
    echo "<src-dir> not found"
    exit 0
fi
if [[ $1 == "" || $2 == "" ]]; then
  echo "src and dest dirs missing" 
  exit 1
fi

mkdir -p $2 #create dest. dir
for dir in $(find $1 -type d); do #loops through all dir. in src
    subdir="$2${dir#$1}" #add relative path to destination subdirectory
    mkdir -p "$subdir"   #create subdir path in dest.

    content=("$dir"/*.c) #takes c files
    if [ -e ${content[0]} ]; then #only run if a c file exists
        count=${#content[@]}

        if [ $count -gt 3 ]; then #more than 3 files, prompt user
            echo "Directory $dir has over 3 .c files"
            for file in ${content[@]}; do
                echo "$file"
                read -p "Do you wish to move this file? (y/n): " confirm
                if [[ $confirm == "y" || $confirm == "Y" ]]; then
                    mv $file "$subdir/"
                    echo "Moved $file"
                else
                    echo "Skipping $file"
                fi
            done
        else #less than 3 files, move automatically
            for file in ${content[@]}; do
                mv $file "$subdir/"
            done
            echo "Moved .c files from $dir to $subdir"
        fi
    fi
done

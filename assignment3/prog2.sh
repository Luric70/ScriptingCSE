#!/bin/bash

#$1 $2 are input/output
#Checks for: input file doesn't exist, file input/output not given
if [ ! -f $1 ]; then
    echo  "$1 not found"
    exit 0
fi
if [[ $1 == "" || $2 == "" ]]; then
    echo "data file or output file not found" 
    exit 1
fi
#awk runs through each record, looping and adding to a sum array for col. index each time
awk -F '[:;,]' '{for(i=1; i<=NF; i++){ sum[i] += $i; if (NF > maxNF) maxNF = NF} } 
END { for(i=1; i<=maxNF; i++) { printf "Col %d : %d", i, sum[i]; print ""}}' $1 > $2
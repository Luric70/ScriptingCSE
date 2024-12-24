#!/bin/bash
#Checks
if [ ! -f "$1" ]; then
    echo "missing data file"
    exit 0
fi

weight=("${@:2}")
awk -F ',' -v weight="${weight[*]}" '
BEGIN { split(weight, arr, " "); sumWeight = 0; totalWeight = 0; }  #split stores weight into arr
NR == 1 { N = NF - 1;   #first line with ID and N, set weight = 1 for extras
for (i=1; i <= N; i++) { if (!(i in arr)) { arr[i] = 1; } } next;
} NR > 1 {  #evaluate lines with data
    stuSum = 0; sumWeight = 0;
    for (i = 2; i <= NF; i++) {
        stuSum += $i * arr[i - 1];
        sumWeight += arr[i - 1]; }
    weighted_sum += stuSum; total_weight += sumWeight;
} END {
    print int(weighted_sum / total_weight); #apply formula
} ' "$1"

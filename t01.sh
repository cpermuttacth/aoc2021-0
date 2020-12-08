#!/usr/bin/env bash

double_ptr() {
    local a=$1 b=$2 sum=$3
    while ((a < b))
    do ((A[a] + A[b] == sum)) && echo $((A[a] * A[b]))
       if ((A[a] + A[b] < sum))
       then ((a++))
       else ((b--))
       fi
    done
}

# get data
mapfile -t A < <(sort -n t01.txt)
d=$((${#A[@]} - 1))

# task #1
double_ptr 0 "$d" 2020

# task #2
while ((0 < d--))
do s="$(double_ptr 0 "$d" $((2020 - A[d])))"
   [ -n "$s" ] && echo $((A[d] * s)) && break
done

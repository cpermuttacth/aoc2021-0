#!/usr/bin/env bash

declare -A G P
p=0
g=0
while read -r S
do if [ -n "$S" ]; then P[$((p++))]="$S"; else G[$((g++))]="${P[*]}"; P=(); fi
done < t06.txt

for g in  "${G[@]}"
do echo "$g"
done

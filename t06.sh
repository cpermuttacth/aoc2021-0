#!/usr/bin/env bash

declare -A G P C
p=0
g=0
while read -r S
do if [ -n "$S" ]; then P[$((p++))]="$S"; else G[$((g++))]="${P[*]}"; P=(); fi
done < t06.txt

p=0
q=0
for g in "${G[@]}"
do for h in $g
   do for i in $(seq 0 $((${#h}-1)))
      do ((C[${h:$i:1}]++)) || true
      done
   done
   # part 1
   ((p+=$(echo "${!C[@]}" | wc -w))) || true
   #part 2
   l="$(echo "$g" | wc -w)"
   for I in "${!C[@]}"
   do ((C[$I] == l && q++)) || true
   done
   C=()
done
echo $p
echo $q

#!/usr/bin/env bash
x() {
    local A=$1 B=$2 C=$3 D=$4
    # part 1
    E=$(echo "$D" | tr -d "$C")
    E=$((${#D} - ${#E}))
    (( A <= E && E <= B)) && (( Z[first]++ ))
    # part 2
    [ "${D:$((A-1)):1}" = "$C" ] && G=1 || G=0
    [ "${D:$((B-1)):1}" = "$C" ] && H=1 || H=0
    (( (G && ! H) || ( ! G && H))) && (( Z[second]++ ))
}

declare -A Z
while IFS=" :-" read -r A B C D
do x "$A" "$B" "$C" "$D"
done < t02.txt

for I in "${!Z[@]}"
do echo "$I ${Z[$I]}"
done

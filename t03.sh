#!/usr/bin/env bash

F=t03.txt
L=$(wc -l <$F)
X=$(tr "." "0" < $F | tr "#" "1" | tr -d "\n")
for i in $(seq 0 $((${#X}-1))); do Y[$i]=${X:$i:1}; done

z=$(((i+1)/L))
c() {
    local s=$1 d=$2
    local S=0
    for x in $(seq 0 "$d" $((L-1)))
    do ((S+=Y[x*z+(x*s/d)%z])) || true
    done
    echo "$S"
}

#part 1
c 3 1

#part 2
echo $(($(c 1 1)*
        $(c 3 1)*
        $(c 5 1)*
        $(c 7 1)*
        $(c 1 2)))

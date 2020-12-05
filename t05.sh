#!/usr/bin/env bash

declare -A R C

j=0
for i in {F,B}{F,B}{F,B}{F,B}{F,B}{F,B}{F,B}
do ((R[$i]=j++)) || true
done

j=0
for i in {L,R}{L,R}{L,R}
do ((C[$i]=j++)) || true
done

x() {
    local f=$1
    while read -r A
    do echo $((R[${A:0:7}]*8+C[${A:7:3}]))
    done < "$f" | sort -n
}

X="$(x t05.txt)"

#part 1
echo "$X" | tail -n1

#part 2
j=0
for i in $X
do ((i-j==2)) && echo $((j+1)); j=$i
done

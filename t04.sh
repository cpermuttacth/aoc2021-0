#!/usr/bin/env bash

F=${1:-t04.txt}
declare -A P Q
p=0
q=0
while read -r L
do if [ -z "$L" ]
   then P=()
        Q=()
	for m in $M
	do IFS=":" read -r N O < <(echo "$m")
           [ "$N" != "cid" ] && Q+=([$N]=$O)
	   [ "$N" = "byr" ] && [ "$O" -le 2002 ] && [ "$O" -ge 1920 ]      && P+=([$N]=$O)
	   [ "$N" = "iyr" ] && [ "$O" -le 2020 ] && [ "$O" -ge 2010 ]      && P+=([$N]=$O)
	   [ "$N" = "eyr" ] && [ "$O" -le 2030 ] && [ "$O" -ge 2020 ]      && P+=([$N]=$O)
	   [ "$N" = "hcl" ] && [[ $O =~ ^\#[0-9a-f]{6}$ ]]                 && P+=([$N]=$O)
	   [ "$N" = "hgt" ] && [[ $O =~ ^(59|6[0-9]|7[0-6])in$ ]]          && P+=([$N]=$O)
	   [ "$N" = "hgt" ] && [[ $O =~ ^1([5-8][0-9]|9[0-3])cm$ ]]        && P+=([$N]=$O)
           [ "$N" = "ecl" ] && [[ $O =~ ^(amb|blu|brn|gry|grn|hzl|oth)$ ]] && P+=([$N]=$O)
	   [ "$N" = "pid" ] && [[ $O =~ ^[0-9]{9}$ ]]                      && P+=([$N]=$O)
	done
	unset M
	[ ${#P[@]} -eq 7 ] && ((q++))
	[ ${#Q[@]} -eq 7 ] && ((p++))
   else M="$M $L"
   fi
done < "$F"
echo "$p"
echo "$q"

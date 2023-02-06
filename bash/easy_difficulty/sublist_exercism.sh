#!/bin/bash
# rid of square braces #
arr1=$(sed 's/\]//g ; s/\[//g' <<< "${1}")
arr2=$(sed 's/\]//g ; s/\[//g' <<< "${2}")
# test for equality # 
# in case when we deal with empty lists - add to the end so we can find that pattern #
(( ${#1} == 0 || ${#2} == 0 )) && arr1=$arr1", 0" &&  arr2=$arr2", 0"

if [[ "$arr1" == "$arr2" ]]; then
    echo "equality"
else 
    if [[ "$arr1" =~ $arr2 ]]; then
        echo "superlist"
    elif [[ "$arr2" =~ $arr1 ]]; then
        echo "sublist"
    else 
        echo "unequal"
    fi
fi
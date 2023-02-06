#!/bin/bash

# input checks #
#
! { [[ "${1}" =~ ^[0-9]*$ && "${2}" =~ ^-?[0-9]*$ ]]; } && echo "input must only contain digits" && exit 1
if [ -z "${2}" ] && (("${1}"==0)); then 
    echo 1
    exit 0
fi
(( "${2}" > "${#1}" ))  && echo "span must be smaller than string length" && exit 1
(( "${2}" < 0 )) && echo "span must be greater than zero" && exit 1
num_array=($(grep -o . <<< "${1}"))
max_mult=0; inner_mult=1;
how_many="${2}"
len="${#num_array[@]}"
# Doesnt seem to work brace expansion and then perform atirhmetic
# I might use seq, but it is overhead of involving external command: for i in $(seq 1 $END); do echo $i; done
# https://stackoverflow.com/questions/169511/how-do-i-iterate-over-a-range-of-numbers-defined-by-variables-in-bash
# So it seems thats not a big concern - should I not use any external commands then?
for ((i=0; i<len-how_many+1; i++)); do
    
    # reset #
    inner_mult=1
    # inner loop for summing consecutive vals #
    for (( j=i; j<i+how_many; j++ )); do
        # We can break - no need to check if we meet 0 #
        ((num_array[j]==0)) && inner_mult=0 && break 
        # Otherwise multiplicate #
        (( inner_mult *= num_array[j] ))
    done
    # Comparison #
    if (( inner_mult > max_mult )); then
        max_mult="$inner_mult"
    fi

done
echo "$max_mult"
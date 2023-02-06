#!/bin/bash
# neccessary transformation - any non-word character to empty space and translation to lowercase #
only_letters=$(echo "${1}" | sed 's/[^[:alpha:]]//g' | tr '[[:upper:]]' '[[:lower:]]')
val=0
# Simple check if line is empty #
if [ -z "${1}" ]; then
    echo false
    exit 0
fi
# Array of possible values #
declare -a arr=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
# Looping through each character from an array #
for i in "${arr[@]}"; do
    # Loop through each character from provided text #
    for ((j=0; j<${#only_letters}; j++)); do
        # If we found a match then this character exists, so we skip iteration of current loop, but also parent loop
        if [[ ${only_letters:$j:1} == $i ]]; then 
            continue 2
        fi
        # When we reach end of the curtrent iteration and we didnt match character then we know the sentence isnt a pangram, so we simply exit #
        if (( $j == ${#only_letters} - 1 )); then 
            echo false
            exit 0
        fi
    done
done
echo true
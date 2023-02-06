#!/bin/bash
##### https://exercism.org/tracks/bash/exercises/dnd-character/iterations?idx=1 ######
# Usage of $RANDOM - generate values in the range 0 - 32767 - upper limit of 16 bit signed integer #
# Starting from bash 4 - associative array to generate names for each variable
# Round() function used as a rounding option %
function round(){
    local val="${1}"
    # [0-9]? because normally bc doesnt output 0 with decimal (-.5/.5), not 0.5 #
    if [[ "${val}" =~ ^-[0-9]?\.5$ || "${val}" =~ ^[0-9]?\.5$ ]]; then
        x=$(bc <<< "${val} - 0.5")
    # Scale is taken only into a consideration when dealing with expression calculations (definetely not subtraction) #
    # So I want to use for example dividing by 1 to use it #
        bc <<< "scale=0; (${x}/1)"
    else bc <<< "scale=0; (${val}/1)"
    fi
}
declare -A property_names=()
sum=0
# Case to generate all stats #
if [[ "${1}" == "generate" ]]; then
    # generate 6 stats #
    for i in strength dexterity constitution intelligence wisdom charisma; do
        val="$((RANDOM % 6 + 1))$((RANDOM % 6 + 1))$((RANDOM % 6 + 1))$((RANDOM % 6 + 1))"
        # Nice use of grep -o . to write 
        x=$(grep -o . <<< "$val" | sort -n | tr -d '\n' | cut -c 2-)
        for ((j=0;j<3;j++)); do
            ((sum += ${x:j:1}))
        done
        property_names[$i]=$sum
        echo "$i ${property_names[$i]}"
        ((sum=0))
    done
    # populate hitpoints characteristic #
    res=$(bc <<< "scale=1; (${property_names[constitution]} - 10) / 2")
    property_names[hitpoints]=$(bc <<< "10 + $(round $res)")
    echo "hitpoints ${property_names[hitpoints]}"
# Case when we pass number - thats a modifier #
elif [[ "${2}" =~ ^[1-9][0-9]?$  && "${1}" == "modifier" ]]; then
    res=$(bc <<< "scale=1;(${2} - 10) / 2")
    bc <<< "$(round $res)"
else
    echo "Wrong arguments"
    exit 1
fi


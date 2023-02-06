#!/bin/bash -x

# Extract values - also discard invalid ones #
# -w and -b #
par1="${1}";par2="${3}";val1="${2}";val2="${4}" 
[[ $par1 != "-w" || $par2 != "-b" ]] && echo "wrong params" && exit 1
# If valid pattern: [-]num,[-]num #
valid_pattern='^-?[0-9]+,-?[0-9]+$'
[[ ! $val1 =~ $valid_pattern || ! $val2 =~ $valid_pattern ]] && echo "invalid numbers / pattern" && exit 1
# Simple check for minus in column and row #
# row #
[[ $val1 =~ ^- || $val2 =~ ^- ]] && echo "row not positive" && exit 1
# col #
[[ $val1 =~ ,-[1-7]{1}$ || $val2 =~ ,-[1-7]{1}$ ]] && echo "column not positive" && exit 1
# whether piece is on board #
# row #
[[ ! $val1 =~ ^[0-7]{1} || ! $val2 =~ ^[0-7]{1} ]] && echo "row not on board" && exit 1
# col #
[[ ! $val1 =~ ,[0-7]{1}$ || ! $val2 =~ ,[0-7]{1}$ ]] && echo "column not on board" && exit 1
# equality #
[[ $val1 == $val2 ]] && echo "same position" && exit 1

#### MAIN PROGRAMME ####
# retrieve each value
val1_r=${val1:0:1}; val1_c=${val1:2:1}; val2_r=${val2:0:1}; val2_c=${val2:2:1};
echo $val1_r" "$val1_c" "$val2_r" "$val2_c
# With nums in variable name '$' is neccessary - BULLSHIT #
subtraction1=$((val1_r - val2_r)); subtraction2=$((val1_c - val2_c))
if (( val1_r == val2_r || val1_c == val2_c || ${subtraction1#-} == ${subtraction2#-} )); then
    echo true
    exit 0
else 
    echo false
    exit 0
fi
#!/bin/bash
function costructProperSentence {
    local num="${1}"
    # First part of sentence #
    local firstPartOfSent=""
    if (( num <= 99 && num >=2 )); then
        firstPartOfSent="$num bottles"
    elif (( num == 1 )); then
        firstPartOfSent="$num bottle";
    else 
        firstPartOfSent="no more bottles"
    fi
    local sentence=$firstPartOfSent
    echo "$sentence"

}
numFrom="${1}"
numTo="${2}"
# Default to 1st param #
numTo=${numTo:=$numFrom}
# Passed parameters check #
(( ${#} > 2 || ${#} == 0 )) && echo "1 or 2 arguments expected" && exit 1
(( "numTo" > "numFrom" )) && echo "Start must be greater than End" && exit 1
# Now loop
for ((i=numFrom; i>=numTo; i--)); do
    # In order not to call every single time, I will store results within each itteration of a loop #
    first=$(costructProperSentence $((i)))
    second=$(costructProperSentence $((i-1)))
    firstLineOfSentence="$first of beer on the wall, $first of beer."
    if ((i-1 < 0)); then
        # There is no need to invoke function there 
        secondLineOfSentence="Go to the store and buy some more, 99 bottles of beer on the wall."
    else
        if ((i == 1)); then
            secondLineOfSentence="Take it"
        else 
            secondLineOfSentence="Take one"
        fi
        secondLineOfSentence=$secondLineOfSentence" down and pass it around, $second of beer on the wall."
    fi
    echo "${firstLineOfSentence^}"$'\n'"${secondLineOfSentence}"$'\n'
done
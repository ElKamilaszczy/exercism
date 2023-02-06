#!/bin/bash
# https://exercism.org/tracks/bash/exercises/darts
# -x to debug
function evaluate_result(){
    # The exit status of the command is overridden by the exit status of the creation of the local variable. For example:
    local result
    # result=$(echo "scale=4; sqrt("${1}"^2 + "${2}"^2)" | bc)

    result=$(bc <<< "scale=4; sqrt(${1}^2 + ${2}^2)" )
    # We can return only int/string
    echo $result
}
# Validation of an input
evaluate_result $@
float_pattern='^[-]?[0-9]+(.[0-9]+)?$'
if ! [[ "${1}" =~ $float_pattern ]] || ! [[ "${2}" =~ $float_pattern ]]; then
    echo "Wrong input" >&2
    exit 1
fi
# We cannot use assignment operator on float #
# Check against values #
if (( $(bc <<< "$(evaluate_result ${1} ${2}) > 10") )); then
    points=0
elif (( $(echo "$(evaluate_result ${1} ${2}) <= 10" | bc) )) && (( $(echo "$(evaluate_result ${1} ${2}) > 5" | bc) )); then
    points=1 
elif (( $(echo "$(evaluate_result ${1} ${2}) <= 5" | bc) )) && (( $(echo "$(evaluate_result ${1} ${2}) > 1" | bc) )); then
    points=5
else points=10
fi
echo $points
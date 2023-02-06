#!/bin/bash
# Armstrong number is a number which equals to a sum of of its own digits each raised to the power of the number of digits
# https://exercism.org/tracks/bash/exercises/armstrong-numbers 
# Check if a parameter is an integer #
int_pattern='^[0-9]+$'
if ! { [ $# -eq 1 ] && [[ ${1} =~ $int_pattern ]]; }; then
    exit 1
fi
# Declaring variables (for simplicity)
len="${#1}";num=${1}; sum=0
# Loop, taking each digit and raise it to the power #
for ((i=0; i<len; i++)); do
((sum += ${num:i:1} ** len))
done
if (( num == sum )); then
    echo true
else echo false
fi
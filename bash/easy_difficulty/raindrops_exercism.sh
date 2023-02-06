#!/bin/bash
###################### https://exercism.org/tracks/bash/exercises/raindrops ###################
# Check if we pass exactly one argument and this argument is a valid positive integer #
if ! { (( "$#" == 1 )) && [[ "$1" =~ ^[0-9]+$ ]]; }; then
    exit 1
fi
for i in 3 5 7; do
    if (( "$1" % i == 0 )); then
        case "$i" in 
            3) text=$text"Pling";;
            5) text=$text"Plang";;
            7) text=$text"Plong";;
        esac
    fi
done
if [ -z "$text" ]; then
    echo "$1"
else 
    echo "$text"
fi
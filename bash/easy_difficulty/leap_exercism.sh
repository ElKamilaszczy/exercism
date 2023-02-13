#!/usr/bin/env bash
# Calculate length of string (just digits) to reject wrong values (containing letters, dots...)
x=$(sed 's/[^[:digit:]]//g' <<< "$1")
# Check if we have exactly one parameter as input and length comparison
if [[ $# -ne 1  ||  ${#1} -ne ${#x} ]]; then
    echo "Usage: leap.sh <year>"
    exit 1
fi
# to group precedences we can use { <some statements>; } or simply (<statements>)
# Check if year is leap one
if (( $1 % 400 == 0 || ( $1 % 4 == 0 && $1 % 100 != 0) )); then
    echo "true"
else
    echo "false"
fi
#!/bin/bash

# Neccessary checks #
if (( ${#} != 1 )) || [[ "${1}" =~ [^aAcCgGtT] ]]; then
    echo "Invalid nucleotide in strand"
    exit 1
fi
# $[] is deprecated, use $(()) instead
# a=$(( $(sed -E 's/(A|a)//g' <<< "${1}" |  wc -m) - 1))
# c=$(( $(sed -E 's/(C|c)//g' <<< "${1}" |  wc -m) - 1))
# g=$(( $(sed -E 's/(G|g)//g' <<< "${1}" |  wc -m) - 1))
# t=$(( $(sed -E 's/(T|t)//g' <<< "${1}" |  wc -m) - 1))
# echo "A: $(bc <<< "${#1} - ${a}")"
# echo "C: $(bc <<< "${#1} - ${c}")"
# echo "G: $(bc <<< "${#1} - ${g}")"
# echo "T: $(bc <<< "${#1} - ${t}")"
# using loop #
for i in A C G T; do
    # Using $i remember to use "" instead of '' - "" will properly expand variable, while '' not
    var=$(( $(sed -E "s/$i//gi" <<< "${1}" |  wc -m ) - 1))
    echo "$i: $(bc <<< "${#1} - ${var}")"
done
#!/bin/bash
acronym=""
if  [ $# -ne 1 ] || [[ "$1" =~ [0-9] ]]; then
    exit 1
fi
# Change every letter besides ''', '-', space and any character to empty space
# formatted=$(echo "$1" | sed -E 's/[^- [:alnum:]]//g')
formatted=$(sed -E 's/[^- [:alnum:]]//g' <<< "$1")
# We need to mapinupate IFS a little bit 
OLD_IFS=$IFS
IFS=' -'
# Loop through and cut first letter of each word
for i in $formatted; do
    char=$(echo "$i" | cut -c1)
    acronym=$acronym$char
done
IFS=$OLD_IFS
# Translation of lowercase to upper
echo "$acronym" | tr [[:lower:]] [[:upper:]] # echo "${acronym,,}"
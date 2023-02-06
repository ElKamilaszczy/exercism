#!/bin/bash

# Standarize words - drop all character besides letters, numbers and ' #
sentence=$(sed -E 's/\\[[:alnum:]]/ /gi' <<< "${1}")
sentence_arr=($(sed -E "s/[^'[:alnum:]]/ /gi; s/([^[:alnum:]]')|('[^[:alnum:]])/ /gi; s/'$/ /gi" <<< "${sentence}" | tr '[:upper:]' '[:lower:]'))
# Sort words and count them
oldIFS=$IFS
IFS=$'\n'
sentence_arr=($(sort <<< "${sentence_arr[*]}"))
IFS=$oldIFS
count=0
for i in "${sentence_arr[@]}"; do
    for j in "${sentence_arr[@]}"; do
        if [[ "$i" == "$j" ]]; then
            ((count++))
        fi
    done
    echo "$i: $count"
    ((count=0))
done  | uniq



wydzial do spraw wykroczen na bema 4
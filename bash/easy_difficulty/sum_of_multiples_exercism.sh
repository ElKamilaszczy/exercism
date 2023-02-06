#!/bin/bash
# https://exercism.org/tracks/bash/exercises/sum-of-multiples
# Warnings #
# 1. Double quote array expansions to avoid re-splitting elements.": https://github.com/koalaman/shellcheck/wiki/SC2068 - "${params[@]}" instead of ${params[@]}
# 2. Quote to prevent word splitting/globbing, or split robustly with mapfile or read -a.": https://github.com/koalaman/shellcheck/wiki/SC2206 
# 3. $/${} is unnecessary on arithmetic variables.: https://github.com/koalaman/shellcheck/wiki/SC2004 in for (())
[[ "${1}" == 0 ]] && echo "First argument cannot be 0 " && exit 1
[[ "${1}" =~ ^$ && "${2}" =~ ^$ ]] && echo "Both first and second argument cannot be empty" && exit 1
# All of specified arguments must be valid number #
declare -a params=("${@}")
for i in "${params[@]}"; do
    [[ ! "${i}" =~ ^[0-9]+$ ]] && echo "Argument must be a valid number" && exit 1
done
# Main programme #
declare -a resultSet=()
sum=0
indx=1
# -n instead of ! -z: https://github.com/koalaman/shellcheck/wiki/SC2236 
while [ -n "${params[indx]}" ]; do
    ((params[indx] == 0)) && ((indx++)) && continue;
    for (( j=params[indx]; j<params[0]; j+=params[indx] )); do
    
        resultSet+=("$j")
    done
    ((indx++))
done
# IFS manipulation - we cannot rely there on grep -o . (see below comment) #
oldIFS=$IFS
IFS=$'\n'
finalFResultSet=($(sort -n <<< "${resultSet[*]}" | uniq));
IFS=$oldIFS
# This would need a tweak (adjusting dots to match length) in grep #
#finalFResultSet=($(grep -o .. <<< "${resultSet[@]}" | sort -n))
for i in "${finalFResultSet[@]}"; do
    ((sum+=i))
done
echo $sum
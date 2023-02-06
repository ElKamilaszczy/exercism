#!/bin/bash
# https://exercism.org/tracks/bash/exercises/series
# Input validation #
[[ "${1}" =~ ^$ ]] && echo "series cannot be empty" >&2 && exit 1
[[ ! "${1}" =~ ^[0-9]+$ || ! "${2}" =~ ^-?[0-9]+$ ]] && echo "not a valid number" >&2 && exit 1
(( "${2}" < 0 )) && echo "slice length cannot be negative" >&2 && exit 1
(( "${2}" == 0 )) && echo "slice length cannot be zero" >&2 && exit 1 
(( "${2}" > "${#1}" )) && echo "slice length cannot be greater than series length" >&2 && exit 1
# if [[ "${1}" =~ ^$ ]]; then
#     echo "series cannot be empty" >&2
#     exit 1
# elif [[ ! "${1}" =~ ^[0-9]+$ || ! "${2}" =~ ^-?[0-9]+$ ]]; then
#     echo "not a valid number" >&2
#     exit 1
# elif (( "${2}" < 0 )); then
#     echo "slice length cannot be negative" >&2
#     exit 1
# elif (( "${2}" == 0 )); then
#     echo "slice length cannot be zero" >&2
#     exit 1
# elif (( "${2}" > "${#1}" )); then
#     echo "slice length cannot be greater than series length" >&2
#     exit 1
# fi
# Main programme #
declare -i how_many=${#1}-${2}
first="$1"; second="$2"
for (( i=0; i<=how_many; i++ )); do
    result+=${first:i:second}" "
    echo $result
done
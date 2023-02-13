#!/usr/bin/env bash
# https://exercism.org/tracks/bash/exercises/triangle


num_pattern='^[0-9]+(.[0-9]+)?$'

if test $# -ne 4 || ! [[ "${2}" =~ $num_pattern ]] || ! [[ "${3}" =~ $num_pattern ]] || ! [[ "${4}" =~ $num_pattern ]]; then
    exit 1
fi

function check_triangle(){
    local val=$(echo "${nums_sorted[0]} + ${nums_sorted[1]}" | bc)
    if [ 1 -eq $(echo "$val < ${nums_sorted[2]}" | bc) ]; then
        echo "false"
        exit 0;
    fi
}
function equilateral(){
    if [ 1 -eq $(echo "${nums_sorted[0]} == ${nums_sorted[1]}" | bc) ] && [ 1 -eq $(echo "${nums_sorted[1]} == ${nums_sorted[2]}" | bc) ] && [ 1 -ne $(echo "${nums_sorted[0]} == 0" | bc) ]; then
        echo "true"
    else
        echo "false"
    fi
}
function isosceles(){
    if { [ 1 -eq $(echo "${nums_sorted[0]} == ${nums_sorted[1]}" | bc) ] || [ 1 -eq $(echo "${nums_sorted[1]} == ${nums_sorted[2]}" | bc) ]; } && [ 1 -ne $(echo "${nums_sorted[0]} == 0" | bc) ]; then
        echo "true"
    else
        echo "false"
    fi
}
function scalene(){
    if [ 1 -eq $(echo "${nums_sorted[0]} != ${nums_sorted[1]}" | bc) ] && [ 1 -eq $(echo "${nums_sorted[1]} != ${nums_sorted[2]}" | bc) ] && [ 1 -ne $(echo "${nums_sorted[0]} == 0" | bc) ]; then
        echo "true"
    else
        echo "false"
    fi
}
##### MAIN PROGRAMME #####
num_table=("$2" "$3" "$4")
oldIFS=$IFS
IFS=$'\n'
nums_sorted=($(sort -n <<< "${num_table[*]}"))
IFS=$oldIFS
# List of available triangles
triangles=("equilateral" "isosceles" "scalene")
case "$1" in
    "${triangles[0]}")
       check_triangle
       equilateral;;
    "${triangles[1]}")
        check_triangle
        isosceles;;
    "${triangles[2]}")
        check_triangle
        scalene;;
    *)
        exit 1;;
esac

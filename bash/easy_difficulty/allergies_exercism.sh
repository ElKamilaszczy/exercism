#!/bin/bash
# https://exercism.org/tracks/bash/exercises/allergies/iterations?idx=2
# <val> allergic_to <name of allergen> 
# <val> list - lists all allergens witch use.  
# Associative array of values #
declare -a vals=( 1 2 4 8 16 32 64 128)
declare -a allergens=( eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
# declare -A allergens_assoc=( [eggs]=1 [peanuts]=2 [shellfish]=4 [strawberries]=8 [tomatoes]=16 [chocolate]=32 [pollen]=64 [cats]=128 )
if (( ${#} == 3 )) && [[ "${2}" == "allergic_to" && "${1}" =~ ^[0-9]*$ ]]; then
    for ((i=0; i<${#vals[@]}; i++)); do
        if [[ ${allergens[i]} == "${3}" ]]; then
            curr_num_allergen=${vals[i]}
            break
        fi
    done
    if (( "${1}" & curr_num_allergen )); then
        echo "true"
    else 
        echo "false"
    fi
elif (( ${#} == 2 )) && [[ "${2}" == "list" && "${1}" =~ ^[0-9]*$ ]]; then
    for ((i=0; i<${#vals[@]}; i++)); do
        if ((vals[i] & ${1})); then
            all_allergens+=${allergens[$i]}" "
        fi
    done
echo "${all_allergens% }"
fi
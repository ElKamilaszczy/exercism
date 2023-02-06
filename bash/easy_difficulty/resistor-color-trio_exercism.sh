#!/bin/bash
################## https://exercism.org/tracks/bash/exercises/resistor-color-duo/iterations?idx=1 ################
# Associative Array - from version 4 onward
: '
    Might do also this way:
    declare -A colorVals=( [black]=0 [brown]=1 ... )
'
#!/usr/bin/env bash
function containsElement(){
    local elem="$1"
    echo $elem
    for i in "${colors[@]}"; do
        if [[ "$i" == "$elem" ]]; then
            return 1
        fi
    done
    return 0
}
result=""
colors=("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")
values=(0 1 2 3 4 5 6 7 8 9)
for ((i=1; i<=2; i++)); do
    if [ containsElement ]; then
        case $1 in
            black) result=$result"0"
                shift;;
            brown) result=$result"1"
                shift;;
            red) result=$result"2"
                shift;;
            orange) result=$result"3"
                shift;;
            yellow) result=$result"4"
                shift;;
            green) result=$result"5"
                shift;;
            blue) result=$result"6"
                shift;;
            violet) result=$result"7"
                shift;;
            grey) result=$result"8"
                shift;;
            white) result=$result"9"
                shift;;
            *) echo "invalid color"
                exit 1;;
        esac
    else 
        echo "invalid color"
        exit 1
    fi
done
echo $result
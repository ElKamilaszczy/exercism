#!/bin/bash -x
: '
    Check:
        - if number doesnt contain any other character besides +()- and number [0-9]
        - if so, then we can translate those which may occur into empty spaces:
            - if length is 11 and starts with 1 than we can consider it futher. 
            - if length is 10 then we can consider it further 

    Second (first if length 10) number must be in range 2-9. This also applies to a fourth number accordingly
'
if [[ "${#}" != 1 || "${1}" =~ [[:alpha:]] ]]; then
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
    exit 1
fi
# Transformation of a number - we can use many of sed instances in one command #
phone=$(sed -E 's/[[:punct:]]//g ; s/[[:blank:]]//g' <<< "${1}")
# Now I can check if the count of digits is 11/10 (depends on 1 in the beginning) #
# $phone =~ ^.{4}[2-9] - $phone =~ ^....[2-9]
if (( ${#phone} == 11 )) && [[ $phone =~ ^1 &&  $phone =~  ^.[2-9] && $phone =~ ^.{4}[2-9] ]]; then
    cut -c 2- <<< "${phone}"
elif (( ${#phone} == 10 )) && [[ $phone =~ ^[2-9] && $phone =~ ^.{3}[2-9] ]]; then
    echo ${phone}
else 
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
    exit 1
fi
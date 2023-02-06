#!/bin/bash
# 1-64, true
# 2 ^ ($1-1)
# input check
function inputCheck(){
# https://github.com/koalaman/shellcheck/wiki/SC2021
# No need to use in tr [] (for example [A-Z] corresponds to simply A-Z) - this is TR specific, so [[:lower:]] in tr is [:lower:]
if ! { (( "${#}" == 1 )) && { { [[  "${1}" =~ ^[1-9][0-9]*$ ]] && (( "$1" <= 64 )); } || [[ "total" == $(tr '[:upper:]' '[:lower:]' <<< "$1") ]]; } }; then
    echo "Error: invalid input"
    exit 1
fi
}
inputCheck "$@"
sum=0
# Bash works only up to 64 signed integers. So 2^63 is ok, byt 2^64 is too much. We can overcome this using BC (bash calculator). #
if [[ "total" != "$(tr '[:upper:]' '[:lower:]' <<< "$1")" ]]; then
    # Instead of echo simply bc <<<. It is simply faster and more correct:
    # https://github.com/koalaman/shellcheck/wiki/SC2005
    bc <<< "2^(${1} - 1)"
    # Wrong apprach: 
    # echo "$(bc <<< "2^(${1} - 1)")"
else
    
    for i in {0..63}; do
        res=$(bc <<< "2^(${i})")
        sum=$(bc <<< "${sum} + $res")
    done
    echo "$sum"
fi

# Way easier to check - using declare with -i - this accepts only integer value - 0 for any other string
declare -i som="1" # This yields integer attributes (more than 64 precision). Hard typing also restricts scope, for example when we use declare in a function it is visible only in function
# Definetely worth looking at declare
echo $som

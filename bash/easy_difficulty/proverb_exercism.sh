#!/bin/bash
last_sent="And all for the want of a ${1}."
senten=""
# Loop through elements, checking if the next arg. exist (otherwise we cannot create a sentence)
if [ -z "$1" ]; then
    echo "$1"
    exit 0
fi
for i in "${@}"; do
    if [ -z "${2}" ]; then
        break
    fi
    senten="For want of a ${1} the ${2} was lost."
    echo "$senten"
    shift
done
echo "$last_sent"
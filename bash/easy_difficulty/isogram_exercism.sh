#!/bin/bash
: '
An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter, 
however spaces and hyphens are allowed to appear multiple times.
'
input="${1,,}"
#echo $input
# by using back-references we can find repeating alphanumerical characters #
# set -e
# ls xd
modifiedInput=$(sed -E 's/([[:alpha:]])(.*)\1//g' <<< "${input}")
#echo $modifiedInput
(( ${#input} == ${#modifiedInput} )) && echo "true" || echo "false"
#echo "s----sdx 1 1" | grep -Ee '([[:alpha:]])(.*)\1'
# var=<<-m
#     xd
#     1
#     233
#     endo
# m
# mapfile arr <<< "$var"
# readarray -t arr2 <<< "$var"
# echo ${#arr2[@]}
# myparam="foo, bar bash"
# IFS=',' read -r -a array <<<"$myparam"
# echo ${array[1]}
# echo $IFS
# select os in "linux" "windows" "mac"
# do
#  echo "${os}"
#  break
# done

#!/bin/bash
rev <<< "${1}"
for ((i=1;i<=${#1}; i++)); do
    echo -n ${1:(-i):1}
done
arr=("some string hehe xd")
arr=${arr[*]// / }
echo ${#arr[@]}
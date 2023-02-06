#!/usr/bin/env bash
if [ -z "$1" ] || [ $# -ge 2 ]; then
    echo 0
    exit 0
fi
word=$(echo "$1" | tr "[:upper:]" "[:lower:]")
letter=""
score=0
for ((i=0; i<${#word}; i++)); do
    letter=${word:$i:1}
    case $letter in
        a | e | i | o | u | l | n | r | s | t )
            score=$[ score + 1 ];;
        d | g )
            score=$[ score + 2 ];;
        b | c | m | p)
            score=$[ score + 3 ];;
        f | h | v | w | y)
            score=$[ score + 4 ];;
        k)
            score=$[score+5];;
        j | x )
            score=$[score+8];;
        q | z )
            score=$[score+10];;
        *)
            continue;;
    esac
done
echo $score
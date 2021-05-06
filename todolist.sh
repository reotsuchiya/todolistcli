#!/bin/bash
# read -p "Enter task: " task
# echo "Here's your to do list"
# echo "$task"
filename='list.txt'
function view {
    n=1
    while read line; do
    # reading each line
    echo "$n. $line"
    n=$((n+1))
    done < $filename
}
function add {
    echo $task >> $filename
}

function remove {
    
    sed "${line}d" $filename> file.tmp && mv file.tmp $filename
}

while getopts i:l:t: flag
do
    case "$flag" in
        i) instruction=${OPTARG};;
        l) line=${OPTARG};;
        t) task=$OPTARG;;
    esac
done
echo "$instruction"


if [ $instruction == "view" ]; then
view
fi
if [ $instruction == "add" ]; then
add
fi
if [ $instruction == "remove" ]; then
remove
fi



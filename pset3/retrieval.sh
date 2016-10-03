#!/bin/bash
# Created: 9-26-2016
# Author(s): Raphael Rouvinov-Kats

declare -a questions=("find" "fifteen")


# get github user/pass once, reuse for every submit50 call
read    -p "Github username: " username
read -s -p "Github password: " password
echo

# retrieve the submissions, place into ./<question>/<name>/<question>.c folders
for question in "${questions[@]}"
do
    mkdir "$question"
    cd "$question"
    echo "retrieving $question"
    echo -e "$username\n$password\n" | submit50 --checkout "$question" > /dev/null 2>&1
    rm -rf "./$username"
    rm -rf "./submit50"
    cd ../
done


# convert into ./<name>/<question>/<question>.c folders, remove .git
echo "organizing work by username"
shopt -s globstar

for question in "${questions[@]}"
do
    cd "$question"
    for directory in $(find . -maxdepth 1 -type d)
    do
        if [ "$directory" != "." ]
        then
            cp -a "$directory/." ".$directory/" > /dev/null 2>&1
            rm -rf ".$directory/.git"
        fi
    done
    cd ../
done


# remove ./<question> folders
echo "cleaning up"
for question in "${questions[@]}"
do
    rm -rf "./$question"
done

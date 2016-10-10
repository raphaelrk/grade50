#!/bin/bash
# Created: 10-6-2016
# Author(s): Raphael Rouvinov-Kats

declare -a questions=("speller")

echo "retrieving, unzipping, renaming speller distro"
wget https://github.com/cs50/problems/archive/speller.zip &> /dev/null
unzip speller.zip &> /dev/null
rm speller.zip &> /dev/null
mv problems-speller speller &> /dev/null

echo "Done. Now retrieving student submissions."

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

#!/bin/bash
# Created: 10-10-2016
# Author(s): Raphael Rouvinov-Kats

check() {
    # for every file matching <arg3>.c
    for file in $(find . -type f -name "*$3*.c")
    do
        echo "------------- $1 (${PWD##*/}/${file:2}) -------------"
        
        # print output to stdout and store in $result
        # # $4 and $5 are optional helper file arguments
        result=$(check50 "$2" $4 $5 "${file:2}" | tee /dev/tty)
        
        # if result doesn't containt sandbox.cs50.net in it,
        # probably had trouble uploading file -- try again
        while [[ $result != *"sandbox.cs50.net"* ]]
        do
            echo "Trying again..."
            result=$(check50 "$2" $4 $5 "${file:2}" | tee /dev/tty)
        done
        
        echo $result
        echo
    done
}

leakcheck() {
    echo "------------ VALGRIND $1 (${PWD##*/}/${2:2}) ----------"
    make
    valgrind --leak-check=full "$2" "$3" > /dev/null # only show stderr
}


echo "-----------------------------------------------------------------"

echo "copying texts and dictionaries to ${PWD##*/}"
cp -R ../speller/texts texts/
cp -R ../speller/dictionaries dictionaries/

check "DICTIONARY" "2016.speller" "dictionary" "dictionary.h" "Makefile" | tee check50.txt
leakcheck "DICTIONARY" "./speller" "texts/shakespeare.txt" | tee valgrind.txt
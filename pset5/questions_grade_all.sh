#!/bin/bash
# Created: 10-10-2016
# Author(s): Raphael Rouvinov-Kats

echo "beginning grading"
for  directory in $(find . -maxdepth 1 -type d)
do
    if [ "$directory" != "." ] && [ "$directory" != "./speller" ]
    then
        echo "<><><><><><><><><><><><><><><><><><><><><><>"
        echo "<><><><><> GRADING $directory <><><><><>"
        cd "$directory"
            if [ -f "questions.txt" ]
            then
                c9 questions.txt
                read -p "How did they do? " res
                echo "How did they do? $res" > check-questions.txt
            else
                echo "questions.txt not found"
            fi
        cd ../
        echo ""
    fi
done

#!/bin/bash
# Created: 10-6-2016
# Author(s): Raphael Rouvinov-Kats

echo "retrieving, unzipping, renaming whodunit"
wget https://github.com/cs50/problems/archive/whodunit.zip &> /dev/null
yes | unzip whodunit.zip &> /dev/null
rm whodunit.zip &> /dev/null
mv problems-whodunit whodunit-files &> /dev/null

echo "beginning grading"
for  directory in $(find . -maxdepth 1 -type d)
do
    if [ "$directory" != "." ] && [ "$directory" != "./whodunit-files" ]
    then
        echo "<><><><><><><><><><><><><><><><><><><><><><>"
        echo "<><><><><> GRADING $directory <><><><><>"
        cd "$directory"
            make whodunit &> make_bmp_out.txt
            if grep -q "No rule" make_bmp_out.txt
            then
                echo "No whodunit.c to make" | tee check-whodunit.txt
            elif grep -q "error: " make_bmp_out.txt
            then
                echo "Error compiling whodunit.c" | tee check-whodunit.txt
            else
                ./whodunit ../whodunit-files/clue.bmp out.bmp
                c9 out.bmp
                read -p "Does their whodunit decode the clue? " yn
                echo "$yn" > check-whodunit.txt
            fi
            
            rm make_bmp_out.txt
            
        cd ../
        echo ""
    fi
done

# Grade50
A template bash script to help the grading of CS50 problem sets.

# Usage
```
update50
git clone git@github.com:lukejacksonn/grade50.git
cd grade50
find . -type f -name "*.sh" -exec chmod 777 {} \;
```

Grade an individual folder with `./grade`, which'll both output to stdout and to a file called `check50.txt`.
Grade all the folders in a pset directory at once with `./grade_all`

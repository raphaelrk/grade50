# Grade50
Template bash scripts to help with the grading of CS50 problem sets.

# Usage
```
# update ide, clone repo, fix permissions
update50
git clone https://github.com/raphaelrk/grade50.git
cd grade50
find . -type f -name "*.sh" -exec chmod 777 {} \;

# create directory for pset4, retrieve and grade pset4 submissions
cd pset4
./retrieval.sh
./grade_all.sh
./bmp_grade_all.sh # specific to pset 4
```

- Retrieve problem set submissions and combine them into per-student folders with `./retrieval.sh`
- Grade an individual folder with `./grade.sh`, which'll both output to stdout and to a file called `check50.txt`
- Grade all the folders in a pset directory at once with `./grade_all.sh`


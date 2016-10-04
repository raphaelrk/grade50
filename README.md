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
mkdir pset1
cd pset1
../grade50/pset4/retrieval.sh
../grade50/pset4/grade_all.sh
```

- Retrieve problem set submissions and combine them into per-student folders with `./retrieval.sh`
- Grade an individual folder with `./grade.sh`, which'll both output to stdout and to a file called `check50.txt`
- Grade all the folders in a pset directory at once with `./grade_all.sh`


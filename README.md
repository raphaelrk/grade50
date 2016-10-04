# Grade50
Bash scripts to help with the grading of CS50 problem sets. Feel free to PR with alternatives.

# Usage

Get and set up the repo:
```
update50
git clone https://github.com/raphaelrk/grade50.git
cd grade50
find . -type f -name "*.sh" -exec chmod 777 {} \;
```

Use the scripts:
```
cd pset4
./retrieval.sh
./grade_all.sh
./bmp_grade_all.sh # specific to pset 4
```

Update the repo:
```
update50
cd grade50
git pull
find . -type f -name "*.sh" -exec chmod 777 {} \;
```

What the scripts do:
- `./retrieval.sh` retrieves pset submissions and combines them into per-student folders, i.e. `grade50/pset4/briansmith/resize.c`, `grade50/pset4/briansmith/recover.c`, etc
- Grade an individual folder by cd-ing into it and running `../grade.sh`, which'll both output to stdout and to a file called `check50.txt` in the student's folder
- Grade all the folders in your pset's directory at once with `./grade_all.sh`


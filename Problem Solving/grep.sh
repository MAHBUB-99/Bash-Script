# # case insensitive -i
# grep -i "Enter" gradesystem.sh

# # case sensitive
# grep "Enter" gradesystem.sh

#search for word in the directory recursively
# -r: recursive
# -l: list file names only
grep -r "Guess" ..
grep -rl "Guess" ..
grep -r -i "enter" .
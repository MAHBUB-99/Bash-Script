# File Testing Conditions
# -e FILE	File exists
# -f FILE	Is a regular file
# -d DIR	Is a directory
# -r FILE	Is readable
# -w FILE	Is writable
# -x FILE	Is executable
# -s FILE	Is not empty

# if [ -f "./file.sh" ];then
#     echo "File exists"
# else
#     echo "File does not exist"
# fi    

# if [ -d "$(pwd)" ];then
#     echo "Directory exists"
# else
#     echo "Directory does not exist"
# fi    

# cd ".."
# echo $(pwd)
# if [ -d "Problem Solving" ];then
#     echo "Directory exists"
# else
#     echo "Directory does not exist"
# fi    

if [ -x "files.sh" ];then
    echo "File is Executable"
else
    echo "File is not executable"
fi
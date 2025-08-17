# for i in 1 2 3 4 5; do
#     echo "$i"
# done

# for i in {1..6}; do
#     echo $i
# done

# count=1
# while [ $count -le 10 ]; do
#     echo $count
#     count=$((count+1))
# done

# count=1
# until [ $count -ge 10 ]; do
#     if [ $count -eq 5 ];then
#         echo "Skipping $count"
#         count=$((count+1))
#         continue
#     fi
#     echo $count
#     count=$((count+1))
# done

for file in *.sh;do
    line=$(wc -l < $file)
    echo "$file has $line lines"
done
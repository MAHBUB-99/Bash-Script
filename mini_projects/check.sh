#!/bin/bash

# ------------------------------
# Matched Line Counter Script
# ------------------------------
# This script compares two text files and counts
# how many lines are exactly the same in both.

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

file1="$1"
file2="$2"

# Check if both files exist
if ! [ -f "$file1" ]; then
    echo "❌ File not found: $file1"
    exit 1
fi

if ! [ -f "$file2" ]; then
    echo "❌ File not found: $file2"
    exit 1
fi

# Sort and find common lines, then count them
matched_lines=$(comm -12 <(sort "$file1") <(sort "$file2"))
matched_lines_count=$(comm -12 <(sort "$file1") <(sort "$file2") | wc -l)

echo "✅ Number of matching lines: $matched_lines_count"
echo "------------------------------"   
echo "Matching lines:"
echo "------------------------------"   
echo "$matched_lines"
echo "------------------------------"   
echo "End of script."

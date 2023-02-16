#!/bin/bash

# Set the input and output files
input_file="/Users/shiyiyin/citation/data/fanlu.txt"
output_file="/Users/shiyiyin/citation/output_fanlu.csv"

# Use grep to find all instances of "Citations:" followed by two numbers separated by a slash, and capture the numbers
# The -o flag tells grep to only output the matched text (i.e. the numbers) instead of the entire line
# The sed command is used to replace the slash with a comma to create the CSV format
grep -o "Citations: \(-\?[0-9]\+\)/\(-\?[0-9]\+\)" $input_file | sed 's/Citations: //' | sed 's/\//,/g' | sed 's#:#,#g'> $output_file



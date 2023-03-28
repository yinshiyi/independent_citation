#!/bin/bash

# Set the input and output files
input_file="/Users/shiyiyin/citation/data/shiyi.txt"
# remove strings after "&scipsc=1"
# use chrome to click through all of them
# gs_ab_mdw is the class name
output_file="$(basename "$input_file" .txt)_output_$(date +%Y-%m-%d_%H-%M-%S).csv"

# Use grep to find all instances of "Citations:" followed by two numbers separated by a slash, and capture the numbers
# The -o flag tells grep to only output the matched text (i.e. the numbers) instead of the entire line
# The sed command is used to replace the slash with a comma to create the CSV format
grep -o "Citations: \(-\?[0-9]\+\)/\(-\?[0-9]\+\)" $input_file | sed 's/Citations: //' | sed 's/\//,/g' | sed 's#:#,#g'> output_num.csv
grep "Link:" "${input_file}" | sed 's/Link: //g' | egrep -o 'http(s)?:\/\/[^ "\(\)\<\>]*' | tr -d '\r' > output_links.csv

paste -d ',' output_num.csv output_links.csv > $output_file
rm output_num.csv output_links.csv

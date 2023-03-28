#!/bin/bash

# Set the input file
input_file="/Users/shiyiyin/citation/data/shiyi.txt"

# Generate the output file name
output_file="${input_file%.*}_output_$(date +%Y-%m-%d_%H-%M-%S).csv"

# Find all instances of "Citations:" followed by two numbers separated by a slash, capture the numbers, and replace the slash with a comma
citation_numbers=$(grep -oE 'Citations: (-?[0-9]+)/(-?[0-9]+)' "$input_file" | sed 's#Citations: ##;s#/#,#g')

# Find all links and remove any extra characters
links=$(grep -oE 'http(.*)' "$input_file")
fulllinks=$(echo "$links" | sed 's/\&scipsc=1.*//')
#links=$(grep -oE 'Link:  (http|https)://[^\s"]+' "$input_file")

# Combine the citation numbers and links into a CSV file and calculate the sum of citation numbers
echo "$citation_numbers" | paste -d ', ' - <(echo "$links") <(echo "$fulllinks") > "$output_file"
awk -F ',' '{sum1+=$1;sum2+=$2}END{print "Sum of GC:", sum1; print "Sum of total:", sum2}' "$output_file" >> "$output_file"

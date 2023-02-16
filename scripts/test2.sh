#!/bin/bash

# set input and output file names
input_file="citation.txt"
output_file="output.csv"

# use grep to extract lines with "Citations:" and "Link:" and extract the relevant information using sed
grep -E "Citations: -?[0-9]+/[0-9]+" "$input_file" | sed -E 's/.*Citations: (-?[0-9]+\/[0-9]+).*/\1/' > citations.txt
# what is grep -E, grep -oP?
grep "Link:" "$input_file" | sed -E 's/.*Link: (.*)/\1/' > links.txt

# paste the contents of the two files together, separating the columns with a comma
paste -d, citations.txt links.txt > "$output_file"

# remove temporary files
rm citations.txt links.txt
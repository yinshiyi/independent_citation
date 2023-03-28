#!/bin/bash

# Remove rows that do not contain "Link:"

# grep "Link:" citation.txt | sed 's/Link: //g' | egrep -o 'http(s)?:\/\/[^ "\(\)\<\>]*' | tr -d '\r' > output2.csv


#!/bin/bash

# Define input and output file paths
input_file="data/shiyi.txt"
output_file="output.csv"

links=$(grep -oE 'http(.*)' "$input_file")
fulllinks=$(echo "$links" | sed 's/\&scipsc=1.*//')
#links=$(grep -oE 'Link:  (http|https)://[^\s"]+' "$input_file")

# Combine the citation numbers and links into a CSV file and calculate the sum of citation numbers
paste -d ',' <(echo "$links") <(echo "$fulllinks") > "$output_file"

# Create an empty output file and add header row
# echo "Link" > "$output_file"

# Extract rows that contain "Link:" and grep strings after each "Link: "
# grep "Link:" "$input_file" | sed -E 's/Link: (.*)/\1/' | egrep -o 'http(s)?:\/\/[^ "\(\)\<\>]*' | tr '\n' ',' | sed 's/,$/\n/' >> "$output_file"

# grep "Link:" "$input_file" | sed 's/Link: //g' | egrep -o 'http(s)?:\/\/[^ "\(\)\<\>]*' | tr '\n' ',' | sed 's/,$/\n/' >> "$output_file"


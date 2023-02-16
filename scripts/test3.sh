#!/bin/bash

# create output CSV file with headers
echo "Citations,Link" > output.csv

# grep the numbers after each instance of "Citations:" and the strings after each instance of "Link:"
grep -o 'Citations: [-0-9]\+\/[-0-9]\+|Link: [^[:space:]]\+' citation.txt | 
while read -r line; do
    # extract the Citations and Link values from the line
    citations=$(echo "$line" | grep -o '[-0-9]\+\/[-0-9]\+' | head -n1)
    link=$(echo "$line" | grep -o 'Link: [^[:space:]]\+' | sed 's/Link: //')

    # write the Citations and Link values to the output CSV file
    echo "$citations,$link" >> output.csv
done

echo "Output file saved as output.csv"

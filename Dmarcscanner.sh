#!/bin/bash
echo "Enter File Location : "
read location
input="$location"
while IFS= read -r line
do
echo "$(dig TXT _dmarc.$line | grep 'v=DMARC\|SOA');"
done < "$input"

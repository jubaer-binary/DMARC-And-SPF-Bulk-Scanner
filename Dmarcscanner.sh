#!/bin/bash
#Colors
RED=$(echo -en '\001\033[00;31m\002')
GREEN=$(echo -en '\001\033[00;32m\002')
WHITE=$(echo -en '\001\033[01;37m\002')

echo "${WHITE}Enter File Location : "
read location
input="$location"
while IFS= read -r line
do
execute1=$(dig TXT _dmarc.$line | grep 'v=DMARC\|SOA')

echo -e "${GREEN}$execute1"
done < "$input"

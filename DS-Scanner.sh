#!/bin/bash
#Colors
RED=$(echo -en '\001\033[00;31m\002')
GREEN=$(echo -en '\001\033[00;32m\002')
WHITE=$(echo -en '\001\033[01;37m\002')
​
echo "${WHITE}Enter File Location : "
read location
echo "${RED}
██████╗    ███████╗   ███████╗ ██████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ 
██╔══██╗   ██╔════╝   ██╔════╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗
██║  ██║   ███████╗   ███████╗██║     ███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝
██║  ██║   ╚════██║   ╚════██║██║     ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗
██████╔╝██╗███████║██╗███████║╚██████╗██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║
╚═════╝ ╚═╝╚══════╝╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                                                                                  "
input="$location"
while IFS= read -r line
do
execute1=$(dig TXT _dmarc.$line | GREP_COLORS='mt=01;32' egrep --color=always 'v=DMARC|\SOA')
spf=$(nslookup -type=txt $line | GREP_COLORS='mt=01;32' egrep --color=always 'v=spf')
echo -e "${GREEN}------------------------------------------Domain: $line------------------------------------------\n\n${GREEN}$execute1\n${WHITE}$spf\n\n"
done < "$input"

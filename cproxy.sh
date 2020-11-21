#!/bin/bash
echo Connecting to TOR.
service tor start
clear
echo Connecting to TOR..
sleep .4
clear
echo Connecting to TOR...
sleep .4
clear
echo Connecting to TOR....
sleep .4
sleep
echo Connecting to TOR.....
clear
echo -e "\e[5m!!!Please keep this terminal running in order to maintain connections to TOR & proxy server!!!"
echo -e "\e[0m"
	

echo -e "\e[45m-----= Minimizing the terminal is suggested =-----" 
echo -e "\e[0m"
echo -e "Connecting to TOR...... \e[5mCONNECTED!"
echo -e "\e[0m"  
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo "example: jhef7rge64g47fh4dd4h.onion:80"
echo "If attacking a SQL server use something like http://site.com/vuln.php?id=1:80"
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo "Enter TARGET URL:"
read vartarget
sudo socat TCP4-LISTEN:8000,reuseaddr,fork SOCKS4A:127.0.0.1:$vartarget,socksport=9050


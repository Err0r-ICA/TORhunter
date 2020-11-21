#!/bin/bash
echo Connecting to TOR.
sudo service tor start
clear
CONNECTED TO TOR!  
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo "example: jhef7rge64g47fh4dd4h.onion"
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo "Enter TARGET URL:"
read vartarget
sudo proxychains4 nmap -Pn -sT -v $vartarget
read -p "Press [Enter] key to start backup..."




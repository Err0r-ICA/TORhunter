#!/bin/bash
echo "Connecting to TOR."
service tor start
clear
echo ""CONNECTED TO TOR!""
echo "Starting Docker"
service docker start
clear
echo "DOCKER STARTED!" 
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo "-p 21,22,23,25,80,135,139,443,8080,8000,9050,4444 wwfmgeecv2aflaopqvfdad.onion"
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo "Enter TARGET:"
read vartarget
sudo docker run --rm -it milesrichardson/onion-nmap $vartarget
read -p "Press [Enter] key to start backup..."

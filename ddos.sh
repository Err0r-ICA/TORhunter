#!/bin/bash 
clear
echo "====================================================================="
echo "EtherApe is a visual tool that will show you information such as"
echo "what you are attacking and at what rate you are attacking." 
echo "--------------------------------------------------------------------"
sleep 1.5
echo "You may also run this script more than once at the same time"
echo "in an effort to be more effective; or choose menu 2 option 6"
echo "===================================================================="
echo
echo
echo
echo "____________________________________________________________________"
echo "Use Nmap, menu 1 option 3, to see open ports."
echo "Ports like: 8000 or 80, 21, 22, 443; 8080,"
echo
echo
echo "Enter PORT:"
read varport
sudo /home/binbash/Vigilante-Toolset/ddos 127.0.0.1 $varport

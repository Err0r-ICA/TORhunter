#!/bin/bash
echo "Use Nmap, menu 1 option 3, to see open ports."
echo "Ports like: 8000 or 80, 21, 22, 443; 8080,"
echo  
echo "Enter PORT:"
read vartport
sudo /home/binbash/Vigilante-Toolset/bruTOR 127.0.0.1 $varport 
read -p "Press [Enter] key to start backup..."

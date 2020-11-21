sudo apt-get update
sudo apt-get install terminator -y
sudo apt-get install nikto -y
sudo apt-get install python3 -y  
sudo apt-get install python3-pip -y
sudo apt-get install sqlmap -y
sudo apt-get install uniscan -y
sudo apt-get install socat -y
sudo apt-get install hydra -y
sudo apt-get install tor -y
sudo apt-get install nmap -y
sudo apt-get install torbrowser-launcher -y
sudo apt-get install etherape -y
sudo apt install proxychains4 -y
sudo apt install docker
sudo apt install docker.io
sudo gcc ddos.c -o ddos
sudo gcc cDDoS.c -o cDDoS
sudo chmod +x proxy.sh
sudo chmod +x cproxy.sh
sudo chmod +x bruTOR.sh
sudo chmod +x bruTOR
sudo chmod +x cport.sh
sudo chmod +x ddos.sh
sudo chmod +x ddos8000.sh
sudo chmod +x ddosx4.sh
sudo chmod +x nmap.sh
sudo chmod +x proxy.sh
sudo chmod +x run.sh
sudo chmod +x sql.sh
sudo chmod +x TorHunter
echo "PLEASE ENTER THE USERNAME OF THE SESSION YOU ARE CURRENTLY LOGGED IN AS:" 
echo " YOUR USERNAME IS PROBABLY:" "$USER"
read varusername 
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' TorHunter
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' bruTOR.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' cport.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' cproxy.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' ddos.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' ddos8000.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' ddosx4.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' nmap.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' proxy.sh
sudo sed -i 's+YOUR_USER_NAME+'$varusername'+' sql.sh
sudo ./TorHunter

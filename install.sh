#!/bin/bash

#Installing Docker
echo "Installing Docker"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
docker --version
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
sudo docker --version
echo "Docker installed"

#Installing Nginx
echo "Installing Nginx"
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
echo "Nginx installed"

#Installing Netstat
echo "Installing netstat"
sudo apt update
sudo apt install net-tools
netstat --version
echo "netstat installed"

#Installing awk command

# Function to install awk on CentOS/RHEL
install_awk_centos() {
    sudo apt install gawk -y
}

# Check if awk is available
if command -v awk > /dev/null 2>&1; then
    echo "awk is already installed."
else
    echo "awk is not installed. Installing..."
    install_awk_centos

fi

#Function to install finger on CentOS/RHEL
install_finger() {
    sudo apt install finger -y
}

# Check if finger is installed
if command -v finger > /dev/null 2>&1; then
    echo "finger is already installed."
else
    echo "finger is not installed. Installing..."
    install_finger
fi

#Reboot system
sudo systemctl reboot

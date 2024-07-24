## DevOpsfetch Application for Server Information Retrieval and Monitoring

This is an application that is set up to retrieve server information, improve maintenance, monitor logs and server activities with the help of a shell script. By running certain command line arguments, you are able to retrieve certain information and logs from your linux server. You can edit the application to better suit your needs and priorities.

### Prerequisites
- Basic knowledge of command line
- An Ubuntu Server
- Run the install.sh script to install dependencies.

### Install Dependencies

#### Install Docker

```
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
```

#### Install Nginx

```
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
```

#### Install Netstat

```
sudo apt update
sudo apt install net-tools
netstat --version
```

#### Install Awk Command

```
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
```

#### Install Finger Command

```
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
```

#### Reboot Server

```
sudo systemctl reboot
```

### Script Usage

```
-p
-p <port_number>
```
- `-p` will display all active ports and services.
- `-p <port_number>` will provide detailed information about a specific port.

```
-d
-d <container_name>
```
- `-d` will list all docker images and containers.
- `-d <container_name>` will provide details about a specific container.

```
-n
-n <domain>
```
- `-n` will display all Nginx domains and their ports.
- `-n <domain>` will provide detailed configuration information about a specific domain.

```
-u
-u <username>
```
- `-u` will list all users and their login times.
- `-u <username>` will provide detailed information about a specific user.

```
-t <year-month-day>
-t <year-month-day> <year-month-day>
```
- ` -t <year-month-day>` will display activities for specified date.
- `-t <year-month-day> <year-month-day>` will display activities for specified date range.

### Run Script

```
chmod +x devopsfetch.sh
./devopsfetch.sh <$1> <$2> <$3>
```
- The first command makes the script executable
- The second command is an example of how to run the script with a minimum of 1 argument and maximum of 3 arguments.

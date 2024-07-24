#!/bin/bash

flag="$1"
name="$2"
    
if [ "$flag" == "-p" ] && [[ "$name" =~ ^[0-9]+$ ]] && [ "$name" -ge 1 ] && [ "$name" -le 65535 ]; then
    echo "Details for port $name:"
    netstat -tuln | grep ":$name"
elif
    [ "$flag" == "-p" ]; then
    # Display all active ports and services
    netstat -tuln
fi

   #inspect docker container
if [ "$flag" == "-d" ] && [ -n "$name" ]; then
    docker inspect "$name"
elif
   [ "$flag" == "-d" ]; then
   # Display all docker images and containers
   docker images && docker ps -a
fi
    

# Function to extract domains and ports from nginx config files
extract_domains_and_ports() {
    grep -rE 'server_name|listen' /etc/nginx/sites-available /etc/nginx/conf.d /etc/nginx/nginx.conf | \
    awk '
    /server_name/ { domain=$0; gsub(/.*server_name\s*/, "", domain); gsub(/;.*/, "", domain); next }
    /listen/ { port=$0; gsub(/.*listen\s*/, "", port); gsub(/;.*/, "", port); print domain, port }' | \
    sort | uniq
}

     
if [ "$flag" == "-n" ] && [ -n "$name" ]; then
    echo "Searching for configuration details for domain: $name"
    grep -r "$name" /etc/nginx/

elif
    [ "$flag" == "-n" ]; then
   # call the function
   extract_domains_and_ports
fi
   

if [ "$flag" == "-u" ] && [ "$2" == "$username" ]; then
   # Username details
   echo "Displaying User Information:"
   finger "$username"
elif
   [ "$flag" == "-u" ]; then
   # list all users and login time
   last -a
fi

if [ "$flag" == "-t" ] && [ -n "$2" ] && [ -n "$3" ]; then
   # Get activities for specific time range
   awk "/$2/,/$3/" /var/log/syslog

elif
   [ "$flag" == "-t" ] && [ -n "$name" ]; then
   # Get activities for specific day
   grep "$name" /var/log/syslog

fi 
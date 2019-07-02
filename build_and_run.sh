#!/bin/bash

docker stop anyconnect-proxy
docker rm anyconnect-proxy
docker build -t anyconnect-proxy .
docker run -d -v cisco:/root/.cisco -e VPN_USER=<username> -e VPN_PASSWORD=<password> -e VPN_HOST=<host> -p <local proxy port>:9052 --restart always --name anyconnect-proxy anyconnect-proxy 

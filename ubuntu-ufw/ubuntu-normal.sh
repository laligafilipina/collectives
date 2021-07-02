#!/bin/bash

sudo ufw disable
sudo ufw reset
sudo ufw enable

sudo ufw allow out 53/udp comment "dns traffic" #dns traffic
sudo ufw allow out on <interface> to any port 80 comment 'http traffic' #http traffic
sudo ufw allow out on <interface> to any port 443 comment 'https traffic' #https traffic

sudo ufw reload
sudo systemctl restart network-manager

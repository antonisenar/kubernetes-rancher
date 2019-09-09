#!/usr/bin/env bash
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get --assume-yes install docker-ce=5:18.09.7~3-0~ubuntu-bionic docker-ce-cli=5:18.09.7~3-0~ubuntu-bionic containerd.io
sudo systemctl start docker
sudo systemctl enable docker
#Para Longhorn
sudo apt-get --assume-yes install open-iscsi
sudo apt-get --assume-yes install ntp
sudo timedatectl set-timezone Europe/Madrid
sudo systemctl stop apparmor
sudo systemctl disable apparmor
sudo service apparmor teardown
sudo aa-status
sudo apt -y update
#Para StorageOS
sudo apt -y install linux-modules-extra-$(uname -r)
sudo usermod -aG docker $USER
#sudo ip route add default via 192.168.2.157

#Deshabilitamos swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:v2.3.0-alpha5

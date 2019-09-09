#!/usr/bin/env bash
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get --assume-yes install docker-ce=5:18.09.7~3-0~ubuntu-bionic docker-ce-cli=5:18.09.7~3-0~ubuntu-bionic containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo apt-get --assume-yes install open-iscsi
sudo apt-get --assume-yes install ntp
sudo timedatectl set-timezone Europe/Madrid
sudo systemctl stop apparmor
sudo systemctl disable apparmor
sudo service apparmor teardown
sudo aa-status
sudo apt -y update
sudo apt -y install linux-modules-extra-$(uname -r)
sudo usermod -aG docker $USER
sudo ip route add default via 192.168.2.157


sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


### OJO!! El siguiente comando dependerá de la instalación concreta de Rancher Server (CLuster EDIT)
sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.3.0-alpha5 --server https://asenar-lb-rancher-server-cluster-87fb648fa6428e7d.elb.eu-west-1.amazonaws.com --token xqwz44mj8lvvxmx56c5mr95ljhqr88htj8fl4j4nncpmvsplngt8mx --ca-checksum 7c6d174abfe4aa371ab6cd9f583587d85751f86c71b4cfc8e783ab3fc750a0d4 --worker

#!/usr/bin/env bash

# Install Docker CE Ubuntu AMI

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    ctop \
    htop \
    jq \
    zip \
    awscli \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce=5:18.09.2~3-0~ubuntu-bionic docker-ce-cli=5:18.09.2~3-0~ubuntu-bionic containerd.io

sudo groupadd docker

sudo usermod -aG docker ubuntu

sudo systemctl enable docker

# Copy your assets to /opt/tfe-installer/  In my case: fullchain.pem, hashicorp-support-sofia.rli, privkey.pem
sudo mkdir -p /opt/tfe-installer/

cp /tmp/assets/* /opt/tfe-installer/
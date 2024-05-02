#!/bin/bash

# Install Docker and Docker Compose
sudo yum check-update
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Create the docker group
sudo groupadd docker

# Create the docker user
sudo useradd docker

# Create the Docker configuration file
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<EOF
{
    "exec-opts": ["native.cgroupdriver=systemd"],
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "100m"
    },
    "storage-driver": "overlay2"
}
EOF

# Start Docker and Docker Compose
sudo systemctl start docker
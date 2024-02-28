#!/bin/bash

# Instalação do Docker e o Docker Compose
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo yum install -y docker-compose

# Cria o grupo docker
sudo groupadd docker

# Cria o usuário docker
sudo useradd docker

# Cria o arquivo de configuração do Docker
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

# Inicia o Docker e o Docker Compose
sudo systemctl start docker










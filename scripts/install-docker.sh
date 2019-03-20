#! /bin/bash


set -e

MYUSER="$1"

echo 'Install docker: https://docs.docker.com/install/linux/docker-ce/ubuntu/'

# remove old versions
apt-get remove -y docker docker-engine docker.io containerd runc

# install requirements
apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# verify the key
apt-key fingerprint 0EBFCD88

# add repo
add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

# install
apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# test
docker run hello-world

# enable docker for non-root user
groupadd -f docker
usermod -aG docker $MYUSER

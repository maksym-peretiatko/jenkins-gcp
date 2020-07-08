#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install wget
sudo apt install -y docker.io

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.4.0.deb
sudo dpkg -i minikube_1.4.0.deb

sudo minikube config set vm-driver none

sudo minikube start

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

sudo kubectl get po -A

sudo kubectl create deployment --image nginx my-nginx

sudo kubectl expose deployment my-nginx --port=80 --type=NodePort

sudo minikube service list

# Create an Nginx Proxy to Access the Installed Application from the Public IP Address

sudo apt install -y nginx


# Install helm
wget https://get.helm.sh/helm-v3.2.1-linux-amd64.tar.gz

sleap 30s

tar zxfv helm-v3.2.1-linux-amd64.tar.gz
cp linux-amd64/helm .

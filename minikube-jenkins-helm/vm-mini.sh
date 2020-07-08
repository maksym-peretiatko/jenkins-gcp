#!/bin/bash

gcloud config set compute/zone us-central1-a

gcloud compute instances create minikube \
    --image-family=debian-10 \
    --image-project=debian-cloud \
    --machine-type=n1-standard-4 \
    --scopes userinfo-email,cloud-platform, \
    --metadata-from-file startup-script=./install-minikube.sh \
    --tags http-server

gcloud compute firewall-rules create default-allow-http-8080 \
    --allow tcp:8080 \
    --source-ranges 0.0.0.0/0 \
    --target-tags http-server \
    --description "Allow port 8080 access to http-server"

gcloud compute instances get-serial-port-output minikube

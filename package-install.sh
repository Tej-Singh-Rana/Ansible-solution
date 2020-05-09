#!/bin/bash

#sudo amazon-linux-extras install ansible2
sudo yum install docker -y && sudo systemctl enable --now docker

sudo docker build -t ansible:v1 .

sudo docker run -itd --name ansible-task -v /var/lib/docker.sock:/var/lib/docker.sock ansible:v1



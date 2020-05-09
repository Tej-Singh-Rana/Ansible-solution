#!/bin/bash

cp  /root/ansible-playbook.yml /etc/ansible/
cat > /etc/ansible/hosts <<EOF
 [local]
 localhost
 EOF
 
 sleep 2
 
 ansible-playbook ansible-playbook.yml
 
 sleep 2

for i in `seq 10`;
do
	docker run -itd --name container$i alpine
done
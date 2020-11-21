#!/bin/bash

#Installing pip and ansible
sudo apt-get update
sudo apt install python3-pip -y
sudo apt install python-pip -y
sudo apt install ansible -y


#install my ansible files
git clone https://github.com/SherazShahid017/practical-project-qa/
cd practical-project-qa/
git checkout kubernetes
cd ansible-files/

ansible-playbook -i inventory.conf playbook.yaml



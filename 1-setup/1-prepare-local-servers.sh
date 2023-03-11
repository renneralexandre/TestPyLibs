#!/bin/bash

# Create ssh key if does not exist
[ ! -f ./ansible/ssh/ansible ] && ssh-keygen -t rsa -N "" -f ./ansible/ssh/ansible 

servers=("LoadBalancer" "webserver1" "webserver2" "db")

# Loop para percorrer a matriz
for server in "${servers[@]}"
do
  # Create instance
  multipass launch 22.04 --name $server
  
  # create user and set password
  echo -e "1\n1\n" | multipass exec $server -- sudo adduser --gecos "" ansible
  
  # create ssh folder on instance
multipass  multipass exec LoadBalancer -- sudo mkdir /home/ansible/.ssh/

  # copy pub key
  multipass exec $server -- sudo sh -c "echo '$(cat ./ansible/ssh/ansible.pub)' >> /home/ansible/.ssh/authorized_keys"  
  echo "------"
  exit

done

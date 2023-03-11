#!/bin/bash

# Create ssh key if does not exist
[ ! -f ./ansible/ssh/ansible ] && ssh-keygen -t rsa -N "" -f ./ansible/ssh/ansible 

servers=(
  ["LoadBalancer",  "192.168.64.10"],
  ["webserver1",  "192.168.64.20"],
  ["webserver2",  "192.168.64.30"],
  ["db",  "192.168.64.40"]
)
  

# Loop para percorrer a matriz
for server in "${servers[@]}"
do
  server="${server[0]}"
  ip="${server[1]}"
  # Create instance
  multipass launch 22.04 --name $server
  multipass stop myinstance
  multipass set myinstance network.ipv4_address=$ip
  multipass start myinstance
  
  # create user and set password
  echo -e "1\n1\n" | multipass exec $server -- sudo adduser --gecos "" ansible
  
  # create ssh folder on instance
  multipass  multipass exec LoadBalancer -- sudo mkdir /home/ansible/.ssh/

  # copy pub key
  multipass exec $server -- sudo sh -c "echo '$(cat ./ansible/ssh/ansible.pub)' >> /home/ansible/.ssh/authorized_keys"  
  echo "------"
done

multipass list

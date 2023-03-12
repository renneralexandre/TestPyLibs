#!/bin/bash

# on mac
# rm /var/db/dhcpd_leases

# Create ssh key if does not exist
[ ! -f ./ansible/ssh/ansible ] && ssh-keygen -t rsa -N "" -f ./ansible/ssh/ansible 
chmod 600 ./ansible/ssh/ansible

servers=(
  "LoadBalancer:192.168.64.2"
  "webserver1:192.168.64.3"
  "webserver2:192.168.64.4"
  "db:192.168.64.5"
)
  

# Loop para percorrer a matriz
for server in "${servers[@]}"
do
  name=$(echo "${server}" | cut -d ":" -f 1)
  ip=$(echo "${server}" | cut -d ":" -f 2)
  echo -e "\033[34mSetting server [ \033[32m$name\033[34m ] ip [ \033[32m$ip\033[34m ]\033[0m"
  # Create instance
  multipass launch 22.04 --name $name

  # Change IP
  # multipass stop $name
  # multipass set $name network.ipv4_address=$ip
  # multipass start $name
  
  # create user and set password
  echo -e "1\n1\n" | multipass exec $name -- sudo adduser --gecos "" ansible
  
  # create ssh folder on instance
  multipass exec $name -- sudo mkdir /home/ansible/.ssh/

  # copy pub key
  multipass exec $name -- sudo sh -c "echo '$(cat ./ansible/ssh/ansible.pub)' >> /home/ansible/.ssh/authorized_keys"  
  echo "------"
done
echo ""

multipass list

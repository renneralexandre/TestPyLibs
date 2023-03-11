# Step-by-Step

## Prepare 4 servers on MacOs to test Ansible

1) Install multipass

multipass: https://multipass.run/

Multipasss is a software to Get an instant Ubuntu VM with a single command. 
It can launch and run virtual machines and configure them with cloud-init like a public cloud.
Useful using M1 processors, installing correct versions.

# SCRIPT

2) Setup VMs, extraxt privatr keys, seup keys in ansible.

    `chmod +x ./1-setup/1-prepare-local-servers.sh && ./1-setup/1-prepare-local-servers.sh`

# OR each comand 

3) Manual process Create VMs.
    
    `multipass launch 22.04 --name {servername}`
        

4) Create ansible user on each VM, with password "1" (just for testing purposes, don't do it on production environment)

    `echo -e "1\n1\n" | multipass exec {servername} -- sudo adduser  --gecos "" ansible`

5) Get 
- configure
     pub key
    - run ansible all -m ping
    - multipass shell webserver1

    echo -e "1\n1\n" | multipass exec <instance-name> -- sudo adduser --disabled-1 --gecos "" ansible


# Prepare 4 servers on MacOs to test Ansible

## Step-by-Step

1) Install multipass and setup instances

multipass: https://multipass.run/

Multipasss is a software to Get an instant Ubuntu VM with a single command. 
It can launch and run virtual machines and configure them with cloud-init like a public cloud.
Useful using M1 processors, installing correct versions.

# SCRIPT

2) Setup VMs, extraxt privatr keys, seup keys in ansible.

    `chmod +x ./1-setup/1-prepare-local-servers.sh && ./1-setup/1-prepare-local-servers.sh` 
    
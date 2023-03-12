# Prepare 4 servers on MacOs to test Ansible

## Step-by-Step

1) Install ansible

pip install ansible && mkdir ansible && cd ansible

2) configure
 To see some configs
 
 `ansible-config init --disabled > ./config-examples/ansible-disable.cfg`
 
 `ansible-config init --disabled -t all > ./config-examples/ansible-disable-plugins.cfg`

    To config create ./ansible.cfg
    - Define user, path-to-private-key, path-to-inventory

3) Create Inventory
    - mkdir inventory
    - touch inventory.yaml
    



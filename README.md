Step-by-Step

1) chmod +x ./venv_setup.sh && ./venv_setup.sh && source venv/bin/activate
2) pip install ansible && mkdir ansible && cd ansible
3) ansible-config init --disabled > ansible-disable.cfg
4) ansible-config init --disabled -t all > ansible-disable-plugins.cfg

5) Ansible

5.1) ansible.cfg

5.2) Inventory
    - update ansible.cfg
    - mkdir inventory
    - touch inventory.yaml

6) install multipass
    - create a linux vn
    - configure pub key
    - run ansible all -m ping
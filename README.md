# ADD_SSH_KEY_TO_REMOTE_MACHINE

This repository provides a streamlined solution for adding an SSH key to multiple remote machines using Ansible. Whether you're managing a fleet of servers or just a few, this setup will save you time and effort in ensuring secure SSH access.

# Prerequisites
Before you get started, make sure you have the following prerequisites in place:

1. **Ansible:** Ensure Ansible is installed on the machine from which you intend to run the playbook. You can install Ansible by following the instructions in the official documentation.

2. **SSH Key:** You should have the SSH key that you want to add to the remote machines readily available. This key will be added to the authorized_keys file of the specified user on the remote hosts.

# Repository Structure
This repository is organized as follows:

```
ADD_SSH_KEY_TO_REMOTE_MACHINE/
├── README.md
├── ansible.cfg
├── group_vars/
│   └── all.yml
├── host_vars/
├── inventory/`
│   ├── AWS
│   │   ├── prod
│   │   ├── test
│   │   └── dev
│   └── on_premise
│   │   ├── prod
│   │   ├── test
│   │   └── dev
└── playbooks/
    └── add_ssh_key.yml
```

`ansible.cfg`: This file contains Ansible configuration settings, including the inventory file path, remote user, SSH options, and more.

`group_vars/all.yml`: Define variables that apply to all the hosts in the inventory.
You can specify the SSH key to be added here. For security reasons, you can encrypt this file using the ansible-vault command.

`inventory/*`: This is the inventory directory where you list the hosts you want to manage.
You can group hosts for better organization.

`host_vars/`: This directory contains individual files for each host.
Here, you can define host-specific variables like the hostname, remote user, and SSH private key file.

`playbooks/add_ssh_key.yml`: The main playbook responsible for adding the specified SSH key to all remote machines.
It uses Ansible's authorized_key module for this task.

# Usage
Follow these steps to add your SSH key to the remote machines:

1. **Inventory Setup:** Edit the `inventory/hosts` file and list the hosts you want to manage. Organize them into groups as needed.

Example:

```csharp
[web_servers]
web1.example.com
web2.example.com

[db_servers]
db1.example.com
db2.example.com
```

2. **Variable Configuration:** Define any host-specific variables in the `inventory/host_vars/` directory. For instance, in the file `inventory/host_vars/web1.example.com`, you can specify host-specific parameters:

```yaml
ansible_host: 192.168.1.10
ansible_user: ubuntu
ansible_ssh_private_key_file: ~/.ssh/id_rsa_web1
```

3. **SSH Key Input:** Run the playbook using the following command and provide the SSH key you want to add when prompted:

```shell
ansible-playbook playbooks/add_ssh_key.yml --ask-vault-pass
```

The `--ask-vault-pass` flag is used to decrypt the `group_vars/all.yml` file if it's encrypted. Enter the vault password when prompted.

4. **Sit Back and Relax:** The playbook will execute the tasks to add the SSH key to all remote machines in your inventory.

# Note
This setup is designed for educational and reference purposes.
Ensure you have proper access rights and permissions for adding SSH keys to remote machines.
Always exercise caution when managing SSH access to your servers.

For any questions or feedback, feel free to reach out.

benjisho.

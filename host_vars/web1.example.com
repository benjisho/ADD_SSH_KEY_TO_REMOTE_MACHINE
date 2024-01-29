ansible_host: 192.168.1.10

ansible_user: ubuntu

ansible_ssh_private_key_file: ~/.ssh/id_rsa_web1
# specifies the path to the private SSH key file that Ansible will use to authenticate to the remote host.
# This key should correspond to a public key that's been added to the authorized_keys file of the remote user's account on the target machine.

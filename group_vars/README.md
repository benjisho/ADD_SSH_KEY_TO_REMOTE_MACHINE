# Optional
## You can use Ansible Vault to Encrypt the SSH key

Ansible Vault is a feature of ansible that allows you to encrypt sensitive data such as passwords, keys, or tokens. You can use ansible-vault to encrypt and decrypt files or variables in your repository.

To use ansible-vault, you need to create a vault password file and store it somewhere safe, such as `~/.vault_pass.txt`. You can use any text editor to create this file and write your vault password in it. Make sure you do not commit this file to your repository or share it with anyone.

You can use the `vault_password_file` parameter in the `ansible.cfg` file to specify the path to your vault password file. For example:

```
[defaults]

# The path to the vault password file
vault_password_file = ~/.vault_pass.txt
```

This way, ansible will automatically use your vault password when running playbooks or commands that involve encrypted files or variables.

You can use the `ansible-vault` command to encrypt and decrypt files or variables in your repository. For example, if you want to encrypt the `group_vars/all.yml` file that contains the SSH key, you can run the following command:

```
ansible-vault encrypt --vault-password-file ~/.vault_pass.txt group_vars/all.yml
```

This will encrypt the file and make it unreadable without the vault password. You can also use the `ansible-vault` command to edit, decrypt, or rekey the file.

- For more information, see the [Ansible Vault documentation](https://docs.ansible.com/ansible/2.8/user_guide/vault.html)https://docs.ansible.com/ansible/2.8/user_guide/vault.html.

[all:vars]
ansible_connection=ssh
ansible_user=${user}
ansible_ssh_private_key_file=${private_key}

[dev] 
${dev} ansible_ssh_extra_args='-o StrictHostKeyChecking=no'
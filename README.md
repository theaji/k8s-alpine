# Bootstrapping Kubernetes Cluster on Alpine with kubeadm and Ansible

This project provides Ansible playbooks and roles to automate the setup of a Kubernetes cluster on Alpine. It aims to streamline the process and reduce manual efforts.

## Requirements 

- **SSH Access**: Ensure that SSH access is enabled to all target nodes using SSH key pairs
- **Sudo Access**: Ensure that a user with sudo privileges exists on the target nodes
- **Python**: Ensure that Python3 is installed on all target nodes.
- **Inventory File**: Create an Ansible inventory file containing the details of all target nodes. An example is provided in ansible/inventory/hosts.


## Usage

- Clone the repository: `git clone https://github.com/theaji/k8s-alpine.git`
- Edit the inventory file to match your environment: `vim ansible/inventory/hosts`
- Customize the Ansible variables according to your requirements. You may need to adjust settings such as Kubernetes version, network configuration, and domain name
```bash
vim ansible/inventory/group_vars/all/vars
```
- Run the Ansible playbook:
```bash
./scripts/setup.sh #create virtualenv and install dependencies
source /tmp/k8s-alpine/bin/activate #activate venv
cd ansible
ansible-playbook k8s-setup.yml
#if sudo user requires password authentication, use: ansible-playbook k8s-setup.yml --ask-become-pass
```
- Monitor the playbook execution for any errors or warnings. Once the playbook completes successfully, your Kubernetes cluster should be up and running.

## Repository Structure

- **`ansible/`**: Contains Ansible playbooks and roles for setting up the Kubernetes cluster.
  - **`roles/`**: Directory containing Ansible roles.
  - **`inventory/`**: Directory containing Ansible inventory.
  - **`k8s-setup.yml`**: Main Ansible playbook.
- **`scripts/`**: Contains project scripts.
  - **`setup.sh`**: Setup script for installing dependencies.
- **`README.md`**: Project documentation providing an overview, usage instructions, etc.
- **`LICENSE`**: License file specifying the project's licensing terms.
- **`requirements.txt`**: Contains Python dependencies required for the project.
- **`requirements.yml`**: Contains Ansible collections required for the project.

## Tested Platforms

This project was tested successfully on the following platforms:

- 4x Rapsberry pi 4B devices (2x 4GB, 2x 8GB) running Alpine v3.19 64-bit OS
- 4x Alpine v3.19 64-bit VMs running on ESXI 7.0

## Contributing

Contributions are welcome! Please follow these guidelines when contributing:
- Fork the repository and create a new branch for your feature or fix.
- Write clear commit messages.
- Submit a pull request with a detailed description of your changes.

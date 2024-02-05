# Bootstrapping Kubernetes Cluster on Alpine with kubeadm and Ansible

This project provides Ansible playbooks and roles to automate the setup of a Kubernetes cluster on Alpine. It aims to streamline the process and reduce manual efforts.

## Requirements 

- **SSH Access**: Ensure that SSH access is enabled to all target nodes and a user with sudo privileges exists on the nodes
- **Python**: Ensure that Python3 is installed on all target nodes.
- **Inventory File**: Create an Ansible inventory file containing the details of all target nodes. An example is provided in ansible/inventory/hosts.

- Before running the Ansible playbooks, ensure that the following prerequisites are met:
- **Ansible**: Install Ansible on the control machine from which you will run the playbooks.
```bash
pip install ansible
```

## Usage
- Clone the repository: `git clone https://github.com/theaji/k8s-alpine.git`
- Edit the inventory file to match your environment
- Customize the Ansible variables in the playbook file (k8s-setup.yml) according to your requirements. You may need to adjust settings such as Kubernetes version, network configuration, and domain name.
- Monitor the playbook execution for any errors or warnings. Once the playbook completes successfully, your Kubernetes cluster should be up and running.

## Project Environment

- 4x Rapsberry pi 4B devices (2x 4GB, 2x 8GB)
- 4x 32GB SD cards
- 4x 64GB USB sticks for storing logs
- 2x 512GB SSD drives for storing data 
- [Alpine](https://www.alpinelinux.org/downloads/) v3.19 64-bit OS installed on 1 SD card (cloned to remaining 3 SD cards using [Etcher](https://etcher.balena.io/#download-etcher))

## Contributing

Contributions are welcome! Please follow these guidelines when contributing:
- Fork the repository and create a new branch for your feature or fix.
- Write clear commit messages.
- Submit a pull request with a detailed description of your changes.

## Repository Structure

- **`ansible/`**: Contains Ansible playbooks and roles for setting up the Kubernetes cluster.
  - **`roles/`**: Directory containing Ansible roles.
  - **`k8s-setup.yml`**: Main Ansible playbook.
- **`scripts/`**: Contains project scripts.
  - **`setup.sh`**: Setup script for installing dependencies.
- **`README.md`**: Project documentation providing an overview, usage instructions, etc.
- **`LICENSE`**: License file specifying the project's licensing terms.
- **`requirements.txt`**: Contains Python dependencies required for the project.
- **`requirements.yml`**: Contains Ansible collections required for the project.

# Bootstrapping Kubernetes Cluster on RPi4 with kubeadm

This repository documents steps and resources for setting up a Kubernetes cluster on RPi4 using kubeadm.

## Overview

The motivation for this project is to improve the reliablility of applications running in my home lab. Previously, all applications ran on a single Docker host and were managed with docker compose templates.

## Environment

- 4x Rapsberry pi 4B devices (2x 4GB, 2x 8GB)
- 4x 32GB SD cards
- 4x 64GB USB sticks for storing logs
- 2x 512GB SSD drives for storing data 
- [Alpine](https://www.alpinelinux.org/downloads/) v3.19 64-bit OS installed on 1 SD card (cloned to remaining 3 SD cards using [Etcher](https://etcher.balena.io/#download-etcher))
- User "ansible" created with sudo privileges 
- SSH package installed and password-less authentication configured from Ansible control node

## Repository Structure

- /roles: Contains ansible playbooks for package installation, cluster initialization, node joining, and other setup.
- /inventory: Contains ansible inventory
- /playbooks: Contains ansible playbooks to be executed

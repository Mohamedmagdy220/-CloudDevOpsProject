# Jenkins Installation and Configuration Playbook

## Overview

This playbook automates the process of installing **Jenkins**, **Java 17**, **Docker**, and other dependencies across **Master Node** and **Slave Nodes**. The setup uses **Ansible** to ensure consistency and automate the deployment across multiple EC2 instances on AWS.

### Features
- **Install Java 17** on all nodes.
- **Install Jenkins** on the **Master Node**.
- **Install Docker, Git, Maven** on all nodes.
- Ensures Jenkins service is started and enabled on the **Master Node**.

---

## Prerequisites

### 1. **Ansible**
   - Ensure **Ansible** is installed on the control node (your local machine or server).
     ```bash
     sudo apt update
     sudo apt install ansible
     ```

### 2. **AWS EC2 Instances**
   - **Master Node** and **Slave Nodes** should be launched and running on AWS EC2.
   - Ensure that the EC2 instances are accessible via SSH, and you have the private key (`.pem` file) for authentication.

### 3. **Inventory File**
   - Create an inventory file (`aws_ec2.yml`) that lists all the EC2 instances. An example for the inventory is shown below:

```yaml
plugin: aws_ec2
regions:
  - us-east-1
filters:
  instance-state-name: running
groups:
  master:
    filters:
      "tag:Name": "k8s-master"
  slaves:
    filters:
      "tag:Name": "k8s-node*"

# FYC HA Metrics

## Introduction

This is a school project where the objective is to create a high availability system for monitoring

Software used:

- Proxmox: Virtualization
- Ansible: Automation
- VictoriaMetrics (Single node and Cluster mode): Metrics storage
- Grafana: Visualization
- HAProxy: Load balancing

## Structure of this repository

- `ansible/`: Contains the ansible playbooks to deploy the monitoring system
- `scripts/`: Contains the scripts to:
  - Create the proxmox template from cloud images

## Install roles

```bash
ansible-galaxy install -r requirements.yml
```

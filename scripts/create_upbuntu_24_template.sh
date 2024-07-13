#!/bin/bash

## Run this script on the Proxmox host to create a Ubuntu 22.04 template

DL_URL="https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
FILE_NAME=$(echo $DL_URL | awk -F'/' '{print $NF}')
VMID=500
VM_NAME="ubuntu2404"
BRIDGE="vmbr2"
STORAGE="local"


echo "Downloading $FILE_NAME"
wget $DL_URL -O /tmp/$FILE_NAME

qm create $VMID --name $VM_NAME --memory 2048 --net0 virtio,bridge=$BRIDGE
qm importdisk $VMID /tmp/$FILE_NAME $STORAGE -format qcow2
qm set $VMID --scsihw virtio-scsi-pci --scsi0 $STORAGE:$VMID/vm-$VMID-disk-0.qcow2
qm set $VMID --ide2 $STORAGE:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0
qm set $VMID --ipconfig0 ip=dhcp
qm template $VMID

rm -v /tmp/$FILE_NAME

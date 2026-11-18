#!/bin/bash
set -e

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to the virtual disk
VM_DISK="$SCRIPT_DIR/../../../../vm/cybercent.qcow2"

# Check whether the virtual disk exists
if [[ ! -f "$VM_DISK" ]]; then
    echo "Error: VM disk not found at $VM_DISK"
    exit 1
fi

# Boot the CyberCent VM
qemu-system-x86_64 \
    -m 8192 \
    -smp 4 \
    -enable-kvm \
    -drive file="$VM_DISK",format=qcow2 \
    -nic user,hostfwd=tcp:127.0.0.1:2222-:22 \
    -vnc 127.0.0.1:0

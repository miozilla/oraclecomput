#!/bin/bash
# Author : Mior
# Script to display basic information about the Oracle Linux machine
# 
# sudo yum install dos2unix
# chmod +x oracle_linux_info.sh
# ./oracle_linux_info.sh
#


echo "----------------------------"
echo "  Oracle Linux Machine Info"
echo "----------------------------"

# Hostname
echo "Hostname: $(hostname)"

# Operating System and Kernel Info
echo "OS and Kernel: $(uname -o) $(uname -r)"

# Current Logged-in User
echo "Current User: $(whoami)"

# CPU Info
echo "CPU: $(lscpu | grep 'Model name' | awk -F: '{print $2}' | sed 's/^ //')"

# Memory (RAM) Info
echo "Total RAM: $(free -h | grep Mem | awk '{print $2}')"

# Disk Storage Size
echo "Storage Size:"
lsblk | grep disk | awk '{print $1 ": " $4}'

# Disk Usage
echo "Disk Usage:"
df -h --total | grep "total"

# Network Configuration (IP Address)
echo "IP Address: $(hostname -I | awk '{print $1}')"

# Uptime
echo "Uptime: $(uptime -p)"

# Yum Query: List installed packages
echo "Installed Packages (via Yum):"
yum list installed | head -10  # Showing the first 10 as an example

# Yum Query: Display enabled repositories
echo "Enabled Yum Repositories:"
yum repolist enabled

echo "----------------------------"
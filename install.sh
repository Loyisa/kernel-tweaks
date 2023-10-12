#!/bin/bash
backupFileName = "sysctl.conf-$(date +%Y-%m-%d-%H-%M-%S)"

echo "Kernel Tweeks by Nfense and DionaMC"

# Check is we are root
if [ "$EUID" -ne 0 ]; then
  echo "Please this script run as root."
  exit
fi

# Backup the /etc/sysctl.conf to current directory
cp /etc/sysctl.conf ./$backupFileName
echo "Backup sysctl.conf to ./$backupFileName"

# Copy kernel settings to /etc
cp ./sysctl.conf /etc

# Reload kernel from file
sysctl -p
echo "Kernel settings reloaded"

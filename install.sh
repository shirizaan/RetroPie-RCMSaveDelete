#!/usr/bin/env bash

CFGDIR="/opt/retropie/configs/all"
RCMDIR="runcommand-menu"
SCRIPT="Delete Save Files.sh"

# Check for root access.
if [[ $EUID -ne 0 ]]; then
  echo "Please run script as root."
  exit 1
fi

# Check if runcommand-menu exists and create it if needed.
cd "$CFGDIR"
if [[ ! -d "$RCMDIR" ]]; then
  mkdir "$RCMDIR"
fi

# Download Delete Save Files.sh to the runcommand-menu.
cd "$RCMDIR"
wget "https://raw.githubusercontent.com/shirizaan/RetroPie-RCMSaveDelete/master/Delete%20Save%20Files.sh"
chmod +x "$SCRIPT"

# Installation complete.
echo "Installation is complete."

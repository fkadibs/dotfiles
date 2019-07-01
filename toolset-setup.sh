#!/bin/bash

# make the toolset directories in main directory (I use /opt/)
BASE_DIR=/opt/
DIR_LIST=(
  "lists"
  "recon"
  "exploit"
  "postex"
  "lateral"
  "persist"
  "staging"
  "infra"
  "exfil"
  "reference"
)
APT_PACKAGES=(
  "git"
  "webshells"
  "gobuster"
  "exploitdb"
  "exploitdb-bin-sploits"
  "radare2"
  "kerberoast"
  "acccheck"
  "gdb"
  "gdb-peda"
  "unicornscan"
  "enum4linux"
  "binwalk"
  "onesixtyone"
  "proxychains"
  "sqlmap"
  "smbmap"
  "wfuzz"
  "recon-ng"
  "tcpdump"
  "cewl"
  "nishang"
  "python-pip"
  "python-scapy"
)
PY_LIBRARIES=(
  "flask"
  "pycryptodomex"
  "pyOpenSSL"
  "ldap3"
  "pyReadline"
)

# disable sleep, hibernate, etc
echo "[+] Tweaking power settings ..."
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# keep the script from being interrupted during installs
echo "[+] Entering noninteractive mode ..."
export DEBIAN_FRONTEND=noninteractive

# manually add java mirror
echo "[+] Installing java ..."
echo "deb http://httpredir.debian.org/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list.d/jessie-backports.list

echo "[+] Updating package mirrors ..."
apt update

echo "[+] Upgrading packages ..."
apt upgrade -y

# a lot things can be install via apt
echo "[+] Installing apt packages ..."
for PACKAGE in ${APT_PACKAGES[@]}; do
    echo "[+] Installing $PACKAGE ..."
    apt install $PACKAGE -y
done
 
# there's a few python dependencies
echo "[+] Installing python libraries ..."
for LIBRARY in ${PY_LIBRARIES[@]}; do
    echo "[+] Installing $LIBRARY"
    pip3 install $LIBRARY
done

# all the other tools installed via git
echo "[+] Building base directories in $BASE_DIR ..."
for DIR in ${DIR_LIST[@]}; do
    mkdir $BASE_DIR/$DIR
done

# git clone toolset here

# update databases
echo "[+] Updating nmap database ..."
nmap --script-updatedb
echo "[+] Setting up msf database ..."
msfdb init
msfconsole -x "db_rebuild_cache;exit"

# clean up installation stuff
echo "[+] Cleaning up ..."
apt autoremove -y
apt-get autoclean
apt-get clean

echo "[+] Complete!"

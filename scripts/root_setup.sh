#!/bin/bash

set -e

# Updating and Upgrading dependencies
sudo apt-get update -y -qq > /dev/null
sudo apt-get upgrade -y -qq > /dev/null

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common python-prettytable devscripts debhelper python-epydoc python-ipaddr python-netifaces python-configobj python-pyparsing python-urwid

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

git clone https://github.com/Datera/rtslib
cd rtslib; make deb; dpkg -i dist/*.deb

git clone https://github.com/Datera/configshell
cd configshell; make deb; dpkg -i dist/*.deb

git clone https://github.com/Datera/targetcli
cd targetcli; make deb; dpkg -i dist/*.deb

#!/bin/sh

set -e
trap 'exit' 2 3 15

if [ $(uname) != "Linux" ]; then
  echo;
  echo "Linux support only";
  echo
  exit;
fi

# Detect linux distro
OS="$(cat /etc/os-release | grep ^ID_LIKE= | sed 's/ID_LIKE=//' | tr -d \" | tr -s ' ' '\r')";

if [ -z $OS ]; then
  OS=$(cat /etc/os-release | grep ^ID= | sed 's/ID=//');
fi

# OPTIONAL
# if [ "$(whoami)" != "root" ]; then
#   echo
#   echo "Please run using sudo or as root user";
#   echo
#   exit;
# fi

echo
echo [Distro]
case $OS in
  # RHEL/CentOS/Fedora
  *fedora)
    echo $OS;
    # yum install package
    # Set locale
    localedef -i en_US -f UTF-8 en_US.UTF-8;;
  # Ubuntu/Debian
  debian)
    echo $OS;;
    # apt update;
    # apt install package
  # Alpine linux
  alpine)
    echo $OS;;
    # apk update
    # apk add package
  # OpenSUSE/SUSE
  *opensuse)
    echo $OS;;
    # zypper install package
  # Arch Linux/Manjaro
  arch)
    echo $OS;;
    # pacman -Sy;
    # pacman -S package
  *)
    echo "Sorry, Couldn't support your current operating system"
    exit;
esac

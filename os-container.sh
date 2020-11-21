#!/bin/sh

UBUNTU="18.04"
DEBIAN="9"
RHEL="ubi8/ubi"
CENTOS="8"
FEDORA="33"
ARCH="latest"
OPENSUSE="15"
ALPINE="3.8"


# Default Yes/No options
YN='n' ;

# Check arguments
if [ -n "$1" ]; then
  case $1 in
    -f)
      if [ -z "$2" ]; then
        echo "Please provide file";
        exit;
      fi

      # Copy file
      podman cp $2 ubuntu:/root;
      podman cp $2 debian:/root;
      podman cp $2 redhat:/root;
      podman cp $2 centos:/root;
      podman cp $2 fedora:/root;
      podman cp $2 arch:/root;
      podman cp $2 suse:/root;
      podman cp $2 alpine:/root;
      exit;;

    -r)
        echo ;
        echo "Remove container? [y/N]" ;
        read YN ;

        if [ "$YN" == 'y' ]; then
          podman stop ubuntu;
          podman stop debian;
          podman stop redhat;
          podman stop centos;
          podman stop fedora;
          podman stop arch;
          podman stop suse;
          podman stop alpine;
          podman rm ubuntu;
          podman rm debian;
          podman rm redhat;
          podman rm centos;
          podman rm fedora;
          podman rm arch;
          podman rm suse;
          podman rm alpine;

          YN='n' ;
          echo ;
          echo "Remove images? [y/N]" ;
          read YN ;

          if [ "$YN" == 'y' ]; then
            podman rmi ubuntu:$UBUNTU &
            podman rmi debian:$DEBIAN &
            podman rmi $RHEL &
            podman rmi centos:$CENTOS &
            podman rmi fedora:$FEDORA &
            podman rmi archlinux:$ARCH &
            podman rmi opensuse/leap:$OPENSUSE &
            podman rmi alpine:$ALPINE
          fi

        fi;;
    -rc)
          echo "Removing containers . . .";
          podman stop ubuntu;
          podman stop debian;
          podman stop redhat;
          podman stop centos;
          podman stop fedora;
          podman stop arch;
          podman stop suse;
          podman stop alpine;
          podman rm ubuntu;
          podman rm debian;
          podman rm redhat;
          podman rm centos;
          podman rm fedora;
          podman rm arch;
          podman rm suse;
          podman rm alpine;;

    -ri)
          echo "Removing images . . .";
          podman rmi ubuntu:$UBUNTU &
          podman rmi debian:$DEBIAN &
          podman rmi $RHEL &
          podman rmi centos:$CENTOS &
          podman rmi fedora:$FEDORA &
          podman rmi archlinux:$ARCH &
          podman rmi opensuse/leap:$OPENSUSE &
          podman rmi alpine:$ALPINE;;
  esac
else
  alias check-container='podman ps --format \"{{.Names}}\"';

  # Pull image and run container
  if [ -z "$(check-container | grep ubuntu)" ]; then
    podman run -dt --name ubuntu ubuntu:$UBUNTU &
  fi
  if [ -z "$(check-container | grep debian)" ]; then
    podman run -dt --name debian debian:$DEBIAN &
  fi
  if [ -z "$(check-container | grep redhat)" ]; then
    podman run -dt --name redhat $RHEL &
  fi
  if [ -z "$(check-container | grep centos)" ]; then
    podman run -dt --name centos centos:$CENTOS &
  fi
  if [ -z "$(check-container | grep fedora)" ]; then
    podman run -dt --name fedora fedora:$FEDORA &
  fi
  if [ -z "$(check-container | grep arch)" ]; then
    podman run -dt --name arch archlinux:$ARCH &
  fi
  if [ -z "$(check-container | grep suse)" ]; then
    podman run -dt --name suse opensuse/leap:$OPENSUSE &
  fi
  if [ -z "$(check-container | grep alpine)" ]; then
    podman run -dt --name alpine alpine:$ALPINE
  fi

  unalias check-container;
  exit;
fi


#!/usr/bin/env bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NOCOLOR='\033[0m'

UBUNTU_CODENAME=$(lsb_release --codename | cut -f2)
LOCAL_USER="$(whoami)"

set -e

function msg {
  echo -e "$2$1${NOCOLOR}"
}

function success_msg {
  msg "$1" "$GREEN"
}

function skip_msg {
  msg "SKIP: $1" "$YELLOW"
}

function module_header_msg {
  msg
  msg "=================================================================" "$CYAN"
  msg "$1" "$CYAN"
  msg "=================================================================" "$CYAN"
  msg
}

function header_msg {
  success_msg
  success_msg "##### $1 #####"
  success_msg
}

function apt_install {
  header_msg "Installing packages: $*"
  sudo apt -y -qq install $@
}

function apt_ppa {
  header_msg "Adding PPA: $1"
  sudo add-apt-repository -y "$1" --no-update
}

function apt_ppa_repository {
  header_msg "Adding Repository: $1"

  if [ -f "$1" ]; then
    skip_msg "$1 is already setup"
  else
    sudo sh -c "echo '$2' >> $1"
    echo "OK"
  fi
}

function apt_ppa_key {
  if [ -f "$1" ]; then
    skip_msg "$1 is already setup"
  else
    curl -fsSL "$2" | sudo gpg --dearmor -o $1
    echo "OK"
  fi
}

function apt_update {
  header_msg "APT update"
  sudo apt update
}

function snap_install {
  header_msg "Installing snaps: $*"
  sudo snap install $@
}

function deb_install {
  debname=$(basename $2)

  header_msg "Installing $debname deb"

  if [ -f "$1" ]; then
    skip_msg "$debname is already installed"
  else
    wget $2 -O "/tmp/$debname.deb"
    sudo dpkg -i "/tmp/$debname.deb"
  fi
}

function pip_install {
  pipname=$(basename $2)

  header_msg "Installing $pipname pip"

  if [ -f "$1" ]; then
    skip_msg "$pipname is already installed"
  else
    sudo pip3 install "$2"
  fi
}

function git_install {
  target_dir="$2"
  repo_name=$(basename "$1" .git)

  header_msg "Installing $repo_name repository"

  if [ -d "$target_dir" ]; then
    skip_msg "$repo_name is already installed"
  else
    git clone "$1" "$target_dir"
  fi
}

source ppas/run.sh
source system/run.sh
source applications/run.sh
source development/run.sh

sudo apt autoclean

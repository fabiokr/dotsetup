#!/usr/bin/env bash

module_header_msg "Development"

packages=(
  # build essential
  build-essential
  # automatic configure script builder
  autoconf
  # compilation
  make
  # makefiles
  automake

  # git source control
  git
  # git graphical interface
  gitg

  # gpu terminal
  alacritty

  # tdrop dependencies
  xdotool
  gawk
  wmctrl

  # dns manager to support local domains
  # dnsmasq

  # sqlite database
  sqlite3
  # slite lib
  libsqlite3-0
  # sqlite driver header
  libsqlite3-dev

  # mysql client
  mysql-client
  libmysqlclient-dev

  # postgres client
  postgresql-client
  libpq-dev

  # keeps virtualbox up to date on kernel upgrades
  dkms

  # docker
  # docker.io
  docker-ce
  docker-ce-cli
  containerd.io
  docker-buildx-plugin
  docker-compose-plugin

  # command line clipboard utility
  xclip

  # jdk
  default-jre

  # virtualbox
  virtualbox

  # imagemagick
  imagemagick
  libmagickwand-dev

  # inotify
  inotify-tools

  # json parser
  jq

  # better cat
  bat

  # better ls
  eza

  # command line fuzzy finder
  fzf

  # better top
  btop

  # shorter documentation
  tldr
)

apt_install ${packages[@]}

snaps=(
  dbeaver-ce
)

snap_install ${snaps[@]}

# visual studio code
deb_install "/usr/bin/code" "https://vscode.download.prss.microsoft.com/dbazure/download/stable/dc96b837cf6bb4af9cd736aa3af08cf8279f7685/code_1.89.1-1715060508_amd64.deb"

# git-delta
deb_install "/usr/bin/delta" "https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb"

# disable to avoid SSH issues
sudo sed -e '/SendEnv/ s/^#*/#/' -i /etc/ssh/ssh_config

# add user to docker group
sudo usermod -a -G docker "$LOCAL_USER"

source development/apps/lazydocker.sh
source development/apps/lazygit.sh
source development/apps/zellij.sh
source development/apps/tdrop.sh

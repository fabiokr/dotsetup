#!/usr/bin/env bash

module_header_msg "System"

packages=(
  synaptic # package manager
  tilda # top-down terminal
  zsh # better shell
  tmux # terminal multiplexer
  vim # terminal editor
  ssh # ssh
  openssl # openssl toolkit
  curl # command line url transfers
  libnotify-bin # desktop notification library
  ruby # ruby
  fastfetch # show system info
)

apt_install ${packages[@]}

header_msg "ZSH"

if [ "$SHELL" != "/bin/zsh" ]; then
  sudo chsh -s /bin/zsh "$LOCAL_USER"
  msg "Zsh set as the default shell"
else
  skip_msg "ZSH is already the default shell"
fi

header_msg "Swappiness"

swapinnes_path="/etc/sysctl.d/20-swappiness.conf"

if [ -f "$swapinnes_path" ]; then
  skip_msg "Swappiness file already exists: $swapinnes_path"
else
  sudo cp system/templates/swappiness.conf /etc/sysctl.d/20-swappiness.conf
  chmod 0644 /etc/sysctl.d/20-swappiness.conf
  msg "Swappiness file created: $swapinnes_path"
fi

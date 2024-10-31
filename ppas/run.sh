#!/usr/bin/env bash

module_header_msg "PPAs"

ppas=(
  ppa:git-core/ppa
  ppa:zhangsongcui3371/fastfetch
)

for ppa in "${ppas[@]}"; do
  apt_ppa $ppa
done

apt_ppa_key /etc/apt/keyrings/enpass.gpg "https://apt.enpass.io/keys/enpass-linux.key"
apt_ppa_repository "/etc/apt/sources.list.d/enpass.list" "deb [signed-by=/etc/apt/keyrings/enpass.gpg] https://apt.enpass.io/  stable main"

apt_ppa_key /etc/apt/keyrings/docker.gpg "https://download.docker.com/linux/ubuntu/gpg"
apt_ppa_repository "/etc/apt/sources.list.d/docker.list" "deb [signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu noble stable"

apt_update

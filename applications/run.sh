#!/usr/bin/env bash

module_header_msg "Applications"

msg "Auto accept mscorefonts agreement"
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

packages=(
  # media player
  vlc
  # required to convert ovgs into a gif
  mplayer
  # password manager
  enpass
  # image editor
  gimp
  # system monitor
  gnome-system-monitor
  # gnome tweaks
  gnome-tweaks
  # preview files
  gnome-sushi
  # torrents
  transmission
  # diff viewer
  meld
  # download manager
  uget
  # partition management
  gparted
  # pdf anotations
  xournal
  # ebook manager
  calibre
  # ftp
  filezilla
  # appimages
  libfuse2
  # dejadup
  python3-pydrive
  # screenshot tool
  flameshot
  # microsoft fonts
  ttf-mscorefonts-installer
)

apt_install ${packages[@]}

snaps=(
  slack
  pinta
)

snap_install ${snaps[@]}

# VNC Viewer
deb_install "/usr/bin/vncviewer" "https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-7.11.1-Linux-x64.deb"

# Appimage launcher
deb_install "/usr/bin/appimagelauncherd" "https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb"

# Insync
deb_install "/usr/bin/insync" "https://cdn.insynchq.com/builds/linux/3.9.4.60020/insync_3.9.4.60020-noble_amd64.deb"

# Obsidian
deb_install "/usr/bin/obsidian" https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.4/obsidian_1.7.4_amd64.deb

# Gnome extensions
source applications/apps/gnome-extensions.sh

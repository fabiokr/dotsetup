#!/usr/bin/env bash

# setup dropdown terminal shortcut to F12
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom99/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom99/ name 'Drop Down Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom99/ command "tdrop -a -m -n top --width 80% --height 100% -x 10% --post-map-hook 'wmctrl -r \"Alacritty - Drop Down - Top\" -b add,above,sticky' alacritty --title 'Alacritty - Drop Down - Top'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom99/ binding 'F12'

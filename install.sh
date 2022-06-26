#!/bin/bash
echo "[*] INSTALLING i3-dope IN -> " $(uname -r)
sudo apt update && sudo apt upgrade -y
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev 
mkdir -p ~/.local/share/fonts/
wget https://0xpsy.000webhostapp.com/i3-dope/iosevka.zip
wget https://0xpsy.000webhostapp.com/i3-dope/robotomono.zip
wget https://0xpsy.000webhostapp.com/i3-dope/i3-gaps.zip

unzip iosevka.zip -d ~/.local/share/fonts/
unzip robotomono.zip -d ~/.local/share/fonts/
unzip i3-gaps.zip
fc-cache -fv
sudo apt install -f -y
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..
pip3 install pywal
mkdir -p ~/.config/i3
mkdir -p ~/.config/compton
mkdir -p ~/.config/rofi
cp config/i3/config ~/.config/i3/config
cp config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
cp config/compton/compton.conf ~/.config/compton/compton.conf
cp config/rofi/config ~/.config/rofi/config
cp fehbg ~/.fehbg
cp config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh
cp -r wallpaper ~/.wallpaper
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#!/usr/bin/env bash

#-----------HEADER-------------------------------------------------------------|
# AUTOR             : Luan Rodrigues da Silva <rodriguesluan854@gmail.com>
# HOMEPAGE          : https://github.com/minacabu
# DATA-DE-CRIAÇÃO   : 2023-09-19
# PROGRAMA          : Ubuntu-Pós-Install
# VERSÃO            : 1.0
# LICENÇA           : GPL3
# PEQUENA-DESCRIÇÃO : Shell Script de pós instalação do Ubuntu 22.x para utilização pessoal.
#


## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando o repositório e baixando o git ##
sudo apt update -y
sudo apt install git nala -y

## Adicionando repositórios adicionais ##
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo add-apt-repository ppa:kisak/kisak-mesa -y
sudo dpkg --add-architecture i386 
sudo apt update 
sudo apt upgrade -y 
sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y

## Instalando programas via Flatpak ##
flatpak_packages=(
    "com.jetbrains.IntelliJ-IDEA-Ultimate"
    "com.jetbrains.PyCharm-Professional"
    "com.jetbrains.DataGrip"
    "com.visualstudio.code"
    "com.getpostman.Postman"
    "com.microsoft.Edge"
    "io.gitlab.librewolf-community"
    "com.github.micahflee.torbrowser-launcher"
    "io.gitlab.news_flash.NewsFlash"
    "com.bitwarden.desktop"
    "in.srev.guiscrcpy"
    "org.qbittorrent.qBittorrent"
    "org.onlyoffice.desktopeditors"
    "org.filezilla_project.Filezilla"
    "com.obsproject.Studio"
    "org.videolan.VLC"
    "org.gimp.GIMP"
    "org.upscayl.Upscayl"
    "com.discordapp.Discord"
    "io.github.jeffshee.Hidamari"
    "com.mattjakeman.ExtensionManager"
    "com.stremio.Stremio"
    "com.dropbox.Client"
    "net.cozic.joplin_desktop"
    "com.protonvpn.www"
    "com.github.IsmaelMartinez.teams_for_linux"
)

for package in "${flatpak_packages[@]}"; do
    flatpak install flathub "$package" -y
done

## Instalando VirtualBox e outros programas via APT ##
sudo apt install virtualbox scrcpy flameshot gnome-tweaks net-tools -y

## Instalando Droidcam ##
wget -O /tmp/droidcam_client_amd64.deb https://beta.droidcam.app/go/droidCam.client.setup.deb
sudo dpkg -i /tmp/droidcam_client_amd64.deb
sudo apt install -f -y
sudo apt install linux-headers-$(uname -r) v4l2loopback-dkms -y

## Configurações adicionais do GNOME ##
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click  true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

## Atualização e limpeza ##
sudo apt update 
sudo apt dist-upgrade -y 
sudo apt upgrade -y 
sudo snap refresh 
sudo flatpak upgrade -y 
flatpak uninstall --unused -y 
sudo apt autoremove -y 
sudo apt autoclean -y

## Instalando mais programas ##
sudo apt install gnome-sushi neofetch -y

## Exibindo informações após a instalação ##
neofetch

echo
echo
echo "Instalação finalizada, é recomendado reiniciar o sistema."
echo "thx! :P"
echo


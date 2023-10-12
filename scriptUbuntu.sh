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
sudo apt install git

## Driver de video ##
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"
sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
sudo add-apt-repository ppa:kisak/kisak-mesa && sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade && sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386


## Flatpack e os programas  ##
sudo apt update -y
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

##programação##
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y
flatpak install flathub com.jetbrains.PyCharm-Professional -y
flatpak install flathub com.jetbrains.DataGrip -y
flatpak install flathub com.visualstudio.code -y
flatpak install flathub com.getpostman.Postman -y

##navegador##
flatpak install flathub com.microsoft.Edge -y
flatpak install flathub io.gitlab.librewolf-community -y
flatpak install flathub com.github.micahflee.torbrowser-launcher -y

##outros##
flatpak install flathub org.gnome.World.PikaBackup -y
flatpak install flathub io.gitlab.news_flash.NewsFlash -y
flatpak install flathub com.authy.Authy -y
flatpak install flathub com.bitwarden.desktop -y

##Office##
flatpak install flathub org.onlyoffice.desktopeditors -y

##FTP##
flatpak install flathub org.filezilla_project.Filezilla -y

##OBS##
flatpak install flathub com.obsproject.Studio -y

##VLC##
flatpak install flathub org.videolan.VLC -y

##dj metade##
flatpak install flathub com.spotify.Client -y 

##Imagem##
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.upscayl.Upscayl -y

##virtualização de linux##
flatpak install flathub org.gnome.Boxes -y 

##Discord##
flatpak install flathub com.discordapp.Discord -y

##papel de parede animado##
flatpak install flathub io.github.jeffshee.Hidamari -y

##gerenciador de extensões##
flatpak install flathub com.mattjakeman.ExtensionManager -y

##print massa#
flatpak install flathub org.flameshot.Flameshot -y

##produtividade##
flatpak install flathub md.obsidian.Obsidian -y

##Jogos#
flatpak install flathub net.lutris.Lutris -y
flatpak install flathub com.valvesoftware.Steam -y

##Backup##
flatpak install flathub org.gnome.World.PikaBackup -y

##Nuvem##
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb && sudo apt install "$PWD/megasync-xUbuntu_22.04_amd64.deb" -y

##Firewall##
wget https://updates.safing.io/latest/linux_amd64/packages/portmaster-installer.deb && sudo apt installl "$PWD/portmaster-installer.deb" -y

sudo apt update -y

##gerenciador de temas##
sudo apt install -y gnome-tweaksy
##ferramentas de redes##
sudo apt install net-tools -y

sudo apt install flameshot -y


sudo apt install virtualbox -y

sudo apt install docker-ce -y


## Frescura do sistema##
echo 'Configurando GNOME'
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click  true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true


## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
sudo apt install gnome-sushi -y

## mensagem gay##
sudo apt install neofetch -y

neofetch

echo
echo
echo "Instalação finalizada, é recomendado reiniciar o sistema."
echo "thx! :P"
echo 

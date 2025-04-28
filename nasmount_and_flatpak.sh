#!/bin/bash
# NAS driver mount és Flatpak programok telepítése
sudo mkdir -p /mnt/media
sudo mkdir -p /mnt/egyeb
echo "//15.0.0.80/Media /mnt/media cifs username=Foki,password=a3K12hy12,uid=1000,gid=1000 0 0" | sudo tee -a /etc/fstab
echo "//15.0.0.80/Other /mnt/egyeb cifs username=Foki,password=a3K12hy12,uid=1000,gid=1000 0 0" | sudo tee -a /etc/fstab
sudo mount -a

flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub com.heroicgameslauncher.hgl --user -y  flatpak install runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08 --user -y
flatpak override --user --filesystem=xdg-config/MangoHud:ro
flatpak install flathub com.leinardi.gst
flatpak install flathub org.bunkus.mkvtoolnix-gui
flatpak install flathub com.xnview.XnViewMP

#!/bin/bash
# NAS driver mount
sudo mkdir -p /mnt/media
sudo mkdir -p /mnt/egyeb
echo "//15.0.0.80/Media /mnt/media cifs username=Foki,password=a3K12hy12,uid=1000,gid=1000 0 0" | sudo tee -a /etc/fstab
echo "//15.0.0.80/Other /mnt/egyeb cifs username=Foki,password=a3K12hy12,uid=1000,gid=1000 0 0" | sudo tee -a /etc/fstab
sudo mount -a

# Plex Media Server install and restorem
paru -S plex-media-server
sudo bash
cp -r /home/foki/backup/Pelx* /var/lib/plex
chown -R plex:plex /var/lib/plex
find /var/lib/plex -type d -exec chmod 755 {} \;
find /var/lib/plex -type f -exec chmod 644 {} \;
systemctl start plexmediaserver
systemctl enable plexmediaserver

# install Flatpak apps
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub com.heroicgameslauncher.hgl --user -y  flatpak install runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08 --user -y
flatpak override --user --filesystem=xdg-config/MangoHud:ro
flatpak install flathub com.leinardi.gst
flatpak install flathub org.bunkus.mkvtoolnix-gui
flatpak install flathub com.xnview.XnViewMP

#!/bin/bash

# Text modifiers
bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}

zenity --info --title='Please pick a folder!' --text='Choose a folder!' --width='300' --height='100' 2>/dev/null

# Folder variable
FOLDER=$(zenity  --file-selection --title="Choose a backup directory" --directory 2>/dev/null )
if [[ $? -eq 1 ]]; then
   echo You did not pick a ${bold}${yellow}folder.${normal} Exiting!
   exit 1
   else
   echo Backups will be saved into: ${bold}${yellow}$FOLDER${normal}
fi

# Options input
user_choice=$(zenity --list --checklist --width='600' --height='400' \
  --title="Backup script by RavePriest1" \
  --text="Select from the options below" \
  --column="Select" --column="Name" \
  FALSE "BACKUP All of My Data and Settings" \
  FALSE "RESTORE All of My Data and Settings" 2>/dev/null )
if [[ $? -eq 1 ]]; then
   echo You did not pick an ${bold}${yellow}option.${normal} Exiting!
   exit 1
fi
sudo echo

if [[ $user_choice = *"BACKUP All of My Data and Settings"* ]]; then
  cd
  echo
  echo -----------------------------------------------------
  echo Copying ${bold}${yellow}$USER Settings and Files${normal} into ${bold}${yellow}$FOLDER/${normal}

  rsync -ap --info=progress2 /home/$USER/Games $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.aegisub $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.anydesk $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.thunderbird $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.mozilla $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.putty $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.steam $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.vscode $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.vscode-oss $FOLDER 2>/dev/null
  rsync -ap --info=progress2 /var/lib/plex $FOLDER 2>/dev/null

  mkdir -p $FOLDER/.config
  rsync -ap --info=progress2 /home/$USER/.config/BraveSoftware $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/ClickUp $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/Code $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/composer $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/corectrl $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/corectrl.ini $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/discord $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/Discord $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/discordcanary $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/doublecmd $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/Epic $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/filezilla $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/FreeTube $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/GIMP $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/heroic $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/kdenlive-layoutsrc $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/kdenliverc $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/libreoffice $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/obs-studio $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/qBittorrent $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/thorium $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/Vencord $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/vesktop $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/vlc $FOLDER/.config 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.config/VSCodium $FOLDER/.config 2>/dev/null

  mkdir -p $FOLDER/.local/share/
  rsync -ap --info=progress2 /home/$USER/.local/share/audacity $FOLDER/.local/share 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/flatpak/overrides/ $FOLDER/.local/share/flatpak 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/kdenlive $FOLDER/.local/share 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/lutris $FOLDER/.local/share 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/net.lutris.Lutris $FOLDER/.local/share 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/qBittorrent $FOLDER/.local/share 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/Steam $FOLDER/.local/share 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/TelegramDesktop $FOLDER/.local/share 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/.local/share/vlc $FOLDER/.local/share 2>/dev/null

  mkdir -p $FOLDER/.var/app/
  rsync -ap --info=progress2 /home/$USER/.var/app/ $FOLDER/.var/app 2>/dev/null

  rsync -ap --info=progress2 /home/$USER/Asztal/ $FOLDER/Asztal 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/Dokumentumok/ $FOLDER/Dokumentumok 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/Letöltések/ $FOLDER/Letöltések 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/Zenék/ $FOLDER/Zenék 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/Képek/ $FOLDER/Képek 2>/dev/null
  rsync -ap --info=progress2 /home/$USER/Videók/ $FOLDER/Videók 2>/dev/null

fi

if [[ $user_choice = *"RESTORE All of My Data and Settings"* ]]; then
  echo
  echo -----------------------------------------------------
  echo Copying ${bold}${yellow}Restoring - $USER - Settings and Files ${normal} into ${bold}${yellow}$FOLDER/${normal}

  sudo rsync -ap --info=progress2 $FOLDER /home/$USER/

  echo -----------------------------------------------------
  sudo chown -R $USER:$GROUP /home/$USER/
  echo
  echo ${bold}${yellow}SETTINGS RESTORED SUCCESSFULLY! ${normal}
fi
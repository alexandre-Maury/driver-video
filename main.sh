#!/usr/bin/env bash

#==============================================================================================================
#
# Auteur  : Alexandre Maury 
# Version 1.2
# License : GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Faire une modification du clonage dans /temp/
#==============================================================================================================

# Configure les drivers video
read -p "[*] Souhaitez-vous configurer le pilotte video ==> y/N " driver
if [ $driver = 'y' ]; then

    nvidia=$(lspci | grep -e VGA -e 3D | grep -ie nvidia 2> /dev/null || echo '')
    amd_ati=$(lspci | grep -e VGA -e 3D | grep -e ATI -e AMD 2> /dev/null || echo '')
    intel=$(lspci | grep -e VGA -e 3D | grep -i intel 2> /dev/null || echo '')

    if [ -n "$nvidia" ]; then
            apt install xserver-xorg-video-nouveau -y    
    elif [ -n "$amd_ati" ]; then
            apt install xserver-xorg-video-ati -y  
    elif [ -n "$intel" ]; then
            apt install xserver-xorg-video-intel -y
            
    else
        apt install xserver-xorg-video-vesa -y
        
    fi
        
    printf "%s \\n" "[Succès] Votre driver est configuré"
fi

#!/bin/bash

apt update
apt upgrade

apt install p7zip mc texlive-full texstudio keepassx chromium-browser openjdk-8-jdk whois samba system-config-samba vlc evince ocaml ghostscript gparted htop kolourpaint4 shotwell kontact unrar inkscape openvpn gedit mtr

apt autoremove

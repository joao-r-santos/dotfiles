#!/bin/bash

#------------------------------#
# Install extra Linux packages #
#------------------------------#

# Ubuntu packages
sudo apt-get install bash-completion build-essential gnome-tweak-tool ttf-mscorefonts-installer ttf-ubuntu-font-family ubuntu-restricted-addons ubuntu-restricted-extras

# Regular packages
sudo apt-get install aspell autojump bzip2 dos2unix fdupes git gitk gzip hyphen-en-us lmodern powerline screen sed socat tree unrar unzip wget xclip zip shellcheck thefuck

# Python packages (use conda for most python specific packages)
sudo apt-get install python-jedi python-pip

# Compilers
sudo apt-get install g++ gcc gfortran python

# pdf & image packages
sudo apt-get install diffpdf eog evince imagemagick meld pdftk xloadimage a2ps ps2eps ps2pdf psutils

# Latex specific packages
sudo apt-get install latexdiff tex-common texlive texlive-full texmaker texmaker-data

# Vim specific packages
sudo apt-get install vim vim-gnome vim-addon-manager vim-python-jedi
# vim-nox-py2 vim-gnome-py2

# Useful programs
sudo apt-get install atom audacious fbreader gimp postgresql transmission-common transmission-gtk
pip install magic-wormhole
#sudo apt install magic-wormhole

# Extra Programs
#dropbox
#google-chrome-stable
#mysql-connector-python
#skypeforlinux
#spotify-client
#vlc

#-----------------------#
# Install atom packages #
#-----------------------#

apm install --packages-file list_atom_packages.txt
# apm install Hydrogen autocomplete-python highlight-selected hydrogen-launcher markdown-scroll-sync minimap minimap-find-and-replace minimap-highlight-selected platformio-ide-terminal project-manager python-tools

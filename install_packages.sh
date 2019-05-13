#!/bin/bash

#------------------------------#
# Install extra Linux packages #
#------------------------------#

# Ubuntu packages
sudo apt install bash-completion build-essential gnome-tweak-tool ttf-mscorefonts-installer ttf-ubuntu-font-family ubuntu-restricted-addons ubuntu-restricted-extras dconf-tools chrome-gnome-shell

# Regular packages
sudo apt install aspell autojump bzip2 dos2unix fdupes git gitk gzip hyphen-en-us lmodern powerline screen sed socat tree unrar unzip wget xclip zip shellcheck thefuck

# Compilers
sudo apt install g++ gcc gfortran

# pdf & image packages
sudo apt install diffpdf eog evince imagemagick meld pdftk pdfshuffler xloadimage a2ps ps2eps ps2pdf psutils cups-pdf

# Latex specific packages
sudo apt install latexdiff tex-common texlive texlive-full texmaker texmaker-data

# Python pyenv
# sudo apt install python-jedi python-pip
sh ./install_pyenv.sh

# Vim specific packages
sudo apt install vim vim-gnome vim-addon-manager vim-python-jedi

# Useful programs
sudo apt install audacious fbreader gimp postgresql transmission-common transmission-gtk jq tmux
sudo snap install cheat


# Extra Programs
#dropbox
#google-chrome-stable
#skypeforlinux
#spotify-client
#vlc

#-----------------------#
# Install atom packages #
#-----------------------#

wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update
sudo apt install atom

apm install --packages-file list_atom_packages.txt
# If installing MagicPython, disable the built-in language-python package

#---------------------------------#
# Jupyter notebooks configuration #
#---------------------------------#

# The default config file is found at: ~/.jupyter/jupyter_notebook_config.py
# If you don’t have this file, run
jupyter notebook --generate-config

mv ~/.jupyter/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py.bak
cat extra_jupyter_config.py ~/.jupyter/jupyter_notebook_config.py.bak > ~/.jupyter/jupyter_notebook_config.py

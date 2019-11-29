#! /bin/bash

# update
sudo apt-get update && sudo apt-get dist-upgrade -y

# install recommended drivers
sudo ubuntu-drivers autoinstall

# install basic command line tools
sudo apt-get install -y \
    lsb-core \
    aptitude htop \
    vim tmux \
    make \
    git \
    curl wget \
    mc w3m w3m-img \
    ranger caca-utils highlight atool mediainfo

# configure editor, ranger
sudo update-alternatives --set editor /usr/bin/vim ;
echo 'SELECTED_EDITOR=/usr/bin/vim' >~/.selected_editor ;
sudo echo 'SELECTED_EDITOR=/usr/bin/vim' >/root/.selected_editor ;
ranger --copy-config=all
sudo ranger --copy-config=all

# install libreoffice
sudo apt-get install -y \
    hunspell hunspell-hu \
    fonts-junicode ttf-mscorefonts-installer \
    libreoffice-writer libreoffice-calc libreoffice-gnome

# install basic python, C/C++, java
sudo apt-get install -y \
    python3-pip python3-dev \
    gcc g++ gdb llvm clang clang-format \
    openjdk-8-jdk

# install some graphical applications
sudo apt-get install -y \
    python-gpg nautilus-dropbox \
    gparted \
    gnome-tweak-tool

# setup firefox markdown-viewer extension
mkdir -p ~/.local/share/mime/packages/
cp data/mime/packages/text-markdown.xml ~/.local/share/mime/packages/
update-mime-database ~/.local/share/mime

# misc
mkdir -p {bin,install,work}

# snap (development)
sudo snap install node --channel=12/stable --classic
sudo snap install vscode
sudo snap install --classic go
# sudo snap install gitkraken
# sudo snap install insomnia


# TODO:
# - python packages (ipython, numpy, scipy, pandas, scikit, tensorflow, keras,
#     beautifulsoup4, ...) - bar ezt ki kene talalni, milyen viszonyban legyen a
#     pyenv/pipenv megoldassal. Lehet, hogy abbol kene egy alapot feltenni
#     fejlesztesi celra
# - vscode, fonts-firacode
# - golang
# - docker (CE, compose, machine?), ctop
# - pyenv, pipenv
# - test dotfiles repo in docker image

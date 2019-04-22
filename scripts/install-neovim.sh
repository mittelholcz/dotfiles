#! /bin/bash


set -e ;

# install requirements
sudo apt-get update  && sudo apt-get install -y \
    software-properties-common \
    xsel \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip

# add repo, install nvim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update && sudo apt-get install -y neovim

# set as default editor
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
echo 'SELECTED_EDITOR=/usr/bin/nvim' >~/.selected_editor ;

# set up providers (:checkhealth)
sudo python3 -m pip uninstall -y neovim pynvim
# sudo python2 -m pip uninstall -y neovim pynvim
python3 -m pip install --user --upgrade pynvim
# python2 -m pip install --user --upgrade pynvim


# vim-plug, init.vim
mkdir -p ~/.config/nvim/ ;
ln -srf vim/init.vim ~/.config/nvim/ ;
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall ;


# ~~~ latest (stable) NVIM AppImage ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | \
#     grep 'browser_download_url.*nvim\.appimage"' | \
#     grep -o 'https[^"]\+')
# TRG="${HOME}/bin/nvim"
# mkdir -p ~/bin
# wget -nv -O ${TRG} ${URL}
# chmod +x "${TRG}"


# ~~~ OLD ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # requirements
# auxpkgs="curl xsel nodejs"
# pythonpkgs="software-properties-common python3-software-properties python-dev python-pip python3-dev python3-pip"
# linterpkgs="cppcheck clang clang-format clang-tidy lacheck tidy libxml2-utils shellcheck"
# pippkgs="pip setuptools wheel neovim neovim-remote jedi"

# # install
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# sudo -H curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - ;
# sudo -H apt-add-repository -y ppa:neovim-ppa/stable ;
# sudo -H apt-get update && sudo apt-get install -y $auxpkgs $pythonpkgs $linterpkgs ;
# sudo -H pip3 install --upgrade $pippkgs ;
# sudo -H apt-get update && sudo apt-get install -y neovim  ;

# # config npm
# mkdir -p ~/.npm-global/bin/ ;
# npm config set prefix '~/.npm-global' ;
# echo 'export PATH=~/.npm-global/bin:$PATH' >>~/.profile ;
# source ~/.profile ;

# # stylelint hack
# cp -b bin/stylelint ~/.npm-global/bin/

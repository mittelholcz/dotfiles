#! /bin/bash


set -e ;

# requirements
auxpkgs="curl xsel nodejs"
pythonpkgs="software-properties-common python3-software-properties python-dev python-pip python3-dev python3-pip"
linterpkgs="cppcheck clang clang-format clang-tidy lacheck tidy libxml2-utils shellcheck"
pippkgs="pip setuptools wheel neovim neovim-remote jedi"


# install
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo -H curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - ;
sudo -H apt-add-repository -y ppa:neovim-ppa/stable ;
sudo -H apt-get update && sudo apt-get install -y $auxpkgs $pythonpkgs $linterpkgs ;
sudo -H pip3 install --upgrade $pippkgs ;
sudo -H apt-get update && sudo apt-get install -y neovim  ;


# config npm
mkdir -p ~/.npm-global/bin/ ;
npm config set prefix '~/.npm-global' ;
echo 'export PATH=~/.npm-global/bin:$PATH' >>~/.profile ;
source ~/.profile ;


# set defaults
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 ;
sudo update-alternatives --set editor /usr/bin/nvim ;
echo 'SELECTED_EDITOR=/usr/bin/nvim' >~/.selected_editor ;


# config neovim
mkdir -p ~/.config/nvim/ ;
ln -srf dots/init.vim ~/.config/nvim/ ;
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ;
nvim +PlugInstall +qall ;

# stylelint hack
cp -b bin/stylelint ~/.npm-global/bin/

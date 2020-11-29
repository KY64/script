#!/bin/sh

set -e
trap 'exit' 2 3 15

if [ $(uname) != "Linux" ]; then
  echo;
  echo "Linux support only";
  echo
  exit;
fi

# Detect linux distro
OS="$(cat /etc/os-release | grep ^ID_LIKE= | sed 's/ID_LIKE=//' | tr -d \" | tr -s ' ' '\r')";

if [ -z $OS ]; then
  OS=$(cat /etc/os-release | grep ^ID= | sed 's/ID=//');
fi

if [ "$(whoami)" != "root" ]; then
 echo
 echo "Please run using sudo or as root user";
 echo
 exit;
fi

echo
echo [Installing package]
case $OS in
  # RHEL/CentOS/Fedora
  *fedora)
    yum install vim git nodejs curl glibc-locale-source glibc-langpack-en
    yum remove -y vim-minimal
    # Set locale
    localedef -i en_US -f UTF-8 en_US.UTF-8;;
  # Ubuntu/Debian
  debian)
    apt update
    apt install git curl make automake gcc libncurses5-dev libncursesw5-dev
    curl -sL https://deb.nodesource.com/setup_12.x | bash
    apt-get install -y nodejs
    git clone --depth 1 https://github.com/vim/vim.git
    cd vim/src
    make
    make install
    cd ../../
    rm -r vim;;
  # Alpine linux
  alpine)
    apk update
    apk add vim git nodejs curl;;
  # OpenSUSE/SUSE
  *opensuse)
    zypper install vim git nodejs curl;;
  # Arch Linux/Manjaro
  arch)
    pacman -Sy;
    pacman -S vim git nodejs-lts-erbium curl;; # nodejs 12
  *)
    echo "Sorry, Couldn't support your current operating system"
    exit;
esac

cd
# If .vim directory does not exist
if [ ! -d $HOME/.vim ]; then
  mkdir .vim
fi;

# Install plugins
git clone --depth 1 https://github.com/sheerun/vim-polyglot ~/.vim/pack/plugins/start/vim-polyglot
git clone --depth 1 https://github.com/junegunn/goyo.vim ~/.vim/pack/plugins/start/goyo.vim  
git clone --depth 1 https://github.com/junegunn/limelight.vim ~/.vim/pack/plugins/start/limelight.vim  
git clone --depth 1 https://github.com/airblade/vim-gitgutter ~/.vim/pack/plugins/start/vim-gitgutter
git clone --depth 1 https://github.com/neoclide/coc.nvim ~/.vim/pack/plugins/start/coc.nvim-release
git clone --depth 1 https://github.com/vim-airline/vim-airline ~/.vim/pack/plugins/start/vim-airline

# Download colorscheme
mkdir -p $HOME/.vim/colors
cd $HOME/.vim/colors
curl https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-pico.vim > base16-phd.vim

mkdir -p $HOME/.vim/autoload/airline/themes
cd $HOME/.vim/autoload/airline/themes
curl https://raw.githubusercontent.com/dawikur/base16-vim-airline-themes/master/autoload/airline/themes/base16_oceanicnext.vim > base16_oceanicnext.vim

echo "
colorscheme base16-phd
set number
set shiftwidth=2
set softtabstop=2
set expandtab
highlight LineNr ctermfg=238 ctermbg=None

let g:airline_theme='base16_oceanicnext'
let g:airline_powerline_fonts = 1" > $HOME/.vimrc

if [ -e $HOME/.bashrc ]; then
  echo 'alias vi=vim' >> $HOME/.bashrc;
fi

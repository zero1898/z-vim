#!/bin/bash
#==========================================
# Author: nero
# Email: zero1898@foxmail.com
#==========================================
# VIM环境搭建
#==========================================

BASEDIR=$(dirname $0)
cd $BASEDIR
Z_VIM=`pwd`
today=`date +%Y%m%d`
#==========================================

echo "VIM====>> Step1: BACK UP CONFIG"
for i in $HOME/.bashrc $HOME/.vim $HOME/.vimrc $HOME/.vimrc.local $HOME/.vimrc.bundles $HOME/.vimrc.bundles_config; do [ -L $i ] && unlink $i ; done
for i in $HOME/.bashrc $HOME/.vim $HOME/.vimrc $HOME/.vimrc.local $HOME/.vimrc.bundles $HOME/.vimrc.bundles_config; do [ -e $i ] && [ ! -L $i ] && mkdir -p $HOME/$today.back && mv $i $HOME/$today.back/; done

echo "VIM====>> Step2: SETTING UP SYMLINKS"
ln -sf $Z_VIM/bashrc $HOME/.bashrc
ln -sf $Z_VIM $HOME/.vim
ln -sf $Z_VIM/vimrc $HOME/.vimrc
ln -sf $Z_VIM/vimrc.local $HOME/.vimrc.local
ln -sf $Z_VIM/vimrc.bundles $HOME/.vimrc.bundles
ln -sf $Z_VIM/vimrc.bundles_config $HOME/.vimrc.bundles_config

echo "VIM====>> Step3: INSTALL VUNDLE"
if [ ! -e $Z_VIM/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $Z_VIM/bundle/Vundle.vim
fi

echo "VIM====>> Step4: UPDATE/INSTALL PLUGINS USING VUNDLE"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $HOME/.vimrc.bundles +BundleInstall! +BundleClean +qall
export SHELL=$system_shell

echo "VIM====>> INSTALL DONE!"

#! bin/bash

git clone https://github.com/tcajee/configs.git ~/.configs
cd ~/.configs
cp -R .vim_runtime ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

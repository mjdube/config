#!/bin/sh
set -e

cd ~/Desktop/configs/.vim_runtime

echo 'set runtimepath+=~/Desktop/configs/.vim_runtime

source ~/Desktop/configs/.vim_runtime/vimrcs/basic.vim
source ~/Desktop/configs/.vim_runtime/vimrcs/filetypes.vim
source ~/Desktop/configs/.vim_runtime/vimrcs/plugins_config.vim
source ~/Desktop/configs/.vim_runtime/vimrcs/extended.vim

try
source ~/Desktop/configs/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"

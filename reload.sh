#! bin/bash

cd ~/.configs
echo "Installing Vim configuration"
cp -R .vim_runtime ~/.vim_runtime
sh ~/.vim_runtime/install_vimrc.sh
echo "Done."
echo "Copying .zshrc"
cp .zshrc ~
echo "Done."
echo "Copying .bashrc"
cp .bashrc ~
echo "Done."

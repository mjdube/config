#! bin/bash

echo "installing zsh and Oh-My-ZSH"
curl -sSL git.io/jovial | bash
echo "Done."
cd ~/.configs
echo "installing Vimrc"
cp -R .vim_runtime ~/.vim_runtime
sh ~/.vim_runtime/install_vimrc.sh
echo "Done."
echo "Copying .zshrc"
cp .zshrc ..
echo "Done."
echo "Copying .bashrc"
cp .bashrc ..
echo "Done."

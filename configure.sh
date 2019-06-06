#! bin/bash

echo "installing zsh and Oh-My-ZSH"
curl -sSL git.io/jovial | bash
echo "Done."
cd ~/.configs
echo " Copying oh-my-zsh configuration"
cp -R .oh-my-zsh ~/.oh-my-zsh
echo "Done."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "Installing fonts"
cd ~/.configs/fonts
./install.sh
echo "Done."
echo "Installing Vim configuration"
cp -R .vim_runtime ~/.vim_runtime
sh ~/.vim_runtime/install_vimrc.sh
echo "Done."
echo "Copying .zshrc"
cp .zshrc ..
echo "Done."
echo "Copying .bashrc"
cp .bashrc ..
echo "Done."
zsh


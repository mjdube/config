#! bin/bash

echo "installing zsh and Oh-My-ZSH"
curl -sSL git.io/jovial | bash
echo "Done."
cd ~/.configs
#echo "Installing pl9k"
#git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "Installing fonts"
git clone https://github.com/powerline/fonts.git --depth=1 ~/.configs/fonts
cd ~/.configs/fonts
./install.sh
rm -rf .git .gitignore
echo "Done."
echo "Installing Vim configuration"
cd ~/.configs
cp -R .vim_runtime ~/.vim_runtime
sh ~/.vim_runtime/install_vimrc.sh
echo "Done."
echo "Copying .zshrc"
cp .zshrc ~
echo "Done."
echo "Copying .bashrc"
cp .bashrc ~
echo "Done."
zsh

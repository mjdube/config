#! bin/bash

echo "installing zsh and Oh-My-ZSH"
curl -sSL git.io/jovial | bash
echo "Done."
cd ~/.configs
echo "Installing fonts"
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
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

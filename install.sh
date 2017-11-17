#!/bin/bash
SCRIPT_DIR=$(readlink -f ${0%/*})
for var in "$@"
do
    if [[ $var == "-u"]]; then
        sudo pacman -Syyu
    fi
    if [[ $var == "-ii"]]; then
        sudo pacman -S wget
        wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
        wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
        tar -xvf package-query.tar.gz &
        tar -xvf yaourt.tar.gz
        cd package-query
        makepkg -sri
        cd ../yaourt
        makepkg -sri
        cd ..
        rm package-query* yaourt*
        sudo yaourt -S zsh zsh-syntax-highlighting i3blocks neovim i3-wm i3lock-color-git ctags

        symlink_dotfiles()

    elif [[ $var == "-i" ]]; then
        sudo yaourt -S megasync zsh zsh-syntax-highlighting i3blocks neovim i3-wm i3lock-color-git ctags
    fi
    if [[ $var == "-l" ]]; then
        symlink_dotfiles()

    fi
done
function symlink_dotfiles {

    ln -s .i3 $HOME/.config/i3
    ln -s .vim $HOME/.config/nvim
    ln -s .Xresources $HOME/.Xresources
    ln -s .dmrc $HOME/.dmrc
    for file in .config/* do
        ln -s $file "${HOME}${file}"
    done
    ln -s .gitconfig $HOME/.gitconfig
    ln -s .oh-my-zsh $HOME/.oh-my-zsh
    ln -s .zshrc $HOME/.zshrc

}

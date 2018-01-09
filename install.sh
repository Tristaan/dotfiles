#!/bin/bash
SCRIPT_DIR=$(readlink -f ${0%/*})
safe_link(){
    local src="$1"
    local dest="$HOME/`basename $src`"
    [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}
symlink_dotfiles() {

    safe_link "$SCRIPT_DIR/.i3"
    safe_link "$SCRIPT_DIR/.Xresources"
    safe_link "$SCRIPT_DIR/.dmrc"
    safe_link "$SCRIPT_DIR/.gitconfig"
    safe_link "$SCRIPT_DIR/.oh-my-zsh"
    safe_link "$SCRIPT_DIR/.zshrc"
    for file in .config/*; do
        [ ! -e "$dest" ] && ln -fs "${SCRIPT_DIR}/${file}" "${HOME}/${file}"
    done
    [ ! -e "$dest" ] && ln -fs "${SCRIPT_DIR}/zsh-themes" "${HOME}/.oh-my-zsh/custom/themes"

}
git submodule update
for var in "$@"
do
    if [ $var == "-u" ] ; then
        sudo pacman -Syyu
    fi

    if [ $var == "-y" ] ; then
        sudo pacman -S wget
        wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
        wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
        tar -xvf package-query.tar.gz & tar -xvf yaourt.tar.gz
        cd package-query
        makepkg -sri
        cd ../yaourt
        makepkg -sri
        cd ..
        rm -r package-query* yaourt*
    fi

    if [ $var == "-ii" ]; then
        yaourt -S zsh zsh-syntax-highlighting i3blocks neovim i3-wm i3lock-color-git ctags alacritty-scrollback-git polybar mplayer udiskie nitrogen compton dunst megasync parcellite rofi terminus terminess-powerline-font-git ttf-font-awesome-4 openssh arc-gtk-theme lxappearance numix-circle-arc-icons-git pulsemixer
        symlink_dotfiles
    fi

    if [ $var == "-l" ]; then
        symlink_dotfiles

    fi
done

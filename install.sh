#!/bin/bash
UNAME="$(uname -s)"
case "${UNAME}" in
    Linux*)     machine=Linux SCRIPT_DIR=$(readlink -f ${0%/*});;
    Darwin*)    machine=Darwin SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd);;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          SCRIPT_DIR=$(readlink -f ${0%/*});;
esac

safe_link(){
    local src="$1"
    local dest="$HOME/`basename $src`"
    [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}
symlink_dotfiles() {

    if [[ $machine == 'Linux' ]]; then
        safe_link "$SCRIPT_DIR/.i3"
        safe_link "$SCRIPT_DIR/.Xresources"
        safe_link "$SCRIPT_DIR/.dmrc"
    elif [[ $machine == 'Darwin' ]]; then
        safe_link "$SCRIPT_DIR/.skhdrc"
        safe_link "$SCRIPT_DIR/.chunkwmrc"
    fi
    safe_link "$SCRIPT_DIR/.gitconfig"
    safe_link "$SCRIPT_DIR/.oh-my-zsh"
    safe_link "$SCRIPT_DIR/.zshrc"
    safe_link "$SCRIPT_DIR/.taskrc"
    for file in .config/*; do
        [ ! -e "${HOME}/${file}" ] && ln -fs "${SCRIPT_DIR}/${file}" "${HOME}/${file}"
    done
    [ ! -e "${HOME}/.oh-my-zsh/custom/themes" ] && ln -fs "${SCRIPT_DIR}/zsh-themes" "${HOME}/.oh-my-zsh/custom/themes"

}
for var in "$@"
do
    if [ $var == "-u" ] ; then
        sudo pacman -Syyu
    fi

    # Install already build packages
    if [ $var == "-t" ] ; then
        sudo pacman -S zsh zsh-syntax-highlighting neovim i3-gaps ctags mplayer udiskie nitrogen compton dunst rofi terminus-font openssh lxappearance xsel conky firejail linux-hardened wget ttf-font-awesome
        wget https://aur.archlinux.org/cgit/aur.git/snapshot/trizen.tar.gz
        tar -xvf trizen.tar.gz
        cd trizen
        makepkg -sri
        cd ..
        rm -r trizen*
        sudo firecfg
    fi

    # Install packages from the AUR
    if [ $var == "-ii" ]; then
        trizen -S polybar megasync alacritty-scrollback-git i3lock-color-git terminess-powerline-font-git arc-gtk-theme numix-circle-arc-icons-git pulsemixer
    fi

    if [ $var == "-l" ]; then
        git submodule init && git submodule update
        symlink_dotfiles
    fi
done

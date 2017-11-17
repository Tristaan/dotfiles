#!/bin/bash
# Dotfiles installer
realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

safe_link(){
    local src="$1"
    local dest="$HOME/`basename $src`"
    [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}
if [[ $1== 'initialize' ]]; then
    cd ~/build
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
    tar -xvf yaourt.tar.gz
    tar -xvf package-query.tar.gz
    cd package-query
    makepkg -sri
    cd ../yaourt
    makepkg -sri
    cd ..
    rm -R yaourt* package-query*
fi

# Get root
SCRIPT_PATH=`realpath $0`
DOTFILES=`dirname $SCRIPT_PATH`

# Install bin scripts
safe_link "$DOTFILES/bin"

# Initialize and update submodules (for vim plugins)
git submodule init
git submodule update

# Install other dotfiles
for f in `ls -A $DOTFILES`; do
    safe_link "$DOTFILES/$f"
done

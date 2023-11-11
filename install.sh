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

	safe_link "$SCRIPT_DIR/.gitconfig"
	safe_link "$SCRIPT_DIR/.oh-my-zsh"
	safe_link "$SCRIPT_DIR/.zshrc"
	for file in .config/*; do
		[ ! -e "${HOME}/${file}" ] && ln -fs "${SCRIPT_DIR}/${file}" "${HOME}/${file}"
	done
	[ -e "${HOME}/.oh-my-zsh/custom/themes" ] && rm -r "${HOME}/.oh-my-zsh/custom/themes" && ln -fs "${SCRIPT_DIR}/zsh-themes" "${HOME}/.oh-my-zsh/custom/themes"

}
for var in "$@"
do
	# Install
	if [ $var == "-i" ] ; then
		if [ ! -d "$HOME/.config" ]; then
			mkdir $HOME/.config
		fi
		git submodule init && git submodule update
		symlink_dotfiles

		if [[ $machine == 'Linux' ]]; then
			sudo pacman -Syyu
			sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting alacritty neovim terminus-font openssh firejail
			sudo firecfg
			wget https://aur.archlinux.org/cgit/aur.git/snapshot/trizen.tar.gz
			tar -xvf trizen.tar.gz
			cd trizen
			makepkg -sri
			cd ..
			rm -r trizen*
		elif [[ $machine == 'Darwin' ]]; then
			NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
			berew install alacritty terminus
		fi
	fi
done


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

UNAME="$(uname -s)"
case "${UNAME}" in
    Linux*)     hostname=$(</etc/hostname);;
    Darwin*)    hostname=$(hostname);;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          hostname=$(</etc/hostname);;
esac

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ "$hostname" == "T-i3" ]]; then
    ZSH_THEME="T-i3"
elif [[ "$hostname" == "TServer" ]]; then
    ZSH_THEME="TServer"
else
    ZSH_THEME="T-netbook"
fi

plugins=(git git-extras archlinux)

source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"
export RANGER_LOAD_DEFAULT_RC=FALSE

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ccat="source-highlight --out-format=esc -i"
alias lal="ls -la"
alias lh="ls -lh"
alias ip="ip -c"
alias ssc="sudo systemctl"

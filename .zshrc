# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/.oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom

# ugh, colors don't work 100% in Terminator
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# we load this early for the theme color, but this might need to be broken into before/after files
if [[ -e ~/.zshrc-priv ]];
then
    source ~/.zshrc-priv
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="r2-simple"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# import aliases
if [ -f ~/.aliasrc ]; then
  . ~/.aliasrc
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# remove the oh-my-zsh alias for gb
unalias gb

# disable autocorrect
unsetopt correct

# pager settings (mostly for psql)
export PAGER=less
export LESS="-iMSrx4 -FX"

# golang
export GOPATH=~/code/go/third_party:~/code/personal/go

# tidy
export HTML_TIDY=~/.tidyrc

# path for Go binaries
GOBINPATH=~/code/personal/go/bin:~/code/go/third_party/bin

# path for personal bins
PERSONALBIN=~/bin:~/.local/bin


# Linux (mostly linuxbrew)
os=$(uname)
if [[ ( "$os" == "Linux" ) || ( "$os" == "GNU/Linux" ) ]]; then
    export PATH="$HOME/code/ext/linuxbrew/bin:$PATH"
    export MANPATH="$HOME/code/ext/linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/code/ext/linuxbrew/share/info:$INFOPATH"
    # fix pkg-config
    export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH

    # detect i3 and export gnome keyring vars
    if grep -q 'Name: i3' <<<$(wmctrl -m); then
        export $(gnome-keyring-daemon -s)
    fi
fi

# the big one
export PATH=$PERSONALBIN:$GOBINPATH:$PATH

tmux list-sessions 2> /dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

type foo >/dev/null 2>&1 && eval "$(chef shell-init zsh)"
export GO15VENDOREXPERIMENT=1

# Base16 Shell
BASE16_SHELL="$HOME/code/ext/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# direnv
eval "$(direnv hook zsh)"

# a bit weird
export COLORTERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# alias for todo app
type todo.sh >/dev/null 2>&1 && alias t=todo.sh

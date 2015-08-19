# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="r2"

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
export GOPATH=~/code/go/third-party/:~/code/personal/go

# tidy
export HTML_TIDY=~/.tidyrc

# the big one
export PATH=~/bin/:/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:${GOPATH//://bin:}/bin:/usr/local/opt/go/libexec/bin

tmux list-sessions 2> /dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

type foo >/dev/null 2>&1 && eval "$(chef shell-init zsh)"

source ~/.zshrc-priv

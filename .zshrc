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

# disable autocorrect
unsetopt correct

# imagemagick on osx
export MAGICK_HOME="/usr/local/Cellar/imagemagick/6.7.7-6"
export PATH="$MAGICK_HOME/bin:$PATH"

# pager settings (mostly for psql)
export PAGER=less
export LESS="-iMSrx4 -FX"

# golang
export GOPATH=~/projects/go/third-party/:~/projects/go/personal

# tidy
export HTML_TIDY=~/.tidyrc

# the big one
export PATH=~/bin/:/usr/local/share/npm/bin:/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:${GOPATH//://bin:}/bin:/usr/local/opt/go/libexec/bin

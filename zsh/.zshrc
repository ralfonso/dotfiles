# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom
HISTSIZE=50000

for file in ~/.{aliases,functions,path,extra,exports}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

if [[ -e ~/.zshrc-priv ]];
then
    source ~/.zshrc-priv
fi

# auto pushd
setopt autopushd

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
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git docker suse safe-paste zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# remove the oh-my-zsh alias for gb
type gb > /dev/null && unalias gb

# disable autocorrect
unsetopt correct

# pager settings (mostly for psql)
export PAGER=less
export LESS="-iMSrx4 -FX"

# golang
export GOPATH=~/go
export CDPATH=.:${GOPATH}/src/github.com:${GOPATH}/src/golang.org

# tidy
export HTML_TIDY=~/.tidyrc

# path for Go binaries
GOBINPATH=/usr/local/go/bin:~/go/bin

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
fi

# the big one
export PATH=$PERSONALBIN:$GOBINPATH:$PATH

tmux list-sessions 2> /dev/null
if [[ -f ~/.fzf.zsh ]]
then
    source ~/.fzf.zsh
    export FZF_DEFAULT_COMMAND='find . -not \( -wholename "./.git" -prune \)'
fi

export GO15VENDOREXPERIMENT=1

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_material-darker

# direnv
type direnv > /dev/null 2>&1 && eval "$(direnv hook zsh)"

# a bit weird
export COLORTERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# alias for todo app
type todo.sh >/dev/null 2>&1 && alias t=todo.sh

# set the GPG tty
type tty >/dev/null 2>&1 && export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f /home/r2/google-cloud-sdk/path.zsh.inc ]; then
  source '/home/r2/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /home/r2/google-cloud-sdk/completion.zsh.inc ]; then
  source '/home/r2/google-cloud-sdk/completion.zsh.inc'
fi

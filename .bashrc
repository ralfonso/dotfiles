# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PS1="\[$(tput setaf 6)\][\[$(tput setaf 7)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 7)\]\h:\w\[$(tput setaf 6)\]]\\$ \[$(tput sgr0)\]"

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=1000000000 
HISTSIZE=1000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

#function sbmisc()
#{
#        if [ "x$2" != "x" ];
#        then 
#                scp $1 tugboat.steelbreeze.org:sites/steelbreeze.org/www/misc/$2
#        else
#                scp $1 tugboat.steelbreeze.org:sites/steelbreeze.org/www/misc/
#        fi

#}


# Put your fun stuff here.

export CLASSPATH=
# The following three lines have been added by UDB DB2.
if [ -f /home/ralfonso/sqllib/db2profile ]; then
    . /home/ralfonso/sqllib/db2profile
fi

export EDITOR=/usr/bin/vim
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/:/usr/lib/pkgconfig"
export PATH="/usr/local/bin/:$PATH:/usr/local/mysql/bin/:~/bin/"
export TERM=xterm-color
export MPD_HOST="theory@theory"
export LESS="-iMx4 -FX"
export PAGER="less -is -R"


export CLICOLOR=true

. ~/.rvm/scripts/rvm

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export XUGGLE_HOME=/usr/local/xuggler/
export DYLD_LIBRARY_PATH=$XUGGLE_HOME/lib:$DYLD_LIBRARY_PATH

##
# Your previous /Users/rroemmich/.bash_profile file was backed up as /Users/rroemmich/.bash_profile.macports-saved_2011-01-18_at_16:53:00
##

# MacPorts Installer addition on 2011-01-18_at_16:53:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


export PROJ=obey

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# fun todos!
export TODO=~/Dropbox/documents/todo
function todo() { if [ $# == "0" ]; then cat $TODO; else echo "• $@" >> $TODO; fi }
function todone() { sed -i -e "/$*/d" $TODO; }

# ec2 tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.3/jars"
export EC2_PRIVATE_KEY=`ls ~/.ec2/pk-*.pem`
export EC2_CERT=`ls ~/.ec2/cert-*.pem`
export AWS_IAM_HOME="/usr/local/Cellar/aws-iam-tools/1.3.0/jars"
export AWS_CREDENTIAL_FILE="/Users/rroemmich/.ec2/keys"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.15.1/jars"

# vimclojure
export VIMCLOJURE_SERVER_JAR="$HOME/local/lib/vimclojure/server-2.3.1.jar"

if [ -f /etc/bashrc ]; then
	. /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

# CUSTOM SETTINGS
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export LESS="-eRX"
export GREP_OPTIONS='--color=auto --exclude=*.{pyc,swp} --exclude=*.{git,svn}* --exclude=fteweb*'
#export PS1="\e[0;31m[\u@\h \W]\$ \e[m"
#export PS1="\[$(tput setaf 2)\]\u@\h:\w $ \[$(tput sgr0)\]"

# VARIABLES

#FUNCTIONS
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# ALIASES
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

source ~/.git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
#PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '

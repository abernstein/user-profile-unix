# .bash_profile
#
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:/usr/sbin:$HOME/bin
export PATH

if [ -f ~/.bash_login ]; then
  source ~/.bash_login
fi

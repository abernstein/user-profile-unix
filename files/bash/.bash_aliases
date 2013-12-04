# Aliases
#
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias clr='clear'
alias c='clear'
alias h='history'
alias j='jobs -l'

alias ls='ls -F --color'
alias la='ls -A'
alias ll='ls -lh'

alias wget='wget -c'

alias mount='mount |column -t'

alias mkdir='mkdir -pv'

# become root #
alias root='sudo -i'
alias su='sudo -i'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# Custom Function Command List #
alias list='declare -F |cut -d" " -f3'

# Evaluate Network
alias ports='sudo netstat -tulanp'

# shortcut for iptables and pass it via sudo #
alias ipt='sudo /sbin/iptables'

# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# get web server headers #
alias header='curl -I'

# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

## pass options to free ## 
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
##alias cpuinfo='lscpu'##

## older system use /proc/cpuinfo ##
alias cpuinfo='less /proc/cpuinfo'

## Memcached server status  ##
alias mcdstats='/usr/bin/memcached-tool 127.0.0.1:11211 stats'
alias mcdshow='/usr/bin/memcached-tool 127.0.0.1:11211 display'

## quickly flush out memcached server ##
alias flushmcd='echo "flush_all" | nc 127.0.0.1 11211'

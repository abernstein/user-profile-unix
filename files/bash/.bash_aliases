# Aliases
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias clr='clear'

alias ls='ls -F --color'
alias la='ls -A'
alias ll='ls -lh'

# Custom Common Command List
alias ls_httpd_logs='ls -alht /var/log/httpd/ | grep -v "../" | head'
alias errlog_count="cat /var/log/httpd/fteweb_ssl_err_log | cut -d' ' -f6- | cut -d'|' -f1 | sed -e 's/^ *//g' -e 's/ *$//g' -e 's/^.*> //g' -e 's/{unknown} //g' |  sort | uniq -ic"

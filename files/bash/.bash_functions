#!/bin/bash
# FUNCTIONS
function re_puppet_profile ()
{
  refresh=$([[ $1 -gt 0 ]] && echo $1 || echo 0)
  puppet apply -e "class{'profile::users':}";
  source ~/.bash_profile;
  if [ $refresh -gt 0 ]; then c; fi
}
# mdcd makes a set of folders recursively and changes to that directory
function mdcd ()
{
  mkdir -p $1 && cd $1
}

# cdls changes directory and lists the contents
function cdls ()
{
  cd $1 && ls -alh
}

# lsext displays long list of files of the given extension
function lsext ()
{
  find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;
}

# batchexec executes a given linux command on a group of files
function batchexec ()
{
  find . -type f -iname '*.'${1}'' -exec ${@:2}  {} \; ;
}

# rpass generate a random password with a specified length
function rpass () 
{
  cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-12}
}

# getip displays the ipaddress of a given interface
function getip ()
{
  ipaddr=`/sbin/ifconfig ${1:--a} | awk '/inet addr/ {print $2}' | awk -F: '{print $2}'`
  echo -e $ipaddr
}

# mach displays the basic information about the system
function mach ()
{
  echo -e "\nMachine information:" ; uname -a
  echo -e "\nUsers logged on:" ; w -h
  echo -e "\nCurrent date :" ; date
  echo -e "\nMachine status :" ; uptime
  echo -e "\nMemory status :" ; free
  echo -e "\nFilesystem status :"; df -h
}

function recent_touch ()
{
  sudo ls -alht $1 | grep -v "../" | head
}

# Specifically works with current syntax:
# %timestamp% %priorityName% (%priority%): <%user%> {%sessionId%} %location% || %message%" PHP_EOL
#
# might help with other logs with different syntax, but probably not....
#
function errlog_count ()
{
  if [ -n $1 ]; then
    sudo cat $1 | cut -d' ' -f6- | cut -d'|' -f1 | \
      sed -e 's/^ *//g' -e 's/ *$//g' -e 's/^.*> //g' -e 's/{unknown} //g' | \
      sort | uniq -ic
  else
    echo "Usage: `basename $0` /var/log/messages"
  fi
}

function find_hooks ()
{
  find ./ -iname *.hook
}

function find_lg_files ()
{
  for i in `find ./ -size +100M`; do du -sh $i; done
}

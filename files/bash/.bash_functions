#!/bin/bash
# FUNCTIONS
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
  /sbin/ifconfig ${1:-eth0} | awk '/inet addr/ {print $2}' | awk -F: '{print $2}';
}

# mach displays the basic information about the system
function mach ()
{
  output="\nMachine information:" ; uname -a
  output+="\nUsers logged on:" ; w -h
  output+="\nCurrent date :" ; date
  output+="\nMachine status :" ; uptime
  output+="\nMemory status :" ; free
  output+="\nFilesystem status :"; df -h
  echo -e $output;
}

function recent_logs ()
{
  sudo ls -alht $1 | grep -v "../" | head
}

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

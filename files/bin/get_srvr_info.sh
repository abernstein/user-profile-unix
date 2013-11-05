################################################################################
#
# This Script is intended to be used in any server environmet via configuration
# A list of known services, user/groups, working directories will be leveraged
# by the application to audit the server.
#
# @category    Sysadmin
# @package     Audit
# @subpackage  Server
# @copyright   Copyright [c] 2012 GoDaddy.com
#
# @author Aaron Bernstein <abernstein@godaddy.com>
#
# @todo
################################################################################

#!/bin/bash

################################################################################
# Genral Functions
divider="################################################################################";
appender=${divider//#/+};

function create_header {
  echo -e "\n$divider\n$1\n$divider"
}

known_services=(nimitz fte fax http tomcat crond mail soffice t38modem memcached)
known_users=(nimitzcache fteadmin)

################################################################################
create_header "Server Audit"
echo -e "This is a general audit performed on the server to report on certain specifics\n"
echo "Hostname: `hostname`"
echo "Requested: `date`"

################################################################################
create_header "Running Services"
echo "Evaluate services with chkconfig runlevel:3 against list of known services"
echo -e "${appender}\n${known_services[@]}\n${appender}";

running_services=`/sbin/chkconfig --list | grep 3:on | cut -f 1 | sort -f | tr "[:upper:]" "[:lower:]"`
for j in $running_services; do 
  for h in "${known_services[@]}"; do
    if echo $j | grep -q "$h"; then
      echo $j; 
    fi;
  done;
done;

################################################################################
create_header "All Apache Configurations"
ls -1t /etc/httpd/conf*

create_header "Current Running Apache Configurations"
/usr/sbin/httpd -S

create_header "HTTPD Log Files"
ls -1 /var/log/httpd/*_log | sort -u;

################################################################################
create_header "Other Installed Components"
echo "Evaluate /var against list of known users"
echo -e "${appender}\n${known_users[@]}\n${appender}";

for i in "${known_users[@]}"; do find /var -maxdepth 1 -user $i; done;

################################################################################
create_header "Certificates"
for i in `ls /etc/pki/tls/certs/*.crt`; do echo $i; done;

create_header "Certificate Usage"
grep -ir "crt" /etc/httpd/conf /etc/httpd/conf.d;

################################################################################
create_header "CronJobs"
ls -1t /etc/cron.*

################################################################################
create_header "Packages"
yum repolist

echo -e "\nList Installed Packages"
rpm -qa | grep -e php -e gd -e fte -e nimitz -e fax | sort

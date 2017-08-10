#!/bin/bash
# Checks hostname and resets it if its anything other than localhost
mailaddr=prasenjit.singh@seamless.se
hostname=`hostname -s`
if [ "${hostname}" = "localhost" ]; then
  echo "Hostname Unchanged!"
  exit 0
else
  echo -e Host name changed `ip a` | mail -s "Hostname Changed" "${mailaddr}"
  /etc/init.d/network restart
  exit 0
fi
# To run as cron ::
# */3 * * * * curl -s https://raw.githubusercontent.com/seamless-distribution-systems/bash/master/check_hostname.bash | bash

#!/bin/bash
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

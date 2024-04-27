#!/bin/sh

crontab_file=/etc/crontabs/root
echo "Configured root crontab ($crontab_file)"
cat "$crontab_file"
echo

echo "Starting crond in the foreground"
crond -f -L /dev/stdout

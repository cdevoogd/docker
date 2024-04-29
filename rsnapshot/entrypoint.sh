#!/bin/sh

crontab_file=/var/spool/cron/crontabs/root
rsnapshot_config="/etc/rsnapshot.conf"


if [ -f "$crontab_file" ]; then
    echo "Configured root crontab ($crontab_file)"
    cat "$crontab_file"
    echo
    echo "Ensuring the crontab file's permissions are correct"
    chown root:root "$crontab_file"
    chmod 600 "$crontab_file"
fi

if [ -f "$rsnapshot_config" ]; then
    echo "Found a config at rsnapshot's default config location: $rsnapshot_config"
    echo "Running configtest to ensure the config file is valid"
    if ! rsnapshot configtest; then
        echo "'rsnapshot configtest' returning a non-zero code - the config is invalid"
        exit 1
    fi
fi

echo "Starting crond in the foreground"
crond -f -L /dev/stdout

# rsnapshot

This image provides [rsnapshot](https://github.com/rsnapshot/rsnapshot) installed on a minimal Alpine image. It includes `ssh` to allow for handling remote backups, and uses Busybox's `crond` to run the cronjobs that kick off the snapshots.

[The image's source is hosted on GitHub](https://github.com/cdevoogd/docker/tree/master/rsnapshot).

## Usage

To use the image, you will need to bind mount a crontab file that includes the schedules for running `rsnapshot` as well as the config file for `rsnapshot`.

Example crontab:

```
30 5 * * * /usr/bin/rsnapshot daily
40 5 * * 0 /usr/bin/rsnapshot weekly
50 5 1 * * /usr/bin/rsnapshot monthly
```


Example (not complete) config file:

```
config_version	1.2
snapshot_root	/.snapshots

cmd_cp		/bin/cp
cmd_rm		/bin/rm
cmd_rsync	/usr/bin/rsync
cmd_ssh		/usr/bin/ssh
cmd_logger	/usr/bin/logger
cmd_du		/usr/bin/du

retain	daily	7
retain	weekly	6
retain	monthly	6

# ... 
```

Using Docker Compose, mount those files (along with a directory to save the backups) to their proper location and you should be good to go:

```yaml
services:
  rsnapshot:
    image: cdevoogd/rsnapshot:latest
    restart: unless-stopped
    init: true
    volumes:
      # Snapshots will be saved in `/.snapshots` by default, but it depends on your config
      - /backups/:/.snapshots/
      # Mount your config file to the default location
      - ./rsnapshot.conf:/etc/rsnapshot.conf
      # Mount your crontab file to root's crontab location
      - ./crontab:/var/spool/cron/crontabs/root
```

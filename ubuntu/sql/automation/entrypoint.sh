#!/bin/bash

add_cron_env()
{
  if ! cat /etc/environment |  grep -q $1; then
    env_label=$1
    echo $1=${!env_label}>>/etc/environment
    echo $1 is added
  fi
}

add_cron_env TEAMS_HOOK
add_cron_env SQL_NAME
add_cron_env MSSQL_SA_PASSWORD

mkdir -p /var/opt/mssql/backup/archive

cron

/opt/mssql/bin/sqlservr

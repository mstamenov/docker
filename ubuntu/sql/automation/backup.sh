#!/bin/bash
BAK_PATH='/var/opt/mssql/backup'
DAY=$(date +%Y%m%d)

rm /automation/*.log
rm "$BAK_PATH/"*.bak
rm "$BAK_PATH/archive/"*.tgz

echo Backup started at $DAY $(date +%T)>>/automation/automation.log

#/opt/mssql-tools/bin/sqlcmd -S localhost -U $DB_USER -P $DB_PASS -v dbName=$DB_NAME -i /automation/backup.sql >> /automation/automation.log>&1
echo No database has been added yet for backup>>/automation/automation.log
echo No database has been added yet for backup>>"$BAK_PATH/"NoDbsYet.bak

chmod 644 "$BAK_PATH/"*.bak

echo Start compressing at $(date +%T)>>/automation/automation.log

/usr/bin/tar czf "$BAK_PATH/archive/$DAY.tgz" "$BAK_PATH/"*.bak

ls -lh "$BAK_PATH/archive">>/automation/automation.log

echo Backup finished at $(date +%T)>>/automation/automation.log

logText=`cat /automation/automation.log`
. /automation/teams.sh "$TEAMS_HOOK" "Scheduled backup from $SQL_NAME" "#00FF00" "<p>${logText//$'\n'/<br />}</p>"

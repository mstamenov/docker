FROM mcr.microsoft.com/mssql/server:2019-latest
USER root

RUN apt-get update
RUN apt-get -y install nano cron curl

ENV TZ="Europe/Sofia"
ENV ACCEPT_EULA="Y"
ENV MSSQL_COLLATION="Cyrillic_General_CI_AS"

COPY ./automation /automation
RUN chmod -R 770 /automation

RUN crontab -l | { cat; echo "0 22 * * * /bin/bash /automation/backup.sh>>/automation/cron.log"; } | crontab -

ENTRYPOINT ["/bin/bash", "/automation/entrypoint.sh"]

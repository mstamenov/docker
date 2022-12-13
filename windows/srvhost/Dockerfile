FROM  mstamenov/lib:win-frm48

WORKDIR c:\\
RUN mkdir sites
WORKDIR c:\\sites
RUN mkdir site
WORKDIR c:\\
COPY ./AppContent ./sites/site

WORKDIR c:\\Windows\\System32\\inetsrv
RUN appcmd delete site "Default Web Site"
RUN appcmd add site /name:"app1" /bindings:http/*:80: /physicalPath:c:\sites\site
RUN appcmd start site "app1"

FROM  mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2022

WORKDIR c:\\
COPY iisconfig.ps1 iisconfig.ps1
RUN powershell C:\\iisconfig.ps1
RUN del iisconfig.ps1
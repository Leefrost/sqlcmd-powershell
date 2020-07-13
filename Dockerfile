FROM mcr.microsoft.com/powershell:lts-nanoserver-1809

USER ContainerAdministrator

SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop';"]

RUN Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
RUN Set-ExecutionPolicy -ExecutionPolicy Unrestricted
RUN Install-Module SqlServer -Scope CurrentUser -SkipPublisherCheck

ENV PSModulePath="C:\Users\ContainerAdministrator\Documents\PowerShell\Modules;${PSModulePath}"

CMD ["pwsh.exe"]
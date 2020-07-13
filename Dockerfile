FROM mcr.microsoft.com/powershell:lts-nanoserver-1809
LABEL maintainer="Sergii Lischuk <sergii.lischuk@gmail.com>"

USER ContainerAdministrator

SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop';"]

RUN Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted; \
    Set-ExecutionPolicy -ExecutionPolicy Unrestricted; \
    Install-Module SqlServer -Scope CurrentUser -SkipPublisherCheck

ENV PSModulePath="C:\Users\ContainerAdministrator\Documents\PowerShell\Modules;${PSModulePath}"

CMD ["pwsh.exe"]
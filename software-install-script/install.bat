@echo off
**Created by Chris Jeffrey**
**Version 1.0**
**This script will install Chocolatey on your local machine and**
**install all the requiered software for the wokshop**
**-------------------------------------------------------------**

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin“

choco install vscode –y
choco install terraform -y
choco install git -y
choco install github -y
choco install docker-for-windows -y
choco install kubernetes-cli  -y
choco install azure-cli -y
code --install-extension ms-azuretools.vscode-azureterraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.azure-account
code --install-extension knisterpeter.vscode-github
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension redhat.vscode-yaml

echo **Installation Complete**
pause
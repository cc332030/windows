@echo off

set FILE_NAME=OpenSSH-Win64.zip

set APP_PATH=%~dp0app
set ZIP_PATH=%~dp0%FILE_NAME%
set URL=https://github.com/PowerShell/Win32-OpenSSH/releases/latest/download/%FILE_NAME%

curl -L -o %ZIP_PATH% %URL%

net stop sshd

7z x -y -o%APP_PATH% %ZIP_PATH%

net start sshd

pause >nul

@echo off

call link-dir %~dp0data %userprofile%\.ssh
::call link-dir %~dp0config "%programdata%\ssh"

net stop sshd

set SSH_PROGRAM_PATH=C:\Program Files
set APP_NAME=OpenSSH
set FILE_NAME=%APP_NAME%-Win64
set ZIP_NAME=%FILE_NAME%.zip

7z x -y -o"%SSH_PROGRAM_PATH%" %~dp0%ZIP_NAME%

cd /d "%SSH_PROGRAM_PATH%"

rmdir /s /q %APP_NAME%

rename %FILE_NAME% %APP_NAME%

cd %APP_NAME%

powershell.exe -ExecutionPolicy Bypass -File uninstall-sshd.ps1
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1

net start sshd
sc config sshd start=AUTO

pause >nul

@echo off

set SSH_PROGRAM_PATH=C:\Program Files\OpenSSH

set WORK_DIR=%~dp0
set APP=%WORK_DIR%app
set DATA=%WORK_DIR%data

call link-dir %APP% "%SSH_PROGRAM_PATH%"
::call link-dir %~dp0config "%programdata%\ssh"

call link-dir %DATA% %userprofile%\.ssh

call link-file %DATA% %APP% sshd_config

net stop sshd

cd /d "%SSH_PROGRAM_PATH%"
powershell.exe -ExecutionPolicy Bypass -File uninstall-sshd.ps1
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1

net start sshd
sc config sshd start=AUTO

pause >nul

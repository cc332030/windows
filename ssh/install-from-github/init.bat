@echo off

set SSH_PROGRAM_PATH=C:\Program Files\OpenSSH

call link-dir %~dp0app "%SSH_PROGRAM_PATH%"
::call link-dir %~dp0config "%programdata%\ssh"

net stop sshd

cd /d "%SSH_PROGRAM_PATH%"
powershell.exe -ExecutionPolicy Bypass -File uninstall-sshd.ps1
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1

net start sshd
sc config sshd start=AUTO

netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22

pause >nul

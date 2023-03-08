@echo off

set SSH_PROGRAM_PATH=C:\Program Files\OpenSSH

call link-dir %~dp0app "%SSH_PROGRAM_PATH%"

cd /d "%SSH_PROGRAM_PATH%"
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1

pause >nul

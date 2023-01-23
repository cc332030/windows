@echo off

setlocal

%utf8%

set current_path=%~dp0

set from=%current_path%
set to=%windir%

call %current_path%\link-file.bat link-dir.bat %from% %to%

call %current_path%\link-file.bat link-file.bat %from% %to%

endlocal

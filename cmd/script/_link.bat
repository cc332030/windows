@echo off

set current_path=%~dp0

set from=%current_path%
set to=%windir%

call %current_path%\link-file.bat %from% %to% link-dir.bat

call %current_path%\link-file.bat %from% %to% link-file.bat

call %current_path%\link-file.bat %from% %to% github-download.bat

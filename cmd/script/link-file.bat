@echo off

setlocal

%utf8%

set targetFileName=%1

set source=%2
set target=%3

if not defined targetFileName (
  set existTargetFileName="false"
  echo.
  set /p targetFileName=请输入源文件名：
) else (
  set existTargetFileName="true"
)

set sourceFileName=%targetFileName%

if not defined source (
  set existSource="false"
  echo.
  set /p source=请输入源文件路径：
) else (
  set existSource="true"
)

if not defined target (
  set existTarget="false"
  echo.
  set /p target=请输入目标文件路径：
) else (
  set existTarget="true"
)

if not exist %source%\%sourceFileName% (
  echo.
  echo 不存在文件 %source%\%sourceFileName%
  pause >nul
  exit 0
)

if exist %target%\%targetFileName% (
  del /f /q %target%\%targetFileName%
) else if not exist %target% (
  mkdir %target%
)

echo.
mklink %target%\%targetFileName% %source%\%sourceFileName%

set skipParse=true

if false==%existTargetFileName% (
  skipParse=false
)
if false==%existSource% (
  skipParse=false
)
if false==%existTarget% (
  skipParse=false
)

if false==%skipParse% (
  pause >nul
)

endlocal

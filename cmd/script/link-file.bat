@echo off

setlocal

%utf8%

set source=%1
set target=%2

set sourceFileName=%3
set targetFileName=%4

if not defined targetFileName (
  set targetFileName=%sourceFileName%
)

if not defined targetFileName (
  set existTargetFileName="false"
  echo.
  set /p sourceFileName=请输入源文件名：
  set targetFileName=%sourceFileName%
) else (
  set existTargetFileName="true"
)

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

if not exist %source% (
  mkdir %source%
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

:: 相同磁盘下使用硬链接
:: if %source:~0,3%==%target:~0,3% (
::   set MKLINK_PARAMETERS=/h
:: )

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

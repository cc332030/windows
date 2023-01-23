@echo off

setlocal

%utf8%

set source=%1
set target=%2

if not defined source (
  set existSource="false"
  echo.
  set /p source=请输入源目录：
) else (
  set existSource="true"
)

if not defined target (
  set existTarget="false"
  echo.
  set /p target=请输入目标目录：
) else (
  set existTarget="true"
)

if not exist %source% (
  echo.
  echo 文件夹不存在 %source%
  pause >nul
  exit 0
)

:: 创建父级目录
if not exist %target% (
  mkdir %target%
)
rd /s /q %target%

echo.
mklink /d %target% %source%

set skipParse=true

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

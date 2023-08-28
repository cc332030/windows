
set fileName=%1
set repoName=%2

if not defined fileName (
  echo.
  set /p fileName=请输入要保存的文件名：
)

if not defined repoName (
  echo.
  set /p fileName=请输入仓库名称：
)

set tmpName=%fileName%-tmp
del /f /s /q %tmpName% >nul 2>&1

curl -L -o %tmpName% https://github.com/%repoName%/releases/latest/download/%fileName%

del /f /s /q %fileName% >nul 2>&1
forfiles /m %tmpName%* /c "cmd /c rename @file %fileName%"

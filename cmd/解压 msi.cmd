@echo off

echo.
set /p msiPath=请输入 msi 文件路径

echo.
set /p exPath=请输入解压路径

echo.
msiexec /a %msiPath% /qb TARGETDIR=%exPath%

pause >nul

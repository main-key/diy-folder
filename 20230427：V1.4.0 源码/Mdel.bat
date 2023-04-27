@echo off & title [ 清除DIY痕迹 ]
color FD & setlocal enabledelayedexpansion
set "tab1=	" & set "tab2=		"

echo. & echo [ 当前目录 ] %cd%
echo. 
for /f "tokens=1,2 delims==" %%b in ('TYPE "Desktop.ini"') do (
	if "%%b" equ "LocalizedResourceName" echo !tab1![ 文件夹别名 ] %%c
	if "%%b" equ "IconResource" ( echo !tab1![ 文件夹图标 ] %%c )
	if "%%b" equ "InfoTip" echo !tab1![ 文件夹备注 ] %%c
)
echo. & echo.
choice /c:10 /n /m:"[ 键入‘1’清除DIY设置，键入‘0’退出 ] "
if "%errorlevel%" equ "1" (
	DeskEdit.exe /F="%cd%" /D
	echo.
	echo.
	echo %tab1%[ 已清除DIY设置 ] 按任意键退出
	pause>nul 
)
exit /b
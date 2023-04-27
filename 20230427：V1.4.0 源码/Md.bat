@echo off
set parameter1=%1
set parameter2=%2

:: 显示当前路径所有文件夹功能判断
if "%parameter1%" equ "?" ( goto info )
if "%parameter1%" equ "/?" ( goto leavingMessage )

echo "%parameter1%"|find " ">nul && set "parameter1=%parameter1:~1,-1%"
echo "%parameter2%"|find " ">nul && set "parameter2=%parameter2:~1,-1%"

set "pathCd=%cd%"
set "to=%pathCd%\%parameter1%"

if "%parameter1%" neq "" (
	if NOT exist "!parameter1!" (
		md "%parameter1%"
	)
	if "%parameter2%" neq "" (
		DeskEdit.exe /F="%to%" /S=.ShellClassInfo /L=LocalizedResourceName="%parameter2%"
	)
) else (
	start "" MdDisplay.exe "%pathCd%"
)
exit /b

:: 显示当前路径所有文件夹信息
:info
start "" Display.exe "%pathCd%"
exit /b

:leavingMessage
start "" Message.exe
exit /b
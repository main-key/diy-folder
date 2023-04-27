@echo off & title %USERNAME% - [ DIY文件夹透视器 ]
color FD & setlocal enabledelayedexpansion
set "tab1=	" & set "tab2=		"
:: 接收传参
set pathCdTemp=%1
set "pathCd=%pathCdTemp:~1,-1%"

:ergodic
:: 单启动模式
if "~1,-1" neq "%pathCd%" (
	cd /d "%pathCd%"
)
cls & set num=0
echo. & echo [ 当前目录 ] %cd%
echo. & echo [ DIY文件夹信息如下 ]
echo. & echo.
:: 如果使用列表格式会导致偏行
:: echo %tab1% # %tab1%名称 %tab2%别名 %tab2%备注 %tab2%图标
for /f "delims=" %%a in ('dir /a/b *.') do (
	set "name=%%~a"
	if exist "!name!\Desktop.ini" (
		set /a num=!num!+1
		echo !tab1! !num!、文件夹名称: !name!
		for /f "tokens=1,2 delims==" %%b in ('TYPE "!name!\Desktop.ini"') do (
			if "%%b" equ "LocalizedResourceName" echo !tab2!别名: %%c
			if "%%b" equ "IconResource" ( echo !tab2!图标: %%c )
			if "%%b" equ "InfoTip" echo !tab2!备注: %%c
		)
		echo.
	)
)
:: 根据文件夹数量进行不同操作
echo. & echo.
choice /c:120 /n /m:"[ 键入‘1’创建，键入‘2’修改，键入‘0’刷新 ] "
if "%errorlevel%" equ "1" (
	:: 创建
	call MdDisplay.exe "%pathCd%"
)
if "%errorlevel%" equ "2" (
	:: 修改
	goto update
)
if "%errorlevel%" equ "3" (
	:: 刷新
	goto ergodic
)
exit /b

:: 修改
:update
set "upName="
echo. & set /p "upName=[ 输入要修改的文件夹序号并回车 ] "
echo %upName%|findstr "^[0-9]*$" > nul && (
	goto updateGet
)||(
	echo [ 参数不存在 ]
	timeout /t 3
	goto ergodic
)
goto ergodic

:updateGet
set num=0
for /f "delims=" %%a in ('dir /a/b *.') do (
	set "name=%%~a"
	if exist "!name!\Desktop.ini" (
		set /a num=!num!+1
		if "!num!" equ "!upName!" (
			call MdDisplay.exe "%pathCd%" "!name!"
		)
	)
)
echo [ 参数不存在 ]
timeout /t 3
goto ergodic
@echo off & color F1 & set "info=DIY文件夹"
setlocal enabledelayedexpansion
:: 接收控制台传参，并作为起始地址
set pathCdTemp=%1
set "pathCd=%pathCdTemp:~1,-1%"
if "~1,-1" equ "%pathCd%" ( set "pathCd=%cd%" )

:: 接收第二个参数，用作指定修改的名字
set pathCdTemp2=%2
set "pathCd2=%pathCdTemp2:~1,-1%"
:: 主程序
:main
set "fileName="
set "LocalizedResourceName="
set "IconResource="
set "InfoTip="
set "to="
cls
title [ %info% ] -按提示输入信息(1/3)
set "t1=	" & set "t2=		"
echo. & echo [ 当前路径 ] %cd%
echo. & echo [ 在当前路径DIY一个文件夹，支持自定义参数为 ]
echo.
echo %t1%1、别名
echo %t1%2、显示图标（ico）格式
echo %t1%3、文件夹备注

:: 录入名称
if "%pathCd2%" equ "~1,-1" (
	echo. & echo. & set /p "fileName=[ 键入文件夹名称 ] "
	if "!fileName!" equ "" ( goto main )
) else (
	echo. & echo. & echo [ 修改文件夹‘%pathCd2%’信息 ]
	set "fileName=%pathCd2%"
)

:: 录入其他信息
echo. & echo. & echo [ 分别输入‘文件夹别名’‘文件夹图标(ico)格式’‘文件夹备注’留空则忽略 ] 选填
echo. & set /p "LocalizedResourceName=[ 键入文件夹 别名 ] "
echo. & set /p "IconResource=[ 键入文件夹 图标 ] "
echo. & set /p "InfoTip=[ 键入文件夹 备注 ] "
echo.
if "%LocalizedResourceName%" equ "" (
	if "%IconResource%" equ "" (
		if "%InfoTip%" equ "" (
			echo [ 其他信息为空，巧妇难为无米之炊 ] - 再见！
			pause>nul
			exit /b
		)
	)
)
cls
title [ %info% ] - 检查并确认(2/3)
echo. & echo [ 即将进行以下操作 ]
echo. 
if "%pathCd%" equ "" (
	set "to=%fileName%"
) else (
	set "to=%pathCd%\%fileName%"
)
:: 判断文件夹是否存在
if exist "%fileName%" (
	echo. & echo [ 修改 ] %fileName%（文件夹）
	set up=yes
) else (
	echo. & echo [ 生成 ] %fileName% （文件夹）
)
if "%LocalizedResourceName%" neq "" (
	echo. & echo [ 别名 ] %LocalizedResourceName%
)
if "%IconResource%" neq "" (
	echo. & echo [ 图标 ] %IconResource%
)
if "%InfoTip%" neq "" (
	echo. & echo [ 备注 ] %InfoTip%
)
echo. & echo. & choice /c:01 /n /m:"[ 确认无误后键入‘1’开始，键入‘0’返回主菜单 ] "
set "ChoiceParam=%errorlevel%"
if "%ChoiceParam%" equ "1" goto main
if "%ChoiceParam%" equ "2" goto ste
pause>nul & exit /b

:ste
:: 进入目录位置，创建所需文件，加上属性
if NOT exist "%fileName%" (
	md "%fileName%"
)
if "%LocalizedResourceName%" neq "" (
	:: echo LocalizedResourceName=%LocalizedResourceName%>>Desktop.ini
	DeskEdit.exe /F="%to%" /S=.ShellClassInfo /L=LocalizedResourceName="%LocalizedResourceName%"
)
if "%IconResource%" neq "" (
	:: echo IconResource=%IconResource%^,0 >>Desktop.ini
	DeskEdit.exe /F="%to%" /S=.ShellClassInfo /L=IconResource="%IconResource%"
)
if "%InfoTip%" neq "" (
	:: echo InfoTip=%InfoTip%>>Desktop.ini
	DeskEdit.exe /F="%to%" /S=.ShellClassInfo /L=InfoTip="%InfoTip%"
)

title [ %info% ] - 处理完成(3/3) 20230426 V1.4.0
echo. & echo [ 处理完成 ]
echo. & echo Quotations:
echo %t1%我的微笑，你百度不到。
echo %t1%生来骄傲，不爽绕道。
echo %t1%你是限量版，但我是绝版。
echo %t1%生活处处是阳光，看你自己怎么想。
echo. & echo. & echo [ 按任意键重复。。。 ] & pause > nul
if "%up%" equ "yes" (
	if "%2" neq "" (
		call Display.exe "%pathCd%"
	)
)
goto main

@echo off & color F1 & set "info=创建DIY文件夹（内测版）"
setlocal enabledelayedexpansion
set "pathCd=%cd%"
:main
set "fileName="
set "LocalizedResourceName="
set "IconResource="
set "InfoTip="
cls
title [ %info% ] -按提示输入信息(1/3)
set "t1=	" & set "t2=		"
echo. & echo [ 当前路径 ]%cd%
echo. & echo [ 在当前路径DIY一个文件夹，支持自定义参数为 ]
echo.
echo %t1%1、别名
echo %t1%2、显示图标（ico）格式
echo %t1%3、文件夹备注
echo. & echo %t1%注意：创建后可能不会立即显示出来，请让子弹飞会。
echo. & echo %t1%或手动刷新【属性-自定义-还原默认图标-应用】

:: 录入名称
echo. & echo. & set /p "fileName=[ 键入文件夹名称 ] "
if "%fileName%" equ "" ( goto main )

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
echo. & echo [ 检查以下输入信息 ]
echo. 
echo [ 目标 ] %pathCd%\%fileName%
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
md "%fileName%"
cd "%fileName%"
echo [.ShellClassInfo]>Desktop.ini
if "%LocalizedResourceName%" neq "" (
	echo LocalizedResourceName=%LocalizedResourceName%>>Desktop.ini
)
if "%IconResource%" neq "" (
	echo IconResource=%IconResource%^,0 >>Desktop.ini
)
if "%InfoTip%" neq "" (
	echo InfoTip=%InfoTip%>>Desktop.ini
)
attrib +s %fileName%
attrib +s +h -a Desktop.ini
:: 再次添加权限是为了让系统注意到这个文件夹
attrib +s %fileName%
cls
cd /d %pathCd%
title [ %info% ] - 处理完成(3/3)
echo. & echo. & echo [ 信息已写入目标文件，有时系统没反应过来也是正常的，让子弹飞会~ ]
echo. & echo %t1%或手动刷新【属性-自定义-还原默认图标-应用】
echo. & echo. & echo Quotations:
echo %t1%我的微笑，你百度都搜不到。
echo %t1%生来骄傲，不爽绕道。
echo %t1%你是限量版，但我是绝版。
echo %t1%生活处处是阳光，看你自己怎么想。
echo. & echo. & echo [ 按任意键重复。。。 ] & pause > nul & goto main
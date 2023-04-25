@echo off & color F1 & set "info=DIY文件夹"
setlocal enabledelayedexpansion
:main
cls
title [ %info% ] - 功能预览(0/4)
set "t1=	" & set "t2=		"
echo. & echo.
echo [ 使用此工具你可以自定义文件夹的某些信息，如 ]
echo.
echo %t1%1、别名
echo %t1%2、显示图标（ico）格式
echo %t1%3、文件夹备注
echo. & echo %t1%注意：创建后可能不会立即显示出来，请让子弹飞会。
echo. & echo %t1%或手动刷新【属性-自定义-还原默认图标-应用】
echo. & echo.
choice /c:01 /n /m:"[ 键入‘1’开始，键入‘0’退出 ] "
set "ChoiceParam=%errorlevel%"
if "%ChoiceParam%" equ "1" exit /b
if "%ChoiceParam%" equ "2" goto Extract
pause>nul & exit /b
:Extract
cls
title [ %info% ] - 确认目标(1/4)
set "target=12"
set "original="
echo. & set /p "original=[ 键入要DIY的文件夹 ] "
if "%original:~1,-1%" equ "" goto getA
echo.
if exist %original% (
	for %%i in (!original!) do set AisDirectory=%%~ai
	if "!AisDirectory:~0,1!" equ "d" (
		echo %Tab1%[ 目标验证成功 ]
		goto getValue
	) else (
		echo %Tab1%[ 目标验证失败 ]	- 这不是文件夹
		goto Extract
	)
) else (
	echo %Tab1%[ 目标验证失败 ]	- 地址未找到
	goto Extract
)
pause>nul & exit /b
:getValue
cls
title [ %info% ] - 信息录入(2/4)
echo. & echo.
echo [ 分别输入‘文件夹别名’‘文件夹图标(ico)格式’‘文件夹备注’留空则跳过 ]

set "LocalizedResourceName="
set "IconResource="
set "InfoTip="

echo. & set /p "LocalizedResourceName=[ 键入文件夹 别名 ] "
echo. & set /p "IconResource=[ 键入文件夹 图标 ] "
echo. & set /p "InfoTip=[ 键入文件夹 备注 ] "
echo.
if "%LocalizedResourceName%" equ "" (
	if "%IconResource%" equ "" (
		if "%InfoTip%" equ "" (
			echo [ 巧妇难为无米之炊 ] - 再见！
			exit /b
		)
	)
)
cls
title [ %info% ] - 检查确认(3/4)
echo. & echo [ 检查以下输入信息 ]
echo. 
echo [ 目标 ] %original%
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
:: copy Desktop.ini %original%
cd /d %original%
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
attrib +s %original%
attrib +s +h -a Desktop.ini
:: 再次添加权限是为了让系统注意到这个文件夹
attrib +s %original%
cls
cd /d %~dp0
title [ %info% ] - 人工检查(4/4)
echo. & echo.
echo. & echo [ 信息已写入目标文件，有时系统没反应过来也是正常的，让子弹飞会~ ]
echo. & echo %t1%或手动刷新【属性-自定义-还原默认图标-应用】
echo. & echo.
echo. & echo Quotations:
echo %t1%我的微笑，你百度都搜不到。
echo %t1%生来骄傲，不爽绕道。
echo %t1%你是限量版，但我是绝版。
echo %t1%生活处处是阳光，看你自己怎么想。
echo. & echo. & echo [ 按任意键重复。。。 ] & pause > nul & goto main
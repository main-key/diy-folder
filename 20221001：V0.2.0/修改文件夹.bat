@echo off & color F1 & set "info=DIY�ļ���"
setlocal enabledelayedexpansion
:main
cls
title [ %info% ] - ����Ԥ��(0/4)
set "t1=	" & set "t2=		"
echo. & echo.
echo [ ʹ�ô˹���������Զ����ļ��е�ĳЩ��Ϣ���� ]
echo.
echo %t1%1������
echo %t1%2����ʾͼ�꣨ico����ʽ
echo %t1%3���ļ��б�ע
echo. & echo %t1%ע�⣺��������ܲ���������ʾ�����������ӵ��ɻᡣ
echo. & echo %t1%���ֶ�ˢ�¡�����-�Զ���-��ԭĬ��ͼ��-Ӧ�á�
echo. & echo.
choice /c:01 /n /m:"[ ���롮1����ʼ�����롮0���˳� ] "
set "ChoiceParam=%errorlevel%"
if "%ChoiceParam%" equ "1" exit /b
if "%ChoiceParam%" equ "2" goto Extract
pause>nul & exit /b
:Extract
cls
title [ %info% ] - ȷ��Ŀ��(1/4)
set "target=12"
set "original="
echo. & set /p "original=[ ����ҪDIY���ļ��� ] "
if "%original:~1,-1%" equ "" goto getA
echo.
if exist %original% (
	for %%i in (!original!) do set AisDirectory=%%~ai
	if "!AisDirectory:~0,1!" equ "d" (
		echo %Tab1%[ Ŀ����֤�ɹ� ]
		goto getValue
	) else (
		echo %Tab1%[ Ŀ����֤ʧ�� ]	- �ⲻ���ļ���
		goto Extract
	)
) else (
	echo %Tab1%[ Ŀ����֤ʧ�� ]	- ��ַδ�ҵ�
	goto Extract
)
pause>nul & exit /b
:getValue
cls
title [ %info% ] - ��Ϣ¼��(2/4)
echo. & echo.
echo [ �ֱ����롮�ļ��б��������ļ���ͼ��(ico)��ʽ�����ļ��б�ע������������ ]

set "LocalizedResourceName="
set "IconResource="
set "InfoTip="

echo. & set /p "LocalizedResourceName=[ �����ļ��� ���� ] "
echo. & set /p "IconResource=[ �����ļ��� ͼ�� ] "
echo. & set /p "InfoTip=[ �����ļ��� ��ע ] "
echo.
if "%LocalizedResourceName%" equ "" (
	if "%IconResource%" equ "" (
		if "%InfoTip%" equ "" (
			echo [ �ɸ���Ϊ����֮�� ] - �ټ���
			exit /b
		)
	)
)
cls
title [ %info% ] - ���ȷ��(3/4)
echo. & echo [ �������������Ϣ ]
echo. 
echo [ Ŀ�� ] %original%
if "%LocalizedResourceName%" neq "" (
	echo. & echo [ ���� ] %LocalizedResourceName%
)
if "%IconResource%" neq "" (
	echo. & echo [ ͼ�� ] %IconResource%
)
if "%InfoTip%" neq "" (
	echo. & echo [ ��ע ] %InfoTip%
)
echo. & echo. & choice /c:01 /n /m:"[ ȷ���������롮1����ʼ�����롮0���������˵� ] "
set "ChoiceParam=%errorlevel%"
if "%ChoiceParam%" equ "1" goto main
if "%ChoiceParam%" equ "2" goto ste
pause>nul & exit /b
:ste
:: ����Ŀ¼λ�ã����������ļ�����������
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
:: �ٴ����Ȩ����Ϊ����ϵͳע�⵽����ļ���
attrib +s %original%
cls
cd /d %~dp0
title [ %info% ] - �˹����(4/4)
echo. & echo.
echo. & echo [ ��Ϣ��д��Ŀ���ļ�����ʱϵͳû��Ӧ����Ҳ�������ģ����ӵ��ɻ�~ ]
echo. & echo %t1%���ֶ�ˢ�¡�����-�Զ���-��ԭĬ��ͼ��-Ӧ�á�
echo. & echo.
echo. & echo Quotations:
echo %t1%�ҵ�΢Ц����ٶȶ��Ѳ�����
echo %t1%������������ˬ�Ƶ���
echo %t1%���������棬�����Ǿ��档
echo %t1%����������⣬�����Լ���ô�롣
echo. & echo. & echo [ ��������ظ������� ] & pause > nul & goto main
@echo off & color F1 & set "info=DIY�ļ���"
setlocal enabledelayedexpansion
:: ���տ���̨���Σ�����Ϊ��ʼ��ַ
set pathCdTemp=%1
set "pathCd=%pathCdTemp:~1,-1%"
if "~1,-1" equ "%pathCd%" ( set "pathCd=%cd%" )

:: ���յڶ�������������ָ���޸ĵ�����
set pathCdTemp2=%2
set "pathCd2=%pathCdTemp2:~1,-1%"
:: ������
:main
set "fileName="
set "LocalizedResourceName="
set "IconResource="
set "InfoTip="
set "to="
cls
title [ %info% ] -����ʾ������Ϣ(1/3)
set "t1=	" & set "t2=		"
echo. & echo [ ��ǰ·�� ] %cd%
echo. & echo [ �ڵ�ǰ·��DIYһ���ļ��У�֧���Զ������Ϊ ]
echo.
echo %t1%1������
echo %t1%2����ʾͼ�꣨ico����ʽ
echo %t1%3���ļ��б�ע

:: ¼������
if "%pathCd2%" equ "~1,-1" (
	echo. & echo. & set /p "fileName=[ �����ļ������� ] "
	if "!fileName!" equ "" ( goto main )
) else (
	echo. & echo. & echo [ �޸��ļ��С�%pathCd2%����Ϣ ]
	set "fileName=%pathCd2%"
)

:: ¼��������Ϣ
echo. & echo. & echo [ �ֱ����롮�ļ��б��������ļ���ͼ��(ico)��ʽ�����ļ��б�ע����������� ] ѡ��
echo. & set /p "LocalizedResourceName=[ �����ļ��� ���� ] "
echo. & set /p "IconResource=[ �����ļ��� ͼ�� ] "
echo. & set /p "InfoTip=[ �����ļ��� ��ע ] "
echo.
if "%LocalizedResourceName%" equ "" (
	if "%IconResource%" equ "" (
		if "%InfoTip%" equ "" (
			echo [ ������ϢΪ�գ��ɸ���Ϊ����֮�� ] - �ټ���
			pause>nul
			exit /b
		)
	)
)
cls
title [ %info% ] - ��鲢ȷ��(2/3)
echo. & echo [ �����������²��� ]
echo. 
if "%pathCd%" equ "" (
	set "to=%fileName%"
) else (
	set "to=%pathCd%\%fileName%"
)
:: �ж��ļ����Ƿ����
if exist "%fileName%" (
	echo. & echo [ �޸� ] %fileName%���ļ��У�
	set up=yes
) else (
	echo. & echo [ ���� ] %fileName% ���ļ��У�
)
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

title [ %info% ] - �������(3/3) 20230426 V1.4.0
echo. & echo [ ������� ]
echo. & echo Quotations:
echo %t1%�ҵ�΢Ц����ٶȲ�����
echo %t1%������������ˬ�Ƶ���
echo %t1%���������棬�����Ǿ��档
echo %t1%����������⣬�����Լ���ô�롣
echo. & echo. & echo [ ��������ظ������� ] & pause > nul
if "%up%" equ "yes" (
	if "%2" neq "" (
		call Display.exe "%pathCd%"
	)
)
goto main

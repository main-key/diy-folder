@echo off & title %USERNAME% - [ DIY�ļ���͸���� ]
color FD & setlocal enabledelayedexpansion
set "tab1=	" & set "tab2=		"
:: ���մ���
set pathCdTemp=%1
set "pathCd=%pathCdTemp:~1,-1%"

:ergodic
:: ������ģʽ
if "~1,-1" neq "%pathCd%" (
	cd /d "%pathCd%"
)
cls & set num=0
echo. & echo [ ��ǰĿ¼ ] %cd%
echo. & echo [ DIY�ļ�����Ϣ���� ]
echo. & echo.
:: ���ʹ���б��ʽ�ᵼ��ƫ��
:: echo %tab1% # %tab1%���� %tab2%���� %tab2%��ע %tab2%ͼ��
for /f "delims=" %%a in ('dir /a/b *.') do (
	set "name=%%~a"
	if exist "!name!\Desktop.ini" (
		set /a num=!num!+1
		echo !tab1! !num!���ļ�������: !name!
		for /f "tokens=1,2 delims==" %%b in ('TYPE "!name!\Desktop.ini"') do (
			if "%%b" equ "LocalizedResourceName" echo !tab2!����: %%c
			if "%%b" equ "IconResource" ( echo !tab2!ͼ��: %%c )
			if "%%b" equ "InfoTip" echo !tab2!��ע: %%c
		)
		echo.
	)
)
:: �����ļ����������в�ͬ����
echo. & echo.
choice /c:120 /n /m:"[ ���롮1�����������롮2���޸ģ����롮0��ˢ�� ] "
if "%errorlevel%" equ "1" (
	:: ����
	call MdDisplay.exe "%pathCd%"
)
if "%errorlevel%" equ "2" (
	:: �޸�
	goto update
)
if "%errorlevel%" equ "3" (
	:: ˢ��
	goto ergodic
)
exit /b

:: �޸�
:update
set "upName="
echo. & set /p "upName=[ ����Ҫ�޸ĵ��ļ�����Ų��س� ] "
echo %upName%|findstr "^[0-9]*$" > nul && (
	goto updateGet
)||(
	echo [ ���������� ]
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
echo [ ���������� ]
timeout /t 3
goto ergodic
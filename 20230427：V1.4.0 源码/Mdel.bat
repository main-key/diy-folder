@echo off & title [ ���DIY�ۼ� ]
color FD & setlocal enabledelayedexpansion
set "tab1=	" & set "tab2=		"

echo. & echo [ ��ǰĿ¼ ] %cd%
echo. 
for /f "tokens=1,2 delims==" %%b in ('TYPE "Desktop.ini"') do (
	if "%%b" equ "LocalizedResourceName" echo !tab1![ �ļ��б��� ] %%c
	if "%%b" equ "IconResource" ( echo !tab1![ �ļ���ͼ�� ] %%c )
	if "%%b" equ "InfoTip" echo !tab1![ �ļ��б�ע ] %%c
)
echo. & echo.
choice /c:10 /n /m:"[ ���롮1�����DIY���ã����롮0���˳� ] "
if "%errorlevel%" equ "1" (
	DeskEdit.exe /F="%cd%" /D
	echo.
	echo.
	echo %tab1%[ �����DIY���� ] ��������˳�
	pause>nul 
)
exit /b
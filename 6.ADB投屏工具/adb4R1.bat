@ECHO OFF&SETLOCAL enabledelayedexpansion
title �ѶR1һ��ADB����

CD /d %~dp0
::ECHO %~dp0
SET "ipd=192.168.1.166" REM �����ѶR1Ĭ��IP��ַ
SET "apkd=h.apk" REM ����Ĭ��apk �ļ���


:main
::CD /d %~dp0hijack
@ECHO OFF
CLS
color 0a
ECHO.
ECHO.
ECHO.         1��ADB ���������ѶR1��ADB���ԣ�
ECHO.
ECHO.         2���鿴�豸����״̬
ECHO.
ECHO.         3���ϴ�APK����װ����1��ɵĻ����ϣ�
ECHO.
ECHO.         4��������װδ֪��Դ�����
ECHO.
ECHO.         5���˳�������
ECHO.
SET /P psn=  ��������ѡ��ǰ�����ּ������س�:

if /I "!psn!"=="1" goto a1

if /I "!psn!"=="2" goto a2

if /I "!psn!"=="3" goto a3

if /I "!psn!"=="4" goto a4

if /I "!psn!"=="5" goto EX
CLS 
ECHO.
ECHO �������󣬰�������������˵���
PAUSE >nul
goto main

:a1
CLS 
ECHO.
ECHO.         1��ADB ���������ѶR1��ADB���ԣ�
ECHO.
ECHO. �������...
adb disconnect >nul
taskkill /f /t /im adb.exe >nul
adb devices >nul
::DIR
ECHO. 
SET /P ip=  �������ѶR1�ľ�����IP��ַ�����س���ֱ�ӻس�Ĭ��Ϊ %ipd%����
if "!ip!"=="" SET "ip=%ipd%"
ECHO.
ECHO. ������...
adb connect !ip!
adb devices|findstr /ic "\<device\>" ||GOTO 2
:1
ECHO. ���ӳɹ�����������������˵�
PAUSE >NUL
SET "ip="
GOTO main

:2
ECHO. ����ʧ�ܣ��豸���߻��豸ADB����δ�򿪣�������...
ECHO. ��������������˵�
PAUSE >nul
GOTO main

:a2
CLS
ECHO.
ECHO.         2���鿴�豸����״̬
ECHO. 
adb devices
ECHO. ��������������˵�
PAUSE >nul
GOTO main

:a3
CLS
ECHO.
ECHO.         3���ϴ�APK����װ����1��ɵĻ����ϣ�
ECHO.
ECHO.  ׼���ϴ�APK�ļ����뽫apk�ļ�����������ͬĿ¼������ȷ���ļ���...
DIR 
ECHO.
SET /P apk=  ������������ʾ���ļ���Ϣ���������������ϴ���װ��apk�ļ�����ֱ�ӻس�Ĭ�� %apkd%��:
if "!apk!"=="" SET "apk=%apkd%"
ECHO.
ECHO. �ϴ��ļ�...
adb push !apk! /data/local/tmp/ 
ECHO. ��װ����У���ȴ�...
adb shell /system/bin/pm install -t /data/local/tmp/!apk!|findstr /i "success" ||GOTO 4
ECHO. ��װ�ɹ���
adb shell rm -rf /data/local/tmp/!apk!
ECHO. ��������������˵���
PAUSE >NUL
SET "apk="
goto main

:4
ECHO. ��װʧ�ܣ�������...
ECHO. ��������������˵���
PAUSE >nul
goto main

:a4 
CLS   
ECHO.
ECHO.         4��������װδ֪��Դ�����
ECHO.
adb shell settings put secure install_non_market_apps 1
ECHO. ok
ECHO. ��������������˵���
PAUSE >nul
goto main

:EX
EXIT
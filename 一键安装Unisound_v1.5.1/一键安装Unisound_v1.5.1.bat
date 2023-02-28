@echo off
setlocal ENABLEDELAYEDEXPANSION
set apk=Unisound_v1.5.1.apk
set title=һ����װ���v1.46 By��С�ɣ�QQ203017966��
if "%apk%" neq "" set title=��%apk%��%title%
title %title%
cd /d %~dp0
:connect
color 03
if not exist adb.exe goto adbfile_not
set /p ip=����������ip���豸���ƣ���������������usb������a��ѡ��ǰ�������豸��:
if "%ip%" == "" color 04&echo ���벻��Ϊ�գ�&choice /t 1 /d y /n > nul&goto connect
if "%ip%" == "cmd" echo ����������cmd��&cmd.exe&echo ���˳�cmd���밴��������أ�&pause > nul&goto connect
if "%ip%" == "a" set type=&goto connect_usb_success
if "%ip%" == "usb" goto connect_usb
if "%ip%" == "USB" goto connect_usb
goto connect_ip

::set query=true
::goto connect_ip_query

:connect_ip_query
color 06
echo ���ڲ�ѯ�豸����״̬������
adb devices > nul
choice /t 1 /d y /n > nul
(for /f "tokens=1 delims=" %%i in ('adb -s %ip% get-state') do (
if "%%i" == "device" set type_id=true&set type=-s %ip%&goto test_connect
))
if "%query%" neq "true" echo ����ʧ�ܣ�1������¿�ʼ���ӣ�&choice /t 1 /d y /n > nul&adb kill-server
set query=
goto connect_ip


:connect_usb
color 06
set type=-d
echo ��ʼ����usb�豸������
adb %type% usb
choice /t 2 /d y /n > nul
adb devices > nul
choice /t 1 /d y /n > nul
goto connect_usb_success

:connect_ip
color 06
::echo ����豸�б�����
::set HideDeviceList=true
::call :get_devices
::if %DeviceNum% gtr 0 echo ������[%DeviceNum%]���豸����������adb���񡣡���&adb kill-server&choice /t 1 /d y /n > nul
echo ��ʼ�����豸������
choice /t 1 /d y /n > nul
adb connect %ip%
goto connect_ip_query

:connect_ip_success
goto connect_ip_query


:connect_usb_success
color 06
echo ���ڲ�ѯ�������豸�б�����
call :get_devices
if %DeviceNum% lss 1 echo ��ǰδ��ѯ���κ��豸��&goto run_error
if %DeviceNum% gtr 1 echo �����ж���豸����ѡ��һ���豸�������ӣ�&goto select_device
echo �����豸��%Device1%�������Զ�Ϊ�����ӡ�����
set ip=%Device1%
set type=-s %ip%
goto test_connect
pause > nul
exit

:select_device
color 06
set DeviceIndex=0
set /p DeviceIndex=������ţ�
if %DeviceIndex% lss 1 color 04&echo ��Ŵ���������ѡ��&choice /t 1 /d y /n > nul&goto select_device
if %DeviceIndex% gtr %DeviceNum% color 04&echo ��Ŵ���������ѡ��&choice /t 1 /d y /n > nul&goto select_device
set device=!Device%DeviceIndex%!
if "%device%" equ "" color 04&echo ��Ŵ���������ѡ��&choice /t 1 /d y /n > nul&goto select_device
echo ѡ���豸��%device%
set ip=%device%
set type=-s %ip%
goto connect_ip_query


:connect_usb_success_bak
echo ���ڲ�ѯ�������豸�б�����
echo -----�������豸�б�-----
adb devices|findstr /i "\<device\>"||goto connect_fail
echo ------------------------
color 06
echo ��ʾ���������б��ж���豸�����ȶϿ��������豸����ʹ�ñ����ߣ�������ܻᵼ���޷������豸��
goto test_connect
pause > nul
exit

:get_devices
set DeviceNum=0
set DeviceList=none
if "%HideDeviceList%" neq "true" echo -----�������豸�б�-----
(for /f "skip=1 tokens=1,2 delims=	" %%i in ('adb devices') do (
set /a DeviceNum+=1
set Device=%%i
set DeviceStatus=%%j
call :set_device
))
if "%HideDeviceList%" neq "true" echo ------------------------
set HideDeviceList=
goto :eof

:set_device
if "%DeviceList%" neq "none" set DeviceList=%DeviceList%-/-\-%device%
if "%DeviceList%" equ "none" set DeviceList=%device%
set Device%DeviceNum%=%Device%
if "%HideDeviceList%" neq "true" echo %DeviceNum%.%Device% %DeviceStatus%
set Device=
goto :eof

:run_error
color 04
echo ��Ǹ���������ϴ����밴����������������ӣ�
pause > nul
goto connect

:connect_fail
color 04
echo �����豸ʧ�ܣ��밴��������ԣ�
pause > nul
goto connect

:test_connect
color 06
echo ���ڲ������ӣ����Ժ򡣡���
adb %type% shell ls > nul
if %errorlevel%==1 goto run_error
color 03
echo ���ӳɹ������ڳ�ʼ��������
echo ���ڲ�ѯ�豸��Ϣ������

(for /f %%i in ('adb %type% shell settings get secure install_non_market_apps') do (
set install_non_market_apps=%%i
))

if "%install_non_market_apps%" neq "1" echo ִ������װδ֪��ԴӦ�á�����&adb %type% shell settings put secure install_non_market_apps 1 > nul

call :get_device_info

if "%build_host%" == "phicomm" if "%build_model%" == "rk322x-box" set r1=true

color 03
if "%hostname%" neq "" echo �豸���ƣ�%hostname%
if "%ver%" neq "" echo �̼��汾��%ver%
if "%ipaddress%" neq "" echo �豸IP��%ipaddress%
if "%serialno%" neq "" echo �豸SN��%serialno%
if %ver% gtr 2999 if %ver% neq 3448 (
color 06
if "%r1%" == "true" goto r1_low_ver
)
if "%apk%" neq "" goto install_apk
goto install


:get_device_info

(for /f %%i in ('adb %type% shell getprop ro.serialno') do (
set serialno=%%i
))

(for /f %%i in ('adb %type% shell getprop ro.build.version.incremental') do (
set ver=%%i
))


(for /f %%i in ('adb %type% shell getprop dhcp.wlan0.ipaddress') do (
set ipaddress=%%i
))

(for /f "tokens=1,2,3,4,5,6 delims= " %%i in ('adb %type% shell getprop ro.build.host') do (
set tmp_text=%%i
if "%%j" neq "" set tmp_text=%tmp_text% %%j
if "%%k" neq "" set tmp_text=%tmp_text% %%k
if "%%l" neq "" set tmp_text=%tmp_text% %%l
if "%%m" neq "" set tmp_text=%tmp_text% %%m
if "%%n" neq "" set tmp_text=%tmp_text% %%n
))
set build_host=%tmp_text%

(for /f  "tokens=1,2,3,4,5,6 delims= " %%i in ('adb %type% shell getprop ro.product.model') do (
set tmp_text=%%i
if "%%j" neq "" set tmp_text=%tmp_text% %%j
if "%%k" neq "" set tmp_text=%tmp_text% %%k
if "%%l" neq "" set tmp_text=%tmp_text% %%l
if "%%m" neq "" set tmp_text=%tmp_text% %%m
if "%%n" neq "" set tmp_text=%tmp_text% %%n
))
set build_model=%tmp_text%

(for /f "tokens=1,2,3,4,5,6 delims= " %%i in ('adb %type% shell getprop net.hostname') do (
set tmp_text=%%i
if "%%j" neq "" set tmp_text=%tmp_text% %%j
if "%%k" neq "" set tmp_text=%tmp_text% %%k
if "%%l" neq "" set tmp_text=%tmp_text% %%l
if "%%m" neq "" set tmp_text=%tmp_text% %%m
if "%%n" neq "" set tmp_text=%tmp_text% %%n
))
set hostname=%tmp_text%

goto :eof


:r1_low_ver
echo ע�⣺����R1�̼��汾�����°汾����װСѶ�޸İ���ܻ᲻���ݣ�����ʹ�����¹��߽��й̼�������https://xfdown.lanzoui.com/icLUkq76mxe ����:9d7f 
echo �밴�����������
pause > nul
if "%apk%" neq "" goto install_apk
goto install

:install
color 03
echo ------------------------
if not exist apps  (md apps
echo ��⵽appsĿ¼�����ڣ����Զ�������
)
echo ��ʾ���뽫Ҫ��װ����������Ƶ�appsĿ¼�£�
echo ��ʾ�����¼����ϵ�Tab�����Զ�������ȡappsĿ¼�µ��ļ���
echo ��ʾ������list���г�appsĿ¼�µ�����б�
echo ------------------------
set CurrentPath=%~dp0
set CurrentPath=%CurrentPath%apps\
call :check_files
cd /d %CurrentPath%
set apk=
set /p apk=������Ҫ��װ�����(����help�鿴��������):
goto start_install

:install_apk
if not exist apps\%apk% goto install
color 03
set CurrentPath=%~dp0
set CurrentPath=%CurrentPath%apps\
cd /d %CurrentPath%
echo �����������ʼ��װ%apk%��
pause > nul
goto start_install

:check_files
if "%check_files%" == "true" goto :eof
set check_files=true
set ListNum=0
(for /f "tokens=1 delims=	" %%i in ('dir "%CurrentPath%*.apk" /b') do (
set /a ListNum+=1
))
if %ListNum% lss 1 (
color 04
echo appsĿ¼��û�з�������������Զ��򿪣��뽫Ҫ��װ��������Ƶ���Ŀ¼�£�
explorer %CurrentPath%
echo �밴�����������
pause > nul
color 03
)
goto :eof

:help
echo ---����---
echo ֱ�������ļ����������ļ����ɰ�װ���ļ����ڲ��������Ļ������ַ���
echo cmd :����cmd����̨
echo list :�г�appsĿ¼�µ�����б�
echo shell :����shell����̨
echo reboot :�����豸
echo scrcpy :Ͷ��
echo exit :�˳�����
echo ------------------------
echo �밴��������أ�
pause > nul
goto install


:start_install
cd /d %~dp0
if "%apk%" == "" color 04&echo ���벻��Ϊ�գ�&choice /t 1 /d y /n > nul&goto install
if "%apk%" == "help" goto help
if "%apk%" == "cmd" echo ����������cmd��&cmd.exe&echo ���˳�cmd���밴��������أ�&pause > nul&goto install
if "%apk%" == "list" goto list
if "%apk%" == "shell" goto shell
if "%apk%" == "reboot" goto reboot
echo %apk%|echo %apk%|findstr /v "\<^*scrcpy.*\>" > nul||goto scrcpy
if "%apk%" == "exit" goto exit
echo %apk%|findstr /i "\<*.apk\>" > nul||set apk=%apk%.apk
echo %apk%|findstr /i "\<*.apk\>" > nul||goto apk_error
echo %apk%|findstr /v \ > nul||goto is_path
echo %apk%|findstr /v \/ > nul||goto is_path
if not exist apps\%apk% goto apk_not_exist

if exist tmp.apk del tmp.apk > nul
echo ���ڸ������Ϊ��ʱ�ļ������Ժ򡣡���
copy apps\%apk% tmp.apk > nul
goto start_install1

:start_install1
if "%type_id%" == "true" (
echo ��ʾ��IP���ӷ�ʽ�ϴ���װ���ٶȽ����������ĵȴ�������
)

if "%type%" == "" (
echo ��ʾ���統ǰΪIP���ӷ�ʽ���ϴ���װ���ٶȿ��ܽ����������ĵȴ�������
)

echo ��ʼ�ϴ�%apk%������
adb %type% push tmp.apk /data/local/tmp/
if %errorlevel%==1 goto upload_fail
del tmp.apk
echo �ϴ��ɹ�����ʼ��װ������
adb %type% shell /system/bin/pm install -r /data/local/tmp/tmp.apk > tmp
type tmp|findstr /i "\<Success\>"||goto install_fail
del tmp
echo ��װ�ɹ���
echo ɾ�����ϴ��İ�װ��������
adb %type% shell rm /data/local/tmp/tmp.apk

echo %apk%|findstr /v EchoService > nul||goto start_EchoService
echo %apk%|findstr /v Unisound > nul||goto start_Unisound
echo �밴��������أ�
pause > nul
goto install


:scrcpy
cd /d %~dp0
if not exist scrcpy\scrcpy.exe echo scrcpyĿ¼��δ�ҵ�scrcpy.exe��&echo �밴��������أ�&pause > nul&goto install
echo Ͷ����ʼ������
scrcpy\%apk% %type% --disable-screensaver
echo Ͷ��������
echo �밴��������أ�
pause > nul
goto install

:exit
echo �밴������˳���
pause > nul
exit

:list
color 03
echo ---����б�---
set ListNum=0
(for /f "tokens=1 delims=	" %%i in ('dir "%CurrentPath%*.apk" /b') do (
set /a ListNum+=1
set ListFile!ListNum!=%%i
echo !ListNum!.%%i
))

if %ListNum% lss 1 (
color 04
echo ����б�Ϊ�գ�
echo ------------------------
echo �밴��������أ�
pause > nul
color 03
goto install
)

echo ------------------------

set /p ListIndex=������Ҫ��װ��������(����exit�˳��б�)��
if "%ListIndex%" == "" color 04&echo ���벻��Ϊ�գ�&choice /t 1 /d y /n > nul&goto list
if "%ListIndex%" == "exit" echo ���˳�����б�&goto install
if %ListIndex% lss 1 color 04&echo ��Ŵ���������ѡ��&choice /t 1 /d y /n > nul&goto list
if %ListIndex% gtr %ListNum% color 04&echo ��Ŵ���������ѡ��&choice /t 1 /d y /n > nul&goto list

set file=!ListFile%ListIndex%!
if "%file%" equ "" call  :err ��Ŵ���������ѡ��
echo ѡ�������%file%
set apk=%file%
echo �밴�������ʼ��װ��
pause > nul
goto start_install

:shell
echo ���潫����shell����̨��
if "%r1%" == "true" adb %type% shell sh
if "%r1%" neq "true" adb %type% shell
echo ���˳�shell����̨��
echo �밴��������أ�
pause > nul
goto install

:apk_error
color 04
echo ��apk�ļ���
choice /t 1 /d y /n > nul
goto install

:is_path
call :get_file !apk!

if "%FilePath%" neq "%CurrentPath%" (
	if exist tmp.apk del tmp.apk > nul
	echo ���ڸ������Ϊ��ʱ�ļ������Ժ򡣡���
	copy "%FilePath%%FileName%" tmp.apk > nul
	goto start_install1
)

color 03
set apk=%FileName%

goto start_install


:get_file
set FilePath=%~dp1
set FileName=%~nx1
goto :eof

:apk_not_exist
color 04
echo appsĿ¼��δ�ҵ�%apk%�����ȸ����������appsĿ¼�£���ֱ�������ļ���
choice /t 1 /d y /n > nul
goto install

:upload_fail
color 04
del tmp.apk
echo �ϴ�%apk%ʧ�ܣ��������ϴ���
choice /t 1 /d y /n > nul
echo �밴��������أ�
pause > nul
goto install

:install_fail
color 04
echo ��װʧ�ܣ�
echo ������룺
type tmp
del tmp
echo ɾ�����ϴ��İ�װ��������
adb %type% shell rm /data/local/tmp/tmp.apk
echo �밴��������أ�
pause > nul
goto install

:reboot
echo �����豸������
adb %type% reboot
echo �밴��������أ�
pause > nul
goto install

:start_EchoService
echo ����EchoService���񡣡���
adb %type% shell am startservice com.phicomm.speaker.player/.EchoService
echo �밴��������أ�
pause > nul
goto install

:start_Unisound
echo ����Unisound������
adb %type% shell am start com.phicomm.speaker.device/.ui.MainActivity
echo �밴��������أ�
pause > nul
goto install

:adbfile_not
color 04
echo adb�ļ������ڣ���ȷ�����ѽ�����ȫ����ѹ��
pause > nul
exit

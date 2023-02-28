@ECHO OFF&SETLOCAL enabledelayedexpansion
title 斐讯R1一键ADB连接

CD /d %~dp0
::ECHO %~dp0
SET "ipd=192.168.1.166" REM 设置斐讯R1默认IP地址
SET "apkd=h.apk" REM 设置默认apk 文件名


:main
::CD /d %~dp0hijack
@ECHO OFF
CLS
color 0a
ECHO.
ECHO.
ECHO.         1、ADB 无线连接斐讯R1（ADB调试）
ECHO.
ECHO.         2、查看设备连接状态
ECHO.
ECHO.         3、上传APK并安装（在1完成的基础上）
ECHO.
ECHO.         4、打开允许安装未知来源的软件
ECHO.
ECHO.         5、退出批处理
ECHO.
SET /P psn=  请输入所选项前的数字键并按回车:

if /I "!psn!"=="1" goto a1

if /I "!psn!"=="2" goto a2

if /I "!psn!"=="3" goto a3

if /I "!psn!"=="4" goto a4

if /I "!psn!"=="5" goto EX
CLS 
ECHO.
ECHO 输入有误，按任意键返回主菜单。
PAUSE >nul
goto main

:a1
CLS 
ECHO.
ECHO.         1、ADB 无线连接斐讯R1（ADB调试）
ECHO.
ECHO. 清理进程...
adb disconnect >nul
taskkill /f /t /im adb.exe >nul
adb devices >nul
::DIR
ECHO. 
SET /P ip=  请输入斐讯R1的局域网IP地址并按回车（直接回车默认为 %ipd%）：
if "!ip!"=="" SET "ip=%ipd%"
ECHO.
ECHO. 连接中...
adb connect !ip!
adb devices|findstr /ic "\<device\>" ||GOTO 2
:1
ECHO. 连接成功！按任意键返回主菜单
PAUSE >NUL
SET "ip="
GOTO main

:2
ECHO. 连接失败，设备离线或设备ADB调试未打开，请重试...
ECHO. 按任意键返回主菜单
PAUSE >nul
GOTO main

:a2
CLS
ECHO.
ECHO.         2、查看设备连接状态
ECHO. 
adb devices
ECHO. 按任意键返回主菜单
PAUSE >nul
GOTO main

:a3
CLS
ECHO.
ECHO.         3、上传APK并安装（在1完成的基础上）
ECHO.
ECHO.  准备上传APK文件，请将apk文件置于批处理同目录，需先确定文件名...
DIR 
ECHO.
SET /P apk=  请依据上面显示的文件信息，依此输入所需上传安装的apk文件名（直接回车默认 %apkd%）:
if "!apk!"=="" SET "apk=%apkd%"
ECHO.
ECHO. 上传文件...
adb push !apk! /data/local/tmp/ 
ECHO. 安装软件中，请等待...
adb shell /system/bin/pm install -t /data/local/tmp/!apk!|findstr /i "success" ||GOTO 4
ECHO. 安装成功！
adb shell rm -rf /data/local/tmp/!apk!
ECHO. 按任意键返回主菜单。
PAUSE >NUL
SET "apk="
goto main

:4
ECHO. 安装失败，请重试...
ECHO. 按任意键返回主菜单。
PAUSE >nul
goto main

:a4 
CLS   
ECHO.
ECHO.         4、打开允许安装未知来源的软件
ECHO.
adb shell settings put secure install_non_market_apps 1
ECHO. ok
ECHO. 按任意键返回主菜单。
PAUSE >nul
goto main

:EX
EXIT
@ECHO OFF
TITLE 一键升级R1
CLS

:MENU
CLS
color 3f
ECHO. =================================================
ECHO.
ECHO.   请选择你的操作：
ECHO.
ECHO.       1.ota-3119-3166
ECHO.       2.ota-3166-3415
ECHO.       3.ota-3174-3318
ECHO.       4.ota-3318-3331
ECHO.       5.ota-3331-3448
ECHO.       6.ota-3415-3448
ECHO.       7.删除otaprop.txt
ECHO.
ECHO. =================================================
ECHO.

:CHO
set choice=
set /p choice= 选择你要进行的操作:
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,1%
if /i "%choice%"=="1" goto ota-3119-3166
if /i "%choice%"=="2" goto ota-3166-3415
if /i "%choice%"=="3" goto ota-3174-3318
if /i "%choice%"=="4" goto ota-3318-3331
if /i "%choice%"=="5" goto ota-3331-3448
if /i "%choice%"=="6" goto ota-3415-3448
if /i "%choice%"=="7" goto del
echo 选择无效，请重新输入
echo.
goto MENU

:ota-3119-3166
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3119升级3166
ECHO.
ECHO.   请将R1连接有线网络并获得内网IP地址，
ECHO.   在设置中开启远程调试（adb）
ECHO.
ECHO.       请按提示进行操作
ECHO.
ECHO.           by 寂静宣言
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=请输入R1的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
echo 开始升级，请等待升级完成后返回目录删除otaprop.txt……
adb push ota-3119-3166.txt /sdcard/otaprop.txt
adb reboot
echo 成功完成后按任意键返回选择菜单 & pause
goto MENU

:ota-3166-3415
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3166升级3415
ECHO.
ECHO.   请将R1连接有线网络并获得内网IP地址，
ECHO.   在设置中开启远程调试（adb）
ECHO.
ECHO.       请按提示进行操作
ECHO.
ECHO.           by 寂静宣言
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=请输入R1的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
echo 开始升级，请等待升级完成后返回目录删除otaprop.txt……
adb push ota-3166-3415.txt /sdcard/otaprop.txt
adb reboot
echo 成功完成后按任意键返回选择菜单 & pause
goto MENU

:ota-3174-3318
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3174升级3318
ECHO.
ECHO.   请将R1连接有线网络并获得内网IP地址，
ECHO.   在设置中开启远程调试（adb）
ECHO.
ECHO.       请按提示进行操作
ECHO.
ECHO.           by 寂静宣言
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=请输入R1的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
echo 开始升级，请等待升级完成后返回目录删除otaprop.txt……
adb push ota-3174-3318.txt /sdcard/otaprop.txt
adb reboot
echo 成功完成后按任意键返回选择菜单 & pause
goto MENU

:ota-3318-3331
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3318升级3331
ECHO.
ECHO.   请将R1连接有线网络并获得内网IP地址，
ECHO.   在设置中开启远程调试（adb）
ECHO.
ECHO.       请按提示进行操作
ECHO.
ECHO.           by 寂静宣言
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=请输入R1的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
echo 开始升级，请等待升级完成后返回目录删除otaprop.txt……
adb push ota-3318-3331.txt /sdcard/otaprop.txt
adb reboot
echo 成功完成后按任意键返回选择菜单 & pause
goto MENU

:ota-3331-3448
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3331升级3448
ECHO.
ECHO.   请将R1连接有线网络并获得内网IP地址，
ECHO.   在设置中开启远程调试（adb）
ECHO.
ECHO.       请按提示进行操作
ECHO.
ECHO.           by 寂静宣言
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=请输入R1的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
echo 开始升级，请等待升级完成后返回目录删除otaprop.txt……
adb push ota-3331-3448.txt /sdcard/otaprop.txt
adb reboot
echo 成功完成后按任意键返回选择菜单 & pause
goto MENU

:ota-3415-3448
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3415升级3448
ECHO.
ECHO.   请将R1连接有线网络并获得内网IP地址，
ECHO.   在设置中开启远程调试（adb）
ECHO.
ECHO.       请按提示进行操作
ECHO.
ECHO.           by 寂静宣言
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=请输入R1的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
echo 开始升级，请等待升级完成后返回目录删除otaprop.txt……
adb push ota-3415-3448.txt /sdcard/otaprop.txt
adb reboot
echo 成功完成后按任意键返回选择菜单 & pause
goto MENU

:del
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   删除otaprop.txt
ECHO.
ECHO.   请将R1连接有线网络并获得内网IP地址，
ECHO.   在设置中开启远程调试（adb）
ECHO.
ECHO.       请按提示进行操作
ECHO.
ECHO.           by 寂静宣言
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=请输入R1的内网IP地址：
adb kill-server
if "%ip%" == "" echo 提示：请输入正确的IP地址 && goto end
echo 开始通过网络进行ADB连接……
adb connect %ip%
echo 开始删除otaprop.txt……
adb shell rm /sdcard/otaprop.txt
echo 成功完成后按任意键返回选择菜单 & pause
goto MENU

:END
EXIT

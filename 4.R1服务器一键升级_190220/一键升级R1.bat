@ECHO OFF
TITLE һ������R1
CLS

:MENU
CLS
color 3f
ECHO. =================================================
ECHO.
ECHO.   ��ѡ����Ĳ�����
ECHO.
ECHO.       1.ota-3119-3166
ECHO.       2.ota-3166-3415
ECHO.       3.ota-3174-3318
ECHO.       4.ota-3318-3331
ECHO.       5.ota-3331-3448
ECHO.       6.ota-3415-3448
ECHO.       7.ɾ��otaprop.txt
ECHO.
ECHO. =================================================
ECHO.

:CHO
set choice=
set /p choice= ѡ����Ҫ���еĲ���:
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,1%
if /i "%choice%"=="1" goto ota-3119-3166
if /i "%choice%"=="2" goto ota-3166-3415
if /i "%choice%"=="3" goto ota-3174-3318
if /i "%choice%"=="4" goto ota-3318-3331
if /i "%choice%"=="5" goto ota-3331-3448
if /i "%choice%"=="6" goto ota-3415-3448
if /i "%choice%"=="7" goto del
echo ѡ����Ч������������
echo.
goto MENU

:ota-3119-3166
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3119����3166
ECHO.
ECHO.   �뽫R1�����������粢�������IP��ַ��
ECHO.   �������п���Զ�̵��ԣ�adb��
ECHO.
ECHO.       �밴��ʾ���в���
ECHO.
ECHO.           by �ž�����
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=������R1������IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
echo ��ʼ��������ȴ�������ɺ󷵻�Ŀ¼ɾ��otaprop.txt����
adb push ota-3119-3166.txt /sdcard/otaprop.txt
adb reboot
echo �ɹ���ɺ����������ѡ��˵� & pause
goto MENU

:ota-3166-3415
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3166����3415
ECHO.
ECHO.   �뽫R1�����������粢�������IP��ַ��
ECHO.   �������п���Զ�̵��ԣ�adb��
ECHO.
ECHO.       �밴��ʾ���в���
ECHO.
ECHO.           by �ž�����
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=������R1������IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
echo ��ʼ��������ȴ�������ɺ󷵻�Ŀ¼ɾ��otaprop.txt����
adb push ota-3166-3415.txt /sdcard/otaprop.txt
adb reboot
echo �ɹ���ɺ����������ѡ��˵� & pause
goto MENU

:ota-3174-3318
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3174����3318
ECHO.
ECHO.   �뽫R1�����������粢�������IP��ַ��
ECHO.   �������п���Զ�̵��ԣ�adb��
ECHO.
ECHO.       �밴��ʾ���в���
ECHO.
ECHO.           by �ž�����
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=������R1������IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
echo ��ʼ��������ȴ�������ɺ󷵻�Ŀ¼ɾ��otaprop.txt����
adb push ota-3174-3318.txt /sdcard/otaprop.txt
adb reboot
echo �ɹ���ɺ����������ѡ��˵� & pause
goto MENU

:ota-3318-3331
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3318����3331
ECHO.
ECHO.   �뽫R1�����������粢�������IP��ַ��
ECHO.   �������п���Զ�̵��ԣ�adb��
ECHO.
ECHO.       �밴��ʾ���в���
ECHO.
ECHO.           by �ž�����
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=������R1������IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
echo ��ʼ��������ȴ�������ɺ󷵻�Ŀ¼ɾ��otaprop.txt����
adb push ota-3318-3331.txt /sdcard/otaprop.txt
adb reboot
echo �ɹ���ɺ����������ѡ��˵� & pause
goto MENU

:ota-3331-3448
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3331����3448
ECHO.
ECHO.   �뽫R1�����������粢�������IP��ַ��
ECHO.   �������п���Զ�̵��ԣ�adb��
ECHO.
ECHO.       �밴��ʾ���в���
ECHO.
ECHO.           by �ž�����
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=������R1������IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
echo ��ʼ��������ȴ�������ɺ󷵻�Ŀ¼ɾ��otaprop.txt����
adb push ota-3331-3448.txt /sdcard/otaprop.txt
adb reboot
echo �ɹ���ɺ����������ѡ��˵� & pause
goto MENU

:ota-3415-3448
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   3415����3448
ECHO.
ECHO.   �뽫R1�����������粢�������IP��ַ��
ECHO.   �������п���Զ�̵��ԣ�adb��
ECHO.
ECHO.       �밴��ʾ���в���
ECHO.
ECHO.           by �ž�����
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=������R1������IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
echo ��ʼ��������ȴ�������ɺ󷵻�Ŀ¼ɾ��otaprop.txt����
adb push ota-3415-3448.txt /sdcard/otaprop.txt
adb reboot
echo �ɹ���ɺ����������ѡ��˵� & pause
goto MENU

:del
CLS
COLOR 3f
ECHO. =================================================
ECHO.
ECHO.   ɾ��otaprop.txt
ECHO.
ECHO.   �뽫R1�����������粢�������IP��ַ��
ECHO.   �������п���Զ�̵��ԣ�adb��
ECHO.
ECHO.       �밴��ʾ���в���
ECHO.
ECHO.           by �ž�����
ECHO.
ECHO. =================================================
ECHO.
ECHO.
set /p ip=������R1������IP��ַ��
adb kill-server
if "%ip%" == "" echo ��ʾ����������ȷ��IP��ַ && goto end
echo ��ʼͨ���������ADB���ӡ���
adb connect %ip%
echo ��ʼɾ��otaprop.txt����
adb shell rm /sdcard/otaprop.txt
echo �ɹ���ɺ����������ѡ��˵� & pause
goto MENU

:END
EXIT

@echo off

echo �ݒ�l�ǂݍ���
cd app_input
(
    SET /P appId=
    SET /P appName=
)< app_info.txt

echo %appId%
echo %appName%

rem Android�[���̐ڑ��m�F
cd %ANDROID_HOME%\platform-tools
call adb devices

pause

cd %~dp0
 
set projectName=%date:~-10,4%%date:~-5,2%%date:~-2,2%%time:~0,1%%time:~3,2%%time:~6,2%

echo cordova�v���W�F�N�g�쐬[�t�H���_���F%projectName%]
call cordova create %projectName%
cd %projectName%

echo res�t�H���_�쐬
md res

echo config�R�s�[
cd ..
copy app_input\config.xml %projectName%\config.xml

echo index.xml�R�s�[
copy app_input\index.html %projectName%\www\index.html

echo icon.png�̃R�s�[
copy app_input\icon.png %projectName%\res\icon.png

cd %projectName%

rem �Ώۃt�@�C��
set targetFile=config.xml
rem �u���O������1
set beforeStr1=samplename
rem �u���㕶����1
set afterStr1=%appName%
rem �u���O������2
set beforeStr2=sampleid
rem �u���㕶����2
set afterStr2=%appId%

echo config���̕�����u��
rem PowerShell�̃R�}���h���b�g��g�ݗ���
set psCommand="(Get-Content %targetFile%) -creplace '%beforeStr1%','%afterStr1%' | Out-File -Encoding utf8 %targetFile%"
rem PowerShell�̃R�}���h���b�g�����s
powershell -NoProfile -ExecutionPolicy Unrestricted %psCommand%

rem PowerShell�̃R�}���h���b�g��g�ݗ���
set psCommand2="(Get-Content %targetFile%) -creplace '%beforeStr2%','%afterStr2%' | Out-File -Encoding utf8 %targetFile%"
rem PowerShell�̃R�}���h���b�g�����s
powershell -NoProfile -ExecutionPolicy Unrestricted %psCommand2%

echo Android�v���b�g�t�H�[���ǉ�
call cordova platform add android


echo �C���X�g�[���J�n
call cordova run android

echo �������܂���
pause
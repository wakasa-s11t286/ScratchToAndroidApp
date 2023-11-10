@echo off

echo 設定値読み込み
cd app_input
(
    SET /P appId=
    SET /P appName=
)< app_info.txt

echo %appId%
echo %appName%

rem Android端末の接続確認
cd %ANDROID_HOME%\platform-tools
call adb devices

pause

cd %~dp0
 
set projectName=%date:~-10,4%%date:~-5,2%%date:~-2,2%%time:~0,1%%time:~3,2%%time:~6,2%

echo cordovaプロジェクト作成[フォルダ名：%projectName%]
call cordova create %projectName%
cd %projectName%

echo resフォルダ作成
md res

echo configコピー
cd ..
copy app_input\config.xml %projectName%\config.xml

echo index.xmlコピー
copy app_input\index.html %projectName%\www\index.html

echo icon.pngのコピー
copy app_input\icon.png %projectName%\res\icon.png

cd %projectName%

rem 対象ファイル
set targetFile=config.xml
rem 置換前文字列1
set beforeStr1=samplename
rem 置換後文字列1
set afterStr1=%appName%
rem 置換前文字列2
set beforeStr2=sampleid
rem 置換後文字列2
set afterStr2=%appId%

echo config内の文字列置換
rem PowerShellのコマンドレットを組み立て
set psCommand="(Get-Content %targetFile%) -creplace '%beforeStr1%','%afterStr1%' | Out-File -Encoding utf8 %targetFile%"
rem PowerShellのコマンドレットを実行
powershell -NoProfile -ExecutionPolicy Unrestricted %psCommand%

rem PowerShellのコマンドレットを組み立て
set psCommand2="(Get-Content %targetFile%) -creplace '%beforeStr2%','%afterStr2%' | Out-File -Encoding utf8 %targetFile%"
rem PowerShellのコマンドレットを実行
powershell -NoProfile -ExecutionPolicy Unrestricted %psCommand2%

echo Androidプラットフォーム追加
call cordova platform add android


echo インストール開始
call cordova run android

echo 完了しました
pause
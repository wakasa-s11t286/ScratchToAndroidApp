# ScratchToAndroidApp
スクラッチからAndroidAppへcordovaを使ってビルドします  
参考：https://wakabaclass.com/2023/02/05/scratch_to_android_app/

## 環境構築
以下をビルド環境(Windows端末)に導入しておく

### Node.jsをインストールする
### Android Studioをインストールする
### JDK(JDK16以下)をインストールする
### gradleをインストールする（パスを通しておく）
### Cordovaをインストールする
```
npm install -g cordova
```
### ScratchゲームをHTML形式に変換しておく
https://packager.turbowarp.org/

## 準備
### アプリ情報を編集する
/app_input/app_info.txt を編集し、アプリID、アプリ名を変更する
```
[AppのID]
[Appの名前]
```

### アプリアイコンを用意する
/app_input/配下に[icon.png]という名称でアイコン画像を配置する  
※サイズ：512px × 512px

### Scratchゲーム(HTML)を配置する
/app_input/配下に[index.html]という名称でHTMLへ変換したスクラッチゲームを配置する  


### Android端末を接続する
※実機にインストールする場合のみ

## ビルド方法
### installバッチを実行する
[install.bat]を実行する。  
コンソールが起動し、ビルドが開始される。  
途中で確認等をはさむため、問題なければ、Enterで継続し、ビルドが成功するまで待つ。  
※もし実機インストールもする場合は実機にて自動でアプリが起動する

### 作成されたものを確認
同ディレクトリに実行日時の名称でフォルダが作成されていることを確認  
(\YYYYMMDDHHmm)

以下のファルダが作成され、Android用にビルドされていることを確認
\YYYMMDDHHmm\platforms\android\

### ビルドをやり直す場合
再ビルドする場合は、以下を削除して、再度installバッチを実行する  
・\YYYMMDDHHmm　フォルダ  
・\res フォルダ
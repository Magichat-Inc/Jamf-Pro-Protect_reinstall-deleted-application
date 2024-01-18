# 数分でできる！削除したアプリの再インストール

## 削除時の検知＆インストール
| ＃  | 名称 | 説明  | 引数・パラメータ |
| ------------- | ------------- | ------------- | ------------- |
| 1  | Jamf ProtectのAnalytics  |   |   |
|   | Moved Adobe Acrobat Reader to Trash  | Adobe Acrobat Readerをゴミ箱へ移動したときに検知する  | Smart Computer Group  |
|   | Delete Adobe Acrobat Reader  | Adobe Acrobat Readerを削除したときに検知する  | Smart Computer Group  |
| 2  | Jamf Protectの拡張属性  |   |   |
|   | Jamf Protect - Smart Groups  |   |   |
| 3 | Smart Computer Group  |   |  |
|   | Jamf Protect - Reinstall Adobe  | 再インストールポリシー起動用  | Jamf Protect - Smart Groups  |
| 4  | Re-installポリシー  |   |   |
|   | Jamf Protect: Reinstall Adobe Acrobat Reader  | 特定アプリインストール用のポリシー  | Ongoing  |
|  | ┗ reinstallAppAndRemoveFromProtectGroup.sh  | トリガーファイルの削除＆インストールポリシーの実行  | インストールポリシーのID  |
| 5 | アプリのインストール  |   |  |
|   | Adobe Acrobat Install  | Adobe Acrobat Readerをインストールするポリシー  |  |

## 定期実行の処理
| ＃  | 名称 | 説明  | 引数・パラメータ |
| ------------- | ------------- | ------------- | ------------- |
| 1  | スケジュール設定  |   |   |
|   | Launch Daemon: Reinstall Adobe Acrobat Reader Task  | Launch Daemonをインストールするポリシー  | Recurring Check-in<br />Once per computer |
|  | ┗ reinstallTask.sh  | Launch Daemonをスケジュールするタスク | インストールポリシーのランチャーのID  |
| 2 | Installポリシーのランチャー  |   |   |
|   | Launch Daemon: Reinstall Adobe Acrobat Reader  | 特定アプリインストール用のポリシー  | Ongoing  |
|   | ┗ reinstallSpecificApplication.sh  | アプリの存在確認＆インストールポリシーの実行  | インストールApp名: Adobe Acrobat Reader.app<br />インストールポリシーのID  |
| 3 | アプリのインストール  |  |   |
|  | Adobe Acrobat Install  | Adobe Acrobat Readerをインストールするポリシー  |  |

## ご参考
詳しくは[ブログ](https://blog.magichat.jp/n/ndc716c568585)をご覧ください。

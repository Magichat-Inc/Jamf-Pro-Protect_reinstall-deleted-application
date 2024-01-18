# 数分でできる！削除したアプリの再インストール

## 削除時の検知＆インストール
| ＃  | 名称 | 説明  | 引数・パラメータ |
| ------------- | ------------- | ------------- | ------------- |
| 1  | Jamf ProtectのAnalytics  |   |   |
| 1-1  | Moved Adobe Acrobat Reader to Trash  | Adobe Acrobat Readerをゴミ箱へ移動したときに検知する  | Smart Computer Group  |
| 1-2  | Delete Adobe Acrobat Reader  | Adobe Acrobat Readerを削除したときに検知する  | Smart Computer Group  |
| 2  | Jamf Protectの拡張属性  |   |   |
| 2-1  | Jamf Protect - Smart Groups  |   |   |
| 3 | Smart Computer Group  |   |  |
| 3-1  | Jamf Protect - Reinstall Adobe  | 再インストールポリシー起動用  | Jamf Protect - Smart Groups  |
| 4  | Re-installポリシー  |   |   |
| 4-1  | Jamf Protect: Reinstall Adobe Acrobat Reader  | 特定アプリインストール用のポリシー  | Ongoing  |
| 4-2 | ┗ reinstallAppAndRemoveFromProtectGroup  | トリガーファイルの削除＆インストールポリシーの実行  | インストールポリシーのID  |
| 5 | アプリのインストール  |   |  |
| 5-1  | Adobe Acrobat Install  | Adobe Acrobat Readerをインストールするポリシー  |  |

## 定期実行の処理
| ＃  | 名称 | 説明  | 引数・パラメータ |
| ------------- | ------------- | ------------- | ------------- |
| 1  | スケジュール設定  |   |   |
| 1-1  | Launch Daemon: Reinstall Adobe Acrobat Reader Task  | Launch Daemonをインストールするポリシー  | Recurring Check-in<br />Once per computer |
| 1-2 | ┗ reinstallTask.sh  | Launch Daemonをスケジュールするタスク | インストールポリシーのランチャーのID  |
| 2 | Installポリシーのランチャー  |   |   |
| 2-1  | Launch Daemon: Reinstall Adobe Acrobat Reader  | 特定アプリインストール用のポリシー  | Ongoing  |
| 2-2  | ┗ reinstallSpecificApplication.sh  | アプリの存在確認＆インストールポリシーの実行  | インストールApp名: Adobe Acrobat Reader.app<br />インストールポリシーのID  |
| 3 | アプリのインストール  |  |   |
| 3-1 | Adobe Acrobat Install  | Adobe Acrobat Readerをインストールするポリシー  |  |

## ご参考
詳しくは[ブログ]()をご覧ください。
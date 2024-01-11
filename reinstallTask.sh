#!/bin/bash

####################################################################################################
# Launch Daemon which calls a script that re-installs a specific application if it's being deleted
# 特定のアプリケーションが削除された場合に再インストールするスクリプトを呼び出す Launch Daemon
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2023/12/05
# 最終更新日: 2023年 12月 05日
####################################################################################################

tee /Library/LaunchDaemons/com.magichat.reinstall.plist << EOF
<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> 
<plist version="1.0"> 
<dict> 
  <key>Label</key> 
  <string>com.magichat.reinstall.plist</string> 
  <key>ProgramArguments</key> 
  <array> 
    <string>/usr/local/bin/jamf</string> 
    <string>policy</string> 
    <string>-id</string> 
	  <!-- Reinstall Specific Application Script Policy ID -->
	  <!-- 特定のアプリケーションの再インストールスクリプトのポリシーID -->
    <string>859</string> 
  </array> 
  <key>StartInterval</key> 
  <integer>3600</integer> 
  <key>RunAtLoad</key>
  <true/>
</dict> 
</plist>
EOF

sudo chown root:wheel /Library/LaunchDaemons/com.magichat.reinstall.plist
sudo chmod 644 /Library/LaunchDaemons/com.magichat.reinstall.plist
sudo launchctl bootstrap system /Library/LaunchDaemons/com.magichat.reinstall.plist

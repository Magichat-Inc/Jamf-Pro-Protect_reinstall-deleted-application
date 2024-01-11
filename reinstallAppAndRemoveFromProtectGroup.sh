#!/bin/bash

####################################################################################################
# Reinstall a specific application and remove the device from the Jamf Protect Smart Group
# 特定のアプリケーションを再インストールし、デバイスをJamf Protect Smart Groupから削除する
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2023/12/05
# 最終更新日: 2023年 12月 05日
####################################################################################################

# Add policy ID here from URL
# JamfインスタンスのURLからポリシーのIDを追加します。
# Example: https://xxxxxx.jamfcloud.com/policies.html?id=587 - the id is 587
# 例: https://xxxxxx.jamfcloud.com/policies.html?id=587 - IDは587です。
policyID="$4"

sudo /bin/rm /Library/Application\ Support/JamfProtect/groups/movedAdobeAcrobatReaderToTrash
sudo /bin/rm /Library/Application\ Support/JamfProtect/groups/deletedAdobeAcrobatReader

sudo jamf policy -id "${policyID}"

sudo jamf recon &

exit 0

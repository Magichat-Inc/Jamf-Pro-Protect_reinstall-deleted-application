#!/bin/bash

####################################################################################################
# A script which re-installs a specific application if it's being deleted
# 特定のアプリケーションが削除された場合に再インストールするスクリプト
#                         
# Author: Magic Hat Inc. (Melinda Magyar)           
# 著者: 株式会社マジックハット (マジャル メリンダ)
#
# Last modified: 2023/12/05
# 最終更新日: 2023年 12月 05日
####################################################################################################

# Example: "Adobe Acrobat Reader.app"
# 例: "Adobe Acrobat Reader.app"
applicationName="$4"

# Add policy ID here from URL
# JamfインスタンスのURLからポリシーのIDを追加します。
# Example: https://xxxxxx.jamfcloud.com/policies.html?id=587 - the id is 587
# 例: https://xxxxxx.jamfcloud.com/policies.html?id=587 - IDは587です。
policyID="$5"

if [[ -d "/Applications/${applicationName}" ]]; then
	echo "${applicationName} is installed."
else
	echo "${applicationName} is not installed."
    sudo jamf policy -id "${policyID}"
    sudo jamf recon
fi

exit 0

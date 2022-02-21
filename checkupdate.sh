#!/bin/bash

daemon_online_version=`curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/MCSManager/MCSManager-Daemon-Production/commits/master | jq -r .sha`
web_online_version=`curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/MCSManager/MCSManager-Web-Production/commits/master | jq -r .sha`

daemon_current_version=`cat ./daemon/version`
web_current_version=`cat ./web/version`

echo $daemon_online_version > ./daemon/version
echo $web_online_version > ./web/version

git config user.name github-actions
git config user.email github-actions@github.com

if [[ $daemon_online_version != $daemon_current_version ]]; then
    git add ./daemon/version
    git commit -m "Update daemon"
fi

if [[ $web_online_version != $web_current_version ]]; then
    git add ./web/version
    git commit -m "Update web"
fi

git push